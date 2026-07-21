Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010063.outbound.protection.outlook.com [52.101.85.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01C233122D;
	Tue, 21 Jul 2026 04:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784606934; cv=fail; b=uwfi1JRAVqiPtPo3zxZKgd+GoE4+CImOIQ4T6B198sR2XpvoYcM3pE/u2zilSw/15yWh+kmSXLRpIZh9xw3E518yvYl3cqEjzsN/PGv2yFD6oAnPr9W8zDj5646E9ectf2uJ0eCcHcxfdCDi0r2+VJamV/0jAg07QNsI1ldMzFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784606934; c=relaxed/simple;
	bh=7986JGVAmCpBlt4vRzGzDPCzBk9pwaTOrBF0yChHwMs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gxzxdvEXwQIrwRKJCsl44j5S/036ddxcljBXx12jYiU3glzR1v/1F33QcNpIQpcMKMqAA2QZcj5ewF8fIAmOyHrK9+19RY9OgtjMXEpMNxSJ34PDtTf3C86a+qE8GWTgRqUZoblBhhZVltyqRdhfQgPOzr78uyvFX3IThOEwUKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h3SVaA/k; arc=fail smtp.client-ip=52.101.85.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h3SVaA/k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqvdPX8qPVflBL2jxy7syhu0wGN6Lvz+ipX0BDh1XvUdnu/7R9pE/fsjz65dx5NZX8KuV8K4yihfFiJycDyREottespjozcF8wxahva0X1s7YTgqFG+Kbx/HiHrVL2HixL1N0HLfrqJsTfmHYMGmJNabmpjhgL1mOcBKYOq30hhSOSDZynNBa8M1GpAsqw+Sp439B+hiPLJPrbru8jHhVAnIwkzvwM8AhnzxeACQSQt/0Q7YdUmdQJQaidiqtMO7XDu8dxmH8dKDPC5Bn9aohUQFtG/L1MwHWRU7UaELmQiTnV78CSkiu8RieShxmgxYnQVJd8njH+qCF+3N0RQyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KEwUc+tl/wc7luFRn0A0eX1RU86KD7C4I/pzCQtV8w=;
 b=IodA8WQO9Jy0jbjJj7PNfKxyQx1+1t6wRliHoF/uZboLvF6Pa9nz0SdHC/NGdEkkaj1UlgaOFOHnpZkY9avZV26INP4FNvjpmkY19rz1Td/xPzsLGJYXSc3npfIj0rg5b/U0O0EFQQ22Rh2KtirQ1VgHhoLtKxkxUgBxP0ddEoYuho332j4WTD1K8bdNIHjO7bTd0+FUlcmUg+z/JRoRWMLzGx4iGUTttSSuhJj0GZDj5UFHCbVYREQznQK0HYWTqK5LVS02G1fMaVzC40VD2MFE5QeTL1sTqmJl6yTxSgzGWlDNjQ2d1jFLGa1h1B2/hZ1ahkCGuH7RBN85Gzk1yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KEwUc+tl/wc7luFRn0A0eX1RU86KD7C4I/pzCQtV8w=;
 b=h3SVaA/kfVSNRBFw+sP+jEN4Wnmuwf8ab8fBQIlXbNGYk7FV2qAE9hCOTMTtykIznzmuPMZK5YOSa1End2l++JrsEMZgpHxdlCIxV5Z370gPPw3jNH9Fsq6BWqign9eS2X9QqmfCOSmcsS+1k/rpUpA31FYEkZMoIwL+7ai2lLmyQI2b27JVDFlZCv9L22xdfRjDICldvk/hDktkBNF9R63/LYZbz8bXedvCmPkaLF5pt/N57zi1DPJLE/2I5bB4A8oCg7wKXq2UplAri/SNgM38WQKXdne9Drcc3onCO2f3vgU9jCboDMlM2eqm311aBtB5PHiv+kIgjyYyE7vBPA==
Received: from SJ0PR13CA0185.namprd13.prod.outlook.com (2603:10b6:a03:2c3::10)
 by SA6PR12MB999200.namprd12.prod.outlook.com (2603:10b6:806:450::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Tue, 21 Jul
 2026 04:08:49 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::9a) by SJ0PR13CA0185.outlook.office365.com
 (2603:10b6:a03:2c3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 04:08:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:08:48 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 20 Jul
 2026 21:08:27 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:08:27 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Jul 2026 21:08:22 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v6 00/12] Support ACPI and SETAASA device discovery
Date: Tue, 21 Jul 2026 04:07:48 +0000
Message-ID: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|SA6PR12MB999200:EE_
X-MS-Office365-Filtering-Correlation-Id: b8a233d6-e808-4e11-e4c0-08dee6ddc3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|82310400026|36860700016|3023799007|11063799006|6133799003|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	wCLr+ce+KiOt3NtgK+HyFjXpBK55AcjjUgSaylR5JPZGOo5nyLpfcpTxD7VekRxj3V6qHkMJcmifcri3g/tFFhhVnDgJS4Up6rMmoi3qqMB2W9XcZPnitoKCDPUzZLYIQK1wuQA6s//260OsiYcRJ8YCcPMVmfiveOwkSGg7UQIfusBC6G9OfE2KxkNn9TlEfeEAg/oqQjEz+kAuf+Na3DeEpOfHB8u3XbZre3i7HTAGpNl1iJJ067URBB+bts05aWRbsneZZ0SkDNI4yjU4tORVTg2eBo54fFQOyEsF6tXoTlQsWofStYx++0wBlrJ7VBUVFkMr+Cmu2ad3UTT8cnud8yqx1LZLTZKKPT/d5Ln3bulXPpnZre8qDUnuImwVn8nhYZT21lu5Cyai4T39e/0wrs84kPBWDCyhvi9NuN+qPQZ+PCy86igirLNq3QNFc1RKUgz03HSEFGoM/XUrQL32AXm2b4ACsIGYCcQXks5gs84tNAb+M0vjMSe9VcUvQJzsy3MSaKDFaQflM04tRUvfW4iPeuXkVO+rIRA5qzmovCNzaTX0ejH+YXNuohbnlkRgxBaIB9xF+2+CkR24ZV8xDwSu4wHCkwXpWoJexD+3w19DKD6i90ti9HZyYtE6zxReXflm6JgtDBtzSy0iz+Q1dIQVwB80cYoBeopDEyh9yzGaAVBaDHccrvjcgTe7aI2EmSp3twmaH/TEDUuwrQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(82310400026)(36860700016)(3023799007)(11063799006)(6133799003)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VMdH+791F70efttnsLrGybMTdHNyStCLJ7i0g8CSWZb3Z2POWrdM1LgoPTjGwqgv5O5FT97L2FfyhT4bt6Bv3QnT/6g6+PeXtL5s6gKFmswsqeSv5oagVAqU5Hbvp0EK5iHP/nUMLh17IvqJLKmW891smT9QwOU6huZSiO99A6CT4oIcUKjvD/RqIueT9DO7kOmbYN6z5CjaWXKlf8ZyW0QMzrn/dWiDtssXrOT6Zv+721lQUWDM1+oqq0lv7HegrIp16Y72/gltyYsXJ8aibCIwovi/S9dZrgx2iugMFUFIvDH8yaS5lm54C47RbdkbL+19TTRjRa65sf51rDbD9yLKU1ibrNToJBlQ15TlA8sjPHrV/jLoV+0zfEx3JIbjbSIcgqUQT81jld8toBiOfZjnYqMI9+u+O4JIi09/v9ZAjTD/Cn0EyTXt4qezCUfq
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:08:48.1646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a233d6-e808-4e11-e4c0-08dee6ddc3f5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR12MB999200

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
 drivers/hwmon/spd5118.c                       | 119 +++---
 drivers/i3c/master.c                          | 390 +++++++++++++++---
 drivers/i3c/master/dw-i3c-master.c            |  59 ++-
 include/dt-bindings/i3c/i3c.h                 |   4 +
 include/linux/i3c/ccc.h                       |   1 +
 include/linux/i3c/master.h                    |  20 +-
 9 files changed, 498 insertions(+), 143 deletions(-)


base-commit: 6eb8711ece2ce27e52e327a5b7a628ed39b97f45
-- 
2.43.0

