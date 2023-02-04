const dbConfig = require("../config/db.config.js");

const Sequelize = require("sequelize");
const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
  host: dbConfig.HOST,
  dialect: dbConfig.dialect,
  operatorsAliases: false,

  pool: {
    max: dbConfig.pool.max,
    min: dbConfig.pool.min,
    acquire: dbConfig.pool.acquire,
    idle: dbConfig.pool.idle
  }
});

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.users = require("./user.model.js")(sequelize, Sequelize);
db.stages = require("./stage.model.js")(sequelize, Sequelize);
db.students = require("./student.model.js")(sequelize, Sequelize);

db.users.hasMany(db.stages, { as: "stages" });
db.stages.belongsTo(db.users, {
  foreignKey: "userId",
  as: "user",
});

db.users.hasMany(db.students, { as: "students" });
db.students.belongsTo(db.users, {
  foreignKey: "userId",
  as: "user",
});

module.exports = db;
