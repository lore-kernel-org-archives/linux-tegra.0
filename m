Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E656641A502;
	Thu,  3 Sep 2026 07:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420022; cv=fail; b=DXy8Gx88onzVH0xO0yyuLgzFYIfb1xx9GbJA3WdRjELmIuHfEn2sAo89BT++k8T7i+Tcd6DEA80WJ+oLjFbyLxky8iIbc5TvBhlyL5f6QaKthXNR0JbrT2oEq1IiRp1GduUVLturb8SlXB5CUlMPdau0QoBSbhUxm9ye+q5yCoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420022; c=relaxed/simple;
	bh=4EAxq82DuOB6MPA+oaJ52s+pJERTit8M3jzRL1kgcZw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KnPk/mRr8CBi9E9nhnSzIizGC7ak/2tKV2OYeQa8B6ID5x9Hsx5y7PUUcfbeGJwPmqB+wSC6ZwTDIL9rOhRdrkXOfVZIeUb1TGCxPvZuyYsXBBIC/8Z1SWcr0Nu50Z6+COb+0UKH3WUaFuDRKIcyluU/VbZtFCMIikOpwWBdDZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Bjraus2Z; arc=fail smtp.client-ip=52.101.61.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bjraus2Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EH0mjlBlXVkyBUwG3ShGePoUbyBpDLwW7sAt4QPAzuhTVXvlHEFvB0ZqM9f1tLkdqIVlNXoCiSwbosgAkUplldWgRy1m3S8DN+9XaCL9uJ5Ac6VBtXgXz+rAxiuVrq43RbbDQWjRIfE7hsp8HlIgW2OmYuzKlZsCjKk28V/QXashrMnDI9MbPW0lxFoRO1a0hXcLkR8VQlIWgyOVoYzKJfSNkbf7lNM76nn04yKfTz2zquuTcqZOscTAkxXzjnV5IxsQk90/rYa+PoIeuZtoMdxYYYt9BnoloZBwJUvd5l4dWwB5EbMtT7u7Rt8viZTwmu27eajTQPjTIoCjN+UnhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBNK27nRczXzaImqeMAsmXW6duahFy4UDlBU8gW4l6A=;
 b=dni6LlUoVHuOCwFFOqUjwcP21xHcaLTnVQS7P9Wj1iJX+dRMcENJzFEZGLx197NiOAvNn6wpYy7YJwfIVxzlunT/YjPWFHNp9J0Z9UqsnSQnTow7H/n9vDhZb5lvvvoWYSeiZAUB8RvdIc8CDNB/4r3Ab8lIHf0yhRZ1ibFiW+87QHkxPLmZYt1R08WJ2Tw6EKbmRKtjYiMNXDZJfLlto9ufqyDsg+pOYJqKk225YAsaZx03Q5yc/ttEKfEmZ4ozk/xzEiT8dkKn6kZAKS71oNYCdhyFzBUqsiNearvRJHngL4xZ71+c+OcOeHRSlStKcBE1RN0MX1/kCYm4AOByTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBNK27nRczXzaImqeMAsmXW6duahFy4UDlBU8gW4l6A=;
 b=Bjraus2ZwhG7qCI7cPSPz3oZxwqFQiPFIH+2ZhCeMW2yVj3K4YFMK3eQhw1SytG/tUoaW1UPVp+Y1SKbEyS7H9OfxNC9kW1gjl/S8PIOjcJhJecP81lqB9LtZEPyAmX/YoNmU5WMikEzh5HP80sMW6Lrr9Ov9uBeaaN3nid6EymIfz4o5w/fbjmSHAElMYXfTtdOdlFihzm/NPvsyTnFP2qVbjOVrlQs+ppW9k4WaE9NoAGIdEQeZmyHTA4jMa4JnRqFgul6dyF6WKwrB8+fnaqEAo4o6Sogwo0cdcK5oeFLE1qs3b/OcvgDyIxTft8VyekSKeMEykwhUXyzs4DhvA==
Received: from BN0PR04CA0108.namprd04.prod.outlook.com (2603:10b6:408:ec::23)
 by MW3PR12MB4378.namprd12.prod.outlook.com (2603:10b6:303:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:20:07 +0000
Received: from BN1PEPF00018548.namprd05.prod.outlook.com
 (2603:10b6:408:ec:cafe::25) by BN0PR04CA0108.outlook.office365.com
 (2603:10b6:408:ec::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 07:20:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN1PEPF00018548.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 07:20:06 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 00:19:54 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 00:19:53 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 3 Sep 2026 00:19:51 -0700
From: Wayne Chang <waynec@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>, JC Kuo <jckuo@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Manivannan Sadhasivam
	<mani@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Wayne Chang
	<waynec@nvidia.com>
Subject: [PATCH V3 3/4] phy: tegra: xusb: Increase timeout for USB2_TRK_COMPLETED polling
Date: Thu, 3 Sep 2026 15:19:36 +0800
Message-ID: <20260903071937.533646-4-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260903071937.533646-1-waynec@nvidia.com>
References: <20260903071937.533646-1-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018548:EE_|MW3PR12MB4378:EE_
X-MS-Office365-Filtering-Correlation-Id: 7387ee16-a173-430c-28ab-08df098bc803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|7416014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6gXa3m7uOS/fgvMHJx7DtPhKWkr3GzVnBFBtpjv/RdnNoNjPtUA2BymdXOUNBXxQEDJ/ZsjunJ9fjzRgJQLkjupkygpNZ2hVLXSEibbijMEHzNUCDR1rbCQMRA8hDhH2+zARxb8Zn3qa0L22Xpx6hhu8RS5e84rCXXp0UvqDKw4b2E4l+1vQ1olUrcOpDCatF9vRhmGtS8elNWfg35iBZmKyfhj+M0KnySAhqzTZua3yDuyGnuLoILVzZGAqOnOOx2kiHwkRYhzhX1v0hT5vwzwlRIIXnIEoopAt3noqhzu5IB2IRd2FjD1Pt7pBGHARWF0Fd881CsaqQIPYEZyzz7x/goNwpGoEQ+OK33W/FDEw4sO7GwOlTs4ETicE5h2F0V85xi49eLtfCIWL+PHFnXK9sfN3JET80xCR6uJcr3CHZDZxyx/sMM4TjpmX78MsuP6qlKryJ0fM3UhpHUxy1D7yHO/kXkk4Jkj99hFcUW60SBU3zSL03n9kpUzV9KecPe+S/fpkAxpif2w7zS1eJrdlhX/478T+cLK5mzWqQmrIdaWYFRH7VvO0w+orUbFHAIDd8ufYnLPE/w5Yijdkxcj+TLTg5ELlmfCqrKrxXz1P4gnKdGlCVZxeRTXr78iWlFkncshAQdTJ34fDqVLj2cfUaE2yDRSlW/IvXYCOAZqXHWiFV70kNiUiyIg+1mCWIgmtzFcSaA0Y7Ey5wrd7KQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(7416014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f/3+OThiPB4+tKrmNAaUPt4CWy+S/TGcmQ/ByElkFd8HaQ32EV60CyGeKXzWVPfj9l8hxPc9wC/6ALkY09GM9IvxfRbftQuGfI9n7xJRDI0nPLaQnMdOv7P07eoqeY4s/HTsRJhZG8al7OEQsvWQ/1bwov+01kSh9MTGeRu3mTxIh/eekBoDAuVRe1NqtpVYQX/QxzM+N558S6pZMiVc8PQiVVeaTiMGYEfaYGHV+jS1vOc9LYHmvjig2dTUDsjLOGIYqMvWWHFLhwDNNJX2RX/d/3bCSLZvMOT0zS0pOpg/0LsAMmw31c9BajUmbaOcqpFOd/eVH3Xz8pV3IUoxPAUIR4yHgSJYJLq+yrklL1gh7Dz4fXpU5qQWiNXuiCe9XKj16BuxZ7MeQdovq/QjN5WqBO274vB2G8SGdq2dBJh/drBwzSHcNpXlTpH0Ie1u
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:20:06.8769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7387ee16-a173-430c-28ab-08df098bc803
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018548.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4378

On Tegra264, the UTMI bias tracking circuit runs at 1 MHz and needs
more cycles for the biases to settle than on earlier SoCs such as
Tegra234. The existing timeout is therefore not long enough and can
cause spurious polling failures during bias pad power-on. Therefore,
increase the timeout to 200 cycles to support Tegra264 devices

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V2 -> V3: No change
V1 -> V2: No change
 drivers/phy/tegra/xusb-tegra186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 800be0cbb3f9..9c1bcd4a72ac 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -636,7 +636,7 @@ static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
 
 	if (padctl->soc->poll_trk_completed) {
 		err = padctl_readl_poll(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1,
-					USB2_TRK_COMPLETED, USB2_TRK_COMPLETED, 100);
+					USB2_TRK_COMPLETED, USB2_TRK_COMPLETED, 200);
 		if (err) {
 			/* The failure with polling on trk complete will not
 			 * cause the failure of powering on the bias pad.
-- 
2.25.1

