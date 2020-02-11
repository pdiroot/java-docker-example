package com.dataart.example.back.repository;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Objects;

@Repository
public class ExampleRepository {

    private static final Logger logger = Logger.getLogger(ExampleRepository.class);

    private final DataSource dataSource;

    public ExampleRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public HttpStatus testDataBaseConnection() {
        try (Connection connection = dataSource.getConnection()){
            String schema = connection.getSchema();
            if (Objects.nonNull(schema) && !schema.isBlank()) {
                return HttpStatus.OK;
            }
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return HttpStatus.NOT_FOUND;
    }

    public void writeResult(String ipAddress, int result) {
        String sql = "INSERT INTO result (ip_address, result, time_stamp) VALUES (?, ?, ?)";
        try (Connection connection = dataSource.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, ipAddress);
            preparedStatement.setInt(2, result);
            preparedStatement.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
    }
}
