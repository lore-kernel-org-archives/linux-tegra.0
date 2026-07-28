Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC2D381EB5;
	Tue, 28 Jul 2026 07:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222170; cv=fail; b=COBbI745UW88nKVjblO7lG/ei3eUBU2aK6inR8tcxkBFxE3kHIHJLl3zMLyQD0bbri43P3E+nxbej9ml/074rEiy3GCDC0vTiDrL2HOUvrE4Q+1D1Ub32blQ9B8wC3fDD/CQ+4bnknfydXrU/oJ/vRX3bYNb64HfpLPH+gk9wAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222170; c=relaxed/simple;
	bh=zTJDUrJEHmKex/IvCfyZOdFOAl4eoIea4hic50YKY3k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ismp4IqGniFfbi7iajaHS6ulCWbkhC+gq23BDxeUC98Ebh7jhX1Cgvz3nFyAXpfEugCwt17bpVWEck0H1PZcoo/RT7Q085gtOhMesDFKUjACnU2nCuAtU7v3Gmxj8A7gAV0aAXlOM3Tml+7qSa/4fUdsoQRB1kFJLE0xqdUWTIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O8eDq7XI; arc=fail smtp.client-ip=52.101.193.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O8eDq7XI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMFTdSe1XqMYkU84pING3hdbUOuD9dOgRJlQ2DiqwDzTSMCwBKurOdHVxc1OWohIn9lug4HLHSiwfoHgC5yn4fOuD7K/lSVzRaLl3hKInU+kGe2cwIE0CfFxtO7GlRXaGjwTDcXGOAPc2O3ny5Qf3avzr2kXnijmtTqhsAikqm62362RlEBuB4eXlxGxYvdRtah6pHunCXKEy9MQOcmeoRYqjBjpZKl9ra2elToOD10EJVZbNzqp8fT3tlY3wQr2zJ7Rsn4FHwvfv9BDTf2Q+wrwm5OtAkaF40YFM5D1KxhSJetdkJgxazcspi32w/ss11Q3H9OIqLbDznCzM56yRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cawe8YFDPkXGL8X0Xe2zgj3DaSjJKAsvVlkXC1R5oTM=;
 b=ilkHg9P54O4KPBgDOJLje0UNU5XZpHeL35XhBYj5ROZtowc2+qhttPZHt3JMaX15evW8oYSN+o+7CwlejwpIRPinFS2FJloIyEKThUEmmaEyxAaVmsAZDBO1l9dX+rA5s7rV6czSwg/lKhCSrwqzrMgx81Xnt7k7beBIq1uBWCNpE5nDIR2oacaXdxSSTTUsL+sK4e/1e5/0n+42uouhNg9DpvU1kh+gD1ep+3C/1JKYhIcV9fa1G9yTNcGg5f6BkZ3rkoTdG2trEqmXycTCLO18DyonbsxYCFi/lPDJ72HOFWrEvQ8kCRstnXO/9sZpBqVY2DPYVikECsxYb427TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cawe8YFDPkXGL8X0Xe2zgj3DaSjJKAsvVlkXC1R5oTM=;
 b=O8eDq7XICpkHRCPPyQFdQZA5D9d2zlcLmwAmtiRmsQ64s9xTAMkDUgazzOD87Yxpkle0DbynRimFSVNRsrGiWj2ipkT0x/Zbdvhz+LlAn66coM/UesrQevCWd6+xhqeOke4XNXuFVx1fjpAPgf1EjhXRrzONYJKh7fMch4+6wYNY7saZK7N59n0EhNGDgw224XjGoTMPjpoSGk4hotnvko0brVUZ+jRrPnBQ2aV//bXHSmhnCT7HfvuKXAZiPzF4W2Mlz/zaWlxAj+B1a60YeuW8JR8i4HdRWCwNaUaBU3u2ET8eGLuI71SG3KZo3oeXcMg6HKPIGIBBf5K23YjkBg==
Received: from MN0P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::24)
 by MW6PR12MB8706.namprd12.prod.outlook.com (2603:10b6:303:249::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:02:43 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::35) by MN0P221CA0024.outlook.office365.com
 (2603:10b6:208:52a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 07:02:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 07:02:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:02:26 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:02:25 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 28 Jul 2026 00:02:20 -0700
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
Subject: [PATCH v7 09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
Date: Tue, 28 Jul 2026 06:59:51 +0000
Message-ID: <20260728065955.809445-10-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728065955.809445-1-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|MW6PR12MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: ebaca4ea-c1f7-49e6-54eb-08deec763807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|1800799024|36860700016|376014|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QnUfJaWK5oXgCysv64by4r1O9E3cGCBUi/2h+5xmG7n4kE+QO7cCBJjvaDYDbrL2vIFZ0yinAplacp22p/Y+aE+BaThzaqtJglK3+0HY0iqaSR+Er1hfsfXeeu9ZYTX8hL4Su7uDjk2cmtchh17iLTzTcLQx1d6ZqUPpBU/76Xm/GGLBIqJnOCruRyaPH5s7knnLPDs4iW4YA4LOGvhZNej7JT8HUKmNvRxui1szJxDxjsY4HYNF4gzfhX00l1wpJbVMfz6aEpggk0+5Zqj2yMijLfZmAtxXZ/9KKBh3ZMF7gW53SU/l2qaAe1ULhTQIHIHvk28K9VvK3foldiwN9KobGoCiiby/WH35w6Rku7vkZdc1xayGsUZujDrG9M9VvcoAO/FaDrD+JNJO69V4MdK+LpBXS/AGQ4ikebcjtpZELOJ3oPgXKIiZfDuSS81/p+eyMpytXMxTp4PUJ02IjqblmvKSAwkdGbBg/egM7LsROq8/cqlOXOgRUXsNQ7DEQg2sOPuwYseCbyenxwBtqqHnr7+Obd4jfNPsHv8aanCrXC/5HunMaE95oNAHYxHhokle0JFLpzNslD7s1FBy6dxOYwF3pC/KjMHK2hkeVaZYXug9UoC5vgEW47H1gyLq7tzdg5iGTzIS2zfJIUFZEeXDwcltCMgk2Ib2uDz4wW0b6z++gSFAy10wJgUZ+gMj87uhCqMbt+lZuRVNioaKQA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(36860700016)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TFMaeho20EaQad/YAgk1aC4FwJuVwotuEyvjkcbzQkJnMD77qbaEpz2Q95mBIthlaW/pzhT7ZISm6ALC3Ly1sln0F0G5sF/j5T05AhygMf1BzMNrXBOQzOrWuVp2YW6+997bS4BU+vN+QNPUu0EpJ0YrmwQ90XXLsJ08StqTMzo/SJDDIRYO1fTJBU3q2nLd+znfZFyLr25ZVCThtrqu/msxYIWGoK2qRoBgcwknQaTHjkCIfbBZ+pkgaAO3MT/2vwawX3rEKHGETwjADcDNBabtkmDstCMzeS0rbptXIIbHs6gPNlQ3Ws4luMXCiM0M3dxTaMjBoBERHOoZPH6o8EwKN21FDRs6cY9sIP7d62aBPPpzZmvfcN2UhPPX/hurz4I3T1ltxIJCpoeaioR4KBzNA4KoqRL/m/EGC9qbSZ+vRSSq2jVqoiUL64/SoF02
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:02:42.1663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebaca4ea-c1f7-49e6-54eb-08deec763807
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8706

Update variable names to generic names and add Tegra410 ACPI ID to
support the I3C controller in Tegra410, which is a DesignWare I3C host
controller.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 273d7a002099..12069aa56fad 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1855,11 +1855,12 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
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
@@ -1868,7 +1869,7 @@ static struct platform_driver dw_i3c_driver = {
 	.driver = {
 		.name = "dw-i3c-master",
 		.of_match_table = dw_i3c_master_of_match,
-		.acpi_match_table = amd_i3c_device_match,
+		.acpi_match_table = dw_i3c_master_acpi_match,
 		.pm = &dw_i3c_pm_ops,
 	},
 };
-- 
2.43.0

