Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794327857;
	b=oVcr9guZTV3Gjl1krQ4ROoo4gn/qFGuKsMBwGcp4+8bMS4x8829sPuMZY2iS+nfoYhGx
	 8bvSFkpGjOb2dTe7HiYkNTL9p2JFvpWo8AWxjqx0rmIj02JAkbC81DMi7HyHN6kxWpC4u
	 HTet+7jB/vtuMYut/d0v4Y5NOXaa5DPlPk2KEMrzdOloUV8AenUAy4e3sDm6RopD6S/+B
	 cq+u5YCkXty8veKcNcD/2dAQGl0MDJioiSpY0FZH7Gbz8IwViBEHYmtkc6JhxlV0tT5/G
	 3AfMIqCuTYP+erqvzRJMw0Ku8xF7/3YFqIhNP/UvU8E6XZ7FROz1Xh3TDUiQHti0wnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327857;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-NV-OnPremToCloud:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=gRcGKbZ92GvagMHn2VgxQWrtt0qmTIZU87aMWYQmf/w=;
	b=1LzzGDRLu/5v1owGn1qnRwONHoIZTL8NsHE0+4+p1LPXQTKkbWGZnX9+Zb32s0s2XIDw
	 AkgAZmLCAfT14BZ5d8oPrT1bNWSAQUb8l3kmoCvRz1l7J4paQCTBeGDDoaZbuTJr/tiij
	 9usOE0Q8K2h3dMktEuVzK/jVc7QONAmvGI3M79B+uNs72fDF6CUhHzu81FHC+lFRr97y3
	 pXZ+jItiSWRWFWscvVTEZPnOwjvT5xtsnc97iQeRhtW9gD2Q3KAcp6LKNy9qyEs+qt2CR
	 iJWvDofzIFDmR6wWsVNKvnOlBj78X8ytpdp/COpOGPJXG+uU0gdEG/2b2kADcBpGPDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RzYd28xc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.68
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012068.outbound.protection.outlook.com [52.101.43.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFD3606A31C;
	Tue, 10 Nov 2026 16:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FFD3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RzYd28xc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BalP0Yla+6lLNE3eG3HIlFLJUMyJDIM9FwB5xLNvWTpoC5kp+Aop1P7VO9ZeAeWHOl2U+cBzX/qXkg7tl3yl7zNgRq/bXH6KZYnLF0oJN+LrBGSqsQ3mSs8jMGx1t7jM7Uo6tV8JcLI1ASGkpMt3Po6fHx6HGt4csPPy4i9+cFFgxEQGPGEzgYy7DDVoT9/f3hH9tM/OHy7I53kuHmftmFE0b2bGCTTOy+o9q7q73Jh1mJhGo/43XPm0tOsTP3GMo11OdANZwONauE6Zcyx5lTkOo2rU4PMEilRu1cJbdoJy02wknVZrUAAIAeLxwe6IgVHOeE5vkizzMOxj4whdQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRcGKbZ92GvagMHn2VgxQWrtt0qmTIZU87aMWYQmf/w=;
 b=aYAmORKV7vXGnMHjvWs+2GKkJukjRGw0vlun/WDKVDWAaE/oQOC7FdmshnX3IrhvGtODEdf9WHVzzHlklCKZSf5oRsboIawKPrVoUOtf5Y32+BHVQMuaRWqMnhwEbNZ9i56l7Bt4tGO0+ia0g2bGwMJp0eiDYLjMdXOq1HFuaKaLedJfF4DmD3FiQUlHpehReGboK+2Y267IWTLKNmYALZ9L34wwIlFUTmjF4shID+6eQFUrxBEhBL+0r/iUIyAH02xt0qLPNpp2+sunoCUUvKGlMcVBPj4YCtMy+bliZbxVOqG9U05GTx/27aUAorJInloHdfletylDVdLBOZEYJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRcGKbZ92GvagMHn2VgxQWrtt0qmTIZU87aMWYQmf/w=;
 b=RzYd28xcidj5vW0AeVC72oXaLMTAyPr1+9CblgZjsFgywnKn0rGsiT0OaP2O5ZJxwqL7X87fgWsV5z1GtEqM3dmRXs5P1yxcDhVSnMA/0UN0hdzMWDdmkeQSwh0cXwV5Y4vz+U1xQnz7InXWyyf+64S/Ik1i2Y70F0WBcMJ24Btb/8CnwrMGnLgkeUDOt19xJfVxYrfQE7G5CTyCQyiwqGmOVfM4qUq5MHHBL85SYs1UPlFxdtVZkiCkxBhXUluNOZFtdrp0j8q3kqZ6DhRegs5+Wk2uFD4yVdyEks7Bxf/f+/XS7qRjbUt4YBdXGlN6zVbRFdhFyDG2lA/kEnzwrA==
Received: from DS3P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:45f::19) by
 LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 16:24:07 +0000
Received: from MN1PEPF000793FA.namprd05.prod.outlook.com
 (2603:10b6:8:45f:cafe::a3) by DS3P220CA0011.outlook.office365.com
 (2603:10b6:8:45f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 16:24:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MN1PEPF000793FA.mail.protection.outlook.com (10.167.249.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 16:24:07 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 08:23:45 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 08:23:44 -0800
Received: from build-akhilrajeev-noble-20260927.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.56
 via Frontend Transport; Tue, 10 Nov 2026 08:23:42 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko
	<digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Wolfram
 Sang" <wsa+renesas@sang-engineering.com>, Kartik Rajput <kkartik@nvidia.com>,
	Akhil R <akhilrajeev@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] i2c: tegra: Use non-HS timings for clock divisor
Date: Tue, 10 Nov 2026 16:23:00 +0000
Message-ID: <20261110162300.3834584-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FA:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 680dec15-f11f-4c38-8a41-08df3f470b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|18002099003|10067099003|921020|11063799006|56012099006|261021123027099003|261009220027099003|261009221727099003|261021121427099003|261009223027099003|261009221227099003|261009223327099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	dYm6xwsCkCvR1EaiAOT0nTFO/iEdgSTytEwm23nXzqJVXmIyFrMnuGyri+M8tsiKCGHTTlbX0+z4Er1GTfiWu+W05hHBvGcJQrjsJm6V3QBa/heXiOd3qtZz3StQlLVU8a1j+ttL8aTEkLeD0oAc8eZ0jXp4Y4Z8asuEHXXcoepl53sre8+6iNeqMZJ60SnhnHyGASGKM4z3xJ/WMtGBYmFEyelkSkqPTpKxdUWAljd5dhh/R5MFg7apG9iQ/MMTMj3HqWfwoCOFjo49FYfmI0Xzwxoqq8KpCnLJucCkrjvYcrUshM6zlBoWRXOAfxs87vH02YJ96A7gx8itXiwUXDdN5FFGpUZEmu3Bbqltdc0kjdbAmr94Jnu97tTRdx+G1KnGNMuxmVQ66NPmX50mys9ilp34XKfhVA4VPrWJZWrwKavel/4E23QkAuSyqOyn+jS3d647NjxIezi9W7wuZdrn+/KVUooZStzuLM0iUAi6+4sQLYzTFRkXpZYDGbspqyblrgCCpPtM/JFz4F+p0rVkGuseP+h72KpO4Gpa1XULrkPps9UaArC2r/Vk1gPwBKuDCgNvvbWa8IZTmlLD/tDAZl12NdLYS39Jci9CIY4tuKuM/Tku7y8RxMbdCPN+S20h3BtJ9nYx0p1AjPNVhEX4ZugmeYW7R3/T+NkhMxIZfvphcHzLrWk+tTJX2yKZNaWXTr9+yC915pNvRZ4n4DF80QFd8k689L0f/zRrJB1hdW8+2KI4zp9UpuLjwidb
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(18002099003)(10067099003)(921020)(11063799006)(56012099006)(261021123027099003)(261009220027099003)(261009221727099003)(261021121427099003)(261009223027099003)(261009221227099003)(261009223327099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n4XQKnmjHx+aWipfR7Wbed2ZsYaXYqF5ffmIKapn8T8EPNsOrkEEDR1FpUpM/0vZAAYye+VV32TzAAnGd6QzG5CekluXugXFkd9sbAUnxKvHiFIovoRYbpKVAnub3tsbfN+KBTubaOxDHSsRzIBkGR+4wK/xVuhgD4aqN+CUa3QqgAMkIIhiuFfJdOvJl0AQPiXhanGD263UKwNtGhyY4AZzyhrmS5wvbMSAAEMfniRoWUISG3YidhA+khPmV42/lU3v1j7jhgPEIqoQXnPAsyg5VR1H8rd3YRo6YybAJps3ZMjYudzmGwrIBn3qv53NNH+bAThW9D48HAMyZR/uO9GrNGL74Br31NsVZoNhbzO8nCThrbKaD5irhccvscoxfEZT3Y6lvP1IXAs2ibmudObEZDHPsDrSP11n7xDhKvliNvRVrx/Mc+wE83F3bYjj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 16:24:07.0488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 680dec15-f11f-4c38-8a41-08df3f470b2a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941

Programming the HS timing registers overwrites the local tlow and thigh
values before they are used to calculate the controller clock rate. On
controllers with HS support, this mixes HS timings with the clock divisor
calculation and sets an incorrect clock rate.

Calculate the clock multiplier before the HS register setup overwrites
the selected non-HS timings.

Fixes: 978b3ccbbac3 ("i2c: tegra: Add HS mode support")
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 76d21bc51c618..6a98432734d37 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -976,6 +976,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
 		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->interface_timing_1);
 
+	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
+
 	/* Write HS mode registers. These will get used only for HS mode*/
 	if (i2c_dev->hw->enable_hs_mode_support) {
 		tlow = i2c_dev->hw->tlow_hs_mode;
@@ -988,8 +990,6 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->hs_interface_timing_1);
 	}
 
-	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
-
 	err = clk_set_rate(i2c_dev->div_clk,
 			   t->bus_freq_hz * clk_multiplier);
 	if (err) {

base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.43.0

