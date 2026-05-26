# Good Grants API writing style

Use this guide when writing or editing API descriptions for Good Grants.

## Core principles

Prioritize technical accuracy over stylistic preference.
When multiple phrasings are possible, prefer the one that is clearest, simplest, and most consistent with the rest of the docs.

## Tone and wording

- Use simple, direct language.
- Avoid filler words and subjective phrases such as `easily`, `simple`, `really`, or `and that's it`.
- Avoid slang, humor, and overly casual language.
- Avoid Latin abbreviations such as `e.g.`, `i.e.`, and `etc.`. Prefer `for example`, `that is`, or `and so on`.
- Use inclusive language.

## Brand names and naming conventions

- Write `Good Grants` as two words with initial capitals.
- Never write `GoodGrants`, `good grants`, `GOOD GRANTS`, or `GG` in prose.
- Use `goodgrants.com` in plain lowercase when referring to domains.
- Do not add `http://`, `https://`, or `www.` unless the full URL is necessary.
- Use official product, API, and UI terms consistently. Do not rename a term for style if the product or API uses a specific label.

## Preferred terminology

- Prefer `configure` over `customise` or `customize` in prose.
- Prefer `platform` or `software` over vague terms such as `system` or `solution` when a more specific term is possible.
- Use the product's official role and workflow names when they matter, such as `applicant`, `reviewer`, `chapter administrator`, `grant manager`, `application`, and `review suite`.

## Perspective and explicitness

- Be explicit about who performs an action.
- In explanatory prose, prefer `you` for reader actions instead of `we`.
- When referring to the product or company, use `Good Grants` rather than `we`.
- Explain why a value, setting, or workflow matters when that context helps the reader use the API correctly.

## General guidance

- Use sentence case in descriptions.
- Start sentences with a capital letter and end them with a period, except summaries.
- Add useful descriptions to operations, schemas, fields, parameters, and tags.
- Do not begin descriptions with articles such as `The`, `A`, or `An`.
- Prefer active voice and present tense.
- Avoid passive voice.
- Avoid vague modal verbs such as `should`, `could`, and `can` when a direct statement is clearer.
- For multi-line YAML descriptions, use `description: |-` so Markdown formatting is available.

## Avoid knowledge bias

Do not assume readers already understand Good Grants concepts.
Explain product-specific terms such as programs, rounds, applications, reviewers, score sets, and workflow states when they appear in a description.
If more context is needed, add it directly or link to a relevant docs page.

## Possessive apostrophes

Avoid possessive apostrophes for inanimate objects.

- Use `Update a user's email address.`
- Avoid `Update an application's score.`
- Prefer `Update the score for an application.`
- Prefer `ID of the round.` over `round's ID`.

## Anthropomorphic wording

Do not describe inanimate objects as if they perform human actions.
Prefer wording that explains what the reader or integrator does.
Avoid verbs such as `enable`, `allow`, `let`, `help`, and `prevent` when they assign actions to operations, features, or settings.

- Avoid `This feature allows you to...`
- Prefer `Use this feature to...`
- Avoid `Program settings prevent duplicate submissions.`
- Prefer `Use program settings to block duplicate submissions.`

## Acronyms and product names

- Define uncommon acronyms on first use, then use the acronym consistently.
- Capitalize proper nouns such as Good Grants, Award Force, OpenAPI, OAuth, and webhook names.

## UI labels and procedural references

- When describing a product workflow, match UI labels exactly as they appear in the product.
- Do not normalize or rewrite a button, menu, workspace, or heading label for style.
- In procedural docs, prefer formatting that makes UI references easy to scan, such as italics for navigation paths and bold for actions, when that matches the surrounding docs style.

## Capitalization

- Use sentence case for descriptions and summaries.

## Line breaks

Use semantic line breaks in long descriptions.
Break lines at complete units of thought so YAML descriptions stay readable in diffs.
Prefer line breaks after a period or comma, not in the middle of a thought.

## Avoid noun strings

Prefer descriptions that show the relationship between words.

- Avoid `Application review assignment status.`
- Prefer `Status of the review assignment for the application.`
- Avoid `Grant program owner field.`
- Prefer `Field used by the program owner.`

## Tags

Tag descriptions should explain the resource or workflow group, not just repeat the tag name.
Add context when the relationship between resources is not obvious.
Link to related content when extra workflow context would help the reader.

## Summaries

- Start summaries with an imperative verb such as `Create`, `Retrieve`, `Update`, or `Delete`.
- Do not end summaries with a period.
- Use sentence case.
- Avoid possessive apostrophes for inanimate objects.

Examples:

- `Create an application`
- `Retrieve a reviewer assignment`
- `Update a round`

## Operation descriptions

- Start operation descriptions with an active verb in present tense, such as `Creates`, `Retrieves`, `Updates`, or `Deletes`.
- Use verb phrases to describe what the operation does.
- Do not write the first sentence as a command.
- Do not begin with `The`, `A`, or `An`.
- Provide detail and link to related content if necessary.

Tip:

- As a drafting aid, imagine prefixing the first sentence with `This operation ...`.
- Remove that prefix in the final description.

Examples:

- `Creates a new application for the specified program.`
- `Retrieves a reviewer assignment with a specified ID.`
- `Updates workflow state for a specified application.`

## Field descriptions

- Use noun phrases for field descriptions.
- Describe what the field is, not what it does.
- Avoid repeating the field name without adding context.
- Avoid starting with articles.
- Provide detail and link to related content if necessary.

Tip:

- As a drafting aid, imagine prefixing the description with `This field is the ...`.
- Remove that prefix in the final description.

Examples:

- `ID of the program.`
- `Date and time when the round opens.`
- `State of the application.`

## Timestamp fields

Use `Date and time when ...` to describe timestamp fields.

Examples:

- `Date and time when the round opens.`
- `Date and time when the application is submitted.`

## Objects and properties

Describe what the value is and, when needed, how it relates to the operation or surrounding workflow.
Give enough detail for the reader to understand the value without needing to guess its purpose.


## Boolean fields

Use `Specifies whether ...` or `Specifies if ...` for boolean descriptions.

Examples:

- `Specifies whether the application is withdrawn.`
- `Specifies whether the reviewer is active.`

## Parameters

- For `in: query` parameters, use imperative verb phrases because query parameters modify request behavior.
- For `in: path`, `in: header`, and `in: cookie` parameters, use noun phrases that describe the value.
- Avoid starting parameter descriptions with articles.

Examples:

- `Filter by round IDs.`
- `Sort by submitted time.`
- `Limit the number of items returned.`
- `ID of the application.`
- `Slug of the program.`

## Response descriptions

Keep response descriptions short and direct.
Avoid unnecessary `was` or `will` phrasing.

Examples:

- `Application retrieved.`
- `Reviewer assignment updated.`
- `Round deleted.`

## General docs authoring guidance

Use these rules for broader documentation prose around the API, such as supporting pages, examples, and explanatory notes.
If a rule here conflicts with the API-description-specific sections above, follow the API-description-specific rule.

- Prefer UK English in prose unless a literal API field, UI label, or external standard requires a different spelling.
- Prefer imperative headings such as `Configure authentication` instead of gerund headings such as `Configuring authentication`.
- Introduce lists with a short lead-in sentence and a colon.
- Use numbered lists for ordered procedures and bulleted lists for unordered items.
- End bullet items with periods when they are full sentences. Single-word items do not need periods.
- Add explanatory text before code blocks instead of placing a code block directly under a heading.
- Introduce code blocks with a colon and a blank line, and specify the language when possible.
- Avoid long sentences with embedded parentheses when a new sentence would be clearer.
- Prefer short paragraphs over dense blocks of text.
- Use contractions only when the meaning is unambiguous. If a contraction could be read in more than one way, write it out.
- For small numbers in prose, prefer words such as `two` unless numerals improve precision.
- Avoid slang, idioms, and exaggerated claims such as `easy`, `simple`, or `you're good to go`.
- Avoid Latin abbreviations such as `e.g.`, `i.e.`, and `etc.` in prose. Prefer `for example`, `that is`, or `and so on`.
- Use correct casing for technology and product names.
- Explain why a step, setting, or feature matters when that context helps the reader make correct decisions.
- Use exact versions or explicit references when precision matters, instead of time-sensitive wording such as `current version`.
- Avoid predicting future behavior or roadmap outcomes in documentation.
- Avoid ampersands in prose unless they are part of a literal name, code example, or operator.
- Avoid em-dashes. Prefer a standard hyphen or rewrite the sentence for clarity.
- Avoid formulaic AI-style patterns such as bold prefixes in bullets or overly mechanical prose.

## Dates, times, and inclusive alternatives

- In prose, prefer day-month order, such as `13 April`.
- Do not use ordinal suffixes in dates such as `11th` or `23rd`.
- When a 12-hour time example is appropriate, prefer forms such as `9am` and `11.30am`.
- Prefer `allowlist` or `safelist` over `whitelist`.
- Prefer `denylist` or `blocklist` over `blacklist`.
- Prefer `pre-launch check` or `final check` over `sanity check`.
