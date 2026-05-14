Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010059.outbound.protection.outlook.com [52.101.201.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE4E309EFC;
	Thu, 14 May 2026 05:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778736667; cv=fail; b=AjUvMqiDrHANYTiXcNC89FUc8U1CmPX78XaQX+dBb0ePYkWVy3hNXlRIbDNsdcNCOZtjGXIgUISbW2gtzpaUj00b6ItPT0gf07oTNUURcAlKXOPbSwJ7NmL/2vlsaAVLmGM495hqnh1OmGRvaG6odAPobzV/3IQAkpaOq6CKVhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778736667; c=relaxed/simple;
	bh=86PMcmyhzQXAaPZxBT9YBmsc+Wal06zMNk1mFCJlftY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DX9esBn7U9EOtszuN7vTMHUldymwdMGKbanLP5wow3Qnl9nKn8Mhpv8R20hmOnpx89Y+EnmE0dszXmj1f5jhT0FwPbHYLRv4AzKrIc1xkzBZt/SBVQPpRVbcTt4tIVQZThyll7Ygu19FYKt97nOb08Yf2RNP0vJHU0O72OTLRko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BJeBMUTw; arc=fail smtp.client-ip=52.101.201.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BJeBMUTw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYMtrl0Vc/sRd1Qf/Vaw7llK8EmPXbCerZsfQKUigOodLXS/gSeAIf+HqSaNYBp/yCMryeVnu/0p4Os4bWWVsGgwgZyZG6p54VrewZGjagEFowMDpALmyPQRGtBkf2GPiCPRmc/EIbTs6edgIpYbzOFpJA9qRXeSvIe0Cq+294g9McJBD+h5tAwAy1GdUHZKqM1j+ZlFYni4T9Q1hh8lVHX3DGWUstKA73b4toLzlcPyvoMMqC/s97na8oRNxP/OuALRVCVGwbgQcoLGTLr9sY5c1yTfXRLzla6HmDChhpPesUomW9XzmWDAGYknk1OAa4BQEFc6/SBL7V9bHeeWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+GBUr4d0zKCg97RI9wqdV/+G/z7aApPPZu88Bw+la8=;
 b=B7Ms8t8XdyP5+Z3IA4wNOdjm7lTQumTKaUGisO8ZFqc1/ABIyQ62qFq6QzDVxXZWXGpM4bMG9k+fQ0M3SR4lsCDGsPG2P+NTqIpXc1ido73HbQc8DhECrZT8iUCc2+ftrQcyNYGM8fYk7Xi/3kaIpkCZSKFy12LHNQ7rnej1EJdmv1cHDYnoDoLWvwmaMtnwJULKzzXVY1ENnGkiD2QSfoML+ByqGJ3bRmPpUOQ/oTsYah+Q5JwYmCOiM7AXBRWAt8MVsNOF5LVgWDTEyvOSpcC5FSNV7ky7CetW3K/u2qxH8QNpT71DsEkFzw82aeSzmWYj57vrCNzQmLHpgCG2rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+GBUr4d0zKCg97RI9wqdV/+G/z7aApPPZu88Bw+la8=;
 b=BJeBMUTwBlJYDRh6fKzJXzETTSY3KaVCDfP7c4iQj+o/vsMJ+kPyHbnVR8UlBo+aNIub1wtLlpYF9WoMPpixnlNKNsu4ItT4bCfl1xcJMOFMaKaj/3rPT2RyZS27obkh8STQaRoYOT9GcPn60uSmO35GElF/GnIokMhD8Gvecmn2m4rNsA4Noc7YsbudDA2iGQKzP+YgLoTzoWQTNKIS8Q0HohpHAXAlRJpEX0bCf9EhPCycwufH8htB1eTl+TCgOywlW4E7/O4o3pCbjeZ6yfbljAFf2QTY6SVMBOkMnOd5NNFo/S+thu73VsRzC02+ok7aQDbVqC++JiOhEPZ6Sg==
Received: from IA1P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::13)
 by PH8PR12MB6916.namprd12.prod.outlook.com (2603:10b6:510:1bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 05:31:01 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:461:cafe::8e) by IA1P220CA0005.outlook.office365.com
 (2603:10b6:208:461::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.19 via Frontend Transport; Thu, 14
 May 2026 05:31:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 05:31:01 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 13 May
 2026 22:30:46 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 13 May 2026 22:30:45 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 13 May 2026 22:30:43 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>, <kkartik@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] soc/tegra: Use Arm SMCCC to get chip ID, revision, and platform info
Date: Thu, 14 May 2026 11:00:41 +0530
Message-ID: <20260514053041.2402379-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|PH8PR12MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 2617f451-2329-487c-dec6-08deb179fc35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	7aC1inBOyZW4qsvLksNj2yYtZJx4YRXqWFxGcc7f0wad8Yg/HECkF6+QR2BA9uCLv894ydNCdGqKtRNeaF+hBJjdt7XOFvQO54Git5utn7Gtn/CoL96LdozxufEIryBNaXQvW0NAMqmO0gPl6/w152nTVUJGBfI0xdSw3V7Prk+JcoviqsuXfXG6/qPsKk+v2NbOIEAUJ5vukznrDp1yHgYBg5QJCuUrMNG500j97eFCExQ9m8zXI6RoSw6i6ssjnobC9KwfdE6lZ9a87rEAe/fE0z1E0K2SAjZTHyzBLHMUkputSwnTZkg8GfcKRwldy+zfJJ+rJHrINWoCa81cEbLUxJFdtUhG9yIphe003kQTlqnV8Tw2FQDZljqC1HIsRMc9fuzOn8QdtYYDKLDMcZdHXx4iuj/AWJBaTfqpjhTLIToX+1gW8NQc0XzOkUSy7slmz9K2oW3GsIDCx/ZmcWuNNLwoypx3um/J2YPIu0x5aGCvzaMFBeVf43bxMjOdPvHtDhoB9Y769y+3pR0xGXk6Do7VhGTgc6X9HIQcxiXoifY1F3wuMdemF56EF+bj9YBsVeAGJ+jLsUnjNYqpzhJE7Tw09LWZwGuecvSdL/6TRLvM0wm5uqAPIO7/u9pqKHSYP9+5iQ7ImFMMr9bom/GY7M5yHBzecIXMNya2itHY3D0m4jqoASMglrrwHPCnkZAwCM5YqJ94ntUSNJp6qdfWy7+9N7E7K54CIUaMQSQ=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Qzt4E6n/JjxzsybFERRkAJYNdECKRhjzc9l/6Ak+9fQdCapGly0iY4aDsoeZIkEJzzMvqiFJJGGHudkhRJS7bvwR6ZBPLkpI64ngB5QDTac0aEErRqLAgWD+8918FH4w51YJBvm7q6zM737G1WzDPTm6OYTzI8rStAiv2EFn9VNZV3iaZXV5XFgTPnLD50bBmw7QG3EplAB9JuJwOwjhbjPfCv+TSZHFoTNsOkQIXzP1k7o6B9ywDovTkQJY/5l9RJVIg4Z2PkO1i1ECtDZVcDdHUVJbljYdcRUERRwvqroXCtSFvcPDIdDtfj9IkD8rgdoHK6a41PfQBecGTc7D3ZZlvuWc7vLIDlkLFiiTrH/ZZT8JjkfK3ggY3v/iFWjJy5vW6AoGzPgTn3R/oyRfHv99ZnlOK/91P7NGydimz4C+Q96DcvU8AqqbyiRPSAPS
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 05:31:01.1822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2617f451-2329-487c-dec6-08deb179fc35
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6916

Tegra410 and Tegra241 deprecate the HIDREV register. The recommended
method is to use Arm SMCCC to retrieve the chip ID, major and minor
revisions, and platform information.

Prefer Arm SMCCC when the platform supports it; fall back to HIDREV
otherwise. Behavior on older Tegra SoCs that do not support Arm SMCCC
remains unchanged.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v2:
 - Fix HIDREV read during driver probe. Move it to tegra_read_chipid(),
   which is called on platforms that do not support SMCCC SoC calls.
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 40 +++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 0ce94fdc536f..87ae63a7e52d 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/arm-smccc.h>
 #include <linux/export.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -27,6 +28,11 @@
 #define PMC_STRAPPING_OPT_A_RAM_CODE_MASK_SHORT	\
 	(0x3 << PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT)
 
+#define TEGRA_SMCCC_PLATFORM(x)		(((x) >> 8) & 0xff)
+#define TEGRA_SMCCC_CHIP_ID(x)		(((x) >> 4) & 0xff)
+#define TEGRA_SMCCC_MAJOR_REV(x)	((x) & 0xf)
+#define TEGRA_SMCCC_MINOR_REV(x)	((x) & 0xf)
+
 static void __iomem *apbmisc_base;
 static bool long_ram_code;
 static u32 strapping;
@@ -34,28 +40,56 @@ static u32 chipid;
 
 u32 tegra_read_chipid(void)
 {
-	WARN(!chipid, "Tegra APB MISC not yet available\n");
+	WARN(!apbmisc_base, "Tegra APB MISC not yet available\n");
+
+	if (!chipid)
+		chipid = readl_relaxed(apbmisc_base + 4);
 
 	return chipid;
 }
 
 u8 tegra_get_chip_id(void)
 {
+#if IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)
+	s32 soc_id = arm_smccc_get_soc_id_version();
+
+	if (soc_id >= 0)
+		return TEGRA_SMCCC_CHIP_ID(soc_id);
+#endif
 	return (tegra_read_chipid() >> 8) & 0xff;
 }
 
 u8 tegra_get_major_rev(void)
 {
+#if IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)
+	s32 soc_id = arm_smccc_get_soc_id_version();
+
+	if (soc_id >= 0)
+		return TEGRA_SMCCC_MAJOR_REV(soc_id);
+#endif
 	return (tegra_read_chipid() >> 4) & 0xf;
 }
 
 u8 tegra_get_minor_rev(void)
 {
+#if IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)
+	s32 revision = arm_smccc_get_soc_id_revision();
+
+	if (revision >= 0)
+		return TEGRA_SMCCC_MINOR_REV(revision);
+#endif
 	return (tegra_read_chipid() >> 16) & 0xf;
+
 }
 
 u8 tegra_get_platform(void)
 {
+#if IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)
+	s32 revision = arm_smccc_get_soc_id_revision();
+
+	if (revision >= 0)
+		return TEGRA_SMCCC_PLATFORM(revision);
+#endif
 	return (tegra_read_chipid() >> 20) & 0xf;
 }
 
@@ -170,9 +204,7 @@ static void tegra_init_apbmisc_resources(struct resource *apbmisc,
 	void __iomem *strapping_base;
 
 	apbmisc_base = ioremap(apbmisc->start, resource_size(apbmisc));
-	if (apbmisc_base)
-		chipid = readl_relaxed(apbmisc_base + 4);
-	else
+	if (!apbmisc_base)
 		pr_err("failed to map APBMISC registers\n");
 
 	strapping_base = ioremap(straps->start, resource_size(straps));
-- 
2.43.0

