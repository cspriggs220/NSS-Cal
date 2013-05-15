<h1>NSS Cal Project</h1>
<hr>
<p>This is a project for the Nashville Software School, in which I'm building a Ruby command line program that can print out the calendar (a la the cal command) of a given month and/or year.</p>
<em><p>This project is incomplete</p></em>
<hr>
<h3>Phase 1 - <em>complete</em></h3>
<ul>
  <li>Write integration tests for the several edgecases that deal with leap year integration.</li>
  <li>Utilize sample cal implementation to make tests pass.</li>
</ul>
<h3>Phase 2 - <em>complete</em></h3>
<ul>
  <li>Write methods that will begin to print out the necessary items in a calendar.</li>
  <li>Write tests for these methods.</li>
  <li>Make them pass.</li>
</ul>
<h3>Phase 3 - <em>incomplete</em></h3>
<ul>
  <li>Build Year class for full year integration with cal.</li>
  <li>Write methods to use existing Month class to build the Year class.</li>
  <li>Write the tests and make them pass.</li>
  <li>Refactor</li>
</ul>
<ol>List of methods used for Month Class
  <li><b>initialize method</b></li>
  <li><b>month_header method</b></li>
  <li><b>days_header method</b></li>
  <li><b>zeller method</b></li>
  <li><b>leap_year? method</b></li>
  <li><b>numbers_in_month method</b></li>
  <li><b>nil_units method</b> replaces blank space before first date of month</li>
  <li><b>month_array_with_nil_units</b></li>
  <li><b>all_weeks_in_month_array</b></li>
  <li><b>format_month</b></li>
  <li><b>format_weeks</b></li>
  <li><b>get_week(n)</b></li>
  <li><b>format_calendar</b></li>
  <li><b>
</ol>
<ol>List of methods used for Year Class
  <li><b>initialize method</b></li>
  <li><b>year_header method</b></li>
  <li><b>months_header method</b></li>
  <li><b>format_month_header method</b></li>
  <li><b>days_header method</b></li>
  <li><b>create_months</b></li>
  <li><b>format_year</b></li>
</ol>

