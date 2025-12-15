<?php

namespace ltiservice_gradebookservices\hook;

use grade_grade;
use grade_item;

final class scorereceived implements \core\hook\described_hook {

    public function __construct(
        public readonly object $score,
        public readonly grade_item $grade_item,
        public readonly int $userid,
    ) {
    }

    public static function get_hook_description(): string {
        return 'LTI score received';
    }

    public static function get_hook_tags(): array {
        return ['course', 'user'];
    }
}