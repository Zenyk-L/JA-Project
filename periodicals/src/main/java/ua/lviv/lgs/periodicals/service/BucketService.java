package ua.lviv.lgs.periodicals.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.periodicals.dao.BucketRepository;
import ua.lviv.lgs.periodicals.domain.Bucket;

@Service
public class BucketService {

	private Logger logger = LoggerFactory.getLogger(BucketService.class);

	@Autowired
	private BucketRepository bucketRepository;

	public List<Bucket> getAll() {
		logger.info("Get all buckets items");
		return bucketRepository.findAll();
	}

	public void delete(Integer id) {
		logger.info("Delete bucket item {} :" + bucketRepository.getById(id));
		bucketRepository.deleteById(id);
	}

	public Bucket add(Bucket bucket) {
		logger.info("Create new bucket item {}: " + bucket);
		return bucketRepository.save(bucket);
	}

}
