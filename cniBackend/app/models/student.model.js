module.exports = (sequelize, Sequelize) => {
  const Student = sequelize.define("student", {
    nom: {
      type: Sequelize.STRING
    },
    prenom: {
      type: Sequelize.STRING
    },
    address: {
      type: Sequelize.STRING
    },
    niveau: {
      type: Sequelize.STRING
    },
    location: {
      type: Sequelize.STRING
    },
    telephone: {
      type: Sequelize.STRING
    },
    dateNaissance: {
      type: Sequelize.STRING
    }
  });

  return Student;
};
