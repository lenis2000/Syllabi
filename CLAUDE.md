# Project Knowledge Base

## Canvas HTML Accessibility Requirements

When preparing HTML syllabi for Canvas LMS, the following accessibility requirements must be met:

### Heading Hierarchy
- **First heading must be `<h2>`** - Canvas requires the main title to be `<h2>`, not `<h1>`
- After changing the main title to `<h2>`, adjust all subsequent headings:
  - Major sections: `<h3>` (e.g., "Contact & Logistics", "Grading", "Policies")
  - Subsections: `<h4>` (e.g., "Late work", "Honor Code", "Attendance")
- Update CSS to maintain visual appearance while using semantic hierarchy

### Alt Text
- Keep alt text **under 120 characters**
- Focus on describing the essential content/purpose, not every detail
- Example: Instead of describing every element in an image, summarize its main purpose

### Tables
- **Must include a `<caption>`** describing table contents
- **Must include at least one header** (use `<th>` elements)
- For presentation tables (like contact info layouts), you can:
  - Add `role="presentation"` attribute
  - Visually hide the caption with CSS while keeping it accessible:
    ```css
    .info-table caption {
        position: absolute;
        left: -10000px;
        width: 1px;
        height: 1px;
        overflow: hidden;
    }
    ```

## File Management

### Two-Version Approach for HTML Syllabi
To resolve the conflict between Canvas requirements (h2 first) and web accessibility (h1 first):
- **`Syllabus_NAME.html`** - Standalone website version with `<h1>/<h2>/<h3>` hierarchy
- **`Syllabus_NAME_canvas.html`** - Canvas version with `<h2>/<h3>/<h4>` hierarchy
- Both versions should be identical except for heading hierarchy
- Keep CSS identical in both files for consistent visual appearance

## Workflow Patterns

### Making Multiple Related Changes
When making accessibility or formatting changes that affect multiple elements (like heading hierarchy), handle them systematically:
1. Read the file to understand current structure
2. Update CSS first to accommodate new HTML structure
3. Use `replace_all: true` when replacing multiple identical instances
4. Process changes in logical order (main sections first, then subsections)
