package club.pojo;

import lombok.Data;

/**
 * @author Losca
 * @date 2022/4/24 15:10
 */
@Data
public class Donate {
    private Integer id;
    private Integer userid;
    private String username;
    private String say;
    private Integer money;
    private String goods;
    private String email;
}
