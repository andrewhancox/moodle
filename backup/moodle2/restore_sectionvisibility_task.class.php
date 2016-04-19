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

/**
 * Defines restore_sectionvisibility_task class
 *
 * @package     core_backup
 * @subpackage  moodle2
 * @category    backup
 * @copyright   2016 onwards Andrew Hancox <andrew_dc_hancox@googlemail.com>
 * @license     http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

defined('MOODLE_INTERNAL') || die();

/**
 * Task to optionally reset the visibility of newly created sections.
 *
 */
class restore_sectionvisibility_task extends restore_task {
    /**
     * @var stdClass Info related to section gathered from backup file
     */
    protected $info;
    /**
     * @var restore_activity_task[]
     */
    protected $restoreactivitytasks;

    /**
     * restore_sectionvisibility_task constructor.
     * @param $name string
     * @param $info stdClass
     * @param $plan stdClass
     * @param $restoreactivitytasks restore_activity_task[]
     */
    public function __construct($name, $info, $plan, $restoreactivitytasks) {
        $this->info = $info;
        $this->restoreactivitytasks = $restoreactivitytasks;
        parent::__construct($name, $plan);
    }

    /**
     * Create all the steps that will be part of this task
     * @throws \base_task_exception
     */
    public function build() {
        $this->add_step(new restore_sectionvisibility_step('sectionvisibility', null, $this->restoreactivitytasks));
        $this->built = true;
    }

    /**
     * There are no settings.
     */
    protected function define_settings() {
    }
}
