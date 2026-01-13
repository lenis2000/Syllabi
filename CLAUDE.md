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

### Three-Version Approach for Syllabi
Syllabi are maintained in three parallel versions:
- **`Syllabus_NAME.html`** - Standalone website version with `<h1>/<h2>/<h3>` hierarchy
- **`Syllabus_NAME_canvas.html`** - Canvas version with `<h2>/<h3>/<h4>` hierarchy (accessibility requirement)
- **`Syllabus_NAME.tex`** - LaTeX source that compiles to PDF
- All three versions should have identical content except for format-specific requirements
- When updating content, **all three files must be updated** to maintain consistency

### Semester-Specific Resources
- Images and other resources are stored in semester-specific folders on S3 (e.g., `S25/`, `S26/`)
- When updating for a new semester, remember to:
  1. **Move/copy the image on S3** to the new semester folder
  2. Update image URLs in HTML files (e.g., `storage.lpetrov.cc/EGMT1520/S25/` → `.../S26/`)
  3. LaTeX files typically use local image paths (e.g., `EGMT_image.png`)

## Workflow Patterns

### Making Multiple Related Changes
When making accessibility or formatting changes that affect multiple elements (like heading hierarchy), handle them systematically:
1. Read the file to understand current structure
2. Update CSS first to accommodate new HTML structure
3. Use `replace_all: true` when replacing multiple identical instances
4. Process changes in logical order (main sections first, then subsections)

### Standard Build and Deploy Workflow
When updating syllabi:
1. Make content changes to all three versions (HTML, Canvas HTML, LaTeX)
2. Build the PDF: `pdflatex -interaction=nonstopmode Syllabus_NAME.tex`
3. Review changes with `git status` and `git diff`
4. Commit with descriptive message and push: `git add <files> && git commit -m "..." && git push`
5. For semester transitions, remember to move/copy images on S3 to new semester folder

## LaTeX Conventions

### Line Length
- Keep lines reasonably short (around 80 characters) for better readability and version control
- Break long paragraphs at natural sentence boundaries
- LaTeX will reflow text during compilation, so line breaks in source don't affect output
