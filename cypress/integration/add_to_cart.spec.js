describe("Navigation", () => {
  it("Should visit root", () => {
    cy.visit("/");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it(`Should add the first product to cart if click "Add to Cart" button`, () => {
    cy.get(".products article").first();
    cy.contains("Add").click({ force: true });
    cy.contains("My Cart (1)");
  });
});
