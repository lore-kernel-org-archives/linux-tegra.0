Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B52F3DFC64;
	Thu, 23 Apr 2026 08:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934721; cv=fail; b=pPCEdTaZtClveWkgNgvDqMacrOw4RX0PsvC4LpOGt6Szz6KKMfFv774Hst1s6LagL9O2O4Vg6ELue91vqnBqXvuBMHqwgvKE0pfD2kt1FVwihwxVCOgXBhsuVlyxYAkbwE2tptt/KCghTpALlj2XUqoPL9001U5/VXNyl62npX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934721; c=relaxed/simple;
	bh=Vi5wB12SV1SDthdNPLFWrv0uI6q9IlEm018GjR+1Ol0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QH17GNFeVSmpjifarOrP+JIJMu5nEqwV4dLm8ZvL7ZCYh3fjIoK7YMja1YeR+Qi5axx1g6e3xJnBhlXrabelfLgFh/g5HTomj81163XyGNaC8EGYwdwkJrsJRrrMG2K/9GtlxTfuu619m5Q4507lsQei5W0mlVvODDz1RKRlNJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mBnvs5ZT; arc=fail smtp.client-ip=40.107.209.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mBnvs5ZT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfL2MXPN+5tHMvcMqmBaQWMyhOTpWvXDctzuHa3NqZw/oPmyw+IFnn5jEX4PrxSz5D7kgGZZy2YOKVyIY5RHLKzaiSLn2nhh/ccf2rtdYYrWdaxCrxnqAfziyNgTbVJLjIqNbX1VnoX6ELLzBSyD27hHyBIu4a9sQHePHpKoCTKvjDYDSjPwenqaYZisacfShmy1qxOXHori3eQ5NVJW0gxzY7rbhVqwNqzmbg/cGaWcQgHCQTRcDYSTFgFQzSx1nAFtCT6WfslC7aZjz+Rxx2549DQJsRqmkfV7cFU1kRvhSEK3fgES8fOHjBjqA5m3S0WeDraOVRFhmgmhM/QDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH9YQfukEFqbQvx2cblCsK8OnqqFKsWsJ0xJ+4z5p4M=;
 b=W6LQ8VYMhjRf+HCHG/8aOLsfeyuxbbx+zBbgW7MgeaPzDnf1I4LjYtaTZxvd4pj6Qp3KfiAVJB3/v8iydR+Hqkf7xy01eHFPXYig/qfS1LJmCvTtjbCyVqT0u9zxB4KY9xh7iPj8w/lbRVJ+WJrG2yzXYzhem2Qhi70OKpUfI0mFJunb7vBFRAag+cv75szXhZaKpJP5yCOEmK1FSfOEegUa/VcQQ0c8E14LbIh4DqbGWtf1q+qQ1vg+nTvWdAChhu10QHcReD/syJW0mfFUy1bLNMOyOMbMC9NIQjkk5quY000ZBcATiMn/NJQt/1Y+EMfVOGhnAqemMqkZrHBLiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH9YQfukEFqbQvx2cblCsK8OnqqFKsWsJ0xJ+4z5p4M=;
 b=mBnvs5ZTHoOWG/qUE8xL6drgFH7OV7pXuPdmkBVRisPXiyX9VkOs9bb/YW7Oyh2W4SfS5F9oLvicCfasWASZHBm9/UM00Te9GUj5n8z2f6lpxWPwRsgaqCnehVj5cvdSNGWzrRu6k+smif4Kpc3dKo6TzI19TYrwT44tiITB0Xsx4GEvrHL2qj7lydWDUZx2otSp1v18okNYOiGD0TT2Bw9zjRDEepOjitJXz0BUB1E2e4dHUcM8uNOsiChoKZvjo4mhGjeknWTMeNfT3cnKfPEcVZCuUAFaAPvzglpQ36H1fWDjEtIPRAN4Sn0rO6L2U5iqGHWf0qmRNokt5V9CPg==
Received: from CH0PR03CA0214.namprd03.prod.outlook.com (2603:10b6:610:e7::9)
 by IA0PR12MB7652.namprd12.prod.outlook.com (2603:10b6:208:434::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Thu, 23 Apr
 2026 08:58:35 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::77) by CH0PR03CA0214.outlook.office365.com
 (2603:10b6:610:e7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 08:58:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 08:58:34 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:58:17 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 01:58:17 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 01:58:08 -0700
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
Subject: [PATCH v3 02/13] ACPICA: Read LVR from the I2C resource descriptor
Date: Thu, 23 Apr 2026 14:27:01 +0530
Message-ID: <20260423085718.70762-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260423085718.70762-1-akhilrajeev@nvidia.com>
References: <20260423085718.70762-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|IA0PR12MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: f70134af-692a-4719-f879-08dea1168084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|56012099003|22082099003|18002099003|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	m+h/xb5bpBuuJok1hGvuL1oI5zrmTjPoF5Axw0kc3d39PRqonCj7HcqNNMauDooUTiq/LkWBJAykuORxa3YRPEf+LIHZjPxopaolkQECRstElQuw70Sh3bE2if6GEBJSBDG+XCSsmb0+Ea/CcdUrtGELr26YbOlLZ2PpOz65N4ccvqCZerzRChpp6YQegkApKMtI14dwm/2SYMJLnI+fiFk2wzjVb0ERxnBQ75OnP8ar4SdVmmxmW0BNEUcPh/uPKvbiELsO6xxbt4oT5xBqeepeTF5VI4kpUd+Q2TlqfowJKYTJKL90nE5O8ehrZRASmIhW4gNmqs9FKfZUN472HAva0MlXc1Jx6q+ommd8XUsQ6tGCdBLc4Qs3B+6aMrqCWMrgXziGGcjpJ+N3UaOCHdN03TKN6NSvarZbDO0NYl8HN15mxiG/61fKC2Ac7Q5vKLP/WK6UGSgHaGynQ4QnIMwiQmLuc/x32qW5vE+UEKWN6ixInCn6t14FFPxsGSnchEJjcsFz3svnY77ti3+024JYRj8uEUI4C4KMvLUugYIpJFqAdSPA92VJK2j/FfTgvLuBI0wltb68eNTXOprYPjNRGBd3+f3KJ8+myM5q1RDAhWRUQ/imZiAMeh5D/omVkVXqDHsOVReRSY1kBcEbxyq4P+JbMFRfgtRg6nGoRFpEna69MUFtf+3fjpzrcYwIkQm8Mb1l+jA5itaaRU8XIQ/zai/SJ0vYfrRfobkmuW4ZEXNtQ2uXV0zUOLFlmZmHHvoiLSdfuIoljLG3idCHos7GUPRilsd31oJR8IBDitekSGZGo8Vfm4GffqM3keFygA0UsAjfaNvxx2QtUdcpzQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003)(921020)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JEKxt6+wdhLfBmWXaHkjlsksm4FvVjUYPCICwfvk2PSVza0DgAKyjifWyiHD9SQdvXY+SwyiG4hgqFKJOBka/chHdHnUOOe9lYTZw7n0mAy3iOVFCS5I6C050RjtFINpv7yuglMzLM+ICrcmIHFLJXelK85s9RgLenssvwSurRdiUPLsUqX15zHObUWJ0cq3YY6caa+KORxFS0f8pcZhQ+j4+l0qzVt+mfjcFEiKPJwMXhA70VslI80tCdbiFxnTKvY0mFXl2H4b4ZkxE41Xi5z/yISAX2ctiqIoiBMgp8ZL5k6V3d1azx9C0FTcmc1HxJ3pdXkZk7d5SHBX9JvzQbXvGx9kjevc4NEvmct+2oZsP6NkpP4JMbEkVEjj9hzVutFIqivX/LjOib2Qtb8XqJ9x4ItwUwsleJKydb0rgGVFG/y8QK3042gx4DYtCtpJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:58:34.9094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f70134af-692a-4719-f879-08dea1168084
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7652

ACPI 6.3 specifies byte 8 of I2C Serial Bus Connection descriptor to be
used for Legacy Virtual Register (LVR) data as specified in the MIPI
I3C Specification for an I2C device connected to an I3C Host Controller.
LVR will be read by I3C host controller drivers and it provides details
about the specific speed and 50ns spike filter capabilities of I2C
devices.

Update the rsconvert_info to include this field. For I2C devices on an
I2C bus, this field is Reserved and unused.

Link: https://github.com/acpica/acpica/commit/70082dc8
Link: https://github.com/acpica/acpica/commit/b3c38dc9
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org> # ACPI
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/acpi/acpica/rsserial.c | 6 +++++-
 include/acpi/acrestyp.h        | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/acpica/rsserial.c b/drivers/acpi/acpica/rsserial.c
index 279bfa27da94..c06e918ab889 100644
--- a/drivers/acpi/acpica/rsserial.c
+++ b/drivers/acpi/acpica/rsserial.c
@@ -315,7 +315,7 @@ struct acpi_rsconvert_info acpi_rs_convert_csi2_serial_bus[14] = {
  *
  ******************************************************************************/
 
-struct acpi_rsconvert_info acpi_rs_convert_i2c_serial_bus[17] = {
+struct acpi_rsconvert_info acpi_rs_convert_i2c_serial_bus[18] = {
 	{ACPI_RSC_INITGET, ACPI_RESOURCE_TYPE_SERIAL_BUS,
 	 ACPI_RS_SIZE(struct acpi_resource_i2c_serialbus),
 	 ACPI_RSC_TABLE_SIZE(acpi_rs_convert_i2c_serial_bus)},
@@ -391,6 +391,10 @@ struct acpi_rsconvert_info acpi_rs_convert_i2c_serial_bus[17] = {
 	 AML_OFFSET(i2c_serial_bus.type_specific_flags),
 	 0},
 
+	{ACPI_RSC_MOVE8, ACPI_RS_OFFSET(data.i2c_serial_bus.lvr),
+	 AML_OFFSET(i2c_serial_bus.type_specific_flags) + 1,
+	 1},
+
 	{ACPI_RSC_MOVE32, ACPI_RS_OFFSET(data.i2c_serial_bus.connection_speed),
 	 AML_OFFSET(i2c_serial_bus.connection_speed),
 	 1},
diff --git a/include/acpi/acrestyp.h b/include/acpi/acrestyp.h
index 842f932e2c2b..38a19b1d19ac 100644
--- a/include/acpi/acrestyp.h
+++ b/include/acpi/acrestyp.h
@@ -423,6 +423,7 @@ struct acpi_resource_i2c_serialbus {
 	ACPI_RESOURCE_SERIAL_COMMON u8 access_mode;
 	u16 slave_address;
 	u32 connection_speed;
+	u8 lvr;
 };
 
 /* Values for access_mode field above */
-- 
2.50.1

