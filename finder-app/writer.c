// Writer.c
// Assignment 2 - Advanced Linux
//Author Noah Bergman

#include <syslog.h>
#include <stdio.h>


//Main
int main (int argc, char** argv)
{
	//arg0 = executable
	//arg1 = filename
	//arg2 = text to write
	//arg3 = 
	//open error log

	char *filename = 0;
	char *text = 0;

	openlog (NULL, LOG_CONS | LOG_PERROR, LOG_USER);
	//const char *filename = "not-here.txt";
	if(argc != 3)
	{
		syslog(LOG_ERR, "incorrect number of parameters");
		return 1;
	}

	filename = argv[1];
	text = argv[2];

	FILE *file = fopen (filename, "r+");

	if(file == NULL) //No file found
	{
		syslog(LOG_ERR, "Error opening file: %s", filename);
		return 0;

	} else // try writing to file
	{
		syslog(LOG_DEBUG, "Writing %s to %s", text, filename);
		
		if( fputs(text, file) == -1)
		{
			syslog(LOG_ERR, "Error writing to file");
		}
		fclose(file);
	}

	return 0;

}

