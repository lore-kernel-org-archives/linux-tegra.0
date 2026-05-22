Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010052.outbound.protection.outlook.com [40.93.198.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6529E428461;
	Fri, 22 May 2026 16:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779467482; cv=fail; b=LhQBmd5MyPMd+76aD+gb+hJep28U0clLLvB2+siTrZCPx0mdTsADTZmYuPFenuvrcWVJDGlUzeDaaWR9XSE2Am0H904Pjnxcl1t0qRR8zr3GPnpdbW5Kb5lht/QAQKRtkqwrZqtcPlSoqsHcuOwWJdwSBhOKOvY+BRMSxuZJxHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779467482; c=relaxed/simple;
	bh=MzrYEPukiohTiThqaoj9fC1EX5Dj6ObAwuzheZzXKk8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YSxc3/o/R9oojMW8zToXOCruG0ioHUFyT0Tt4YDZe7pRSbB3SQw8uw3LwzsyxS0a612P6IV0N/zNiE33f6Ap01DrPUpwlV8Nk7ecGzJAOxzsK9E+3fzhz/djvnw9O8kMiwf9dY1RPx9t2p+bg5icGBPVPChdicJv8Q4jlQOaZK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VB8uGmWX; arc=fail smtp.client-ip=40.93.198.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VB8uGmWX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYyJK6QlvHMU9tn1OonB35oibMyio/MoFTk2I/S+0ZRpeRkfkAm9JPBhnTDDLIOiUFfFz5Oj1Jm+/zEHBrlLE26ZVK5dS8ctV9iYARJE9PrWsbmvI48syOHYxSXBA/OGHIM5uxrebViLKLAYxnIjtYJaTYcmCLeM69hQdl2I+oKSRUgbub4OWGfSJOjJZcmMCIWNl1+UmijpMZLe8u0DJKwy9UyPHgwqDtgYGaOl0TF2L8I0vdnwwINhX04tzEjHyW2mULnFTsISKQDUnP8cJKSZjzqG/UHfoOTNuJLDtN+T7bSiPIbismC1dOzxApVncjLygfa3t8rsOK0f9BVkkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+j78mtLQ0s5FP8n45jSyxtX81OaQeAkggLfPCHFUuZc=;
 b=J92/E+/S9QZ32elsByKkvKqPSBh6wkEdf+3biCR7giXzgNL3aqRExx9uqswY+hJFtSI01oD64fDAay3ZuLlw1CxcpFMhEQzga7mhIyePTkGaoy8npEDNm/0YWuNouST66fnv9aoKU1EbaOiNKK8XZGLYIBC5xSxCLEr5b5BMSTloeM4JGYWL5mGLf03BuP7xkW5WFqEG8mZPCsdeir0T9AyiEJFyPPYCREw4c9xnHGtTCgnqBeBHeJ2c54EyE0pr7FUy0rCbGTYj630UqqOvP2UaS8/D2Yqj85P8P6qc15kZTF9ijUEK2+Ytsep/2UcuCyQ0CIsNNeFo3/txdk7YkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=baylibre.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j78mtLQ0s5FP8n45jSyxtX81OaQeAkggLfPCHFUuZc=;
 b=VB8uGmWXDj7llb+DERqCq6Veu7npegnWfDXIW8Ld5fkVXxK2tY2FZMCCM3GoCip4O57lkAxjl67vM+G25KoFvISbup/Y4Qd9lqY7mZAjiWpvf7gGqC9NI58k2syeKf6F1BQNN6I1cbmU7h3rUjeCW6MDEAD22yiVAUJvAXIaLE63mgFS2aca7iC8S9+X9bbm2rzt46qYA+o94I9BGw8BQqPzbF4SUGYwCtbwXDuFo/dOlm/fugFOqFW7kEXBPNp7w/jBzLD0XC8wvHN6Q5V9hX00K2+Z/zkwNH57+6oMZ9zaVanqXgjTC/J8JmLogcmYebNFxDw0OUzNjOcdkjLG6g==
Received: from BY3PR05CA0053.namprd05.prod.outlook.com (2603:10b6:a03:39b::28)
 by LV2PR12MB5846.namprd12.prod.outlook.com (2603:10b6:408:175::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 16:31:15 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:a03:39b:cafe::1d) by BY3PR05CA0053.outlook.office365.com
 (2603:10b6:a03:39b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.9 via Frontend Transport; Fri, 22
 May 2026 16:31:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Fri, 22 May 2026 16:31:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 22 May
 2026 09:30:46 -0700
Received: from moonraker.home (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 22 May
 2026 09:30:44 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Thierry Reding <thierry.reding@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>
Subject: [PATCH] clk: tegra: Support unique names for multi-socket platforms
Date: Fri, 22 May 2026 17:30:33 +0100
Message-ID: <20260522163034.80330-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|LV2PR12MB5846:EE_
X-MS-Office365-Filtering-Correlation-Id: b6bb38dc-8f49-4347-6bfe-08deb81f8adc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|56012099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	0Q5vCcRuCEybLTALQABsA2NoPmzjwhIyT41WplgX/oNCnhULf1gyZRF4SL2teXvp9YLTU4misljrrd3zsjF/x/M1nXiRGkeyy/NGIZq7xIgBrxHgvMfDVAvCP55QozBh8PRN0pVcis+7o7+qmvk7yEuOp7BQpl8lQBonVXhYElkzu7kX/uteHXESbkfRX3P6YA43y54dWaKuvf5ZTh1GGhdJIx3LjJHzcNhbkbLK346usj6zhOJDFr1HODu61sSncfHPlk+2rJ4HMmsQuKitPGPYZmq9ye27PNfwukF8KUGuIUSTypNrtV2lHwdhQJ6D4V9y0hWTtSV/NKaZ0FJ3j3upaDyY//J7taFVXEs7FR6h+Q8kRWdDa5fxNloRjZ7SCmRrDmEd9KDh4OigY1cU0XbFdJ1IWctraSuGXrSuWzNiUwFEGNhlCyDDSrMYBHNX1ZfrUVTGypYGyWWn5Lb6XvgN94MON+o7LKtg1qXup/rYP5HvAjodsvzugVCpZ5nSaK2UFRxTqziW8wFpiVQixA6RLjD7RZ6DXz1reg7ckHT/W573Lybql1c4kE00oFaUvd6kWhKCwUg0NvKoahAyajMSqCDMQpfw3yNtKc0ybCrWLDgktn1s03lvDqmvCwsRlkoTO5mjw0Qp/sYcjqMPhLgNJ3m6T+53tCyXhmLaQRAb4TxUy520H48K86xBQxoCAtuDjagNmdk5Ar9zqhe1GIUu4B0E8WNhUujtab3K3VQ=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hHnQrOgM9ftvNIDgG+1YSdWILGndNgoV87bmaJ2u9lrfLjYXwvuPU/UospZ5nbfOMNiX27KLE9+PN8gdQI96o5wwnsGG+iuLV+U0KyF/Z+HtKOEuzJbpHiW+AA9dgohsn7R17Qi+yRlf3iCykd1/SW6v6H62HYSMuc5YuL/Cpr2bq3KX82HzE18gPQzJG8/073RTUR2gz6rBFNisrhZwb00qhi6Zjme2hs5ywApSgRn9nUNWTbr6gOF5tlRF586BU3O6ZFAGzoCL8lYwAwiwu1th56F7IBp4Djimxh1b42dCaqGXWO4XXa65ApDvx9u51dtzv2rjgVlK1mD1fcTQQTyWlKC08pg9JWayTS7m7xKk7AI5M9CXt7ldVWs0WR7oYXKTM52zTYGXyX5tlCYPCW8IvcZJboDih+xuPX7Iyzz8NSEQVIRJezcqpyAfGCQZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 16:31:14.4875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6bb38dc-8f49-4347-6bfe-08deb81f8adc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5846

On multi-socket platforms each socket has its own BPMP which exposes the
same clock names. Fix this by appending the NUMA ID as suffix to the
clock names for multi-socket platforms.

Use 'sizeof(info->name)' in the strscpy() and snprintf() functions to
future proof against anyone changing the size of the 'name' array.

Co-developed-by: Timo Alho <talho@nvidia.com>
Signed-off-by: Timo Alho <talho@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clk/tegra/clk-bpmp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index f6d2b934228b..428e776561c5 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -367,7 +367,15 @@ static int tegra_bpmp_clk_get_info(struct tegra_bpmp *bpmp, unsigned int id,
 	if (err < 0)
 		return err;
 
-	strscpy(info->name, response.name, MRQ_CLK_NAME_MAXLEN);
+	if (dev_to_node(bpmp->dev) == NUMA_NO_NODE) {
+		strscpy(info->name, response.name, sizeof(info->name));
+	} else {
+		err = snprintf(info->name, sizeof(info->name), "%s.%d",
+			       response.name, dev_to_node(bpmp->dev));
+		if (WARN_ON(err >= sizeof(info->name)))
+			return -E2BIG;
+	}
+
 	info->num_parents = response.num_parents;
 
 	for (i = 0; i < info->num_parents; i++)
-- 
2.43.0

