<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

namespace ltiservice_gradebookservices\hook;

use grade_item;

/**
 * Hook dispatched when a tool updates a line item through the LTI Assignment and Grade Services.
 *
 * @package    ltiservice_gradebookservices
 * @copyright  2025 Andrew Hancox <andrewdchancox@googlemail.com>
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
final class lineitemreceived implements \core\hook\described_hook {
    /**
     * Constructor.
     *
     * @param object $lineitem The line item as it will be returned to the tool (JSON object).
     * @param grade_item $grade_item The Moodle grade item the line item maps to.
     */
    public function __construct(
        /** @var object The line item as it will be returned to the tool (JSON object). */
        public readonly object $lineitem,
        /** @var grade_item The Moodle grade item the line item maps to. */
        public readonly grade_item $grade_item,
    ) {
    }

    #[\Override]
    public static function get_hook_description(): string {
        return 'LTI line item received';
    }

    #[\Override]
    public static function get_hook_tags(): array {
        return ['course'];
    }
}
