package egov.location.model; 
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LocationModel {
	private int num;
	private String name;
	private String category;
	private String address;
	private String area;
}
