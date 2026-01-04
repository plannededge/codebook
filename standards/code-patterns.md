---
document_name: "code-patterns.md"
location: "standards/code-patterns.md"
codebook_id: "CB-STD-PATTERNS-001"
version: "1.0.0"
date_created: "2026-01-03"
date_last_edited: "2026-01-03"
document_type: "standard"
purpose: "Code patterns and best practices to follow for consistent, maintainable code"
category: "standards"
subcategory: "code-quality"
related_docs:
  - ".claude/skills/code-quality.skill.md"
  - "standards/naming-conventions.md"
status: "active"
ai_parser_instructions: |
  This document defines code pattern standards.
  Customize per project as needed.
  Section markers: === SECTION ===
---

# Code Patterns

[!FIXED!]
## Purpose

These patterns ensure code is consistent, maintainable, and follows best practices. Customize for your specific tech stack.
[!FIXED!]

---

=== GENERAL PATTERNS ===
<!-- AI:GENERAL:START -->

### Single Responsibility

Each function/class should do one thing well.

```javascript
// BAD: Multiple responsibilities
function processUser(user) {
  validateUser(user);
  saveToDatabase(user);
  sendEmail(user);
  updateCache(user);
}

// GOOD: Single responsibility
function validateUser(user) { ... }
function saveUser(user) { ... }
function notifyUser(user) { ... }
function cacheUser(user) { ... }
```

### Early Return

Return early to reduce nesting.

```javascript
// BAD: Deep nesting
function processOrder(order) {
  if (order) {
    if (order.items) {
      if (order.items.length > 0) {
        // process
      }
    }
  }
}

// GOOD: Early returns
function processOrder(order) {
  if (!order) return;
  if (!order.items) return;
  if (order.items.length === 0) return;

  // process
}
```

### Immutability Preferred

Prefer immutable operations.

```javascript
// BAD: Mutating
function addItem(cart, item) {
  cart.items.push(item);
  return cart;
}

// GOOD: Immutable
function addItem(cart, item) {
  return {
    ...cart,
    items: [...cart.items, item]
  };
}
```

### Descriptive over Comments

Code should be self-documenting.

```javascript
// BAD: Comment explaining code
// Check if user is over 18
if (user.age >= 18) { ... }

// GOOD: Self-documenting
const isAdult = user.age >= 18;
if (isAdult) { ... }
```

<!-- AI:GENERAL:END -->

---

=== FUNCTION PATTERNS ===
<!-- AI:FUNCTIONS:START -->

### Parameter Limits

Maximum 3-4 parameters; use objects for more.

```javascript
// BAD: Too many params
function createUser(name, email, age, address, phone, role) { ... }

// GOOD: Object parameter
function createUser({ name, email, age, address, phone, role }) { ... }
```

### Pure Functions Preferred

Functions without side effects are easier to test.

```javascript
// BAD: Side effects
let total = 0;
function addToTotal(amount) {
  total += amount;  // Side effect
  return total;
}

// GOOD: Pure
function add(a, b) {
  return a + b;
}
```

### Function Length

Keep functions under 50 lines; extract if longer.

### Async/Await over Promises

```javascript
// Prefer
async function fetchUser(id) {
  const response = await api.get(`/users/${id}`);
  return response.data;
}

// Over
function fetchUser(id) {
  return api.get(`/users/${id}`)
    .then(response => response.data);
}
```

<!-- AI:FUNCTIONS:END -->

---

=== ERROR HANDLING ===
<!-- AI:ERRORS:START -->

### Fail Fast

Validate inputs early.

```javascript
function processPayment(amount, card) {
  if (amount <= 0) {
    throw new Error('Amount must be positive');
  }
  if (!card || !card.number) {
    throw new Error('Valid card required');
  }
  // Process...
}
```

### Specific Error Types

```javascript
class ValidationError extends Error {
  constructor(field, message) {
    super(message);
    this.field = field;
  }
}

class NotFoundError extends Error {
  constructor(resource, id) {
    super(`${resource} ${id} not found`);
    this.resource = resource;
    this.id = id;
  }
}
```

### Error Messages

Include context in error messages.

```javascript
// BAD
throw new Error('Invalid input');

// GOOD
throw new Error(`Invalid email format: "${email}" must contain @`);
```

### Don't Swallow Errors

```javascript
// BAD
try {
  doSomething();
} catch (e) {
  // Silent failure
}

// GOOD
try {
  doSomething();
} catch (e) {
  logger.error('Failed to do something', { error: e });
  throw e;  // Re-throw or handle appropriately
}
```

<!-- AI:ERRORS:END -->

---

=== ASYNC PATTERNS ===
<!-- AI:ASYNC:START -->

### Handle All Promises

Never leave promises unhandled.

```javascript
// BAD: Unhandled
saveData(data);

// GOOD: Handled
await saveData(data);
// or
saveData(data).catch(handleError);
```

### Parallel vs Sequential

```javascript
// Sequential (slow)
const user = await getUser(id);
const orders = await getOrders(id);

// Parallel (fast)
const [user, orders] = await Promise.all([
  getUser(id),
  getOrders(id)
]);
```

### Timeout Handling

```javascript
async function fetchWithTimeout(url, timeout = 5000) {
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), timeout);

  try {
    const response = await fetch(url, { signal: controller.signal });
    return response;
  } finally {
    clearTimeout(timeoutId);
  }
}
```

<!-- AI:ASYNC:END -->

---

=== DATA HANDLING ===
<!-- AI:DATA:START -->

### Null Checks

Use optional chaining and nullish coalescing.

```javascript
// BAD
const name = user && user.profile && user.profile.name || 'Unknown';

// GOOD
const name = user?.profile?.name ?? 'Unknown';
```

### Default Values

```javascript
function greet({ name = 'Guest', title = '' } = {}) {
  return `Hello, ${title} ${name}`;
}
```

### Destructuring

```javascript
// BAD
const name = user.name;
const email = user.email;

// GOOD
const { name, email } = user;
```

<!-- AI:DATA:END -->

---

=== TESTING PATTERNS ===
<!-- AI:TESTING:START -->

### Arrange-Act-Assert

```javascript
describe('calculateDiscount', () => {
  it('should apply 20% discount for premium users', () => {
    // Arrange
    const user = { tier: 'premium' };
    const price = 100;

    // Act
    const result = calculateDiscount(price, user);

    // Assert
    expect(result).toBe(80);
  });
});
```

### One Assertion Per Test

```javascript
// BAD: Multiple assertions
it('should process order', () => {
  expect(order.status).toBe('processed');
  expect(order.total).toBe(100);
  expect(order.items).toHaveLength(2);
});

// GOOD: Separate tests
it('should set status to processed', () => ...);
it('should calculate correct total', () => ...);
it('should include all items', () => ...);
```

### Test Names

Names should describe expected behavior.

```javascript
// BAD
it('test 1', () => ...);

// GOOD
it('should return null when user not found', () => ...);
```

<!-- AI:TESTING:END -->

---

=== ANTI-PATTERNS TO AVOID ===
<!-- AI:ANTIPATTERNS:START -->

| Pattern | Problem | Alternative |
|---------|---------|-------------|
| Magic numbers | Unclear meaning | Named constants |
| Deep nesting | Hard to read | Early returns |
| God objects | Too many responsibilities | Split into classes |
| Copy-paste code | Duplication | Extract functions |
| Long functions | Hard to test | Break into smaller |
| Callbacks hell | Hard to follow | async/await |
| Mutating params | Unexpected side effects | Return new values |
| Silent failures | Hides bugs | Proper error handling |

<!-- AI:ANTIPATTERNS:END -->

---

=== PROJECT-SPECIFIC ===
<!-- AI:PROJECT:START -->

[?DYNAMIC?]
Add project-specific patterns here:

- Framework patterns (React, Vue, etc.)
- API patterns (REST, GraphQL)
- Database patterns
- State management patterns
[?DYNAMIC?]

<!-- AI:PROJECT:END -->
