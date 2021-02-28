describe("test", () => {
  it("test nlw+4", () => {
    expect("nlw" + 4).toBe("nlw4");
  });

  it("test not nlw+4", () => {
    expect("nlw" + 4).not.toBe("nlw5");
  });
});
