const { test, expect } = require('@playwright/test');

test('basic test', async ({ page }) => {
  await page.goto('http://localhost:3000/baked');  
  const name = await page.innerText('.Baked__InnerHeader-xn1e9l-4');
  const text = "🧁 Top tracks"
  expect(name).toBe(text);
});
