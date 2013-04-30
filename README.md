<h1>NSS Cal Project</h1>
<hr>
<p>This is a project for the Nashville Software School, in which I'm building a Ruby command line program that can print out the calendar (a la the cal command) of a given month and/or year.</p>
<em><p>This project is incomplete</p></em>
<hr>
<h3>Phase 1</h3>
<ul>
  <li>Write integration tests for the several edgecases that deal with leap year integration.</li>
  <li>Utilize sample cal implementation to make tests pass.</li>
</ul>
<h3>Phase 2</h3>
<ul>
  <li>Write methods that will begin to print out the necessary items in a calendar.</li>
  <li>Write tests for these methods.</li>
  <li>Make them pass.</li>
</ul>
<ol>List of Methods used (to this point)
  <li>initialize method with two arguments upon creating a new instance of a Cal object.</li>
  <li>find_month method that contains an array of all months, which returns the value of the month in the Cal object as a string.</li>
  <li>month_header method which returns the stringified values of the Cal object centered with accurate spacing on both sides.</li>
  <li>days method which contains an array of abbreviated strings representing the days of the week.</li>
  <li>days_header method that creates a single string out of the days method array, to be printed with each calendar.</li>
  <li>get_first_of_month method utilizes Zeller's Congruence algorithm to find out which day of the week a month will begin.</li>
  <li>leap_year? method to be utilized in the future when determining if selected Cal object is a leap year.</li>
</ol>
