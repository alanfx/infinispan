@echo off

:noenvreset
set my_classpath=
for /f "tokens=* delims=" %%f in ('dir /s /b /a-d "..\modules\core\lib\*.jar"') do (
		call set my_classpath=%%my_classpath%%;%%~f)
	)
set my_classpath=%my_classpath:~1%

for /f "tokens=* delims=" %%f in ('dir /s /b /a-d "..\modules\core\*.jar"') do (
                call set my_classpath=%%my_classpath%%;%%~f)
        )
set my_classpath=%my_classpath:~1%


for /f "tokens=* delims=" %%f in ('dir /s /b /a-d "..\modules\gui-demo\*.jar"') do (
                call set my_classpath=%%my_classpath%%;%%~f)
        )
set my_classpath=%my_classpath:~1%


for /f "tokens=* delims=" %%f in ('dir /s /b /a-d "..\modules\gui-demo\lib\*.jar"') do (
                call set my_classpath=%%my_classpath%%;%%~f)
        )
set my_classpath=%my_classpath:~1%

java -cp %my_classpath% -Dbind.address=127.0.0.1 -Djava.net.preferIPv4Stack=true -Dlog4j.configuration=..\etc\log4j.xml org.infinispan.demo.InfinispanDemo


