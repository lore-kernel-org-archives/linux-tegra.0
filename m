Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010067.outbound.protection.outlook.com [52.101.61.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C5F3033FB;
	Wed, 18 Mar 2026 17:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773854946; cv=fail; b=OTHOfd3488dF5C58715xYKg+EGj1+1CKeCJRihXvY3ipQ5BaofsMjMwPKLHKfhcvb8F32U0u0uVhk1sEnXYCPBLwhWAt1KJxWPBSw9gnW4tnyqmeakgW50HQKoMv6Dvs5boulr+XdfnlQ6Z5jB1pwbQ3j5RODoKpF7WyvNTblDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773854946; c=relaxed/simple;
	bh=4k3CGfvuqRnFWHb6z9uSDpzgKKE2UlJjxN68G1AxnXU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zl6bVG1x+wU0Z9+8qnVuhxYQLE841Su1hYVPulvLoL/H8aOL61pElB/opZnRiBN2Q+Gh72VqI8l/F5Xh+zDmB9v+ehSVWoMAkd2iPD/CaJp0kRQhz4z8hhcor+6zQOFZqlcgRYQndZAEVWQWrzgsSmPfZAhTrYFgdqEzi40K8uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hC2NGDgu; arc=fail smtp.client-ip=52.101.61.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hC2NGDgu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsYvPyQ55p6hq6Qntk3z/TCVv6qOJdFX8AzGQGRg/Rvn5qOP2qAd3krekugsGnhvl8q89CEyrJcmYlT3l9mq8b7Zg5bcL1phEVk2vHc1XrdpUHPomQiPCyiai06ldtn1pQOT4zYvTehibJEbaIfGn+BNsTAmpnFCrZwAA/4qkQSRX1SFI5Cd9rr7B0/ueGXQHJnZtZ2vm3eaEa9mpW2avzeLilrEbQWa5yzLJbnV+KGKoDLfU9LsoO80Xv706Memsqab/CuRYfaHJq9ePOMdfYEGkiPXyDu6Xd8QBUDLiOVoOItw76YsA89inFFTGXvzP1LudI/jX4Sn2JmHVZfpdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3BiRDm9LD/TWNCy0470OWScGle1q0iYyCockNhQuSo=;
 b=rN+6I//l37IuBgy92Af667BXH/0MvWvfhf6WN7O8lkcrZW28MmaXc2Q+z7OKaNf64qgkb4RIT41Eo5hvoXX58krxj2/l/rYBWG3BM74vVk95RMcJMlfKH3rcVCol5zIRia8kKtAzmn/tytNdZsk3Yxoh78Ki9zKUfzpW1H8RMSg5UXKNsyrBA+WtIch584jlu6Fbfoc3oKlgl+/IndTBu5wQBkpRPcs6VrRTW+GfDOkGqLSjOOfronzTTIH//72foE77C+6m/mdppEF3JQ+01lRSCb+XSLeAtAnvCQc407eCgldl39JKO7wFKQQfPgbLuAVaCt4raLizxULrcpsi6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3BiRDm9LD/TWNCy0470OWScGle1q0iYyCockNhQuSo=;
 b=hC2NGDgukF2/1w3a+7BgSbRv2V+F9JIlo1xGvUcoIhNvGVn8YAfkP3PsJKCS4c9vGb39oSeFg3QVKewDQyyPuclbKd2r3Z5CypcjtlrSePNpvIEg0KH9yK5MFQQCWdp0y7QbXKSLhsiVGt6G37mPXS7eVugPkPRE2Gqunx0KHRlIyu/alAprAtdUxaQTO8GZZELwZ1J7pXB5gYIotb4di65OgG6Bl16naZf2++4P6Bt+m+sXVLzi1lt/vQBMgLTe6Ul62+a33OXhlkpUNOFqCX+hnOj1X1WWXErzfr2no3JV39b+tS4qobShI+3Zjz+3cGoZWlZ8s/kgDqrYvg/Qdg==
Received: from DS7PR03CA0116.namprd03.prod.outlook.com (2603:10b6:5:3b7::31)
 by MW6PR12MB8865.namprd12.prod.outlook.com (2603:10b6:303:23b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Wed, 18 Mar
 2026 17:28:59 +0000
Received: from DM2PEPF00003FC6.namprd04.prod.outlook.com
 (2603:10b6:5:3b7:cafe::1c) by DS7PR03CA0116.outlook.office365.com
 (2603:10b6:5:3b7::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 17:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM2PEPF00003FC6.mail.protection.outlook.com (10.167.23.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 17:28:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:28:42 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:28:42 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:28:36 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, "Fredrik
 Markstrom" <fredrik.markstrom@est.tech>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Thierry Reding <thierry.reding@kernel.org>, "Jon
 Hunter" <jonathanh@nvidia.com>, Suresh Mangipudi <smangipudi@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 00/12] i3c: Support ACPI and SETAASA device discovery
Date: Wed, 18 Mar 2026 22:57:13 +0530
Message-ID: <20260318172820.13771-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC6:EE_|MW6PR12MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d55e1d-ae58-49ca-a505-08de8513d6b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|1800799024|376014|82310400026|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
	C207k49eGeYfeWgTvKukwBMnavd+6l9qhsTxrgfhOw7jLuPjCYGcCxApyNyX3HU71+sLqvAwcmU7xV/KODuKOD62tQGEG3cnfYOSxMczWZ1q6rl+Dnu7aYS0/4qNkgKrYn9AWRyZN4WZWVwlTeUuH+7eJe/uwBPRjzytPDO9wKVav2tVcaS/Auz4DXWY1ZOvwIQGPSt5cGZMg7pWTSWpOAR9DeLRVS1ioO3R8n6oFrgDEPKHk6WDYPalwSOc3w+PNH7PgPdjkLN+3j+6169GtyIoh96P0zoSpEpYcb2jRA2FohIpMvuHKnk6o20uyVJ5+ROhc0QRNBLop9/xVd2CZyfpDf42Hy+wQNSKFGcsyYkhk2/V8MrwX4eqEXoCX4uxNATrSd0q5YGyT9aAz7ZND2a8Q2HvQ8V9+Ya/FV5xhqzAx3uqiCghuT6YhnzvH6xSN3W9/2dcR9ng0NLxbmo/n+FCn+waUFQWVcXUE31DMLMqMNlU7wc7iF+Q+sqAcQopK3rTOAGC7MNN5/jS6W01ZeiygKAOW3znZ1HnCTkVAA4Fme6JBMjWKNGPNCcyQMPxuzfxAyau2A3RVJv8aDqtxI8Dh+qQsNZAcO+xNPNFcakZSd61IrLOMMFMqfqOgylOMHDHaBz0gthr/vr7/aIQ5Olf+WQOzCklfDd5sRMnpC225xi1EVDMNEjzLUw1hL2JFMdaZO2P2dpGSKnkmHvP9ySpy4OKHN5Pq1CCjBX8FX0oBvmVg9haA7nlhG3R925iQV+RrBeO9/w9FAWs8KX4w5SgCf5seNWGu71NqL6jveCvA0YvdSxz81dc4Vg8fW/0
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G/fkhBe8M/g/1EhpytxjkyEdbQ7oIJ7dzh6omUbaSnKBhG9yjk4eMOuIs+SZvhNjUJdHBZxo3FmqPCUHbjcubv/BJ/GkEi0VKvJGR6qHVSmBM51QukHmiAUnmvtuzr2i8tcZJ9qU1RrB6A1YxNpqeu0IhSPElOz4bgRi3JdvftDHCQ65xIRENLVXmkqArqZAOsKKDML13piLPyD5H2Nzii7gV+EYfiwyUnmsvIC4HTa1OZM3HH7ZHmoOyVGM+eMl3zppeDmk5foPqTJA8W10LNp8Kiq0H5+GNjuKFqcWQ4MkhGctOOzIUYiKz8ftE7Fy5lEwns05K7l7yrasckLJNgynMvtTpQjH+RNxxRjh8uxi28CDWuxFFwSkHFuEcO3jQu2ePgRW2tM8iBa4+W0uhXrzico+m4799cYTHhGVRr2JOw+mr+anhNitomtDupUJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:28:58.5029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d55e1d-ae58-49ca-a505-08de8513d6b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8865

This patch series adds SETAASA device discovery to the I3C subsystem,
enabling support for SPD5118 temperature sensors found on DDR5 memory
modules. The changes also add ACPI support for all existing DAA
methods like SETDASA, SETNEWDA as well as I2C devices on I3C bus.

SPD5118 and similar devices on DDR5 memory modules differ from typical
I3C devices in their initialization. They use SETAASA broadcast CCC
instead of ENTDAA for address assignment, and per JEDEC specification,
are not required to have a Provisioned ID or implement standard device
information CCC commands (GETPID, GETDCR, GETBCR).

The series enables to describe all I3C and I2C devices on both Device
Tree and the ACPI table, using unified device property APIs throughout
the I3C core and the Synopsys DesignWare I3C master driver.

Please note that the series modifies drivers across multiple subsystems,
like Device Tree bindings, ACPI, I3C and HWMON.

Akhil R (12):
  dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
  ACPICA: Read LVR from the I2C resource descriptor
  i3c: master: Use unified device property interface
  i3c: master: Support ACPI enumeration
  i3c: master: Add support for devices using SETAASA
  i3c: master: Add support for devices without PID
  i3c: master: match I3C device through DT and ACPI
  i3c: dw-i3c-master: Add SETAASA as supported CCC
  i3c: dw-i3c-master: Add a quirk to skip clock and reset
  i3c: dw-i3c-master: Add ACPI ID for Tegra410
  hwmon: spd5118: Add I3C support
  arm64: defconfig: Enable I3C and SPD5118 hwmon

 .../devicetree/bindings/i3c/i3c.yaml          |  30 +-
 arch/arm64/configs/defconfig                  |   3 +
 drivers/acpi/acpica/rsserial.c                |   6 +-
 drivers/hwmon/Kconfig                         |   7 +-
 drivers/hwmon/spd5118.c                       |  66 +++-
 drivers/i3c/master.c                          | 327 +++++++++++++++---
 drivers/i3c/master/dw-i3c-master.c            |  66 ++--
 include/acpi/acrestyp.h                       |   1 +
 include/linux/i3c/ccc.h                       |   1 +
 include/linux/i3c/master.h                    |  22 +-
 10 files changed, 439 insertions(+), 90 deletions(-)

-- 
2.50.1

