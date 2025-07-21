package util;

import java.io.FileWriter;
import java.io.IOException;

public class FileWriterUtil {
    public static void saveFavoriteId(String path, String favoriteId) {
        try (FileWriter writer = new FileWriter(path)) {
            writer.write("{ \"favoriteId\": \"" + favoriteId + "\" }");
        } catch (IOException e) {
            throw new RuntimeException("Failed to write favoriteId", e);
        }
    }
    
}
