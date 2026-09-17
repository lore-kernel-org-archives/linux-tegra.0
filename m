Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010042.outbound.protection.outlook.com [40.93.198.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5244AAC5D;
	Thu, 17 Sep 2026 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636606; cv=fail; b=WsYVoAYBj2vWWKRWv9vGfaJyZ/cCXhDPz5r4/4JPoJva8Kzb+w3g2U3K67Pz1uLkVJ81UqJffI2lqyvWstthvRcv/tls+0yvAnIzIqXJSeG3wGcLFC6sszU7B9LCQHmv9rtHGzsn6LdQMRmd5qrisgzcAcPi7wVKJ1nrAfjtOL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636606; c=relaxed/simple;
	bh=I7YZ/arKozETNmRbapi4EKldm74H1xywoGEbBIL4Z74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=luKxfAnDP7TBBmzfaMgtK+++Ju1y62f4c0Z1ifJMMegzsPxWjD8zIr3tw98Er/ttm/Bu77vlJJXKtZDwmkhmWHrv/Cmd9rQh6xpZ7qcZf34lb3iFlsiMtQT1Wc3aqRCy1rzsPK73JS/t3GB+fk7zre/krHRcm1IsCW3teRnKIN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fwO0pxqS; arc=fail smtp.client-ip=40.93.198.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fwO0pxqS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzjlot+q1BnfepwVb9k7qtMIMpWXTL24DuvRf34ixhN59HdcyOQJO1d18Fzfy4/hdn/HOju66ZiOlYdded2SbnDom30bu1zG1U5Eebkt7lFveLO1X4MzmeGY5OrY1hCLc2EVifH78xa/aX8UDmiH32gDtnyTuIOEEFimEypfzpBLEbrrWQ/5Y4FbOQDwKC1qdz0/PPWEpDyjoCK7r+8OU7gSTwpHvSDHGR6dSTKCMAVb8H5Na1DQ5xBpSraYLX4IfHzNyUlzjHouZcLjBKrCeK06hILyXIGw0fMfCo9vm0BIV4M1c46hN8Xp/21QU7ZeIUTUgEHA59LgUY8c0dwxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWYha9MDveFQrkgFSqHxgWEymSFlEcATu9AEhSh4j3c=;
 b=xfMx+5PHql3rhNRkReuLLZxAA9ligPfmZJssZGl91gUZcIbAR1qVU5zm4Kq1yGuE8AtkjJzQ4PHIQg4XJ69PD8I9EBXH65BDLD3pshOxxpi8D2lGKOoubyO8aivq01SKSrhoUjmsaXR5a+n8E7F84/Ux56FYqPu20v9wzrYc8s6AOn1aIhrUdbhJdNsWZ6JAa1tWvc1XEWnTXtZFZQ0wLtI1c9CMywoghf2s7tHkjtwTb4Wns7x/mEtPJxFx8kZxJ2Q5oahbXmyawdgTGeQqVo1bu8W6o+fZSi5s2arXAuRcfAnufkZa05Q5j0R6p3Am3C1/sa5D4RWHmo9ZPLhE2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWYha9MDveFQrkgFSqHxgWEymSFlEcATu9AEhSh4j3c=;
 b=fwO0pxqSb+nLtlJ9TmNQ+k7Zty8QomPM3q2rluN1RVJ/pnPkQWuK4f4t0Fo+LkZyQiDIKb34Ppw02f8CBstC3mbq2eWHKAoG3ZRjODo21gS9Mf9LdyyFq+mBlpz5fcRGToN5XWK6wnpVrJejyKwxjr2YYcQ0wsaKsd/94XMPOTfO3c+S8y7HpnQmWFmElFR4nesTryFDEzrYb9Xc4ZlwzASgD/77EaZZDovZPLmWX7qPm0vYrqmiKHN+ABccJpshSnXM6cBRPjJ85IWvhA7xMrOij2uBCuij2NBrx6mVs4J4HbuoWgKmMz5dtsprMWk3+L8L9dJMwhhEUfLzWDPUPQ==
Received: from YQZPR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:85::7)
 by SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 09:16:37 +0000
Received: from BN2PEPF0000A992.namprd04.prod.outlook.com
 (2603:10b6:c01:85:cafe::92) by YQZPR01CA0003.outlook.office365.com
 (2603:10b6:c01:85::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Thu,
 17 Sep 2026 09:16:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000A992.mail.protection.outlook.com (10.167.248.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 09:16:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 02:16:16 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 02:16:14 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Thu, 17 Sep 2026 10:16:03 +0100
Subject: [PATCH v2 3/3] soc/tegra: fuse: Add Tegra264 support
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260917-tegra-tegra264-fuse-v2-3-4936068c2168@nvidia.com>
References: <20260917-tegra-tegra264-fuse-v2-0-4936068c2168@nvidia.com>
In-Reply-To: <20260917-tegra-tegra264-fuse-v2-0-4936068c2168@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>
CC: Thierry Reding <thierry.reding@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A992:EE_|SN7PR12MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: eb3d52fa-0485-4cc8-5500-08df149c606c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|22082099003|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Cnj0QIJsVutOFm/SsvqcT3syI2vOa/5OSzH5erusmfiaXGTjAnhhLNrJ2mSlTVJrE3+SH/+pzngLkYfhX2lsChuLh7zyBN1Sd2JrIXx/OlBzaQIR04tFu2IoGui6dm+1q+IJJfTXbCy/MTqxKnFrX4rMWxzEQbBSRPJM9S287DkBSIFarHmK+yzmvk2B7aNpXQa3kaqSz5o/KV3Bp+O9kdbQ19TtUL88XDeaQ4Zw/nnXKsSAR6d5nvD2S3yVISJshOJh+89CYIs382l/F0+ob1xQch3H0pORRi1XnhDN+h4GYf/W5Qi21PcYNEj9S1U8o1nIdBqd4MWJqfV3cHa9/CtCzcpKOig+jc9fkkTwrBIivFMWLvKY+LA+Sg3DjzwNPPXg+6l9Uam+GbZgY6BzrQV5FZRpKP4MgxXsYLWx6s6AZukFZQhyNCqd30U6C1yNhScSoU3ACz399yFJo+luiQZaKgt6Va3TLZaqbqPQUalNGaIrqtpKcS3ux1BiIaSoJk6FEkPCU9vYKAz8z6dZZx9rLS87u7lXBVRqSlJ1n0XvNOYyybt6iZpdZ/jMjggqp+BOxeKEHqpBIrFYuFhjTiY2Bm5EVyh5SjmCvPapPN0msg/GmFtGQgm5Hv4LJv77qxEVks693nO6USWqplrjkh//tWnSxmnMoklGHp2x1zviSw8IfUfIQhEaN/5BAgzLNz12jDNdYMsFl2MSowHf9Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m5/Rd7gpy8ZtgH3mYRfi4ZcaLGPWWqdKCi8WNMZndb9bHvv4EAjhjZm00PmuEqr6RxH+B2WqPqJKlQisn08rmEr/LRE1jkS/sFdKcJ22dc4BOSk+LQUUGLc8SoeCGD5ussN4hVfbfbGXrAwybTqlHb+tWXKdHtDLQXwRH23hSBoJX2AdEvOv2gy5jOn4GfoDJ/RDrAmyKaIVc9jwMbBGh4pfoKSXE4EbDNnwz8GTkrV4NjVhFBceArdtBklVGV4EHW/K52zkbfxAAjAos6lKd3RW3E/OpVxZ2gN5H+PeHAhwYiqluK8P0/iJzJAqr9L8Imp7dCzS1cXlhJvdkbT/rY6Iv+z86cqwZPx2azK5cujSTb2w+I2gTwBmNmxpcUbSVIT2dXa6EIL3IvLdSiyMc/rWB2yrjdnlmbnIE6H4A+BOXQLGSr55ZdxFdbW/UDJR
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 09:16:37.3166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb3d52fa-0485-4cc8-5500-08df149c606c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A992.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8147

Add the fuse SoC data for the Tegra264 device which defines the address
range and keepouts for the fuse registers.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c   |  11 ++-
 drivers/soc/tegra/fuse/fuse-tegra30.c | 168 +++++++++++++++++++++++++++++++++-
 drivers/soc/tegra/fuse/fuse.h         |   7 +-
 3 files changed, 183 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 39654964c35c3e59e142f74b09fc60cb3515c78a..b8c8ccf80056cbf13318f7ad06de6c658f52ad41 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -65,6 +65,9 @@ static struct tegra_fuse *fuse = &(struct tegra_fuse) {
 };
 
 static const struct of_device_id tegra_fuse_match[] = {
+#ifdef CONFIG_ARCH_TEGRA_264_SOC
+	{ .compatible = "nvidia,tegra264-efuse", .data = &tegra264_fuse_soc },
+#endif
 #ifdef CONFIG_ARCH_TEGRA_234_SOC
 	{ .compatible = "nvidia,tegra234-efuse", .data = &tegra234_fuse_soc },
 #endif
@@ -175,6 +178,11 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 		case TEGRA241:
 			fuse->soc = &tegra241_fuse_soc;
 			break;
+#endif
+#if defined(CONFIG_ARCH_TEGRA_264_SOC)
+		case TEGRA264:
+			fuse->soc = &tegra264_fuse_soc;
+			break;
 #endif
 		default:
 			return dev_err_probe(&pdev->dev, -EINVAL, "Unsupported SoC: %02x\n", chip);
@@ -413,7 +421,8 @@ const struct attribute_group tegra_soc_attr_group = {
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_241_SOC)
+    IS_ENABLED(CONFIG_ARCH_TEGRA_241_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
 static ssize_t platform_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index 2fad8b13a3b9615b46187ecfc6f975dd8e0f6e80..623848116b693b2a4c6669538f096b99943f420a 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -39,7 +39,8 @@
     defined(CONFIG_ARCH_TEGRA_186_SOC) || \
     defined(CONFIG_ARCH_TEGRA_194_SOC) || \
     defined(CONFIG_ARCH_TEGRA_234_SOC) || \
-    defined(CONFIG_ARCH_TEGRA_241_SOC)
+    defined(CONFIG_ARCH_TEGRA_241_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_264_SOC)
 static u32 tegra30_fuse_read_early(struct tegra_fuse *fuse, unsigned int offset)
 {
 	if (WARN_ON(!fuse->base))
@@ -802,3 +803,168 @@ const struct tegra_fuse_soc tegra241_fuse_soc = {
 	.soc_attr_group = &tegra194_soc_attr_group,
 };
 #endif
+
+#ifdef CONFIG_ARCH_TEGRA_264_SOC
+static const struct nvmem_keepout tegra264_fuse_keepouts[] = {
+	{ .start = 0x0019c, .end = 0x001a0 },
+	{ .start = 0x00308, .end = 0x00310 },
+	{ .start = 0x0032c, .end = 0x00334 },
+	{ .start = 0x00350, .end = 0x00354 },
+	{ .start = 0x00494, .end = 0x0049c },
+	{ .start = 0x0078c, .end = 0x00790 },
+	{ .start = 0x007a0, .end = 0x007a8 },
+	{ .start = 0x007dc, .end = 0x007e4 },
+	{ .start = 0x008d8, .end = 0x008dc },
+	{ .start = 0x0096c, .end = 0x00970 },
+	{ .start = 0x00974, .end = 0x0097c },
+	{ .start = 0x009f4, .end = 0x009f8 },
+	{ .start = 0x00a14, .end = 0x00a20 },
+	{ .start = 0x00a44, .end = 0x00a4c },
+	{ .start = 0x00a50, .end = 0x00a58 },
+	{ .start = 0x00a5c, .end = 0x00a64 },
+	{ .start = 0x00a68, .end = 0x00a70 },
+	{ .start = 0x00acc, .end = 0x00ad0 },
+	{ .start = 0x00b0c, .end = 0x00b18 },
+	{ .start = 0x00c80, .end = 0x00c8c },
+	{ .start = 0x00dac, .end = 0x00db4 },
+	{ .start = 0x00db8, .end = 0x00dbc },
+	{ .start = 0x00e0c, .end = 0x00e10 },
+	{ .start = 0x00fd0, .end = 0x01f00 },
+	{ .start = 0x01f1c, .end = 0x10064 },
+	{ .start = 0x10084, .end = 0x100a0 },
+	{ .start = 0x100a4, .end = 0x1019c },
+	{ .start = 0x101a0, .end = 0x101cc },
+	{ .start = 0x101d0, .end = 0x10308 },
+	{ .start = 0x10310, .end = 0x1055c },
+	{ .start = 0x1057c, .end = 0x106b0 },
+	{ .start = 0x106b4, .end = 0x11008 },
+	{ .start = 0x1100c, .end = 0x11018 },
+	{ .start = 0x11020, .end = 0x110b8 },
+	{ .start = 0x110c4, .end = 0x110c8 },
+	{ .start = 0x110e8, .end = 0x110ec },
+	{ .start = 0x110f0, .end = 0x11124 },
+	{ .start = 0x11128, .end = 0x11168 },
+	{ .start = 0x1116c, .end = 0x111b8 },
+	{ .start = 0x111bc, .end = 0x111e4 },
+	{ .start = 0x111e8, .end = 0x111ec },
+	{ .start = 0x111f0, .end = 0x1121c },
+	{ .start = 0x11250, .end = 0x1133c },
+	{ .start = 0x11340, .end = 0x113c8 },
+	{ .start = 0x113d0, .end = 0x11420 },
+	{ .start = 0x11430, .end = 0x11440 },
+	{ .start = 0x11444, .end = 0x11468 },
+	{ .start = 0x1146c, .end = 0x114a8 },
+	{ .start = 0x114ac, .end = 0x115cc },
+	{ .start = 0x115d0, .end = 0x115dc },
+	{ .start = 0x115e0, .end = 0x116b4 },
+	{ .start = 0x116bc, .end = 0x11740 },
+	{ .start = 0x11744, .end = 0x117b8 },
+	{ .start = 0x117bc, .end = 0x11810 },
+	{ .start = 0x11814, .end = 0x11850 },
+	{ .start = 0x11858, .end = 0x118a0 },
+	{ .start = 0x118ac, .end = 0x11b48 },
+	{ .start = 0x11b50, .end = 0x11b5c },
+	{ .start = 0x11b60, .end = 0x11bf8 },
+	{ .start = 0x11bfc, .end = 0x11c18 },
+	{ .start = 0x11c40, .end = 0x12000 },
+	{ .start = 0x12004, .end = 0x12010 },
+	{ .start = 0x12014, .end = 0x120fc },
+	{ .start = 0x1211c, .end = 0x12120 },
+	{ .start = 0x12124, .end = 0x12144 },
+	{ .start = 0x1214c, .end = 0x12300 },
+	{ .start = 0x12308, .end = 0x1236c },
+	{ .start = 0x12370, .end = 0x126ac },
+	{ .start = 0x126b0, .end = 0x12c60 },
+	{ .start = 0x12c64, .end = 0x12d94 },
+	{ .start = 0x12da4, .end = 0x13004 },
+	{ .start = 0x13008, .end = 0x1300c },
+	{ .start = 0x13010, .end = 0x13014 },
+	{ .start = 0x13018, .end = 0x13020 },
+	{ .start = 0x13064, .end = 0x13084 },
+	{ .start = 0x130a0, .end = 0x130a4 },
+	{ .start = 0x130b8, .end = 0x130c4 },
+	{ .start = 0x130c8, .end = 0x130e8 },
+	{ .start = 0x130ec, .end = 0x130f0 },
+	{ .start = 0x130fc, .end = 0x1311c },
+	{ .start = 0x13120, .end = 0x13128 },
+	{ .start = 0x13144, .end = 0x1314c },
+	{ .start = 0x13168, .end = 0x1316c },
+	{ .start = 0x1319c, .end = 0x131a0 },
+	{ .start = 0x131ac, .end = 0x131c0 },
+	{ .start = 0x131cc, .end = 0x131d0 },
+	{ .start = 0x131e4, .end = 0x131e8 },
+	{ .start = 0x131ec, .end = 0x131f0 },
+	{ .start = 0x1321c, .end = 0x13250 },
+	{ .start = 0x132f0, .end = 0x13310 },
+	{ .start = 0x1332c, .end = 0x13334 },
+	{ .start = 0x1333c, .end = 0x13344 },
+	{ .start = 0x13350, .end = 0x13354 },
+	{ .start = 0x1336c, .end = 0x13370 },
+	{ .start = 0x133ac, .end = 0x133b0 },
+	{ .start = 0x133c8, .end = 0x133d0 },
+	{ .start = 0x13420, .end = 0x13430 },
+	{ .start = 0x13440, .end = 0x13444 },
+	{ .start = 0x13468, .end = 0x13470 },
+	{ .start = 0x13494, .end = 0x1349c },
+	{ .start = 0x134a8, .end = 0x134ac },
+	{ .start = 0x13544, .end = 0x1354c },
+	{ .start = 0x1355c, .end = 0x1357c },
+	{ .start = 0x135cc, .end = 0x135e0 },
+	{ .start = 0x135e4, .end = 0x13608 },
+	{ .start = 0x1360c, .end = 0x13620 },
+	{ .start = 0x136ac, .end = 0x136bc },
+	{ .start = 0x136c0, .end = 0x136c8 },
+	{ .start = 0x13714, .end = 0x13718 },
+	{ .start = 0x13724, .end = 0x13728 },
+	{ .start = 0x1372c, .end = 0x13730 },
+	{ .start = 0x13734, .end = 0x1373c },
+	{ .start = 0x13740, .end = 0x13744 },
+	{ .start = 0x13754, .end = 0x13758 },
+	{ .start = 0x13760, .end = 0x13784 },
+	{ .start = 0x1378c, .end = 0x13790 },
+	{ .start = 0x137a0, .end = 0x137a8 },
+	{ .start = 0x137b8, .end = 0x137bc },
+	{ .start = 0x137dc, .end = 0x137e4 },
+	{ .start = 0x137ec, .end = 0x137f0 },
+	{ .start = 0x13800, .end = 0x13818 },
+	{ .start = 0x13820, .end = 0x13828 },
+	{ .start = 0x13830, .end = 0x13858 },
+	{ .start = 0x138a0, .end = 0x138b0 },
+	{ .start = 0x138d0, .end = 0x138dc },
+	{ .start = 0x1396c, .end = 0x13970 },
+	{ .start = 0x13974, .end = 0x1397c },
+	{ .start = 0x139f4, .end = 0x139f8 },
+	{ .start = 0x13a14, .end = 0x13a20 },
+	{ .start = 0x13a44, .end = 0x13a4c },
+	{ .start = 0x13a50, .end = 0x13a58 },
+	{ .start = 0x13a5c, .end = 0x13a64 },
+	{ .start = 0x13a68, .end = 0x13a70 },
+	{ .start = 0x13acc, .end = 0x13ad8 },
+	{ .start = 0x13b0c, .end = 0x13b18 },
+	{ .start = 0x13b48, .end = 0x13b50 },
+	{ .start = 0x13b5c, .end = 0x13b60 },
+	{ .start = 0x13bf8, .end = 0x13bfc },
+	{ .start = 0x13c18, .end = 0x13c40 },
+	{ .start = 0x13c60, .end = 0x13c64 },
+	{ .start = 0x13c74, .end = 0x13c8c },
+	{ .start = 0x13d94, .end = 0x13da4 },
+	{ .start = 0x13dac, .end = 0x13db4 },
+	{ .start = 0x13db8, .end = 0x13dbc },
+	{ .start = 0x13df4, .end = 0x13e04 },
+	{ .start = 0x13e0c, .end = 0x13e10 },
+};
+
+static const struct tegra_fuse_info tegra264_fuse_info = {
+	.read = tegra30_fuse_read,
+	.size = 0x13eb8,
+};
+
+const struct tegra_fuse_soc tegra264_fuse_soc = {
+	.init = tegra30_fuse_init,
+	.info = &tegra264_fuse_info,
+	.keepouts = tegra264_fuse_keepouts,
+	.num_keepouts = ARRAY_SIZE(tegra264_fuse_keepouts),
+	.soc_attr_group = &tegra194_soc_attr_group,
+	.clk_suspend_on = false,
+};
+#endif
diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.h
index 9fee6ad6ad9e98852c9d47079cdf49433e55fdb7..0fb97508db0a56c742cca6f7d1175b714aa7099c 100644
--- a/drivers/soc/tegra/fuse/fuse.h
+++ b/drivers/soc/tegra/fuse/fuse.h
@@ -125,7 +125,8 @@ extern const struct tegra_fuse_soc tegra186_fuse_soc;
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_241_SOC)
+    IS_ENABLED(CONFIG_ARCH_TEGRA_241_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
 extern const struct attribute_group tegra194_soc_attr_group;
 #endif
 
@@ -141,4 +142,8 @@ extern const struct tegra_fuse_soc tegra234_fuse_soc;
 extern const struct tegra_fuse_soc tegra241_fuse_soc;
 #endif
 
+#ifdef CONFIG_ARCH_TEGRA_264_SOC
+extern const struct tegra_fuse_soc tegra264_fuse_soc;
+#endif
+
 #endif

-- 
2.43.0

