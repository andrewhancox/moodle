<?php

namespace ltiservice_gradebookservices\hook;

use grade_grade;
use grade_item;

final class lineitemreceived implements \core\hook\described_hook {

    public function __construct(
        public readonly object $lineitem,
        public readonly grade_item $grade_item,
    ) {
    }

    public static function get_hook_description(): string {
        return 'LTI entity saved';
    }

    public static function get_hook_tags(): array {
        return array();
    }
}