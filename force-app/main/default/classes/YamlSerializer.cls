/**
 * @author Heitor Araujo
 * @Description Class responsible for Writting YAML on the right format
 */

public with sharing class YamlSerializer implements FileSerializer{

    private StringBuilder builder;
    private Integer indentationCount;

    public YamlSerializer(){
        this.builder = new StringBuilder();
        indentationCount = 0;
    }

    public YamlSerializer writeString(String key, String value){

        if(key == null || value == null)
            return this;

        return this.writeString(String.format('{0}: {1}', new List<String> {key, value}));
    }

    public YamlSerializer writeString(String value){

        if(value == null)
            return this;

        this.applyIndentation();
        this.builder.append(value);
        this.breakLine();

        return this;
    }

    public YamlSerializer openObject(String key){
        this.applyIndentation();
        this.builder.append(key).append(':');
        this.breakLine();
        indentationCount++;
        return this;
    }

    public YamlSerializer openListObject(){
        this.applyIndentation();
        this.builder.append('-');
        this.breakLine();
        indentationCount++;
        return this;
    }

    public YamlSerializer closeListObject(){
        indentationCount--;
        return this;
    }

    public YamlSerializer openListItem(String key, String value){
        return this.openListItem(key + ': ' + value);
    }

    public YamlSerializer openListItem(String value){

        this.applyIndentation();
        this.builder.append('-').append(' ').append(value);
        this.breakLine();
        indentationCount++;
        
        return this;
    }

    public YamlSerializer closeListItem(){
        indentationCount--;
        return this;
    }

    public YamlSerializer closeObject(){
        indentationCount--;
        return this;
    }

    private YamlSerializer breakLine(){
        this.builder.append('\n');
        return this;
    }

    public String serialize(){
        return this.builder.build();
    }

    private YamlSerializer applyIndentation(){
        if(indentationCount <= 0){
            return this;
        }
        for(Integer i = 0; i < indentationCount; i++){
            indent();
        }
        return this;
    }

    private YamlSerializer indent(){
        this.builder.append('  ');
        return this;
    }
}