Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011057.outbound.protection.outlook.com [52.101.57.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DD03CC310;
	Tue, 16 Jun 2026 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603721; cv=fail; b=cqbph8Hb1FdsowU1eqJUcDINEVIs2A7QqoPhPCPVPPXr9uFC1rX0OXahCvanPBo6/15jR/QUKmoQ23MajgLjHNnM19tTMHkPo2IxSg5YLKIUvQ96aJBhsppOMdYH8pOH/DbEIpnAqVycyxKr1FzpVr13f2bbTeVd+/tXMOuH2m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603721; c=relaxed/simple;
	bh=mXjl89h1PF0rMLkXthjti8vWMTg/2qKEFgyGOdWK3c4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cTj5EkdMvKGgGo1OKJ9TMlhh24TzBgoVdHdRbMxCIP21ayhGtUhrxt9ytjkxf5Kta74wpKGfpgtD9TFLym1sdo+yLERLQbk2GDfdtbrzhv7jk0xJdqcBA7YhoLLINeXprIXyM3VfO9D4WRyCZ/H8giTePeh7tQ1TeLJ4+2vf1NA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZEQfPem7; arc=fail smtp.client-ip=52.101.57.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZEQfPem7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svpKhcFt8lOthS+41IARUYQweb/8fdgeenqI/lRAKpcJxpRmj/MbMQrax7bXc3hLpVkEKv3S3OvGCblbIZPadiDRxuFw9t7c9RXl+oChES1sgruzYtt7diSQJ7g8R9iYCtY/rT8FFEcimIGm6Wy37XPndGKKmsTOWMQzcITKHnL0jDB7VxQwLPq/HV+QeLs/sWq00vMMMapMIPS8c6xBrRIzXSBotxcfQ9XzaXJM3sA5srjBUde/tDILV5ZQoQaW14B02ei842xMjjIl3LW1rNCAJqItfYK1by1jDPMXS/3GQ10x6qdm6EEfE5jop4JLHhdfdgd1e9CjM9MxfgBWNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljN/RJk6bW20MDCwOc/IjRhSqNkc/rvq6KrSwU09xV8=;
 b=Xn4at2iB3nPy8KrWg3tRboXHf7xasFW20FcUJCuU9QHBv7e4K2fFDanfXNi/RLRYa1QlC4H5Aozp+Ecu8xvd+xp8z6nNFH0clJ399kHsH4kSSaQJgdvBRpGfUVtwuymrCJ+F7ZqumkcRIa8hzmLxd0m85ZV9H4d9lJapgsE/T/ZrO00UMojWIsEavP7gpHyYc6gAfmV8y9zR2z7F/vVI57Wg/Ffnpq0o/6BEYMU6I6koLX7QUiWbiXG7rJcisyBiJqeEFTLVJH8ClUz9kkN6lRKRjtuS0922VeQSL2YyBK0f7qg/9m8sGagq66NUqeR1ERRUWjxRmrIPWt0npweDWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljN/RJk6bW20MDCwOc/IjRhSqNkc/rvq6KrSwU09xV8=;
 b=ZEQfPem7fd32lGvJzuRGu24k8/6fhVuSiiD8aI8mlljHT9iqbbL4Ugy2WnEsCyzYbEAInILCNWBZJxYDLnpafxNNfOF4uzwK6B+0rM1zVvOl/IY85LnK4K4gLuHJw3jzEtJhMDlO0qRUMLYA0+Z1td9ySy9VFlpu72L4DgjP50X9lt1SD9GaIW6W16iXXuK4LG6lGqwKdh8TBjOz/oKuxY7/nqgvbvyr6UJ9n1TEchl1DyXzOW1zOcFUo5aEy+aGniPvxcvx8OIb5+LGn1IH/fo0d0slUpHMTyVC0eeK3vNdHpdLLZyGChaBv+UOOQGdrsjjTOCfVk4BeAG8tkNAhA==
Received: from BL1PR13CA0172.namprd13.prod.outlook.com (2603:10b6:208:2bd::27)
 by MW4PR12MB6952.namprd12.prod.outlook.com (2603:10b6:303:207::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:55:14 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:2bd:cafe::1) by BL1PR13CA0172.outlook.office365.com
 (2603:10b6:208:2bd::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Tue,
 16 Jun 2026 09:55:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 09:55:13 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Jun
 2026 02:55:02 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 16 Jun 2026 02:55:01 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 16 Jun 2026 02:54:57 -0700
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
Subject: [PATCH v4 00/12] Support ACPI and SETAASA device discovery
Date: Tue, 16 Jun 2026 09:54:14 +0000
Message-ID: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|MW4PR12MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ea84e71-b9ee-4d60-4278-08decb8d5c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|82310400026|1800799024|56012099006|6133799003|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	os9RFDeOf5a70GF+c81zU/9nMkjb3CRWJp5dfecppQSJMxJ7I/qpgkTbrZ/zZ7q4ZdDIUnYMaKU3NAylgBxeyrhEdqf0Qcco4y/MN1AzPiD73RC5LwR2e6xgC2ANqkWi7hU5G42ojdDiGOgftIu67+qhV+Iw0h0QK7A4KghSwMZAAVG+YOY3YEEv6n44BhQryFEaOlGin1MRIypNYHeA2reP7C0nGfoZvAx61saFvdLP/EPgC3Kiq0wyNGOWqAtA/+2grsl8GBFtOz0qYIMPpU31aJCPm3605GoiWdW6G+tYI9jn8u7Vbzub8v/jc+VukS5kTahjfn675Jf0ScC4Ioym2r+ORzkXWBxZ76LWwwL5oxHoeznTiISClQ2oe59Piw2y/HJQcpOE79rwcmiX6uqdLGgqUfOeSFbtA6+Vy/pJKJxwRRSxKLVGdxQfN+EaqBB2fzh3K/CBTzavynSoqMsdAiXVJIXxz75ut91aLDDUTIMM85Y68rFQHCGT5baxGrjNwFCBFDZdA6hzXi3ReVEcqrPSUhJO+SFPjwwu/U2CjSVGavD7oJU/c1vpkM7Ep2sW5xHR7Z9y/IdIb7ojGs5c3pBGP/ND0Ih9+kkALK+e9ZOFoyt1ZQzjXF+zkmMTWQpGyKCEF/ilTcg7omqv+6HETnFctCu41hjdog9952aaZ9uowUyIod/Arq8/D194ffte0AVuQS+HV8yvxiUNhrKukiqXFD3zSohxqGtlXmU=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(82310400026)(1800799024)(56012099006)(6133799003)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Q3foa2kqq+PRiiRWJh67RRAMpbtxSTvZEhE6B9GfqBzlg45YFv2jvWcx2AxWIlrv5b8tsAi0lU1LJsL08toEHgQVg3yBKqTA4COOLnooIO/SwAaTMZCyvIOplgoUqMJ3OAuvWXWH4UYRubxI38oi0dwzDFnupN+BedU4qcfc0gwzuteV17ko/Dk1VZAd6sk4HjpdMa+cU4kqBQDLI7u2jXxE0hrY/q9Ruq7MpNYrwHEpfx1+U3IfZYgF8Vhi0cf5TakJVIesDs24cpyw0W+lIWNiNdM0IKIAEptsPogVSX8Eqj0OBwAXrzdsaqtwEjFA1pXcx9lTAwDY9hS7XY/Hk4JmuQmLOpGIKrFYOuZT9JKP0SvbIY3chRxN0r7WQW+3aFMv4Z5MYu2U33G7gfnkD0qFR7JckW7wYW0pMoCMbF0o5NoirUV/uhYlqoa2AQGJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:55:13.0161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea84e71-b9ee-4d60-4278-08decb8d5c45
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6952

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
  i3c: dw-i3c-master: Add a quirk to skip clock and reset
  i3c: dw-i3c-master: Add ACPI ID for Tegra410
  hwmon: spd5118: Remove 16-bit addressing
  hwmon: spd5118: Add I3C support
  arm64: defconfig: Enable I3C and SPD5118 hwmon

 .../devicetree/bindings/i3c/i3c.yaml          |  36 +-
 arch/arm64/configs/defconfig                  |   3 +
 drivers/hwmon/Kconfig                         |   9 +-
 drivers/hwmon/spd5118.c                       | 119 +++---
 drivers/i3c/master.c                          | 371 +++++++++++++++---
 drivers/i3c/master/dw-i3c-master.c            |  75 ++--
 include/dt-bindings/i3c/i3c.h                 |   4 +
 include/linux/i3c/ccc.h                       |   1 +
 include/linux/i3c/master.h                    |  20 +-
 9 files changed, 485 insertions(+), 153 deletions(-)

-- 
2.43.0

