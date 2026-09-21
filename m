Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012011.outbound.protection.outlook.com [40.107.209.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF58248A2B5;
	Mon, 21 Sep 2026 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993209; cv=fail; b=LV5R9IIofClbnjV3FqUEg7gpPpijtN6MrQOAStBD9PH0KfdTUJUknWC7a/CFMo2hJX+0B9humzhtOKDoO0lqgx1p4zEspPgmGex9AZEdrppmvHzmxKBN0cx0MDX1uWLuHzuzzsCIs/kBVYWhkdpfAtDqihECRjrqJqRmXcJZ6SU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993209; c=relaxed/simple;
	bh=RoHzjanoV3Zs5f3y/xG+6xitPiBuFHDnpYbpnMZkj00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EUze9/wLZPsv6ePy/QNoZbHcoSAN8VYwPGM8iQOo+30jzmri1YG3KE3tPHB9OJ+QpqHAmFft3RMwRKSKBZWuGTuT2MhaATl/Ez31BJ+drJ7DNpQyZdssccOpj1kSKzIrx0n87oxQSc2yCsGmP8ldb7y/KANP5cws1ODq1Vosbz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qVLZh57p; arc=fail smtp.client-ip=40.107.209.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qVLZh57p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1gbgSLi/rFxXLy9uvkjI8tiGydMSW+Tb57cc6SMLzkwpL/6KR5Og1hnL49cjgxTesu7pexUVXQEfgRFksbcJIO+O8svu4kBxZlxcEbzv7zNwNEW3GMnO5RahqzoILe9oc+SCvDy0YjiBjgh4cKXcT8xKY3kEc8eVb3QcDASWNSLJjPTM04+LaMzWRL5kYR/sfKU2YP5mm/8K4DOJrPKpw7QYy76tksNW62u/UCpFFX6BUXvlI+2QQZjrEzI9pvueVt15ZGJMn/WNntpIo8a2kteI9W+QsnfrgNdBsJ1UTXPzZXxMvVDpl7FfJ9IvJGjhk9bSVonPPdIMEgAFNiOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAvIEkgoLPESAdsctFlApaKBGeG2lC0hhGStridRtAU=;
 b=zPzWy5I35m/RZ9h593qjHskF5Us6OzrneRduEYrnG7KKV7zjdPf5/sw+520p1Qj6qvaRWqhYWFD3abogpcLId1ZCNxeKzxo+a0MJV5vOnL7ZVk52tnWPY1tQqH1fstnAOblvxr6FiWh9eVmDbP3pUDW7pfv1NlUIwQeJNIeg+NszDp0N1s1nRxYUe/+P8Rl/Kj1lkTbCxkc/SKtvv5BCDUZhoryJrzDxZX6Jod2rITZFvuju305Xc/2T9nrht13paTPHr5GWeVmCmvOBmMLCu/FNCavR7lKJgwjLDGPMhcvP21ieVfEpAHoV/AVpDiyKeyXTwSHUwZmtif7jE82ClA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAvIEkgoLPESAdsctFlApaKBGeG2lC0hhGStridRtAU=;
 b=qVLZh57pHtVWn77FnZOrTq52vdB3J97W/RyInqrXF8Z1tybcu+85vjX0877jhCZztmzElG7aJtSp3VspjZRlVgDlRT+ZmHROWzIwZOeVOI62bjPIiLQ7pXJ06ktywcvIHqRV+U+XYhILLBMQ7xs25Gkif3RolTbuxthuSIhfSwN3kAS+aqBlzSHhenvCO1YPbG6gnDUjqjTCl/xY06zuS15/bDgLBne09td3j3tUzm0vEZ5jdUxXqQo89DyPlM3LQj9TcvibsMJn9d44MAFbbQL/uToSp5x0SgwIH7bMhKlWZJAfwgf6FDNvLi5giyM98iM40IHXZvVLoXjMo9HhBw==
Received: from BY3PR05CA0040.namprd05.prod.outlook.com (2603:10b6:a03:39b::15)
 by CH2PR12MB4104.namprd12.prod.outlook.com (2603:10b6:610:a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 12:19:58 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::7f) by BY3PR05CA0040.outlook.office365.com
 (2603:10b6:a03:39b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Mon,
 21 Sep 2026 12:19:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 12:19:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:38 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:34 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 21 Sep 2026 13:19:07 +0100
Subject: [PATCH 7/9] usb: gadget: tegra-xudc: Add SSPX register offset to
 SoC data
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260921-tegra-usb-v1-7-74a925a35d82@nvidia.com>
References: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
In-Reply-To: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, "Nagarjuna
 Kristam" <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Mathias Nyman
	<mathias.nyman@intel.com>
CC: Thierry Reding <thierry.reding@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Thierry Reding
	<treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|CH2PR12MB4104:EE_
X-MS-Office365-Filtering-Correlation-Id: ea5a643b-d7b4-487d-3b2a-08df17daa704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|1800799024|376014|23010399003|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Rk201Sq3xg7GiZCsQOn0xaq9+hnLODKkuX6wZH2IPXQcwcr3uvGoXR1Hy1WtRaQYjNuVh4sqp/Nc4IL1QbY6zltvHPUXrpZNlDk662a/jSXFXtawAXme7EWcsqyLGZYUSf9yf3jCOjUqsKZm5lcb8SKw7IcWu/3nLcYb68aby/K9VKHxaQF7pEre+Oy91OyTQNTQtJE6GZ92BohXbCRkp0TtzT3wT3n9X6+ECePTGWBF0hqaNGSj4hRx4CO5suhlqnW4pWYNoinDT3dg1fkTGIUd8DPHX9vw3OpoPuQS41N2rk0/0m/bB+zmjhxfX3+YGXgry7y/YPnaRZ9wQtvXrtk+csaEA7lZGvJOv9NN5Y9ALlpLG3rKdU51cpBX1M+75SncKW5iWLlV2Mx8W0EJ+RzkV6IKrQm5BZhHjo4lgOFSQm4lT9Lo0b3YQKhhs5qxSbvxDbu7JhVLjL+lB5msyueDEchV4DKW9HzwWY4KhCYJ0rjhr42rgVm05G0Wx9shdMeqXFtNL0zyInJpEU2+DjlgrgF3iNUASwADQiW49lKd6CJnIBXW1l7bT3LK58i00g09Py+i/EuIagQEbQEGBC/1Y9d2SFk+Mqt7NqYlK/fRsusaMLdolEktnwFMlRIv79SMZ3WOt5VotF5zL7l1LJJgjAtelHB6qTTCMDx7CZk7PrERhtd7g3C8slTBJe0ahc2Ajrwy3DvOVEBTRfoeLQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(1800799024)(376014)(23010399003)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n5PKSVmmQO4+vrZT66mZd9Dg2QtR6VdgcPtyln/O51JheUWpVu+i65dr/saWgsPbReG/PpJz9za9cbzxvucyiHD9vvrgKmUPonUsxcEnrByhfq69dWCDugM28hfIlMYT3h2xlGqSS0Fm5piZVx1XAdNmG6Vi43IholVdC1j0r94VqWEKNybKTf2HdUtW1yALlgEFDQRppK0G6lrcotlUnYRzEvT9xXG8qZilegjWkkNX2XhZqlN5f+tcass6DjDZinCGHP9qHwsBXM+iwifhnPrEFXsPVOlvqQhYEE5akfA+x6LFfjhVmOUpfDLrwBH+tv6/v99WqGghYu13FVp1G/rohDc5vQQ/jJq+1G2C4bdBI5J2OSuzd5p2SlHV/Sp7ZYY+I2+N3aE5bLWmWwcTBwRqO0tIG0npy6Zhv6fKAz+OXPJ4fHNkrwux+AqHujap
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:19:58.1870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5a643b-d7b4-487d-3b2a-08df17daa704
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4104

The SuperSpeed Port (SSPX) register offsets for Tegra264 (0x4000) are
different to the existing Tegra devices (0x600). In preparation for
adding support for Tegra264, add the SSPX register offset into the SoC
data and update the register definitions and register accesses to use
the offset from the SoC data.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 90 ++++++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 42 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 0b88c1610f27..c97cacb7e416 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -143,42 +143,42 @@
 #define  HSFSPI_COUNT13_U2_RESUME_K_DURATION(x) ((x) & \
 				HSFSPI_COUNT13_U2_RESUME_K_DURATION_MASK)
 #define BLCG 0x840
-#define SSPX_CORE_CNT0 0x610
+#define SSPX_CORE_CNT0 0x10
 #define  SSPX_CORE_CNT0_PING_TBURST_MASK GENMASK(7, 0)
 #define  SSPX_CORE_CNT0_PING_TBURST(x) ((x) & SSPX_CORE_CNT0_PING_TBURST_MASK)
-#define SSPX_CORE_CNT30 0x688
+#define SSPX_CORE_CNT30 0x88
 #define  SSPX_CORE_CNT30_LMPITP_TIMER_MASK GENMASK(19, 0)
 #define  SSPX_CORE_CNT30_LMPITP_TIMER(x) ((x) & \
 					SSPX_CORE_CNT30_LMPITP_TIMER_MASK)
-#define SSPX_CORE_CNT32 0x690
+#define SSPX_CORE_CNT32 0x90
 #define  SSPX_CORE_CNT32_POLL_TBURST_MAX_MASK GENMASK(7, 0)
 #define  SSPX_CORE_CNT32_POLL_TBURST_MAX(x) ((x) & \
 					SSPX_CORE_CNT32_POLL_TBURST_MAX_MASK)
-#define SSPX_CORE_CNT56 0x6fc
+#define SSPX_CORE_CNT56 0xfc
 #define  SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX_MASK GENMASK(19, 0)
 #define  SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX(x) ((x) & \
 				SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX_MASK)
-#define SSPX_CORE_CNT57 0x700
+#define SSPX_CORE_CNT57 0x100
 #define  SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK GENMASK(19, 0)
 #define  SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX(x) ((x) & \
 				SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK)
-#define SSPX_CORE_CNT65 0x720
+#define SSPX_CORE_CNT65 0x120
 #define  SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK GENMASK(19, 0)
 #define  SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID(x) ((x) & \
 				SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK)
-#define SSPX_CORE_CNT66 0x724
+#define SSPX_CORE_CNT66 0x124
 #define  SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK GENMASK(19, 0)
 #define  SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID(x) ((x) & \
 				SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK)
-#define SSPX_CORE_CNT67 0x728
+#define SSPX_CORE_CNT67 0x128
 #define  SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID_MASK GENMASK(19, 0)
 #define  SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID(x) ((x) & \
 				SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID_MASK)
-#define SSPX_CORE_CNT72 0x73c
+#define SSPX_CORE_CNT72 0x13c
 #define  SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT_MASK GENMASK(19, 0)
 #define  SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT(x) ((x) & \
 				SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT_MASK)
-#define SSPX_CORE_PADCTL4 0x750
+#define SSPX_CORE_PADCTL4 0x150
 #define  SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3_MASK GENMASK(19, 0)
 #define  SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3(x) ((x) & \
 				SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3_MASK)
@@ -548,6 +548,7 @@ struct tegra_xudc_soc {
 	const char * const *clock_names;
 	unsigned int num_clks;
 	unsigned int num_phys;
+	unsigned int sspx_offset;
 	bool u1_enable;
 	bool u2_enable;
 	bool lpm_enable;
@@ -629,35 +630,35 @@ static void tegra_xudc_limit_port_speed(struct tegra_xudc *xudc)
 	u32 val;
 
 	/* limit port speed to gen 1 */
-	val = xudc_readl(xudc, SSPX_CORE_CNT56);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT56);
 	val &= ~(SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX_MASK);
 	val |= SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX(0x260);
-	xudc_writel(xudc, val, SSPX_CORE_CNT56);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT56);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT57);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT57);
 	val &= ~(SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK);
 	val |= SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX(0x6D6);
-	xudc_writel(xudc, val, SSPX_CORE_CNT57);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT57);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT65);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT65);
 	val &= ~(SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK);
 	val |= SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID(0x4B0);
-	xudc_writel(xudc, val, SSPX_CORE_CNT65);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT65);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT66);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT66);
 	val &= ~(SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK);
 	val |= SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID(0x4B0);
-	xudc_writel(xudc, val, SSPX_CORE_CNT66);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT66);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT67);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT67);
 	val &= ~(SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID_MASK);
 	val |= SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID(0x4B0);
-	xudc_writel(xudc, val, SSPX_CORE_CNT67);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT67);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT72);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT72);
 	val &= ~(SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT_MASK);
 	val |= SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT(0x10);
-	xudc_writel(xudc, val, SSPX_CORE_CNT72);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT72);
 }
 
 static void tegra_xudc_restore_port_speed(struct tegra_xudc *xudc)
@@ -665,35 +666,35 @@ static void tegra_xudc_restore_port_speed(struct tegra_xudc *xudc)
 	u32 val;
 
 	/* restore port speed to gen2 */
-	val = xudc_readl(xudc, SSPX_CORE_CNT56);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT56);
 	val &= ~(SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX_MASK);
 	val |= SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX(0x438);
-	xudc_writel(xudc, val, SSPX_CORE_CNT56);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT56);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT57);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT57);
 	val &= ~(SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK);
 	val |= SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX(0x528);
-	xudc_writel(xudc, val, SSPX_CORE_CNT57);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT57);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT65);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT65);
 	val &= ~(SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK);
 	val |= SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID(0xE10);
-	xudc_writel(xudc, val, SSPX_CORE_CNT66);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT66);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT66);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT66);
 	val &= ~(SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK);
 	val |= SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID(0x348);
-	xudc_writel(xudc, val, SSPX_CORE_CNT66);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT66);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT67);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT67);
 	val &= ~(SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID_MASK);
 	val |= SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID(0x5a0);
-	xudc_writel(xudc, val, SSPX_CORE_CNT67);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT67);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT72);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT72);
 	val &= ~(SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT_MASK);
 	val |= SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT(0x1c21);
-	xudc_writel(xudc, val, SSPX_CORE_CNT72);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT72);
 }
 
 static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
@@ -3409,22 +3410,22 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 		tegra_xudc_limit_port_speed(xudc);
 
 	/* Set a reasonable U3 exit timer value. */
-	val = xudc_readl(xudc, SSPX_CORE_PADCTL4);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_PADCTL4);
 	val &= ~(SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3_MASK);
 	val |= SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3(0x5dc0);
-	xudc_writel(xudc, val, SSPX_CORE_PADCTL4);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_PADCTL4);
 
 	/* Default ping LFPS tBurst is too large. */
-	val = xudc_readl(xudc, SSPX_CORE_CNT0);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT0);
 	val &= ~(SSPX_CORE_CNT0_PING_TBURST_MASK);
 	val |= SSPX_CORE_CNT0_PING_TBURST(0xa);
-	xudc_writel(xudc, val, SSPX_CORE_CNT0);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT0);
 
 	/* Default tPortConfiguration timeout is too small. */
-	val = xudc_readl(xudc, SSPX_CORE_CNT30);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT30);
 	val &= ~(SSPX_CORE_CNT30_LMPITP_TIMER_MASK);
 	val |= SSPX_CORE_CNT30_LMPITP_TIMER(0x978);
-	xudc_writel(xudc, val, SSPX_CORE_CNT30);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT30);
 
 	if (xudc->soc->lpm_enable) {
 		/* Set L1 resume duration to 95 us. */
@@ -3438,10 +3439,10 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 	 * Compliance suite appears to be violating polling LFPS tBurst max
 	 * of 1.4us.  Send 1.45us instead.
 	 */
-	val = xudc_readl(xudc, SSPX_CORE_CNT32);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT32);
 	val &= ~(SSPX_CORE_CNT32_POLL_TBURST_MAX_MASK);
 	val |= SSPX_CORE_CNT32_POLL_TBURST_MAX(0xb0);
-	xudc_writel(xudc, val, SSPX_CORE_CNT32);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT32);
 
 	/* Direct HS/FS port instance to RxDetect. */
 	val = xudc_readl(xudc, CFG_DEV_FE);
@@ -3641,6 +3642,7 @@ static struct tegra_xudc_soc tegra210_xudc_soc_data = {
 	.clock_names = tegra210_xudc_clock_names,
 	.num_clks = ARRAY_SIZE(tegra210_xudc_clock_names),
 	.num_phys = 4,
+	.sspx_offset = 0x600,
 	.u1_enable = false,
 	.u2_enable = true,
 	.lpm_enable = false,
@@ -3655,6 +3657,7 @@ static struct tegra_xudc_soc tegra186_xudc_soc_data = {
 	.clock_names = tegra186_xudc_clock_names,
 	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
 	.num_phys = 4,
+	.sspx_offset = 0x600,
 	.u1_enable = true,
 	.u2_enable = true,
 	.lpm_enable = false,
@@ -3669,6 +3672,7 @@ static struct tegra_xudc_soc tegra194_xudc_soc_data = {
 	.clock_names = tegra186_xudc_clock_names,
 	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
 	.num_phys = 4,
+	.sspx_offset = 0x600,
 	.u1_enable = true,
 	.u2_enable = true,
 	.lpm_enable = true,
@@ -3683,6 +3687,7 @@ static struct tegra_xudc_soc tegra234_xudc_soc_data = {
 	.clock_names = tegra186_xudc_clock_names,
 	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
 	.num_phys = 4,
+	.sspx_offset = 0x600,
 	.u1_enable = true,
 	.u2_enable = true,
 	.lpm_enable = true,
@@ -3696,6 +3701,7 @@ static struct tegra_xudc_soc tegra238_xudc_soc_data = {
 	.clock_names = tegra186_xudc_clock_names,
 	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
 	.num_phys = 3,
+	.sspx_offset = 0x600,
 	.u1_enable = true,
 	.u2_enable = true,
 	.lpm_enable = true,

-- 
2.43.0

