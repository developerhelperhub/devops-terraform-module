<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 https://maven.apache.org/xsd/settings-1.0.0.xsd">
    <servers>
        <server>
            <id>${app_repository_id}</id>
            <username>${app_repository_username}</username>
            <password>${app_repository_password}</password>
        </server>
        <server>
            <id>${app_central_repository_id}</id>
            <username>${app_central_repository_username}</username>
            <password>${app_central_repository_password}</password>
        </server>
    </servers>

    <profiles>
        <profile>
            <id>my-app</id>
            <repositories>
                <repository>
                    <id>${app_repository_id}</id>
                    <name>${app_repository_id}</name>
                    <url>${app_repository_url}</url>
                    <layout>default</layout>
                </repository>
            </repositories>
        </profile>
    </profiles>

    <activeProfiles>
        <activeProfile>my-app</activeProfile>
    </activeProfiles>

    <mirrors>
        <mirror>
            <id>${app_central_repository_id}</id>
            <mirrorOf>*</mirrorOf>
            <url>${app_central_repository_url}</url>
            <name>Artifactory</name>
            <blocked>false</blocked>
        </mirror>
    </mirrors>
</settings>