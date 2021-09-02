package ua.lviv.lgs.periodicals.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "bucket")
public class Bucket {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	private User user;

	@ManyToOne
	@JoinColumn(name = "periodical_id", referencedColumnName = "id")
	private Periodical periodical;

	@Column(name="purchase_date")
	private Date purchaseDate;

	public Bucket() {
	}

	public Bucket(User user, Periodical periodical, Date purchaseDate) {
		this.user = user;
		this.periodical = periodical;
		this.purchaseDate = purchaseDate;
	}

	public Bucket(Integer id, User user, Periodical periodical, Date purchaseDate) {
		this.id = id;
		this.user = user;
		this.periodical = periodical;
		this.purchaseDate = purchaseDate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Periodical getPeriodical() {
		return periodical;
	}

	public void setPeriodical(Periodical periodical) {
		this.periodical = periodical;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	@Override
	public String toString() {
		return "Bucket [id=" + id + ", user=" + user + ", periodical=" + periodical + ", purchaseDate=" + purchaseDate
				+ "]";
	}

}
