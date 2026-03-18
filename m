Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012002.outbound.protection.outlook.com [52.101.43.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1335F3115B5;
	Wed, 18 Mar 2026 17:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855064; cv=fail; b=QcbhUiKU/vd4nDaFMxvkWRM3x6FaL62l6Cj3cO4ch8DnUPilz6al65k4ZJKU+ADnwBrld7NegbmVWvoKGsSjQI5a6r6JDAZ4s67UyPYL40GL8e3NQc0XWbZkdEWxoUvs8lhiBW0OOPwpfj9R7bzLHTdczITaV1JG/X/+iwW1FA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855064; c=relaxed/simple;
	bh=CBJKAL5afxTStg3hbxcx6i72y6o6Pf1tMhp6i/RZ7gk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WUTGnEn/I4ewJcszQssHM/bs7n0cC3NU6hy71uQcuD+vsdJRZlMPunMyO9VM/49zCchfBnn009WSd4kG+5R8pIShMHxu5VZmHWjaYdbuQ0LKCJMEvZNMBhNyCwv2Kv/EgLQNdGUfwIvzAo35AESqbLSU5TzKp7KTjakyK5Kie40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=diixPl/L; arc=fail smtp.client-ip=52.101.43.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="diixPl/L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAQ5LlBR7iOaa8n6tmbWhmHct4Oeo8roZR+i4Okl3Vvu2wa9/tupBAr7lzwJ3hbkHdi1D9FUgzfMwBryGEK8kjFZmj9+iga48NPX/QYhxWcS4fwVmkpwJa79tgjUKsDeJHeUYx8e6SoWuSkf21732r2mCthFrwGGFe6+U8kdgzV7S2EPGgEjwvb46kLtATsGoS85fgu/GwEeSJ2c/3ABWE5xfSuJBF2osF/FzKfI/P5t9ybkLfrGQTLRKVMdIxbP3Mh3kgm3uY5u41A7oo+K6od2qZcbBEu49bT91ZVW05EnTSP5ETiGM1ZYG+fEzs/9pG4bqnLix9LPKpITU65J6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEyqJ7IBqpDdTN1NfsC3t7VX98lDYspyuGE5prcV8Rk=;
 b=c2CInlxctcua1em+Qk7+UvCd7WggeonyzddPe9nKzrnHOnv0FguA/x5DQl2MgyqiCQAYfTDwHo3fzgmJr17PJMkJ1xjw61YpNYYVnELRmA4EMBGuCB0eXnnfS2A8AJPhpnsi8tSCUQUJ5Si1ZTu8qqqVNZqPLBx24PYxkM3KjjcydGJ4ekZa+KyAJw4lwxWA37hUuhADIMXxD79lAkK2b1D1QPLbTDZN7Mem774oAr7gmx9yx41hm+nNk9vaRMgLD2VqR1KcWLLwKyIXBuQwaxvT3BuusbkmV+gGA6/73xqAZ4nKDX3yERkvRlfq4zSlEQltrrOqc0tSXanxZiDZpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEyqJ7IBqpDdTN1NfsC3t7VX98lDYspyuGE5prcV8Rk=;
 b=diixPl/L168TzSxOolLjtS58uoUOOOXnKJBmgI/42a/4M/apINmza97iQh7oOU46fpSpjFEVqfRWqaJO8D6A6XQdMRGenG2tCKWoPBhJdaKYZf5wH2IsKWWmIoAmDG9uyYudsiHtZdOXq5+zam25p120v7lihXI0lG2vbJ6NvP/ZJNsb8APpMNCvd5fp3pNWwnI63KoZgYCaN/pVwU5PRI4HsEDgLAiit/4S7n/f390uquAubapL+OCaP1SV9JOsvf9mkgNM4gfJFAsy9+2LbA2iyNeQACZYgbeGTF/Wdn0sAgcDfSX7+hblBh7+y7e5b8ilvhDrda0S02SRqbo/+Q==
Received: from DS7PR03CA0103.namprd03.prod.outlook.com (2603:10b6:5:3b7::18)
 by IA1PR12MB9499.namprd12.prod.outlook.com (2603:10b6:208:595::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 17:30:57 +0000
Received: from DM2PEPF00003FC6.namprd04.prod.outlook.com
 (2603:10b6:5:3b7:cafe::43) by DS7PR03CA0103.outlook.office365.com
 (2603:10b6:5:3b7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 17:30:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM2PEPF00003FC6.mail.protection.outlook.com (10.167.23.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 17:30:56 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:30:35 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:30:35 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:30:28 -0700
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
Subject: [PATCH 10/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
Date: Wed, 18 Mar 2026 22:57:23 +0530
Message-ID: <20260318172820.13771-11-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260318172820.13771-1-akhilrajeev@nvidia.com>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC6:EE_|IA1PR12MB9499:EE_
X-MS-Office365-Filtering-Correlation-Id: f48e201c-7399-48fb-e945-08de85141d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|22082099003|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	r/IfTjPUOLAGbixcfG5xmL3CX/JjvbfJBjgRakYTkkkVFNiPiMHZNY1NmmtQTGAp8DQx1JDia5OTX1ktejHkd7dcb+ctDF+mqPzWtkbyKEpO1GQyqH7OLd0+/LQRpGitTpGzhJF0FSNjy6QMbvUW+LJKk+Xd2JBOMomwLNaChdhnneH/5sHpUUazqlNdiQiO/u72uUI6D1CZZ5VjuyyWMKV0dlxDJTYXQYhRTwuoQXJ2UGy3jrUhB4CmmCPcyflyPfPQ7tZ3vcKBTSlX1NNts8ohjXMcPTtK2kvIhDtzCcYLmFRrsuFjfK+BgZxzO7iwMw8UeJtP+BNhXZZenpvz0L41X/PeLE1BWVQe918KZP6B/Zob9NrZUV/W9gTSVKOLB1G+pDPVYuLcGHlue14YwSaOI6bTZWGUOqONhDfbgRgV4ejPfthJWoOXYFW+je/VAQrBO5kG7PcNqI/6/fhx83SXmGVRSM77jgkn47QhfW4NQ+PAbYrBcO2NZzo28BNlgIO5nNxFvJLYmI3diYrfNUAHbcQLgjyoT4WvEAtIgch8D7pQfG6FlkRfeR5fwb6CdzTuOfV3RXjwhUMbRwYb5GyC8chFO6+2mY/HmhJRY7d90G0QJE6b9NVuqRhG72cPD2o1ae0cdJsLNgRLcYmHi3Bllz0hY4WDs5M5lPC3BUZHS9pExgdJwxNQmEVw7+PfwTblSzekfE1J8Iehi3LOVPHFe1qfwo9utGw/63Cstf88wFUONyrGblZiGuvLFB8LRuIq6UN+xnfbP32xdfrld837UmdDFdXnn62I0jzw/CDoKziMHMKJzxJZ+C9hAdMI
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(22082099003)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9AZgzQE6UhrStKZH6G/gMNEjQQ6mH4wXBdoYniyabRHzs81U2/2bMhNiOv1Uo+MfbJgAuSnOVzaKJTViugiKwWwFJmduLfG/cuOtCmERLZAjO8n2f//YyKgPYK4w1MRW8Eq5a1MT3Ln7UpvHzNuJZBStN4VipKHfcRcupZTFgFue+imYKaCnvF+KMDfsEC9F+PMSmTPDfWZNhZ/6crZU0ZwhxGYVxCfJz02v7uAIIF+NUreeeo4MQXjEkrypHfXxi+WRgkpoAk4jiQwqsYeSaIaJtNfic0sZLU/SyIwN01NYo/1XYHr3D2R4j8PeCF5mQ4tkgLHabaju0IXwOfuvFlRKiP8v9TACdiYbnqRtYt6uj4QoECXb+GD6poh3qCU2PUHzN/eJuHcF3kM0thU4V0r8XPZIQx4pwO9icuFmn1ERYR8PwImrmkIniVhikv7+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:30:56.6993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f48e201c-7399-48fb-e945-08de85141d2b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9499

Update variable names to generic names and add Tegra410 ACPI ID to
support the I3C controller in Tegra410 which is a DesignWare I3C host
controller.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 2dae63983303..684499ad2047 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1866,11 +1866,12 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
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
@@ -1879,7 +1880,7 @@ static struct platform_driver dw_i3c_driver = {
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

