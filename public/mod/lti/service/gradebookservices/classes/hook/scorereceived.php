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
 * Hook dispatched after a tool posts a score through the LTI Assignment and Grade Services.
 *
 * @package    ltiservice_gradebookservices
 * @copyright  2025 Andrew Hancox <andrewdchancox@googlemail.com>
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
final class scorereceived implements \core\hook\described_hook {
    /**
     * Constructor.
     *
     * @param object $score The score posted by the tool (decoded JSON object).
     * @param grade_item $grade_item The Moodle grade item the score was saved against.
     * @param int $userid The ID of the user the score is for.
     */
    public function __construct(
        /** @var object The score posted by the tool (decoded JSON object). */
        public readonly object $score,
        /** @var grade_item The Moodle grade item the score was saved against. */
        public readonly grade_item $grade_item,
        /** @var int The ID of the user the score is for. */
        public readonly int $userid,
    ) {
    }

    #[\Override]
    public static function get_hook_description(): string {
        return 'LTI score received';
    }

    #[\Override]
    public static function get_hook_tags(): array {
        return ['course', 'user'];
    }
}
