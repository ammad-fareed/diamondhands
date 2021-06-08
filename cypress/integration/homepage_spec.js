describe('Homepage', function() {
  
    it('Should visit the root page', function() {
      cy.visit('http://localhost:3000/')
      cy.contains('New tracks')
    })
  
})
  