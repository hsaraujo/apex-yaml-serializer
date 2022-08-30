/**
 * @author Heitor Araujo
 * @description Serialize any object to YAML format
 */
public with sharing class YAML {

    private static final YamlSerializer serializer = new YamlSerializer();

    /** 
     * Serializes any object to YAML format
     * 
     * @param obj
     *        Object to be serialized
     * @return Formatted YAML
     */
    public static String serialize(Object obj){
        String jsonStr = JSON.serialize(obj);
        Object jsonDeserialized = JSON.deserializeUntyped(jsonStr);

        if(isMap(jsonDeserialized)){
            writeMap((Map<String, Object>) jsonDeserialized);
        }
        else if(isList(jsonDeserialized)){
            writeList((List<Object>) jsonDeserialized);
        }
        
        return serializer.serialize();
    }

    private static void writeMap(Map<String, Object> objectByKey){

        for(String key : objectByKey.keySet()){

            Object val = objectByKey.get(key);

            if(isPrimitive(val)){
                serializer.writeString(key, String.valueOf(val));
                continue;
            }

            if(isMap(val)){
                serializer.openObject(key);
                writeMap((Map<String, Object>) val);
                serializer.closeObject();
                continue;
            }

            if(isList(val)){
                serializer.openObject(key);
                writeList((List<Object>) val);
                serializer.closeObject();
                continue;
            }

        }
    }

    private static void writeList(List<Object> objs){

        for(Object item : objs){

            if(isPrimitive(item)){
                serializer.openListItem(String.valueOf(item)).closeListItem();
                continue;
            }

            if(isMap(item)){
                serializer.openListObject();
                writeMap((Map<String, Object>)item);
                serializer.closeListObject();
                continue;
            }

            if(isList(item)){
                writeList((List<Object>) item);
            }
        }
    }

    private static Boolean isList(Object obj){
        return obj instanceof List<Object>;   
    }

    private static Boolean isMap(Object obj){
        return obj instanceof Map<String, Object>;
    }

    public static Boolean isPrimitive(Object obj){

        return (obj instanceof Blob
            || obj instanceof Boolean
            || obj instanceof Date
            || obj instanceof Datetime
            || obj instanceof Decimal
            || obj instanceof Double
            || obj instanceof Id
            || obj instanceof Integer
            || obj instanceof Long
            || obj instanceof String
            || obj instanceof Time
        );
    }
}
