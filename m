Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793621568;
	b=aYUEqEdxvskN/oX3yTtjjftfAR7V7NK4dARSoU7tVOGi+BMJnFYNMt9GxQIqrCxj+hp2
	 ZoIyOUyECsmiXi2x6P8JI69+RzoBkE0khuN9P2rFRlikoqYKxX/bZoZsNkQjJU0O/zevH
	 zHGfNIPXi5ef4/82HGEEUkElw+Enu9kGuZuIzOSqIGHMBt6dhNr5X3xsyys+ZE7dOLj9A
	 ZO5pm31/VNS0pyOeJZzgovcQqUn/eCvTofuq5Q5U6Pt4AyZyaYPUxfF4aeC9JHmZFVgA9
	 N3r0T1GA0x4QOh5CPmgnSTs085NHZuI6it0lQ3nFwLwgu/Qxhb0kmp0skSpqzGnvWTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621568;
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
	b=fv5V4VxRquPgwLFD+069jiKBp4RIQcd4z0RoPtc3wiYYImg36G7c0kbvDUHWEj5+M31q
	 ULrwLIG1mr2DYLfgo491Arb2xxv5mjo/rQ3LwsK0FXYNAIve/EHdxXs/RLFYDBviK/ST5
	 QbWpKSLbpITNDIQw1/TJdSWmiLQnXh3PEFSUHopKs1BSq7hS8O+LdEWLfKb6i/7TO1hmY
	 3qImMbEGIFOJUXYTQAfP19MkxaFI/qUzcTRweiLZW+WHHfxB+bAPfnNnxt+YP9Golf0hy
	 aauPK5TE7peN2bU7cahscxkK/g0h59lyj79pgKY+lP/Pgqtb5RIjgqBVDPYV1T93YYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sW3y5FEj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.44
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010044.outbound.protection.outlook.com [52.101.193.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F70F606A32E;
	Mon,  2 Nov 2026 12:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F70F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sW3y5FEj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSij9LW4xKlaCywnPCaG4eQHz0Xqeftbq31B9OCPKYwFiSsuTdOEZT1DIjTrwcum6UGB0mAzBtHLYE+MUZHbsu18xFQDqMGtCMd6CNqFl1AeL2tuM40bzC9lLIQpoUoPXqIQ2EDfxyk5SPwYuJkFitl1F9sgfdG2h0Zuo8934/qD4by78WyKncEbnzMheao9VDJqRN4d3qPqEEC7x+Nb5/vFV4mW01rYS2r/XWWhpX0ciUq12da6SSBLz2AGeUV2qve9m1kDxQcCaMJvUQkEX0QELW9wMmGhYeT+fTNXghzNTgBHAM/HnhAcOYXlA8syuo2CrHijsHvCZnwkee9I7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjZL0LpvDdOjSRO2qnRklWaytRS+6oW0S7030i2OwxQ=;
 b=OLeC0P0/zO7g6oLKNQ4+ojKuSLkgujTagwETgWVDvlLtnfyuIrZ4AJNLdf6tV4r4P2tH8ndpIy8vGnlkzM3IuLmKCHXTiryDc+PQkLJHm23muUAEbX5oEODDym2ZAit7gkhgz+ftxuA3zIYoiEOcVSizDeUZxYrGorhzkE+vjtDYb2VtvMflHkXISHqyvBsNYBgrtFxuik8Lo7zV5xI1jdlhkVqee1dCsrkwlvlmbPywHnsFiCatnCELSaANmykA9Is9NRjOJ13hbLim/oxOv9V74l0MTmE4y4q5ezR0bWUW3NKjub5K0fH971fVQ89GEFlJS3M+0b7oA8oUu2Dedg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjZL0LpvDdOjSRO2qnRklWaytRS+6oW0S7030i2OwxQ=;
 b=sW3y5FEjU60UIbsLB6iBSXVHKqgwlQYiG20FHiOP8m1ul7a0teFxqn/Nse+pSOZP30DacuzhCGRjmtJRl+OdC6JEdSZOjXYot7NF3YhY4mrmo4udxdz5CFb5366V+zwykgT3GpO1FagyiOdTKeJLEOZbp/aegD/k9Y1KXUtE82gcdeea9d3fqhOG8TcfLevefAjAKoM0CppaYDZYkmLsCt9xgXEAY6YX17s9XRJ+OkD/IGAi+SvdYR7bGHoK0VkWfhgTqWeUNu/EHReU0Cqj9xUhmynIr8ta5fdosmgxMvJYJvEhj7RgMZtDTXkfeKHFuptX0yH4WARTERAzIJoR8Q==
Received: from BN9PR03CA0209.namprd03.prod.outlook.com (2603:10b6:408:f9::34)
 by DM4PR12MB8569.namprd12.prod.outlook.com (2603:10b6:8:18a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:12:43 +0000
Received: from BN7PEPF0000009E.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::86) by BN9PR03CA0209.outlook.office365.com
 (2603:10b6:408:f9::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 12:12:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN7PEPF0000009E.mail.protection.outlook.com (10.167.248.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 12:12:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 2 Nov
 2026 04:12:27 -0800
Received: from build-johnliu-noble-20261009.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 04:12:25 -0800
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
Subject: [PATCH v3 4/4] clk: tegra: bpmp: Do not cache the EMC clock rate
Date: Mon, 2 Nov 2026 12:12:02 +0000
Message-ID: <20261102121202.2431928-5-johnliu@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102121202.2431928-1-johnliu@nvidia.com>
References: <20261102121202.2431928-1-johnliu@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009E:EE_|DM4PR12MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: 59771765-335a-488c-a640-08df38da98de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|7416014|376014|261021121427099003|261009223027099003|921020|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	St5sJhj1Dz0aTd7AKBI7sRWLEHHW6OaStPg9bUPzR9t7b5mfvVI+9a52H7CdlZR+7hR8xDns9bYm1o4Rayj5/O9BJ5RDjvaRb02wk/C+/gLV70VEMxth0tdBdgsmnQ8LZN2QOTTxQ8iM/ZkT7jYc9pW4TYNr4/v0nI00zkUwm+LRiixfjwB7tIFnQQDdzAX+UbkfMih9Gr9Wjx/J5LKy4s4GfJ1pgOWdtnjun164koaGXyxs/fYYlN6k0ZLjL63fyhDxJ+zDDTzG4qPtgVSvOpASO4FPVsLiQQsAg9Sz0NmEsFSwCrVwkUSUiR/aOCgZ4ekEe/VXuG3Kt4LDAS4xeR3CRNPAuiJTYWTH+gPtge5MAyjoqx1D8/ITeFCaPcDyYhHlOiH2r4yUriKWdnzOkJrgTbiDc5j3u/lpSUMyDzsVxg6c2XUWCAkvANt/PR81p93fvNJ5ISmOD/hzhs2wTj9rMl+BC9yRbuSUGkzptSZ/vnUZEbwkHjQLtnMhmz0F53yRtEYXxOAdVfyNt0VP/JfLux6i8FRsTkpfAbrvBQkFfH1iva1UX4xGkcPAzknSf9y303JqI0UcP+WtkRycv0GIz+BfcMFDSLh3ynFIsUGF63JHzbA0PC9VaAuZRE/oMFL6NH9G6T7oS/6qlj7tNJE1PNZVGMGcfRe2/aDSqkf8vvUml0srj6DuJBHWXK3CwOHrs3Exy93NnmJIJvJdiTa/ZwDUSxhVOtCrLmrdk819dCPYp/x9ZkieHt4ZDfHc
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(7416014)(376014)(261021121427099003)(261009223027099003)(921020)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CmCqxFcWZsrte/mjCgnQwF/zaOwnm7e1TO/jYuWxPVLkTeP2JkxS7IaciJJzK8qafU7fhH15w4/7wl9pPti4VT85D0VdeDjDY8y6qTLPxvAXk9Ukhq/JD4+tJFRA4m0C25IeoZOegQeoFKGKDC1MBpAKvAjhW8dFM7gSjsg5LVLTcwpC+JO9Dv14MtBAB/hXa1T6Eq3mfQvDCezE7bGj7omMQ8cBM7bGMRkgjYqfMyqkeQ2f21R0DTflmKbUqoumABWy4lj6d2gPVvncFQE+W8p3LpOBFsBWRIQAZhSEezc9fzJ82eAD1Mdtz5D9EP7WJ7ucsMFs14fGgedeQheCdgrARASYuVe3EK41fUzxawno4IzkVyzrS1qMdPLXYad6RodEktgVkoOSJXffACvO7TiK5knq6f/GEBFUdGJyC/Ob5f31u3GdBtvR1PQrd0tP
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:12:42.6852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59771765-335a-488c-a640-08df38da98de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8569

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

