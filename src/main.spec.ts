import { sum } from "./main"

test('2+2=4', function () {
  const res = sum(2, 2)
  expect(res).toBe(4)
})
