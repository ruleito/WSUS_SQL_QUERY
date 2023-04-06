SELECT
    CASE
        WHEN Donwstream.AccountName IS NULL THEN 'ML-00-WSUS-1'
        ELSE Donwstream.AccountName
    END AS 'WSUS',
    CASE
        WHEN OSBuildNumber = 17763 THEN 'Windows Server 2019 Datacenter'
        WHEN OSBuildNumber = 17763 THEN 'Windows Server 2019 Standard'
        WHEN OSBuildNumber = 22621 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 22000 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 19045 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 19044 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 19043 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 19041 THEN 'Windows 10'
        WHEN OSBuildNumber = 18362 THEN 'Windows 10, Version 1903'
        WHEN OSBuildNumber = 14393 THEN 'Windows Server 2016 Standard'
        WHEN OSBuildNumber = 18363 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 15063 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 16299 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 19042 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 9600 THEN 'Windows 8.1'
        WHEN OSBuildNumber = 9200 THEN 'Windows 8'
        WHEN OSBuildNumber = 7601 THEN 'Windows 7'
        ELSE Computer.OSDescription
    END AS 'OS',
    SUM(CASE WHEN Failer.Failed > 0 THEN 1 ELSE 0 END) AS 'Failed',
    SUM(CASE WHEN Failer.Failed > 0 THEN 0 ELSE 1 END) AS 'OK'
FROM tbComputerTarget
LEFT JOIN tbComputerTargetDetail AS Computer ON tbComputerTarget.TargetID = Computer.TargetID
LEFT JOIN tbDownstreamServerTarget AS Donwstream ON tbComputerTarget.ParentServerTargetID = Donwstream.TargetID
LEFT JOIN tbComputerSummaryForMicrosoftUpdates AS Failer ON Computer.TargetID = Failer.TargetID
WHERE Donwstream.AccountName IS NOT NULL
GROUP BY Donwstream.AccountName, CASE WHEN OSBuildNumber = 17763 THEN 'Windows Server 2019 Datacenter'
        WHEN OSBuildNumber = 17763 THEN 'Windows Server 2019 Standard'
        WHEN OSBuildNumber = 22621 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 22000 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 19045 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 19044 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 19043 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 19041 THEN 'Windows 10'
        WHEN OSBuildNumber = 18362 THEN 'Windows 10, Version 1903'
        WHEN OSBuildNumber = 14393 THEN 'Windows Server 2016 Standard'
        WHEN OSBuildNumber = 18363 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 15063 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 16299 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 19042 THEN 'Windows 10 Pro'
        WHEN OSBuildNumber = 9600 THEN 'Windows 8.1'
        WHEN OSBuildNumber = 9200 THEN 'Windows 8'
        WHEN OSBuildNumber = 7601 THEN 'Windows 7'
        ELSE Computer.OSDescription
    END
ORDER BY 'WSUS', 'OS';
