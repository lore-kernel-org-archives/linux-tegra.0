Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012018.outbound.protection.outlook.com [52.101.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718413E0226;
	Thu, 23 Apr 2026 09:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934836; cv=fail; b=UWYxxgJHITDpL81DIFZjsp6/79GHeHMZIuCQerQe2ZbZ90Q7bxLQeN7pJ9vwnr3n02z09NTJ33pHEeo7jsgnlL/pzFrBZ/DENwE4RerlOrqny1GT2S7DMFGVe4i2GPWdUlmsnC2j+yDo0pD2u5icAAISzDXDqEb2DJFSQM6MEk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934836; c=relaxed/simple;
	bh=LGoiupd+S/KSMMuz0eMqyVVV1bkxAx1HnvLRfuwR4ac=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q8KSJeyxrxVmoQF6kCiE1VbrBo6xv8FI4NhdXfKHH65fzhJ/qiVpDp+S8noMQpH0z+vPXon3TGrEOuka8VQv0mBscOfLFICnr+N7Q975HHbpl9iAze+0XedsjnmYPSclM1aVCN3JVfwdw+Cv4FJvKbho49z3N7FvLPqx89BlxhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g+QrZe3v; arc=fail smtp.client-ip=52.101.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g+QrZe3v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HoSKQng7iAdfbWuRM2qKYH0ChOqs7lb+LXmKm71EBNHmsdgWG0MmHI7JircvZKtGEPno9mVtIOYM8lUSmcndmOsWm7exBxXUdcZO6kjoraoRwyRl//zPLsIYFw1hEIq7gBfgXggzpaRmZ07PPUtMCzl17OKJvMYUbKoVppisKzfs+eRYP5s8D6Kt0cxONgxQNU4+Nfu2VxhdJH5Eb+pQWHuJPWYziLTmNomo1WM4N3hh83REE+xjAvfZqhzb3v3k1kgPuPgs/63fboRpsC8cSDlEnglpPhGU+mENEURcrUPLMEava92awTEo1Rx5qG83R5uip/O1C7eAQV1wAeF0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OI2jcnITSzA20Hq5OBpI8zQTN6J7vVg7OoWsecdwwbM=;
 b=leQVCqgYhA99sOQ7QLSk9Xy3Z90ijb5rASGuaqU0uALD7SqADNGF4PK/Pl4JAcFu8Zrl67iyJSw31UrMgoJCyYeHhY41wpwG08XukcPKdVrBWRlko96Irkwz6iwFVb5lrZbq703o5I409qTL0iVpbtQwHG4lUNL594DrSfX2kdfIjjoiiEjleANSI8NEtDn2DvJhqSPv5hKr/leARw6ZHARZhYUfxqMZKgDFYrpP58sHuP0xK43nFeYJ5SeMko8jy1/bi+F1w+gMeCX05gJHdVtOL3VsHf1PPJ4mfEci5llm2QBl575cSYu2EVdn7fIlhfY+lMgX4i8Hdt1//LT+Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OI2jcnITSzA20Hq5OBpI8zQTN6J7vVg7OoWsecdwwbM=;
 b=g+QrZe3vWHm8sF2cHTdAfudjn5IMYsewfnxvcV3Gd1PA4QrZx1YyOdGUFSZ6Mg0nNfBzU1N4ywepsBrW+tJ/6Y7M/ApB9ablNowydjpjAWwzk7onii/E4rVxaDiKkj0UKdRjJoDLnDg+zBJmjzMU0CpqXWicHmwNyj1v00AqK0imqm+XqZpzvBWi5pVpA6VSaLcLNFHizr6neQMh+c386xPs0M7lwfYg6cyXEJRGY17/C2FO0J9wiW13Is1yqzWgUXhc3kFFXQFnOOjxN/ROoeL46iOgKOtTFaxmFYTO5oPU4d02I8/7IDq2xliPUspYMdvGKVoteBRvjYYbzGkH5g==
Received: from MW4PR04CA0290.namprd04.prod.outlook.com (2603:10b6:303:89::25)
 by DM3PR12MB9391.namprd12.prod.outlook.com (2603:10b6:0:3d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 09:00:24 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:303:89:cafe::d8) by MW4PR04CA0290.outlook.office365.com
 (2603:10b6:303:89::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 09:00:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 09:00:22 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 02:00:06 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 02:00:05 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 01:59:56 -0700
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
Subject: [PATCH v3 10/13] i3c: dw-i3c-master: Add ACPI ID for Tegra410
Date: Thu, 23 Apr 2026 14:27:09 +0530
Message-ID: <20260423085718.70762-11-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|DM3PR12MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: 666227b9-4d4a-495e-8def-08dea116c0de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WxXZ27SU2uXUgKEoWQO95+CLDM/V+VeI9itb6IS2TZvYs3uGO9PXqY2NIN2nMUmk6LQZWiC3ZQg0zJ1FEZ66WMLEUxvLF3RMinqx2fGoxfmHzAGi7Q8Yx2T4eKHHhXkNdCbPu1O8QsX3BuhFoTZ6Ed8a1e+qvSFxhT/tmT4QGMSfD9ih4P6RCADiw8Pr0i9TtPJzP8I/M8pOQWIB2QllSfxdniTX3n2Iq9FjOo5OoMcM3HDkx9VN9avA5pxVc4tQaIyPyVjX1A5UYqx272ATXrO/V+UKkCsuHYW0X++asAVMMCVl+N1VfdLwmekuYKbviPJx+6vKMP1HNbEi8oilf5eDQZtiVNQqsg4V77/G4cK7K01+PsHA//u4gD6k6j9RlFDVdT+NhyjvXmeqpuTUUyGRP+XIDouO+y3piPU3M15TInXeXpVrZfKwLEwFh4el5uJqVySf23Qf/9ghGUpigLwAOMAyuA088G60q8K0SmSSJYGjEEeN6UTimJdiOtUi5qQEV0Pkzt2GUEWMMwGn0OzulomxtMs2d10HebAwpYkUI/EfN4tHfJJEvbefqIRuV1cNdF3KmELfcGCtzPO6rXfsNdjnh0HN0zjltvgmePe1m7cUlw2vZx4db8R+bDZ5HjiQyknOIUVvWyuZzu+VgLI07R251hWvY7VunabBQ827t/70ckLKHRe5xTK1FNKRn4AH5/vg4ozPphwLvtkdM3A3fkxo+9/ggU186GntOoCe4vvo7cgrvGJaMA1qFwyxO2UR7rykpYN0qh+4mg3FRheiTnWTAB7YRr6Qc6MYSJzrQWe6mfK9WW2UpuVmEASn
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MAWOT27d00JOCtYDK+v+1Q1sXlZaSmGdpYqWW+5A9gV2jaGAxFW31rhA3+IMWbj7LPqlB0512Ljb9tSzXeWH3S0zo62OTA88j3dfbWoGe1DO/TyhMlQQx7JKs2uW0djN+g6GDXwUa2D8orinYM0mZXDnsj8bjD8jFotA8i80duRbTPDWHjXLD96k5ql3FSHerof1UTYOl8jeq4KaFm0MNw23ou47jnu6xbX+1BEzusZ+qMlOTXP40Y++9VUPV9BFD8jlBhp+O1WvlXRZFPzeKCDHu+CjMEd5H53nYLLk52sdz2gLM1sMZJZEDFX3E2Kwfineb6gcVU7Vl1KR2lMvekAlKXKX9bOob5Q15dg1p/GwWdxWD9SaCXvKga+e5AMbtdWwZitTeLrnxYoT60E73cqHosnRy93xB99sBO23C3H9yl3H+/l95RX7dNIjFmOv
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 09:00:22.8967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 666227b9-4d4a-495e-8def-08dea116c0de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9391

Update variable names to generic names and add Tegra410 ACPI ID to
support the I3C controller in Tegra410, which is a DesignWare I3C host
controller.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index b90756ade2db..e63822df2ae4 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1847,11 +1847,12 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
 
-static const struct acpi_device_id amd_i3c_device_match[] = {
+static const struct acpi_device_id dw_i3c_master_acpi_match[] = {
 	{ "AMDI0015", AMD_I3C_OD_PP_TIMING },
+	{ "NVDA2018", DW_I3C_ACPI_SKIP_CLK_RST },
 	{ }
 };
-MODULE_DEVICE_TABLE(acpi, amd_i3c_device_match);
+MODULE_DEVICE_TABLE(acpi, dw_i3c_master_acpi_match);
 
 static struct platform_driver dw_i3c_driver = {
 	.probe = dw_i3c_probe,
@@ -1860,7 +1861,7 @@ static struct platform_driver dw_i3c_driver = {
 	.driver = {
 		.name = "dw-i3c-master",
 		.of_match_table = dw_i3c_master_of_match,
-		.acpi_match_table = amd_i3c_device_match,
+		.acpi_match_table = dw_i3c_master_acpi_match,
 		.pm = &dw_i3c_pm_ops,
 	},
 };
-- 
2.50.1

