describe('Rails using factory bot examples', function() {
    // beforeEach(() => {
    //     cy.visit('http://localhost:3000/')
    // })
  
    it('using single factory bot', function() {
      cy.visit('http://localhost:3000/')
      cy.contains('New tracks')
    })
  
})
  