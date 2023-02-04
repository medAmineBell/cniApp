module.exports = (sequelize, Sequelize) => {
  const Stage = sequelize.define("stage", {
    type: {
      type: Sequelize.STRING
    },
    sujet: {
      type: Sequelize.STRING
    },
    encadrant: {
      type: Sequelize.STRING
    },
    dateDep: {
      type: Sequelize.STRING
    },
    dateFin: {
      type: Sequelize.STRING
    },
    payer: {
      type: Sequelize.BOOLEAN
    },
    status: {
      type: Sequelize.BOOLEAN
    }
  });

  return Stage;
};
