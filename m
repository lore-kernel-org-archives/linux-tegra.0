Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793203567;
	b=ye6Msm237wFHhygNribNJoSkpo+Z7h+ttfAWoBMpMYvBC3Nohbjp8pwyo4l6/qy4gMFF
	 zscfMA86+SfYHuNcCgZB049qWZEQAXeJHOMwY+MJrm7ucb2a+pQBK5y++ZgS1lEFZrtMB
	 bwujsR6GovuoabMyl64u7q7l6WrLziAPd4Ew/rj4yEfNyUIzd/So6d9DS2IKM4tYqm8Zb
	 9EEvLzVmhVwqPGFmPu3ZtsqmIZHkDu4uk6p9Ty/qNLgWngboyAi9ypWgI/b7erEzC0DPe
	 4IpCNnWBal04dFVq5rOtk4miru5P0SpEOPUpJBKWtOWIJdwb7BxAyLLUXoMqtNzXzyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203567;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=JjZL0LpvDdOjSRO2qnRklWaytRS+6oW0S7030i2OwxQ=;
	b=rwUvrGls4wqlBWauOh/PTQ1K7yKkV+uD4O7eoGXjre12Md+Tj7RyPQRxE6GUk293hVPa
	 aHLnDVheuSWHQWJWyVD6It5+ZAk58FZTmvGGm1ZiPn74G4CHUZ7R7a/piJIKYhp9ytOmc
	 un1HkK7Ax/G9McnVwHEKVKhD5cj/AP0BzpMmOtBCVKyFdgRIkLXxpbm0om1YIMolb6E9A
	 47LxjxMxw5ROmI9YDTcuK7L7CGlxuZsslfKvKZoAdZhczLYTHsbQ2v194LGKnohpDASve
	 m7tSfjVcPKYqXTErEbsTKJHpCLzKRr5P1bS3Xe8B8XEjREigs2ryxt886D9/gnY0PTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mapUkRuv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.23
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012023.outbound.protection.outlook.com [52.101.53.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1548E606A323;
	Wed, 28 Oct 2026 16:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1548E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mapUkRuv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTJjWhzUCQIN7kAUZRq82flGkMgqc8x59xnt7iwkNxYKbwAYN6NNc1L8x0hbsYjuF3c50KmJQKOoKnHl8ffPLmMF0P/pe06ttub2XiLxrdshiTWAEsxGbYjEWSHvGYf377gEPRD8GWLxBfX6ioZ8qPjUjFWtahqTAB+Hrvi5TRoYvdjtSax5Hi7xrLaBSN5QekuqNJfvVdji4l5C6tPe+7YMMR7VvK2HLzH/NLFbiF4IgBDvH2Ilf4hewiuWiNNn8kYF+HJKj2MVDh1Htq5nUBPSzxHIhhvAZkpvgAa39+nqOfZLO+ltoLUjux9kyP8NZxTSN1gofY1zsAYRMiaoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjZL0LpvDdOjSRO2qnRklWaytRS+6oW0S7030i2OwxQ=;
 b=F4UxAzdPb8HO3AebZVcC/gCLgEvmUfCGcID8BlXZGcxH3JNz/BL3sUSoQOaWGK3vJKhY2CzxVU3LFTG1GQPi+UcH6uTP3llR4JhQz2XYkHuZU7AhBYis406J8QJcpPT638kVSNtkcnYUiM9jXevGyaVIeLpS9MglkHkqNcYFXcNSEPgw32vPGGQnNkuRWp+D+hYGP4Ri1we2QH7xDfAUJccm5qW4LDtwKWe2Ky/XzzuXrwvQbo97sq0vphg1swATTEZ1PgXYbWbzmhI+t8CvmsONpFV2HK1qfhMy5HuOP01/1KGzNKv59N3Klwwi1IhZvLSJc9DDaA1ngF5QhCoUFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjZL0LpvDdOjSRO2qnRklWaytRS+6oW0S7030i2OwxQ=;
 b=mapUkRuvanOKlg5reMI3Hew+OkqecL+eiG6XxrW4WPJEyKVEIumUTtTYiRbPQJfu2WH46dq3h1z2I8AqWI3UeVxsUl7ajsq5Et/oSAPPLWLSvgx4UGmDowTBSyin/HSgDxDC0YKUZHktBSzzMHzR7HKFzkU9yU61BCNCwkR0/qAgfQpFsWjSqOVT1yZWQkm+nEpIUbunm2H2aqeusDxEzr+/AegustM56Pr+FtA7cqwbU4rGdB8JURt9I12wcxOJ2RfKqw//to+V9K/2+N0fjMn9YFYePQTud9BCgWHkdtR8/qDySHOUMUbXgwVeFnjRfUqfmUtpxBjSeU/iW4FQ+w==
Received: from CH2PR11CA0002.namprd11.prod.outlook.com (2603:10b6:610:54::12)
 by SA1PR12MB6799.namprd12.prod.outlook.com (2603:10b6:806:25b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 16:05:58 +0000
Received: from CH01EPF000BE940.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::87) by CH2PR11CA0002.outlook.office365.com
 (2603:10b6:610:54::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 16:05:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH01EPF000BE940.mail.protection.outlook.com (10.167.244.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 16:05:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 08:50:31 -0700
Received: from build-johnliu-noble-20261009.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 08:50:30 -0700
From: Johnny Liu <johnliu@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	"Prashant Gaikwad" <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, "Douglas Anderson" <dianders@chromium.org>,
	Aniruddha Rao <anrao@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
CC: Johnny Liu <johnliu@nvidia.com>
Subject: [PATCH v2 4/4] clk: tegra: bpmp: Do not cache the EMC clock rate
Date: Wed, 28 Oct 2026 15:50:00 +0000
Message-ID: <20261028155000.1205739-5-johnliu@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028155000.1205739-1-johnliu@nvidia.com>
References: <20261028155000.1205739-1-johnliu@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE940:EE_|SA1PR12MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae82725-62b9-4c1a-d411-08df350d5ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|36860700016|82310400026|921020|11063799006|56012099006|261021121427099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AgMi6Q+CJl8JsSe20178j2XqglUm3OBYWHQzfpf79afXKysE/bgg5/2f7fXdMPSd+koXwIJSXjCFCIyeInBuXh6fmW808HZwW95yfVKGsxMaUSHQJ5FvasQa8Oi4DW+drnYw9k5Q4KxpP334mIEc0J3sNIlGv6L9n4khv3GHw6Bh0joiVo//pxMYsSa3s8HYneDNDFHsRizuPi3PtTNQdcQFmroDaP4oJMoUpc+9mJPN8UZ4QfyF1pORA/sIpE20NMO+oihZjH3KkKZWXOb86ZLVQ+fC4/WC9UwdAKWN0pfIXUUwQWFUYVHLhSoxtlh1hTjFHSw0ay8nF3BKJe6HSbo3Q2kxQzP0K3Y7r1rYnZ2bZx5DhTcJJrzDY5wz/n3TMbJNOcRFvRtDKi9+YQWShTu2/tXdldn+Tqf+4T8vCgYmCwIMzw6KF+m5d61V7qWt49l0jIzfdJP+RZkKu2m57fll9Whvo416PlPr5kMNs/nAHAw6P4KMAglJZXGrM/Q9PG4IFbAGXlNyI94w4gkvGyugtqFRtNtSP98eIouSj7GU7WrbXKGOlF3480XuvQzIDINQdzdtbqyTPpHP0+5fowm0jzitPiMsGvM3PiWbIKEdlFiZ+wn/J+uUBUZNLke0LDpq3Em1WoIUsadvpsZpDCt2oWFxFJ1jAECd/PqtGEEOuy7p19Khu3w/a081FDwiizTrNSw8wzDPR2WT/wHsp/C74J2/ujJP+EG3WuQZ2iEq6LB62R9w1oxqOfZwS8VX
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(36860700016)(82310400026)(921020)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UAPYOPrLJwiPe0gS7RSelXfy7QJVxD8jtCBxGQOjIdrEji+Ra8R+pKNoLXR/VkY6BWQF9+e/2higsXW6/EQxxcbkeKRnvJ5VApjjN47Z/zOmeh0rC7Q85ddhbrVowIvry3wqg0NrPR0mv/2EeEwS1IB7A664zWrekOpDpkQn96bVRPvmE8fKcTSrmjqzNxDOlA7VzAveYycHom9puxIlSa2T5D2egBwBvPcMBgYFUT5oqvXbi0oBSTED8xK4lSzdTj1qQKdp+thtBnaVeWymcwxSpA25y320e8bb0859PGWFahfbLrNlipPpylAKvidN+o0h+o2Bp2F1sPUd2Thg6nIClWqr2Bn5r7S35d4//BC1dM01L3NeWa5vpanhXtja3FHlYDsMiXEFAVxokGCEXDoSVPcFbBFvPiwrW1gE8LWEScEy+wGbAzAdzM7U1K52
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 16:05:58.4366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae82725-62b9-4c1a-d411-08df350d5ae8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE940.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6799

EMC clock scaling is managed by the BPMP itself without kernel
involvement. When the rate changes on the BPMP side, clk_get_rate() on
the kernel side returns the stale value cached by the common clock
framework instead of the rate programmed by the BPMP.

Set CLK_GET_RATE_NOCACHE on the EMC clock, identified by the per-SoC
emc_clk_id from the BPMP SoC data, so that rate queries are forwarded to
the BPMP.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 drivers/clk/tegra/clk-bpmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index 067a8555c4e7..ddbc528cf93a 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -588,6 +588,9 @@ tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
 
 	init.parent_names = parents;
 
+	if (bpmp->soc->emc_clk_id && info->id == bpmp->soc->emc_clk_id)
+		init.flags = CLK_GET_RATE_NOCACHE;
+
 	err = devm_clk_hw_register(bpmp->dev, &clk->hw);
 
 	kfree(parents);
-- 
2.43.0

