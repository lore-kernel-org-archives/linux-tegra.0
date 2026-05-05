Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012033.outbound.protection.outlook.com [52.101.48.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E9941B36B;
	Tue,  5 May 2026 11:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978852; cv=fail; b=fsA4eGY8Mhnz96vpzhYpWPuxPlObJiK2Jd6TGjhmTixquvtc2joXe0dEFFvWk/kj/YuQVyNc7wzqBONcN4lPx+AGpPoFgvK8iI//RuzvsMsOzAY8ox7p4U01RYmaYPTtTKDdxWCMgtmhHujx7KHkSjENlDjYeAYLV4cXUZVLL40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978852; c=relaxed/simple;
	bh=hnOT4g5Qm189c1uuMTHVhMBm5iIsVXJy00lXzH/rv9A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IbKmyYfFnW6+eNrym1zGz0nhOzoi/32TnmY/HLnxFQQp26nZ0Fwybv/gZNRvWb962lcEhrVuNk5R4IlGXfAamPUlzqvDgdinEG1cOrhGfXpzlxt1592IbF8/fFdW5VGeoPqun03iFcpXu7uDVGEnAT0WgMr2QYxvCQYJTvPKjXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XZBJFouT; arc=fail smtp.client-ip=52.101.48.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XZBJFouT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kljQSfXGQmoMIcOdB7tM6heksMOufm3V0tDedje5kWNpGe3XRAjcmlmgOHkPiiqBmRV/wL6K2/vkgviRVbA9TiLw+mJT8uGwHXOlIYIBg+CbpwUMj6ZZDOu1SYVYXWARfYcSsT+9uRHiBnKWw39w1cB9OLmRNdThgldZh0NGrelAl46nswg/Wmx1U1BmGjfUHU74CRggqzAM2iE8jg6+DD23v6bSgS2Q4OEbn4+dpNebMmdPhvZmFWpcqxwlE1tBkeIITX7Bh26kgA5vJ5r9+/oQPhvMVNyOMq6yoLSxrH9VsxyaOpUuxkugYp/hOkWrgGxGG3/mU6n2iAjvovrdgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqS8QplLZpPp1zQFqAL0hyH2+FRxJc/6pbd1/GhR7CM=;
 b=mZ/wex0Fu8809Q7WzPcvvvVvhIm2cIHB3n96R6ce+iM8tYiYG86IeN85spVj/oUKsHWFMPJmH6/X5vQdiC/UPmosCpnR70NI7JL0HHYmyhqIP2U7Yhrwy27J/18vVaH4/zqH85XDF5JO9Zd2THgXmBrCo70fgEI8MW7JeXys3lUPyKljuAcUk7O0YIPgY+0sI0RKko/59/WeTsu1rZuOp2Q75cpKCRyRdmWE/XRtFK6d8E6C7vMddlCcvTlkQzRxu8oqaG4lcRKoig4ROYrGt2xmQHZ46c9yA/HopJz52CWpfwDPiQMe6idqixwdUakxJr3D1KFCZ1m5qkAFOQRkiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqS8QplLZpPp1zQFqAL0hyH2+FRxJc/6pbd1/GhR7CM=;
 b=XZBJFouTKrpAmVQ6oK5RKXJZVw3hZ6wt7Ud4jD8M9EbMlHdxZ8VD3zS0DmkACACKAiS+aXa/Jr1jAwBXmwE/L5Rr35n+nRiK56yK09+D8gLKewgGrJIwMqJcX7TyyKPrvAfvs1kZznt8jyz7MqsP97Ux8KhQ3zbO4lFWgJ+RpPgzKFyZV7t48XQGwcMdgjWDajo8D8b4A+SSeqsA60mZ+Hv/VP4ywdvTt5m/XfdjZO2YW9ZiYEloYL3ql3gg2EQ47cDyDL9I3L78oRgadm+UGuZccRcWRq1LY4azrSZeyO5YeocJQXCRzNSvIz4yz16WzPSKcrPNkKVtDyAqLsB2BQ==
Received: from BL1PR13CA0246.namprd13.prod.outlook.com (2603:10b6:208:2ba::11)
 by SN7PR12MB8819.namprd12.prod.outlook.com (2603:10b6:806:32a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:00:46 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::aa) by BL1PR13CA0246.outlook.office365.com
 (2603:10b6:208:2ba::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.14 via Frontend Transport; Tue,
 5 May 2026 11:00:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:00:46 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 04:00:15 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 04:00:15 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 04:00:11 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko
	<digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Kartik
 Rajput" <kkartik@nvidia.com>, Wolfram Sang <wsa@kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <mochs@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 3/4] i2c: tegra: Update Tegra410 I2C timing parameters
Date: Tue, 5 May 2026 16:29:27 +0530
Message-ID: <20260505105928.38457-4-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260505105928.38457-1-akhilrajeev@nvidia.com>
References: <20260505105928.38457-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|SN7PR12MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fac295a-2d2f-43c6-b4f0-08deaa958f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FOsEA+RXE8+QBxpB5q/hLp+7XKHZ8aldSEEb8BreLViiqzW/oQvBC6QYMUdFiAjvQGolkTqVmD4FM7Gi44hby3YPDwx8SWw1eskJHh/3I2FM0i8jYf0FkS275wWy58DTzM2p57vPXIuiueJPzC01KPiRg1z2aR1IHnlPTQywUwJ3BuraM9OfM+WKU0PlgSWP7qLH5KAgtUEwVQR0x5ynSTLdbsXq1gbgvJgfpC/GRQ6AQA1YX4T8JkiCPHqFK4Eu0u1FE+5H0gvLbfb4OUObS1Wt9WATNGVdZQDZQHGAVBxbptHOXdkhEl1MFCeHmSB1lcJSih+96rC+oqze+f06F9m4kyVM/a5vJ8g9u9Km6bMBBWZ31CZHIeWRFkEi2PPvFqS4KqtklzXLItkfB7bCM2zGyxKIDVMbtbnwMpAN6D/GmXCNKfixxnhzgjvQjYQ9lCCXD5INXwr/o46KcTTJn1aWXvpD56rtPy9fl9uPvXDAbHLyt2p6NSucyo/eHTcvhto757tEAKWzEYuPt4o6O1WXf5nBreuYnwgrX8M9OcDQ/IV1OGSe7FPYnC6ZRIIrepxee57RIuSAppOtC/2n/kftagI3dy0IdMjiF/8jj6hP0ha+42SqemArVwVU/Sbi8dg8kYkQeYN5m+1l8iHZ0KksHzlPLU+fdLG3IHpqufNsQFz9nAhKaOneZT+ap/m2g1GcaNkllggrjMoQloXvm1kcZyB5wDgN+Us5KCmDQ2xa5tfywLngcmsJVggDI9o+B0Hy8HfT+7CuGAVEyPoILA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6yAOL+rhbLKTfz1pzq9aJUP6NakFqji+67dBZ136p6Xqw5Vwyx+Ovxofn1swidN3ApjfiSsrvWmW+c/Nc2q/lksxmFBqeACi0GH9dIKdAhBSNdwIZqHmPpD27uTAcov96GYNKkYVGIuRV4p9CURVfSmXnMKkmVCM9rAHme5KrHuIv+yH8hNOniQCuqOFZTDyMtgJkRKeQQYaoPsGjpAJlfvBXwR5VkxbG5BRc60LYj790hS44JtO0vfNiFVYs4kqnO4O3rZMjV5vAg14TAxDvuun9xj6y4kqZUwfw3bs1PcLCXGTJdvfs+xiHBL2fyVXq3atDN/fVLeoTfuY2FaX9ujzjt9qj9lfFEHS6tFSM3o/TCB3YPb4tp5TajnsNlWb8w3GVytnT/ARdD7AVqK0mMwqLGgFfnRoX2uAIG4eh6PhNKS9lgQ9A72SM713DQmP
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:00:46.0485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fac295a-2d2f-43c6-b4f0-08deaa958f2e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8819

Update Tegra410 I2C timing parameters based on hardware characterization
results. This adjusts the fast mode and HS mode settings to be compliant
with the I2C specification.

Fixes: 59717f260183 ("i2c: tegra: Add support for Tegra410")
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1d274431e209..0c26139b4721 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -2137,9 +2137,9 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 static const struct tegra_i2c_hw_feature tegra410_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
-	.clk_divisor_hs_mode = 1,
+	.clk_divisor_hs_mode = 2,
 	.clk_divisor_std_mode = 0x3f,
-	.clk_divisor_fast_mode = 0x2c,
+	.clk_divisor_fast_mode = 0x2f,
 	.clk_divisor_fast_plus_mode = 0x11,
 	.has_config_load_reg = true,
 	.has_multi_master_mode = true,
@@ -2155,8 +2155,8 @@ static const struct tegra_i2c_hw_feature tegra410_i2c_hw = {
 	.thigh_fast_mode = 0x2,
 	.tlow_fastplus_mode = 0x2,
 	.thigh_fastplus_mode = 0x2,
-	.tlow_hs_mode = 0x8,
-	.thigh_hs_mode = 0x6,
+	.tlow_hs_mode = 0x5,
+	.thigh_hs_mode = 0x2,
 	.setup_hold_time_std_mode = 0x08080808,
 	.setup_hold_time_fast_mode = 0x02020202,
 	.setup_hold_time_fastplus_mode = 0x02020202,
-- 
2.50.1

