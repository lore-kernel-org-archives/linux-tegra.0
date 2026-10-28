Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793177378;
	b=q4/xCpsmAHottW6uoZR/jpIEpK1qWD/KbwwCjs6VfrUdfKfkkyZ2/WtT+iyvONlci/e1
	 E0kE8RjM9jclPJ03QUvNJu1XmIORZ0R/wSLoYcBsAiQosuvMyMnsnBi0W5YzTL+HKr/uE
	 4sr5uM2laxrgPaaVmT4IsRZWet+NKKw9N3tlmADCwPipZ+oOxjzBK1orlM3DQuma9oGdB
	 sUT6xK5m1yIolTBQlVid2rmmcvC3AWwMZybGuiKCb7QebqCB5AlXHDDHa5x4OoK4YkVqP
	 bvFIJX0hjCH9h42dLiJbbn3CguzAuKZtNIO8oVYyp53LIjegfpi6L76vcNg9ISyAleA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177378;
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
	bh=ZyO9lmQ5T/qLTNEnlq3IawD2R1eRroM0j2e0TMZa2A4=;
	b=bR6rDiG5CXDuTrHp9rPf/T1YniAIeCbNqCl5GKnMczzUeQZWWXIWXSgdEDv04MaqdM7w
	 T2cCu+Z7t2aU48vhQ5UnfKCLZXNGapUTDmxZxDU7lH+wj7emAvXlGYmScUeP76ATtx1dp
	 vDDwY7El5gB4ndtNB08adA3YnV5LWmBdJsS8k6HayFQIX/O0+HqOS67FhHBtsH3C6sDjY
	 z0rt9Sx9Zbrw+Q0HhcPGECs7VmUBa7ogCi03rx6xGZNoRgMM4bLl6FH3DbJmzPcZH803V
	 qikUoAAL2qmwpQZdKF1bENsUbL18uJi+r8Qdrz+DjrEi2f0X4+h2Rq9pISNFk9oXMZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TYmjzCyC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.5
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010005.outbound.protection.outlook.com [52.101.193.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3283E606A31A;
	Wed, 28 Oct 2026 08:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3283E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TYmjzCyC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSj0kSrf/5+2Te2V5KONmgMbi7rJv+cocTuL4Ot36QPxz/QG283vCgPKtFxel2kc+PjCGUofKlnKbeny86r7DYt0N75IVOGxENV3evikZOnbWmwFIUFTr6CDWvS5Q8Q3kiA+2GLR7nvG+Qad5aGPBgs0YdEE4PWsIWJd3gQS9UDyr3HcU3e5m4griONxXB/y+tDrtU8zF/z98mllJsefce9/Z7SEc9OU4zjtBaoBBj0n9j13OYVbJG3zf5z2J+k6d/c8RDqh0wVCKxWJDEdEoofjiga9BOMN+/4BY4fQ4YsivxUcUPssUZ9UZKEz4stMjXVZfWNVLKwxjnK00sypVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyO9lmQ5T/qLTNEnlq3IawD2R1eRroM0j2e0TMZa2A4=;
 b=hx5ScH2aIlE/HxYRAzt4g7ebK82xNfZ1NlqfH6NRS4OjOkezkm+VpE4g3xHhTwNtJFm1FYuZYzQNhd0wCp9S2QqZEVKEDbhfHFmQlpDXeGayauEo6nreYba9LWw+vmwXvUE//oTtUh6EBfS2o3VZYya6V3E5Sb0LWP7zMno5d66P29tFnDOL2fCGbJXL0dWNlSlMici5GSWGRzUJ+AvJ1RtxfB3VjzR257ewH+Hcxz39xsIL1iZJ8SNyIgU4tKinUVGLWT3CEAMdwRd/OU/FjZ64kzNCudmU+9FP9s5aGxhBqJvTfm6NiC+hB4KaP4p3WaGleQTpak75HiSo4KhuiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyO9lmQ5T/qLTNEnlq3IawD2R1eRroM0j2e0TMZa2A4=;
 b=TYmjzCyCSXAf/PnGCm4hoLO2j3D8g1JG94nmVqqFJ6tNJXGCSDUYFUuemsnKwDCCdtgaapHJ8QFvD4F394SvIqomERSQi7cb8890N+MVDKY+9veTb5Rl5vHAj0tIx0ClRoHK3dwm18zY2RnDdPdJOM4soN/yUxC6tAp8KqbjLWWEcDBJJuTl6VZEXIMKPj/0fIrecp3bOjzw4LtS+VuMWg/FgEvKSrbo9hNfJpNXHyZ8Uc8Tu5cYoJryDAG8ScN9M9pRfY1iMLrnL345v9GDPEXpb40BVhP6RAP9a5AIfPeuXHo10OLt0oIpTNPw8fnNsCGzFRMO+PgixWlCgYBfTg==
Received: from CH2PR12CA0025.namprd12.prod.outlook.com (2603:10b6:610:57::35)
 by PH7PR12MB7283.namprd12.prod.outlook.com (2603:10b6:510:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 08:49:34 +0000
Received: from BL2PEPF000352CE.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::ab) by CH2PR12CA0025.outlook.office365.com
 (2603:10b6:610:57::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 08:49:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL2PEPF000352CE.mail.protection.outlook.com (10.167.249.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 08:49:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 01:49:19 -0700
Received: from build-johnliu-noble-20261009.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 01:49:18 -0700
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
Subject: [PATCH 4/5] firmware: tegra: bpmp: Add per-SoC EMC clock ID
Date: Wed, 28 Oct 2026 08:48:59 +0000
Message-ID: <20261028084900.1047287-5-johnliu@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028084900.1047287-1-johnliu@nvidia.com>
References: <20261028084900.1047287-1-johnliu@nvidia.com>
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
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CE:EE_|PH7PR12MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc9e276-be76-477b-9d27-08df34d0638b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|82310400026|36860700016|921020|11063799006|56012099006|261009223027099003|261021121427099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RcSdTsDcuMSHvnBaM2Rr7FJPOSMumV0U0guJMsIbqWy56nB0BvCSTs01+WJ8Q0VYH4Y6/UTfZq2tOct91GnBpQbzYfuSSsIq+f3VIxtFDl4fJywuUQVdg6ADCJzkw3ZIS4/7zr6ghFZZ8Lc3MvPxu2q9+6aYTIMw38jHhUPI9ULwc8bUhQ1F8y8/cWlXpHZkr0JLe7UYV+BETkajkbEWHAjMbJr7t8G3xekkZDz89yU86l/YickZX944K7CyLubOWju4n+u5QJyWV6mt1b8Pm4ns1H7hMIqD3uBlTFLkkIy6+hZDugKZ+Zc5DfeJnQ3nsm33jLtW9efJ/jDTVhnownIayAl5JnGMLpVGNs7xLzh/F6e2H4+BriXF2CdWqmQ2Jc6UZijRYYmX35prsiuNbSDJrdZTXXVCT/ApeErzAJ6/Y2ER20uVuJ/0SQNJFQRK7GFUZ9/tYNnzaw8oQpA5E8Ux57rFvzOd+vfSFIxUKeQDkNKc+GY5uOFpvZUWybtPjMAk/qUNm4hVzJJL7GVYQy+r5PjiV9Uy4K/0DerJTNmhXyW+50+Jmbo5xhEEantMp7ZPDzUtdgnlDoUsBcc+Uw1PjYGlfYwbZbUXBDrHzdO4PUk4/ydT7azccJM15kzYmGeXI1geudWG5uI2v3/8KKyocfVQMMNUEnZMQDzxp5oDxCNR+uSUqhIbqSnoaVCJ9MPffZdd7aBxfQKkFOIc720xFyCSz9zN6kW3gf1DXwglpYty6kkUROXKn11TXoWk
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(82310400026)(36860700016)(921020)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2FnIaDkRAlPzmssnZAxSDv2mbBoNkknFtTqesxStap6yRFm1WDIOsbN9RZupY5SPiCJjnh+YY5l/SXMNtsSakD/53ht6IHuIJer9+MRwO1Fb5ZsRyzI+kPHu/sJQlfFM/EZ3bl4rqXPyY/gXv/JyWWqqjNd6pPClqhoZMPAWbe2XKcQPkBAOHX9V+hp9kWM9W/iTkhDUOHdcw5wGvIRu6YCptNXBcfgb8mSCh1y5ITJC1lq4lvE+NM/DaW3WhEzIzMDKAF6NAf7/t5+r9On7VmY2JMT5qcHOHI1P+j5Vy2EgHTFtGsgyuz4CuCJHo9OE0xI49/2BkfKoEjdc7GqvceDOmfkSJX46rRqWs36F5KHiOK+mwtRvWESz55sPrq0/KeWgI/b2v5vpqv5sCo073JcEwz+w1BTl3rV6p5U74fTQq4n8ZHnfEeGywXHLyYnB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 08:49:33.5873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc9e276-be76-477b-9d27-08df34d0638b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7283

The EMC clock ID differs per chip (TEGRA234_CLK_EMC=31,
TEGRA238_CLK_EMC=43, TEGRA264_CLK_EMC=290).

Add an emc_clk_id field to struct tegra_bpmp_soc and set it for
Tegra234, Tegra238 and Tegra264. Tegra186 and Tegra194 have no EMC clock
ID and leave it unset.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 drivers/firmware/tegra/bpmp.c | 7 +++++++
 include/soc/tegra/bpmp.h      | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index beeb385870f5..06da888535dc 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -21,6 +21,10 @@
 #include <soc/tegra/bpmp-abi.h>
 #include <soc/tegra/ivc.h>
 
+#include <dt-bindings/clock/nvidia,tegra238.h>
+#include <dt-bindings/clock/nvidia,tegra264.h>
+#include <dt-bindings/clock/tegra234-clock.h>
+
 #include "bpmp-private.h"
 
 #define MSG_ACK		BIT(0)
@@ -1158,14 +1162,17 @@ static const struct tegra_bpmp_soc tegra186_soc = {
 
 static const struct tegra_bpmp_soc tegra234_soc = {
 	TEGRA186_BPMP_SOC_COMMON,
+	.emc_clk_id = TEGRA234_CLK_EMC,
 };
 
 static const struct tegra_bpmp_soc tegra238_soc = {
 	TEGRA186_BPMP_SOC_COMMON,
+	.emc_clk_id = TEGRA238_CLK_EMC,
 };
 
 static const struct tegra_bpmp_soc tegra264_soc = {
 	TEGRA186_BPMP_SOC_COMMON,
+	.emc_clk_id = TEGRA264_CLK_EMC,
 };
 #endif
 
diff --git a/include/soc/tegra/bpmp.h b/include/soc/tegra/bpmp.h
index f55db918ccb1..40e2db8e69cc 100644
--- a/include/soc/tegra/bpmp.h
+++ b/include/soc/tegra/bpmp.h
@@ -31,6 +31,7 @@ struct tegra_bpmp_soc {
 	const struct tegra_bpmp_ops *ops;
 	const struct tegra_bpmp_mbwt_soc *mbwt;
 	unsigned int num_resets;
+	unsigned int emc_clk_id;
 };
 
 struct tegra_bpmp_mb_data {
-- 
2.43.0

