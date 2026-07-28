Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012040.outbound.protection.outlook.com [40.93.195.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D8172630;
	Tue, 28 Jul 2026 07:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222057; cv=fail; b=JhtbnG2vgWvGigFiusjJtpQy0fJyDOuX0cwv7UFmZYOGvH/0IgTRg8axhAOTuCXxVxA7l2GxTdGBkw6WOC2KC/9Tq9aiBPCYr7y5Sv9du5BeXEl8DvsmWXHB4C3rLw1tCItHg3PFfy0QsH37d7a/90HgG8o4WFXHorj8PTbyL/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222057; c=relaxed/simple;
	bh=Mz9w9yAxjL4GBBLC5lYsbvDdxU1oG3KSdo5CrWyPTSg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GnByzMrepyGHN7I1KajIIrIHuBn9M52oqxoFlwh1tXY2HGVsHiLQa6OXbAtL4Og/RLw5mzbsxiThiljefsQ3I/lyMarPfevPb7V7jG8mx3tLUjskwn9Iso0nDpf/Lpkey4tuYCt2oDVQObhWcfnDU8FR0ZY1dFLGFQevMzjDpoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gopbT/i8; arc=fail smtp.client-ip=40.93.195.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gopbT/i8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIqPFgz8c4BWeT13eW1yFKOmjjGCoV2irAWDgOpDre+xkRf5MJcjfRhu7TSqriSuC1BjZhrPJ/RIPn8JL80cy/8o6FVTh0tEhMOSN9Qzr6vEKjtd7Fh4y32o2xFzArzzdaGg7LEKH5CqXaS2NsoT44Mm6DrpOkNNlAw70li710A6sFzv9TNy/7ouMFr8a/ZEP8F+iMDyEFRiSZD9ggetSDdufJEYqojt/aRy+nY8/LKvPusmGLF4t4ZelPrMGgUZ7fikKCIRYICeDcb+XRmsU5KfmdCNWgwEs6vC6W7f/F+OqhuG0FBekORbCcOZFT+DP4ZYj5vVA3+DoLC6bntnTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPNxNvfMTPXTK5k/5S5ZPJfs8O9OdT++0WQFpxymsGs=;
 b=scawLBlWGKUgNV3K/fNulDLNSHozImVyQCl+1/1yUpp6oXZdup9rHzn5wF2ofiy69JlD7/6F19GhoqbcfL4OdrrqKP+D3V5iPRsm1BoOYLcZVCbbx8EAzD+lQm0cXeH5zof+uGpBpwP4inw+KF2T1iSdJIWmi0EEiH3uomjvsA9xBAoko/34rry1qhNSySQ+mhFpG9DhzCjEvbHfrZPCs0qBGj95n38RE3bYYaJbjDadWkDylwkyYoJFGoVWzXRxBA4W0STgSmKp5tTif7NWTZ/2PYmBW7mc/TlCQzNKB1O7wdZ5tG54wYA8TaVMt1NSnWcnfLjex6tNcXvqRjw97g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPNxNvfMTPXTK5k/5S5ZPJfs8O9OdT++0WQFpxymsGs=;
 b=gopbT/i8oh7OHCj6eA4EV/FWvpFI/tbXY4pbQcK+02rDTCP+8zqZW08PlkVmY+xnDgTlulq116y2lHW8yo3wpM0MasgK8H/CsxhXJG35eNu0lWEdZYqpuguq6VBzaMnh47zPZNBRiWW02XbC9T1J5CIXPPMWUoIQB6Od+xM+nhVB/SulcBo/b2nzMerMBggCFbNI6zIk1ulX4EctPPMCHPPyW5nKsZMR//idl8d8iwUUJN5LEW0YPHquVnRmpZq78HKagdCIP0b4LpjiG90VNK4Rd9GNseYzlspYbg/ivVZKNoAbFHEc3LuYe2QbIzyBWZ/uDJxaNmTKXbmIZ3bwVA==
Received: from BL1P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::14)
 by SA5PPFE3F7EF2AE.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Tue, 28 Jul
 2026 07:00:49 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::9b) by BL1P222CA0009.outlook.office365.com
 (2603:10b6:208:2c7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 07:00:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 07:00:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 28 Jul
 2026 00:00:28 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:00:28 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 28 Jul 2026 00:00:22 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Frank Li <frank.li@oss.nxp.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, "Jon Hunter" <jonathanh@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v7 00/12] Support ACPI and SETAASA device discovery
Date: Tue, 28 Jul 2026 06:59:42 +0000
Message-ID: <20260728065955.809445-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|SA5PPFE3F7EF2AE:EE_
X-MS-Office365-Filtering-Correlation-Id: 24006d56-bacd-4060-b642-08deec75f45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|23010399003|6133799003|56012099006|10067099003|18002099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	gSkzFN4h30skroM5/+17bULLC703zHQ3MzbM/aQWDMxvEq/cp0bY1DBphnFYwNiLgJ8/zX/z6KNOme+wVorwlWn8G7EUgtbTJuduxnJ5treaegt5jYL1sz30M5D8JglRPVI3KpkNRK/JGfcfgP5LoZf2iKZxk9G54PuQ/JHqitOTnRyIgT1U1AniH1sAaCEEZbPT5jEMX6YPHh+EFE5V8A44QEXbSkXs1WP5uo2jdwSrJld9tQ+YrMHYQwn1w8aT+7qjNrQNgtbVxs8ktxg7vTMysGSMzdWI8g9jlFU2zvbGamNKzN0fyVL6+qpLnzZ7xa4Q8/CNEBrpKzEUeqr0FXhlCc4WCrD+wQH/Y2slxcF4bEprvZYUi3u5m+ZH63pZmQd02PSwh3pbJhis23Yb/ngMscbCQUAuQReaSHFsMcvJJF520GCrksPNV21YOquF9aAqLZ/cd5waMpoH/Ap/7Ds/U8kAYUn20y8XWoif68JRLgGJkkKmx1hPJwlyHJzwnEytppWjvXuGVRCvDWIdwuphAIVancMG2QhgR+fhv1PmNhEEETKzlrJlTaNmg5eu9Ecoit7wHEYB2nlHGsn7iC/OOwupSVjBsHbjvA+e2g00of6Rklk3/BWavn+GYdWxWjjtuE3lvMY1oVYlHKpH+dEul2ATsQ4+ne7zfzg2OoD6FA/ro7ynys3CfzIInbKLvLoL816reR4mP9xFSllfrg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(23010399003)(6133799003)(56012099006)(10067099003)(18002099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	abhkupf9ct1ASviZkpwgxspYU1kjgIBIRP0rOZ3J22S7qZPivs8LU0dQ2mZa+bxEE/wOnkKx81Hq9uMl+/e9aCItye9A3L9oaF+r455TsaWmRdOBXM1zVq5fNqDDE1oYnpsu6PXizhmP8VmkA88fgbwURUidDN5jy+6zRYt3bTX2khrZxFhAQlcegPY8vHWVdnaw1121J5qBS8Bc7dIEVH8UPCjZDlh2+IL9mimd5BUOhl3qPL0oOJCtiaoKn44YgoLQ0eLxWmoQmyEbx/9PMOLkDqvRu2LxRLhNUswhE74q7e7Y23+PqqaMZBpNc1SBZs05yjE5ev6O4hR6tzbxTnpPLtJQ3omejBeGNFl+KHOrwIiGtqAZguHsu1RrIuL/4F2kmeuDGhqDruxpYIKSNvfLGMkOrPqu9Q6nyck2xGIs5CzCQqPid4MYkhFlpDAm
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:00:48.6232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24006d56-bacd-4060-b642-08deec75f45a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE3F7EF2AE

This patch series adds SETAASA device discovery to the I3C subsystem,
enabling support for SPD5118 temperature sensors found on DDR5 memory
modules. The changes also add ACPI support for all existing DAA
methods like SETDASA, SETNEWDA as well as I2C devices on I3C bus.

SPD5118 and similar devices on DDR5 memory modules differ from typical
I3C devices in their initialization. They use SETAASA broadcast CCC
instead of ENTDAA for address assignment, and per JEDEC specification,
are not required to have a Provisioned ID or implement standard device
information CCC commands (GETPID, GETDCR, GETBCR).

The series enables describing all I3C and I2C devices on both Device
Tree and the ACPI table, using unified device property APIs throughout
the I3C core and the Synopsys DesignWare I3C master driver.

Please note that the series modifies drivers across multiple subsystems,
like Device Tree bindings, ACPI, I3C and HWMON.

v6->v7:
  * Reject I3C devices with a zero manufacturer ID by validating with
    I3C_PID_MANUF_ID() instead of the whole PID.
  * Keep the static address reserved when a SETAASA device cannot be
    added, so that it is not assigned to another device during DAA.
  * Do not issue RSTDAA when a SETAASA device fails to attach, as no
    address assignment CCC was sent to it.
  * Drop the redundant core clock check in dw_i3c_master_get_core_rate()
    as probe already fails when the clock is missing without the ACPI
    skip quirk.

v5->v6:
  * Do not take an extra fwnode reference when assigning the boardinfo
    fwnode to a newly registered I3C device.
  * Issue SETAASA after SETDASA pre-assignment and before ENTDAA.
  * Prefer SETDASA over SETAASA when a device advertises both methods
    and an explicit dynamic address (assigned-address) is provided.
  * Reject PID 0 for non-SETAASA I3C boardinfo entries.
  * Drop OF/ACPI uevent modalias emission; keep OF/ACPI matching for
    SETAASA devices only.
  * Resolve DesignWare quirks before core clock acquisition and fail
    probe early when the clock is missing without the ACPI skip quirk.

v4->v5:
  * Free ACPI I2C boardinfo when an ACPI child without an I2C resource is
    ignored.
  * Issue RSTDAA if SETAASA device attach fails after the static address is
    used as the dynamic address.
  * Emit OF and ACPI modaliases for firmware-matched I3C devices.
  * Make the DesignWare core clock optional and use "clock-frequency" as
    the fallback when core_clk is absent.
  * Keep DesignWare pclk, reset, and match-data handling on their existing
    optional paths.

v3->v4:
  * Clarify mipi-i3c-static-method bit semantics and assigned-address
  * Add I3C_ADDR_METHOD_VENDOR
  * Fix fwnode reference handling while converting child property parsing
    to use unified firmware-node APIs.
  * Align ACPI child enumeration with the I2C core for multiple
    I2cSerialBus resources, ignore ACPI child entries without an I2C
    resource, and populate I2C modalias information from ACPI.
  * Update SETAASA handling to use the static address as the dynamic
    address, skip device-info retrieval for SETAASA devices, and tolerate
    M2 for SETHID/SETAASA similarly to ENTDAA.
  * Reorder DesignWare I3C clock/reset to include optional clock in the
    ACPI skip clock/reset quirk.
  * Add prints for missing ACPI clock-frequency and SPD5118 I3C
    device type read failures.
  * Fix grammar in comments and commit messages.

v2->v3:
  * Fix maximum value and indent bit list for mipi-i3c-static-method.
  * Move I3C_ADDR_METHOD_* macros to dt-bindings header.
  * Drop ACPICA commit IDs, keep only the Link: tags.
  * Revert the change which proceeds to register other devices if SETAASA
    is not supported so that it aligns with the rest of the driver and to
    avoid the issues pointed by Sashiko.
  * Rework multiple commit messages.

v1->v2:
  * Added patch to remove 16-bit addressing support for SPD5118
  * Guard ACPI calls with #ifdef CONFIG_ACPI
  * Remove CONFIG_OF guard for of_alias_get_highest_id()
  * Mask mipi-i3c-static-method in the driver to select only valid values.
  * Proceed to register other devices if SETAASA is not supported.
  * Update commit message and links in the description of multiple commits.

Akhil R (12):
  dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
  i3c: master: Use unified device property interface
  i3c: master: Support ACPI enumeration of child devices
  i3c: master: Add support for devices using SETAASA
  i3c: master: Add support for devices without PID
  i3c: master: match I3C device through DT and ACPI
  i3c: dw-i3c-master: Add SETAASA as supported CCC
  i3c: dw-i3c-master: Add ACPI core clock frequency quirk
  i3c: dw-i3c-master: Add ACPI ID for Tegra410
  hwmon: spd5118: Remove 16-bit addressing
  hwmon: spd5118: Add I3C support
  arm64: defconfig: Enable I3C and SPD5118 hwmon

 .../devicetree/bindings/i3c/i3c.yaml          |  36 +-
 arch/arm64/configs/defconfig                  |   3 +
 drivers/hwmon/Kconfig                         |   9 +-
 drivers/hwmon/spd5118.c                       | 119 +++--
 drivers/i3c/master.c                          | 406 +++++++++++++++---
 drivers/i3c/master/dw-i3c-master.c            |  54 ++-
 include/dt-bindings/i3c/i3c.h                 |   4 +
 include/linux/i3c/ccc.h                       |   1 +
 include/linux/i3c/master.h                    |  20 +-
 9 files changed, 507 insertions(+), 145 deletions(-)


base-commit: 6eb8711ece2ce27e52e327a5b7a628ed39b97f45
-- 
2.43.0

