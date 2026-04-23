Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010014.outbound.protection.outlook.com [52.101.61.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C1D3DEFE4;
	Thu, 23 Apr 2026 08:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934699; cv=fail; b=HyZ808fg4Tnaa7y7DPmQo80hPOZshX4R9qQb+hGYrPqy9JeWJSfqs4O4pCUFobzWpbORjghKDEdQI1yj/YkGqb0Skibghf9Duxe/kCBbTW5cTF69eKmOipWxUyEcJMMKteY/ytC5L/raU2JMcO3mCFkj82pB0fm1Ag5cxgc4TSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934699; c=relaxed/simple;
	bh=1SHmzT5hhepKNFwgowf0wmTZDkeNYUB3TnpPinuBK0Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fz6SZjLShxoZBIiTUKbmZMbQREKh8WkN7ybYnsYGkmwi3TIJxGl+atZz3Vnm1L+WF+LSr0CD33frGg8zpmhsjAk9izsZfGjyuKAIF683Q10DJZaQ0aX9xXd6Qmkyv/4nKDY0Y3G9hUbZWwkXiul9Am9aAveKJL/Kv9Nj1yEz8C0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=idXjy7Mq; arc=fail smtp.client-ip=52.101.61.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="idXjy7Mq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2ygp33zDDCpLFyL6Vm3B+HX0eycPxj0m43tOPxmbfPr9DqwZzPUHuchNYji/yezXzDQqdXXS+wZdLWJFbwSQIWeUyoL2xl+aN0ASqdV4/QR/ko9prj6BiO4I+LaIQPnsvwAqt0z8wEiNBbrBuO41Ss6jP+6VNnWxbIyPcMgg6CjS8IUGww98ZhOeK1Ktw6IaEA0Fb2I71NT3chGRCSaU1COFUL2EICQWriJrm5on/6RYqvJVYaJX6U5kdBbifEC/kscEOdb4qgPYY88xKQo9zM/OyshQ72pXRFUBy5tTwze8LOI+3xk85nZWaZ/rgYY72JDo3JmwpZ491E2J+09lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVZw5OvMS5G9u2NFh69O+TOgbzxV+OTCf7AEW8DnzBY=;
 b=L6ISwwZCUk07NQsOnAUNqL7uOKpoH5/gED9eo966gs4bxhguy2nA2gOaRsIRksh7ykjOWBM27ILfHefEUtkqm/2hJLjqcqc0Wmdc8ECJgEVjfKYyYRmf6WWx5Ih3T3cEqOCZs147OGkqPe5BeomZF8levme4RdSwehI+QUP1kP9mxAg3KMlzmPR3E690e0UXg0ya5bbTksTYBdQN+t0ldiyitTYOLeeXikWb/Pla9g6embHUO4IdvOui775WQQ/g1BonQlLDvS4wNZiV82JX01EiBku92oGWZGwasxWW1irVnHrmGOjgpI37eBvcOM9OoZMywT1tcqNDq+HEXj7+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVZw5OvMS5G9u2NFh69O+TOgbzxV+OTCf7AEW8DnzBY=;
 b=idXjy7Mqg5ZnZe6o/x5OgUnQW3sJd9W2Jdf4pffNGfePXDSpgaidViYwTGq5dJOniNAkZnjJJunCSv2RRWxmHMZXbEpNSXSfT2H7mN1z4eYaQyPMqHwAK35AgQ/zUC/dyVQ5t+ooGUpiXO0k0yDKLYvACkRXBoNPt/M+vzT4T86Kz2ngbUhnIBH5bxoB3Jp//olXBgEyQpkuLGgvFrJl/kdZWvv0KZyvEr9wyqB29fUeGZ33wlID60pGTRpTRAdacxzk4wIrCH/RqxuVWYeX4BP1lCpjCUIP+E7yOQZRj+SsQ10cph+PhRK8ktnYKcVhmu8Fdc04E0zEIcOjbJAIzQ==
Received: from MW4PR03CA0296.namprd03.prod.outlook.com (2603:10b6:303:b5::31)
 by DS4PR12MB9747.namprd12.prod.outlook.com (2603:10b6:8:2a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 08:58:11 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:303:b5:cafe::fd) by MW4PR03CA0296.outlook.office365.com
 (2603:10b6:303:b5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 08:58:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 08:58:10 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:57:49 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:57:48 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 01:57:39 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, "Eric
 Biggers" <ebiggers@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Jon Hunter <jonathanh@nvidia.com>, "Thierry
 Reding" <treding@nvidia.com>, <linux-tegra@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<acpica-devel@lists.linux.dev>, <linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v3 00/13] Support ACPI and SETAASA device discovery
Date: Thu, 23 Apr 2026 14:26:59 +0530
Message-ID: <20260423085718.70762-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|DS4PR12MB9747:EE_
X-MS-Office365-Filtering-Correlation-Id: fd46f657-2e5f-469b-0db4-08dea11671f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|7416014|82310400026|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EZH2SECpcfJenaPyUoi2rgbCyF3s5gRzok4+/JpgyXO4RSi4GcmQ3BuoHN+w6mRK8f/W69QR+DfDhXc2p8CV1w6HHCFARJ4uKQRYIm++g+zt4nhi+gLICmc8FGpj40vNMfYQQL09LmGU317mAPsUWsE0WQ4dq9IsVDYEwlzG1wLcH/QHvhOn643MjGjga6sGrCt0FsQmfKZDh7rj8fqWKRvL5xWDgwmHIr7HUkl+Eqmj3oF3yKEjmlolU9en5NrCbHhAbdhqfOOFT2UB8/32Wj58fjJeA5T2b+CO4uNKIOwKC+UkZPJ5meALKP9kNEZZZAyzKSGrnT5VBqXOMFKbK5+YXXJaokqfaNZeLsyGJ+2psCBjb58u7dCunPn1R944+vqN7zERqSHSbd7YFQgTAwjBR2qxS9rz+pEGkOAW9TWThIRiwEbFPmGWfeqIw0xCl8qF+52q/yOkBp4Q1xs6HWr09hEtp7gqoAOVEVQiXyXe/0Dqx8S1UyltcmV9HHFcQ8YQNAYjk5eHSAk7Xyux7uIOo+afPUdwVfZkueFwhRR0slmaJBStCqt/b4R8QcHpOC1O/a1g9NeqEQdH+U6tw0M9t8Xjxs8UtTTUXQDBVzy+jDrCLcXNpIsyic7b0pojFj3iGFsGIdrUaXpmi45DaUKCNXlZVLEV8PgdPbVO/fJ7JcTsswkLsrgyXek7Cfhc9Lw2dKvhqDAc9ZD9DxAAtsrO0eELB7YgmnEI/VMmjd5vfKXLEmkctp5cd/u2wRTm6DNUJc0Pp3YSl6fE1FnPvnbQrHchv8PzeGstDh8KMh7AJviTG8iqGSEmgDP9yDdB
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(7416014)(82310400026)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y14/ELzFR1RDK0gjFSg3A0Cw4fxUc0aoIfVmMblpuq/+pDvXmgFa1h5UMyvW6/rrATQmLrfPIZ8U/nEcWHtDD2YMfKy6tif2Ep3U2D/UwruBYZ7hCqVfCkYreVEGlukiSfZOuNETMHeMUK4BnvdyD/OUXjHgfrDJ+uKBIy5fyJ92whRPkIdiqAXcaJCdVyjeuCICz4Og1/ooOYMo7flebUyM1+S+IBzXr6kVfP7XayWFq/vsyi65Ohw0htSS/yal6tiMqGQ8DryIzg35dj2YJ4NgVItORcVXsK/8COe9iS7rHaMTfTEhgW7s0GxCjAn+9yg83GYo6uOL73dsW4EUrot9VXQsSDrh65aSUKlbQwetuiiPsg10g+A6HqVHal2jEkYIVfdfwWUL+Ypzm8yPQpjTHyJPOzpvj9lpC7iC4w4kz+ckhns+notn3IlXXyX1
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:58:10.4730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd46f657-2e5f-469b-0db4-08dea11671f3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9747

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


Akhil R (13):
  dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
  ACPICA: Read LVR from the I2C resource descriptor
  i3c: master: Use unified device property interface
  i3c: master: Support ACPI enumeration of child devices
  i3c: master: Add support for devices using SETAASA
  i3c: master: Add support for devices without PID
  i3c: master: match I3C device through DT and ACPI
  i3c: dw-i3c-master: Add SETAASA as supported CCC
  i3c: dw-i3c-master: Add a quirk to skip clock and reset
  i3c: dw-i3c-master: Add ACPI ID for Tegra410
  hwmon: spd5118: Remove 16-bit addressing
  hwmon: spd5118: Add I3C support
  arm64: defconfig: Enable I3C and SPD5118 hwmon

 .../devicetree/bindings/i3c/i3c.yaml          |  31 +-
 arch/arm64/configs/defconfig                  |   3 +
 drivers/acpi/acpica/rsserial.c                |   6 +-
 drivers/hwmon/Kconfig                         |   9 +-
 drivers/hwmon/spd5118.c                       | 119 +++---
 drivers/i3c/master.c                          | 354 +++++++++++++++---
 drivers/i3c/master/dw-i3c-master.c            |  66 ++--
 include/acpi/acrestyp.h                       |   1 +
 include/dt-bindings/i3c/i3c.h                 |   3 +
 include/linux/i3c/ccc.h                       |   1 +
 include/linux/i3c/master.h                    |  20 +-
 11 files changed, 463 insertions(+), 150 deletions(-)

-- 
2.50.1

