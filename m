Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013052.outbound.protection.outlook.com [40.93.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7821A9B24;
	Tue, 23 Sep 2025 00:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758586867; cv=fail; b=a5ofRCmXglSHYPXRzZv/tqNeZNDE4a6PV9Mcz41OENTmKfCBszYsffc3ywU9LRakop/tr/wyABHomFOfzU5w1BCj3mjvETJtkLeEf1Vp0/LRw9AvBBwmziLSRHOVk/g+H266Miibm8ar6wSgrTNuINbuWTQ6wFE8JZ+yexW4RbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758586867; c=relaxed/simple;
	bh=EjRdKIukK8mbxgRqUv5h59gGO4CiXFaqK+xxuFo3cSo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PCsVuIlUsVnTIeFx6QrQ40MUjorvE+RfN1uNr9zu5n8Tf/7rvIEvw95DbxmX8NyflSvP9vCyGbwBZXhNhT8Tna1ahi5AR3IMsMTEnIxw4GutArQBdaxQs4oqhojBQFeYdjs2cuODntiB1duZXlavC1sjrMPzrjdPDo0X52fXUJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ldyQ3i+h; arc=fail smtp.client-ip=40.93.201.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ldyQ3i+h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOYHymDeZcVbit0nHlWSW4Noklgmw7+RtMiJtWVem1y8A+KtHiibtrh1kSDRoRvh7ZCBh8Sjdd2qQRRT/3g0keTfzrr+LcQbE84mt7+LtMwxSPG6k0IqtsKQH1Q82bLdAZxDP3f1UcMhiA2PE4tAPl0VmxndFLCzE8uCthYmXGqllAbuWWTVRspPdkIvCmuOlkAe74w+rJ7YrafQU3X4+Ym77NO+1QTFRNL+ARXNRcQ+5nX6BrHSBaLU7rNv3AD6SUDcnhzRS73WxDpIb7SHz0jvxnT56aflv3UUh1wf0+GOLmb9dLLHuiB/oTAiUuBU6r3PHS/X66+Il/YSHO1y6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCK6PM50QWujymmPTS5vOZevTPh0u9qW2gkMPf3MzkA=;
 b=ukmbQsU/ijWl71PbhwpnwHfm0AihKz7cqZaR3cGaxXecJniNICsAA3wS77tGKyYkUiy5aYYWasWwefE7FzZ5+c9CobRDcLwBxkUCJbuvSu5FcKirQbtYeefDlKwItOeUDXemYDNoP/ijtYKtF9+ZPRpacFu4PNF8JJ8WgIVnU+oQPIuj7gxi8uuk/kDc2nouOaco7cPMVGTUcvCfHeEusRA9DrDrRgZRxz3ArO3oDWsRyYWqUg/NGJr/6P5pdzQR2jCJsCwrI2mSsyqtX7uAlZMRB8jicCHfLopV5exbbQ65br+tGwXPabQ5yXG8VJ89gAYvPtnwDdHcMO5IbReMeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCK6PM50QWujymmPTS5vOZevTPh0u9qW2gkMPf3MzkA=;
 b=ldyQ3i+hK+PI+cCsyb0mi7Gn/i3oq6ag6xYI1ullcQ28ZfudVV966Qz0bLQAGFdXsAINQnFxeTVUP6QLCpUqvDaFlqsedOi7EonJwcVId2F31NOQ5bu+SvI1fmmbEwOsbViIVTgxHi4ebeu+210phR5+85MFk3RoDn1Gf7nRHlUqa/X2jaGfmUX9vM3F6vcWd1SSVfzJ+45sINoKg5w+Ubb4pFYgW2PZaycJtlACmRJhjaRHEKvhqisskSzTeziWYW7VT5eII07nzr5BmbcIWQdXJYr0Q9Hf+KoUP9sZFgNQH3QqEkppbgclc3uEJ4qIay53uZGNPoyA1grRQ/tGmg==
Received: from DS7PR03CA0057.namprd03.prod.outlook.com (2603:10b6:5:3b5::32)
 by SN7PR12MB8028.namprd12.prod.outlook.com (2603:10b6:806:341::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 00:21:02 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:3b5:cafe::28) by DS7PR03CA0057.outlook.office365.com
 (2603:10b6:5:3b5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 00:21:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 00:21:01 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Mon, 22 Sep
 2025 17:20:51 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 22 Sep
 2025 17:20:50 -0700
Received: from build-bwicaksono-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 22 Sep 2025 17:20:50 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <suzuki.poulose@arm.com>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH v2 4/5] perf/arm_cspmu: nvidia: Add revision id matching
Date: Tue, 23 Sep 2025 00:18:39 +0000
Message-ID: <20250923001840.1586078-5-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250923001840.1586078-1-bwicaksono@nvidia.com>
References: <20250923001840.1586078-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|SN7PR12MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d3d8925-e1be-4e48-1e0a-08ddfa3713e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DRtM3Q9cbvyzmmMcmoHQox+b5MV2I9Y+t1ZJ0WVl2c3r3osPPTN+mDhA/GzE?=
 =?us-ascii?Q?KDP9RcZ3+heAcwumZMEkmr2JnNveByU7EYmMQRoNlecS/gkNVdtUrWBxho3+?=
 =?us-ascii?Q?WByxEBPVTF737XkNQ3ljBABbMxf7B0avUe1pV7SbH5a5RqtVJjU8hrCWzws/?=
 =?us-ascii?Q?Lr3uWPyEANux6eG+Nwi1iNg3CjXolURHyhRGyyEzd8L2UzHq++tx7OOsl5Y3?=
 =?us-ascii?Q?6luri2NfSqKpwwzfAe0CxqwCGaOAI/DIbqMpPOciJ5cTriEAYG6LExksoWvv?=
 =?us-ascii?Q?frGH1fahf/UkC0774aqf9H4Oz+/REB2StWDfZUt5jFva0XWJEiCOKr9Hd2nt?=
 =?us-ascii?Q?UD7D2uVlek/PEhzKgZ89QKsXH7/hyfGwDN0EAFQGNbNyjdShXYnfcT3gGJDx?=
 =?us-ascii?Q?IvZNiRjLtKhs/gGiwg/RdY/V68cZ9JxxYHU4S2oK8gM1tr0p8GsF0tZ7X0Bw?=
 =?us-ascii?Q?bZ27Ir5WSWFiGIuBrpA9XRzaO0I83baGl4eGGz2OnpjWVac/W7QsXakOx8hs?=
 =?us-ascii?Q?rG7Lra9Hed/szKKKOOcLQKQCRF17zkPRuZCOyjwtnhK16J6xiFGz4fhSOQ8w?=
 =?us-ascii?Q?4yz/RVA28ZY36qD6ZTzf107TLdzFWKEnELD0UccSLZ18e9j0Owqebsw+TBzW?=
 =?us-ascii?Q?ytI3L3UW15Pi1p2/HL/m1AcoUYy+Vg86EcBZXhhZT9i7CsbHznDjaj7H7niG?=
 =?us-ascii?Q?J8aGz1rxdC37wHLi4GPqxLDgJdUwzHNYgQVmwgqFFham+sFPOOPFFOlbJ5c1?=
 =?us-ascii?Q?hgVANMsB+g+7t8fzOlMxnRSmBR56DVCiLsP06iq3zyOXVlFMq3dJXcj9DJb2?=
 =?us-ascii?Q?4T+aIuUsfAkkIApIeyAeZ4nfrkH1pFrsHNP+zU3qwBzlv+zlwwx6qOgIH0fq?=
 =?us-ascii?Q?QmKnPFzTrUC3xxZltrBwRW809NHsY+fiwWD3QhObmpvP40wewLub9wbjvFVT?=
 =?us-ascii?Q?ZDrdiSawU+3XDpmArHb++s0vIaBNVmRP0QZfvMnl8H54Nw05CEASGaoL0Z4E?=
 =?us-ascii?Q?KWyvXf324NiD98CNTdTlF4t/4hC4B0NSmnR+w3TJeFxpch0tJFntuj+Q9lFg?=
 =?us-ascii?Q?qBjF8GJsY7ZkhnzDTVaTbCgEqjWO7y2/rXkQXOAYpH4mXch6WWnK+AnMoObI?=
 =?us-ascii?Q?O+xKGWByL3DjQFuz06PaHkjnwTc+JEa/pcH5X0/kx3fUfIplXE0i8yhCUpBK?=
 =?us-ascii?Q?YzFm1UKaCv3RgtVNlPAli3gQNca9ltbub3tY1LKyx5oey47mwi0Eq8lXEpll?=
 =?us-ascii?Q?McWFplvSjU8NlS9KIe1Yk6hLGnRaFK7VNj+L8P5O0fQNoyY7Rr6XetOOXeMi?=
 =?us-ascii?Q?mIB52uuuWuWrWmRrMKrn6xpcUUAwGlbKZc5OsppXGXjXoBQKq/JW/NxQskdR?=
 =?us-ascii?Q?Y4OpLMnGFbdS48hAUyE7qBf8bqUhqxr5rdMQmBwsblY1f4nf+bY7Og0IlZ7F?=
 =?us-ascii?Q?+rAllkqnZnh78XxNhCcrCdzCVLKs82qh+HwmGM5rXCiWac932tNzYUjjs26S?=
 =?us-ascii?Q?KX2jiz2KN8C4E94BNJrDw+rkdADb+C5FtLWs?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 00:21:01.9241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3d8925-e1be-4e48-1e0a-08ddfa3713e4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8028

Distinguish NVIDIA devices by revision and variant bits
in PMIIDR register in addition to product id.

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/nvidia_cspmu.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index b6cec351a142..ac91dc46501d 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -23,7 +23,7 @@
 
 #define NV_GENERIC_FILTER_ID_MASK    GENMASK_ULL(31, 0)
 
-#define NV_PRODID_MASK               GENMASK(31, 0)
+#define NV_PRODID_MASK	(PMIIDR_PRODUCTID | PMIIDR_VARIANT | PMIIDR_REVISION)
 
 #define NV_FORMAT_NAME_GENERIC	0
 
@@ -220,7 +220,7 @@ struct nv_cspmu_match {
 
 static const struct nv_cspmu_match nv_cspmu_match[] = {
 	{
-	  .prodid = 0x103,
+	  .prodid = 0x10300000,
 	  .prodid_mask = NV_PRODID_MASK,
 	  .filter_mask = NV_PCIE_FILTER_ID_MASK,
 	  .filter_default_val = NV_PCIE_FILTER_ID_MASK,
@@ -230,7 +230,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	  .format_attr = pcie_pmu_format_attrs
 	},
 	{
-	  .prodid = 0x104,
+	  .prodid = 0x10400000,
 	  .prodid_mask = NV_PRODID_MASK,
 	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
 	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
@@ -240,7 +240,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	  .format_attr = nvlink_c2c_pmu_format_attrs
 	},
 	{
-	  .prodid = 0x105,
+	  .prodid = 0x10500000,
 	  .prodid_mask = NV_PRODID_MASK,
 	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
 	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
@@ -250,7 +250,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	  .format_attr = nvlink_c2c_pmu_format_attrs
 	},
 	{
-	  .prodid = 0x106,
+	  .prodid = 0x10600000,
 	  .prodid_mask = NV_PRODID_MASK,
 	  .filter_mask = NV_CNVL_FILTER_ID_MASK,
 	  .filter_default_val = NV_CNVL_FILTER_ID_MASK,
@@ -260,7 +260,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	  .format_attr = cnvlink_pmu_format_attrs
 	},
 	{
-	  .prodid = 0x2CF,
+	  .prodid = 0x2CF00000,
 	  .prodid_mask = NV_PRODID_MASK,
 	  .filter_mask = 0x0,
 	  .filter_default_val = 0x0,
@@ -312,7 +312,6 @@ static char *nv_cspmu_format_name(const struct arm_cspmu *cspmu,
 
 static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
 {
-	u32 prodid;
 	struct nv_cspmu_ctx *ctx;
 	struct device *dev = cspmu->dev;
 	struct arm_cspmu_impl_ops *impl_ops = &cspmu->impl.ops;
@@ -322,13 +321,12 @@ static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
 	if (!ctx)
 		return -ENOMEM;
 
-	prodid = FIELD_GET(PMIIDR_PRODUCTID, cspmu->impl.pmiidr);
-
 	/* Find matching PMU. */
 	for (; match->prodid; match++) {
 		const u32 prodid_mask = match->prodid_mask;
 
-		if ((match->prodid & prodid_mask) == (prodid & prodid_mask))
+		if ((match->prodid & prodid_mask) ==
+		    (cspmu->impl.pmiidr & prodid_mask))
 			break;
 	}
 
-- 
2.50.1

