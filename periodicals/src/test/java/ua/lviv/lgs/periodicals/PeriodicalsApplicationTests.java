package ua.lviv.lgs.periodicals;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.collection.IsCollectionWithSize.hasSize;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import ua.lviv.lgs.periodicals.dao.BucketRepository;
import ua.lviv.lgs.periodicals.dao.PeriodicalRepository;
import ua.lviv.lgs.periodicals.dao.UserRepository;
import ua.lviv.lgs.periodicals.domain.Bucket;
import ua.lviv.lgs.periodicals.domain.Periodical;
import ua.lviv.lgs.periodicals.domain.User;
import ua.lviv.lgs.periodicals.domain.UserRole;
import ua.lviv.lgs.periodicals.service.BucketService;
import ua.lviv.lgs.periodicals.service.PeriodicalsService;
import ua.lviv.lgs.periodicals.service.UserService;

@RunWith(SpringRunner.class)
@DataJpaTest
class PeriodicalsApplicationTests {

	@Autowired
	private UserService userService;

	@Autowired
	private PeriodicalsService periodicalsService;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PeriodicalRepository periodicalsRepository;

	@Autowired
	private BucketService bucketservice;

	@Autowired
	private BucketRepository bucketRepository;

	@Test
	void testSaveUser() {

		List<User> users = userRepository.findAll();
		assertThat(users, hasSize(0));

		User user = new User();
		user.setEmail("1@gmail.com");
		user.setFirstName("1");
		user.setLastName("1");
		user.setPassword("1");
		user.setPasswordConfirm("1");
		user.setRole(UserRole.ROLE_USER);

		userService.save(user);

		users = userRepository.findAll();
		assertThat(users, hasSize(1));

		User userFromDb = users.get(0);
		assertTrue(userFromDb.getEmail().equals(user.getEmail()));
		assertTrue(userFromDb.getFirstName().equals(user.getFirstName()));
		assertTrue(userFromDb.getLastName().equals(user.getLastName()));
		assertTrue(userFromDb.getRole().equals(user.getRole()));

	}

	@Test
	void testFindByEmail() {

		List<User> users = userRepository.findAll();
		assertThat(users, hasSize(0));

		User user = new User();
		user.setEmail("2@gmail.com");
		user.setFirstName("2");
		user.setLastName("2");
		user.setPassword("2");
		user.setPasswordConfirm("1");
		user.setRole(UserRole.ROLE_USER);

		userRepository.save(user);

		User userFromDb = userService.findByEmail("2@gmail.com");

		assertTrue(userFromDb.getEmail().equals(user.getEmail()));
		assertTrue(userFromDb.getFirstName().equals(user.getFirstName()));
		assertTrue(userFromDb.getLastName().equals(user.getLastName()));
		assertTrue(userFromDb.getRole().equals(user.getRole()));

	}

	@Test
	void testSavePeriodical() {

		List<Periodical> periodicals = periodicalsRepository.findAll();
		assertThat(periodicals, hasSize(0));

		Periodical periodical = new Periodical();
		periodical.setName("1");
		periodical.setDescription("1");
		periodical.setPrice(10d);

		periodicalsService.save(periodical);

		periodicals = periodicalsRepository.findAll();
		assertThat(periodicals, hasSize(1));

		Periodical periodicalFromDb = periodicals.get(0);
		assertTrue(periodical.getName().equals(periodicalFromDb.getName()));
		assertTrue(periodical.getDescription().equals(periodicalFromDb.getDescription()));
		assertTrue(periodical.getPrice().equals(periodicalFromDb.getPrice()));

	}

	@Test
	void testFindById() {

		List<Periodical> periodicals = periodicalsRepository.findAll();
		assertThat(periodicals, hasSize(0));

		Periodical periodical = new Periodical();
		periodical.setName("1");
		periodical.setDescription("1");
		periodical.setPrice(10d);

		periodicalsService.save(periodical);

		periodicals = periodicalsRepository.findAll();
		assertThat(periodicals, hasSize(1));

		Periodical periodicalFromDb = periodicalsService.findById(periodicals.get(0).getId());
		assertTrue(periodical.getName().equals(periodicalFromDb.getName()));
		assertTrue(periodical.getDescription().equals(periodicalFromDb.getDescription()));
		assertTrue(periodical.getPrice().equals(periodicalFromDb.getPrice()));

	}

	@Test
	void testGetAllPeriodicals() {

		List<Periodical> periodicals = periodicalsRepository.findAll();
		assertThat(periodicals, hasSize(0));

		Periodical periodical = new Periodical();
		periodical.setName("1");
		periodical.setDescription("1");
		periodical.setPrice(10d);

		Periodical periodical2 = new Periodical();
		periodical2.setName("2");
		periodical2.setDescription("2");
		periodical2.setPrice(20d);

		periodicalsRepository.saveAll(java.util.Arrays.asList(periodical, periodical2));

		periodicals = periodicalsRepository.findAll();
		assertThat(periodicals, hasSize(2));

		List<Periodical> periodicalsFromDb = periodicalsService.getAllPeriodicals();

		assertTrue(periodicalsFromDb.get(0).getName().equals(periodical.getName()));
		assertTrue(periodicalsFromDb.get(0).getDescription().equals(periodical.getDescription()));
		assertTrue(periodicalsFromDb.get(0).getPrice().equals(periodical.getPrice()));

		assertTrue(periodicalsFromDb.get(1).getName().equals(periodical2.getName()));
		assertTrue(periodicalsFromDb.get(1).getDescription().equals(periodical2.getDescription()));
		assertTrue(periodicalsFromDb.get(1).getPrice().equals(periodical2.getPrice()));

	}

	@Test
	public void testAddToBucket() {

		User user = new User();
		user.setEmail("1@gmail.com");
		user.setFirstName("1");
		user.setLastName("1");
		user.setPassword("1");
		user.setPasswordConfirm("1");
		user.setRole(UserRole.ROLE_USER);

		userService.save(user);

		User userFromDb = userRepository.findAll().stream().findFirst().get();

		Periodical periodical = new Periodical();
		periodical.setName("1");
		periodical.setDescription("1");
		periodical.setPrice(10d);

		periodicalsService.save(periodical);

		Periodical periodicalFromDb = periodicalsRepository.findAll().stream().findFirst().get();

		Date now = new Date();
		Bucket bucket = new Bucket();
		bucket.setPeriodical(periodicalFromDb);
		bucket.setUser(userFromDb);
		bucket.setPurchaseDate(now);

		List<Bucket> buckets = bucketRepository.findAll();
		assertThat(buckets, hasSize(0));

		bucketservice.add(bucket);
		buckets = bucketRepository.findAll();
		assertThat(buckets, hasSize(1));

		Bucket bucketFromDb = buckets.get(0);
		assertTrue(bucketFromDb.getPeriodical().equals(periodicalFromDb));
		assertTrue(bucketFromDb.getUser().equals(userFromDb));
		assertTrue(bucketFromDb.getPurchaseDate().equals(now));

	}

	@Test
	public void testDeleteFromBucket() {

		User user = new User();
		user.setEmail("1@gmail.com");
		user.setFirstName("1");
		user.setLastName("1");
		user.setPassword("1");
		user.setPasswordConfirm("1");
		user.setRole(UserRole.ROLE_USER);

		userService.save(user);

		User userFromDb = userRepository.findAll().stream().findFirst().get();

		Periodical periodical = new Periodical();
		periodical.setName("1");
		periodical.setDescription("1");
		periodical.setPrice(10d);

		Periodical periodical2 = new Periodical();
		periodical2.setName("12");
		periodical2.setDescription("12");
		periodical2.setPrice(12d);

		periodicalsRepository.saveAll(Arrays.asList(periodical, periodical2));

		List<Periodical> periodicalsFromDb = periodicalsRepository.findAll();

		Date now = new Date();
		Bucket bucket = new Bucket();
		bucket.setPeriodical(periodicalsFromDb.get(0));
		bucket.setUser(userFromDb);
		bucket.setPurchaseDate(now);

		Bucket bucket2 = new Bucket();
		bucket2.setPeriodical(periodicalsFromDb.get(1));
		bucket2.setUser(userFromDb);
		bucket2.setPurchaseDate(now);

		List<Bucket> buckets = bucketRepository.findAll();
		assertThat(buckets, hasSize(0));

		bucketRepository.saveAll(Arrays.asList(bucket, bucket2));

		buckets = bucketRepository.findAll();
		assertThat(buckets, hasSize(2));

		bucketservice.delete(buckets.get(0).getId());
		buckets = bucketRepository.findAll();

		assertThat(buckets, hasSize(1));

	}

	@Test
	public void testGetAll() {

		User user = new User();
		user.setEmail("1@gmail.com");
		user.setFirstName("1");
		user.setLastName("1");
		user.setPassword("1");
		user.setPasswordConfirm("1");
		user.setRole(UserRole.ROLE_USER);

		userService.save(user);

		User userFromDb = userRepository.findAll().stream().findFirst().get();

		Periodical periodical = new Periodical();
		periodical.setName("1");
		periodical.setDescription("1");
		periodical.setPrice(10d);

		Periodical periodical2 = new Periodical();
		periodical2.setName("12");
		periodical2.setDescription("12");
		periodical2.setPrice(12d);

		periodicalsRepository.saveAll(Arrays.asList(periodical, periodical2));

		List<Periodical> periodicalsFromDb = periodicalsRepository.findAll();

		Date now = new Date();
		Bucket bucket = new Bucket();
		bucket.setPeriodical(periodicalsFromDb.get(0));
		bucket.setUser(userFromDb);
		bucket.setPurchaseDate(now);

		Bucket bucket2 = new Bucket();
		bucket2.setPeriodical(periodicalsFromDb.get(1));
		bucket2.setUser(userFromDb);
		bucket2.setPurchaseDate(now);

		List<Bucket> buckets = bucketRepository.findAll();
		assertThat(buckets, hasSize(0));

		bucketRepository.saveAll(Arrays.asList(bucket, bucket2));

		List<Bucket> bucketsFromDb = bucketservice.getAll();
		assertThat(bucketsFromDb, hasSize(2));

	}

}
