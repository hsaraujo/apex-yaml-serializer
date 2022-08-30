/**
 * @author Heitor Araujo
 * @description Interface for File Serialisation
 */

public interface FileSerializer {

    FileSerializer writeString(String key, String value);
    FileSerializer writeString(String value);
    FileSerializer openObject(String key);
    FileSerializer closeObject();
    FileSerializer openListObject();
    FileSerializer closeListObject();
    FileSerializer openListItem(String key, String value);
    FileSerializer openListItem(String value);
    FileSerializer closeListItem();
    String serialize();
}