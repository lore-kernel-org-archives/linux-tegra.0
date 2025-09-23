Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013065.outbound.protection.outlook.com [40.93.196.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ADB184540;
	Tue, 23 Sep 2025 00:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758586891; cv=fail; b=Ny7n5wfXVbNQr8H+G0ikCkSrcT7zHsh3j55mvbFpJohpr/29yRKsMrQ8ERmWdHDu8Ns/qvAJa2VqVXtxB+WwTG4MaClGxjlPkEPRmi/OVZ3CIoD6Df722IzRg3bijpkXUgs9SvdiNyEPceYx8yHt1o1im2hfgvXlA6CGVjh8v0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758586891; c=relaxed/simple;
	bh=y0Vzngh9J7hK2UTcB/wah3WpbXSdp5agQXMEyEcRqEU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q9fg5ZazfGj8ZEY0RNA1MtTFxJE/pR7S8NztIV47QcAJmsDwIOklEJjnb+ccG4FFNY1wm4FNgE4qKl/ogRNp2CrIPX4KrjFpYBabB1b82hFqgTyO0kjCDGiKnnKh6k9pDmScQlQJ8xbHxFKcrC3gCwI8bOUzROhcOkGtA5zdKqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OQEl7s8Y; arc=fail smtp.client-ip=40.93.196.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OQEl7s8Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkE8s6rpC+WdYzvWfepxGsjaMCvJj7tiuB9nzcc+6T4NRiFJmE6s1X3hE9ffp9FSww1f+12etjYahwQDnk5Xit/0vZODDe24wk3CZ1N/caiMf78kJ56hdfmlHcqjc/lL9FiZ+jEeNFoApCi5WXE8tkv2bmqcjI/NCu/Xi6lOjWKYT7X8yjuBqZvnKBHKHeVEJAZ6rnWDeRRbT+BRMTAawXQ3CACAyBHGtvznCUn0XrlvDydaDXxyxM/yvtXQnAdgCLBXzIkA8An2hD/ahXSOvjqh6Ztrb7U6mNLKD1UU2RVQ1rtwDaSXXtXK857Bqa6GdPl2e5/KR84VsHP1+1QyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ApB1Vxngk7d0gpi7VavlKGPmX4qx5JeDH9qyDLnciQ=;
 b=Z1tsEQxw9nLNFwCXKAcKSJNu/IzQf42Z7eWCtSm4/vyOvTYPvhgAPmT6UzSckVvap1R+6zxQYyacknqgYVlc1gHtI+CSXlSBFlEzyG5ZQVaygjf6fMc2je9QTSErGzQYICFmYqxx3dhZKE6irbG+uvREKQwoCj+GJRGF2iL8sS8fxffvf0iSgJS117doIfFNyUGHJf8g6iIkLqAJCMFYFafesFfXkZt48QPitRZBIdn2gsys/WrEudI9YGT+jyejx2OwlIYGca+93QX0xVBBr4HMDQyICsmP3faTBQLoiM+anMj4zHZKZnuU3qsxloEz1dkfvOxRb/YiH5BJ8+7Cdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ApB1Vxngk7d0gpi7VavlKGPmX4qx5JeDH9qyDLnciQ=;
 b=OQEl7s8YILlE2umtbpRqHUYAlepjuQK9ngDCG2vGYklfthTRBrzSA5d/vmIt0oOdGu2IP9dvNh/AIkJxElokDeq7YncQkep8bT1Cj9xVJE9FJOz9yVflvAxPJ8oq022xNummvDEXwksVsHzNDFCGI9CQQc0AumabmcDqX50roQL9NY1uXQSYHYzPSg+gzdxG3Jvv+bTtJiy0beigKmNXl4VRASbJryyqedlF5uhH86joUNYOVkT+Q26D+NoAmjCofRlarPPRqelNtZOUuZ0yM1OtUtGBb2bnj4STNF7SYK5uWYHl41RvFV9X5VmqMTScA12/DGkglTBlwVy/wfySRQ==
Received: from DS7PR03CA0270.namprd03.prod.outlook.com (2603:10b6:5:3b3::35)
 by MN2PR12MB4360.namprd12.prod.outlook.com (2603:10b6:208:266::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 00:21:21 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::80) by DS7PR03CA0270.outlook.office365.com
 (2603:10b6:5:3b3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.19 via Frontend Transport; Tue,
 23 Sep 2025 00:21:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 00:21:21 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Mon, 22 Sep
 2025 17:21:11 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 22 Sep
 2025 17:21:10 -0700
Received: from build-bwicaksono-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 22 Sep 2025 17:21:10 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <suzuki.poulose@arm.com>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH v2 5/5] perf/arm_cspmu: nvidia: Add pmevfiltr2 support
Date: Tue, 23 Sep 2025 00:18:40 +0000
Message-ID: <20250923001840.1586078-6-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|MN2PR12MB4360:EE_
X-MS-Office365-Filtering-Correlation-Id: aeed8419-e5bf-4c2b-96bb-08ddfa371f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?otFjBXWDuY6rN7KcAs/pGBtXgdwlujB0xI3hUCO9BcXxGN4uUI7HrkRVpJna?=
 =?us-ascii?Q?5rTTLewHCeIFaImjFJe0eE2riP2H43q/mdXB8mden5E6YaWqZndIxDytpvJ7?=
 =?us-ascii?Q?fS+ZmdLworjnrb41Orxu/kBwyX2C+73YT4WwtspjUzePgNkVNZBiZcilGZd3?=
 =?us-ascii?Q?8rvtHjPu+yI7rGrrMlV4cLJyOwQGg5lzBOG2AT93lXHT4hBkuW4Zzsi3gI+C?=
 =?us-ascii?Q?BC+/lWEkcuo2+SnfWARs88q7ST6TIR9m/Bh82bN8BQHnVzVmeGACzm9r+tqD?=
 =?us-ascii?Q?fmEYy93CVn5Z7vFGtAwW+m4VPif0CilSxrC+c1rwZ4dlWMFOVXOz5LraxEKR?=
 =?us-ascii?Q?908Jb4g4V0LasgiyNpzRa6FT51UVFYRFiiqUjtFdeIOm2kDPp9nc9g+Z1cOT?=
 =?us-ascii?Q?kaoyKgU7vQp9xySnxh72R2MViccWPlylnkRSFju/PTk+DL9HcxPhF/stc+rU?=
 =?us-ascii?Q?KDnD8/iRau4vJkYkCcVXg4Ulc/du3+F/PKVJCIBda+PymG5dlDKlyUGmTgC3?=
 =?us-ascii?Q?CjX2iVctZIzJBn0z/DBd9YwDt9kqver+C4NSJ3A06hUEAYHG7TYm5R1oaZtX?=
 =?us-ascii?Q?J2X6/e7LRAYzZRKPCBJSonZHunTkqhBetctMdsyNkAFY5yJNINF/dWPEeK1R?=
 =?us-ascii?Q?ju1FflLm8t1jRmkO2rq3/ggbwMhv3rGyeI3CWtEm9x3Pbpn4jI1oIgwPK5Bo?=
 =?us-ascii?Q?4qq0Lbg3u3vtU48CHZRKOvrI89HtK+00jEcL2x+VldZQ3XpXaah6bRwdEfh5?=
 =?us-ascii?Q?MgFUAYtL7MuNHHl4OgU2wY1AupdUXeUTUvHZUsQWnoLhzpeY+x9A64o4c0wC?=
 =?us-ascii?Q?6cxOVmwJCIBACNm+MRqzF2E+qpg9MrNNYdstW7LShVw9wKvHzKd4O02jdeoI?=
 =?us-ascii?Q?kGhTyI+pV2SpS3wGIXp8FJnR3hYV+zNPHnITevEqwdohSTKQ0AWOpQ60R/sS?=
 =?us-ascii?Q?Kn0hmq1MnCbSPWMSvA7ZyyywYWNB4+NO8/5jOj6QEj/Wc+EL0RpBWSYENx+e?=
 =?us-ascii?Q?WSLkKY7u5dZ7ybD758J5Ics65lc4mjNQbT8cP+jOj9FWmcTTy2O6nNDdDDyn?=
 =?us-ascii?Q?27wftofxjMEI9zl3Rwv0qkubqzrDg7vC4JpVcH7Nb+sOBAnLRclE+L7xt331?=
 =?us-ascii?Q?nZ/ls7BmJi3X4NVSecfaBcRA09NFQ5vpDYJr6IAT0+DIlcQHPNYv27JBCgkP?=
 =?us-ascii?Q?YRZ/aqxlHpQlMYJR1awbS0nwEScfWjYQeebDpRUU3fIihUK3m3bFzWXH1pe3?=
 =?us-ascii?Q?ev9EmTgA6jIq+epgzh38Xm8R/y1Z4TDnWeULEtJ9q4jtFzgCACVyjF6QRvtS?=
 =?us-ascii?Q?0Di/1uRrbnNw4482hp3UYRouS5k9iR94r6j5hoZ18KdqysZL/d0okA8gF+cG?=
 =?us-ascii?Q?QYnvkBOA4Qify7JToPMF0zEJ7OEx0p0yT6nuOjMMO7xxcL9srnw/E7wnUbNM?=
 =?us-ascii?Q?rIQCcv8hinC3IMr1ucXRLAKs9D4o1BWM4aY8vtCZ7YvKE1sncCfSgO5d0FXA?=
 =?us-ascii?Q?l4pvZHYeXtOksJimpxeOtnvSwwwzwpOlZVG8?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 00:21:21.3325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeed8419-e5bf-4c2b-96bb-08ddfa371f7c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4360

Support NVIDIA PMU that utilizes the optional event filter2 register.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/nvidia_cspmu.c | 176 +++++++++++++++++++-------
 1 file changed, 133 insertions(+), 43 deletions(-)

diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index ac91dc46501d..e06a06d3407b 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -40,10 +40,21 @@
 
 struct nv_cspmu_ctx {
 	const char *name;
-	u32 filter_mask;
-	u32 filter_default_val;
+
 	struct attribute **event_attr;
 	struct attribute **format_attr;
+
+	u32 filter_mask;
+	u32 filter_default_val;
+	u32 filter2_mask;
+	u32 filter2_default_val;
+
+	u32 (*get_filter)(const struct perf_event *event);
+	u32 (*get_filter2)(const struct perf_event *event);
+
+	void *data;
+
+	int (*init_data)(struct arm_cspmu *cspmu);
 };
 
 static struct attribute *scf_pmu_event_attrs[] = {
@@ -144,6 +155,7 @@ static struct attribute *cnvlink_pmu_format_attrs[] = {
 static struct attribute *generic_pmu_format_attrs[] = {
 	ARM_CSPMU_FORMAT_EVENT_ATTR,
 	ARM_CSPMU_FORMAT_FILTER_ATTR,
+	ARM_CSPMU_FORMAT_FILTER2_ATTR,
 	NULL,
 };
 
@@ -184,13 +196,36 @@ static u32 nv_cspmu_event_filter(const struct perf_event *event)
 	return filter_val;
 }
 
+static u32 nv_cspmu_event_filter2(const struct perf_event *event)
+{
+	const struct nv_cspmu_ctx *ctx =
+		to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
+
+	const u32 filter_val = event->attr.config2 & ctx->filter2_mask;
+
+	if (filter_val == 0)
+		return ctx->filter2_default_val;
+
+	return filter_val;
+}
+
 static void nv_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
 				   const struct perf_event *event)
 {
-	u32 filter = nv_cspmu_event_filter(event);
-	u32 offset = PMEVFILTR + (4 * event->hw.idx);
+	u32 filter, offset;
+	const struct nv_cspmu_ctx *ctx =
+		to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
+	offset = 4 * event->hw.idx;
 
-	writel(filter, cspmu->base0 + offset);
+	if (ctx->get_filter) {
+		filter = ctx->get_filter(event);
+		writel(filter, cspmu->base0 + PMEVFILTR + offset);
+	}
+
+	if (ctx->get_filter2) {
+		filter = ctx->get_filter2(event);
+		writel(filter, cspmu->base0 + PMEVFILT2R + offset);
+	}
 }
 
 static void nv_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
@@ -210,74 +245,120 @@ enum nv_cspmu_name_fmt {
 struct nv_cspmu_match {
 	u32 prodid;
 	u32 prodid_mask;
-	u64 filter_mask;
-	u32 filter_default_val;
 	const char *name_pattern;
 	enum nv_cspmu_name_fmt name_fmt;
-	struct attribute **event_attr;
-	struct attribute **format_attr;
+	struct nv_cspmu_ctx template_ctx;
+	struct arm_cspmu_impl_ops ops;
 };
 
 static const struct nv_cspmu_match nv_cspmu_match[] = {
 	{
 	  .prodid = 0x10300000,
 	  .prodid_mask = NV_PRODID_MASK,
-	  .filter_mask = NV_PCIE_FILTER_ID_MASK,
-	  .filter_default_val = NV_PCIE_FILTER_ID_MASK,
 	  .name_pattern = "nvidia_pcie_pmu_%u",
 	  .name_fmt = NAME_FMT_SOCKET,
-	  .event_attr = mcf_pmu_event_attrs,
-	  .format_attr = pcie_pmu_format_attrs
+	  .template_ctx = {
+		.event_attr = mcf_pmu_event_attrs,
+		.format_attr = pcie_pmu_format_attrs,
+		.filter_mask = NV_PCIE_FILTER_ID_MASK,
+		.filter_default_val = NV_PCIE_FILTER_ID_MASK,
+		.filter2_mask = 0x0,
+		.filter2_default_val = 0x0,
+		.get_filter = nv_cspmu_event_filter,
+		.get_filter2 = NULL,
+		.data = NULL,
+		.init_data = NULL
+	  },
 	},
 	{
 	  .prodid = 0x10400000,
 	  .prodid_mask = NV_PRODID_MASK,
-	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
-	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
 	  .name_pattern = "nvidia_nvlink_c2c1_pmu_%u",
 	  .name_fmt = NAME_FMT_SOCKET,
-	  .event_attr = mcf_pmu_event_attrs,
-	  .format_attr = nvlink_c2c_pmu_format_attrs
+	  .template_ctx = {
+		.event_attr = mcf_pmu_event_attrs,
+		.format_attr = nvlink_c2c_pmu_format_attrs,
+		.filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
+		.filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
+		.filter2_mask = 0x0,
+		.filter2_default_val = 0x0,
+		.get_filter = nv_cspmu_event_filter,
+		.get_filter2 = NULL,
+		.data = NULL,
+		.init_data = NULL
+	  },
 	},
 	{
 	  .prodid = 0x10500000,
 	  .prodid_mask = NV_PRODID_MASK,
-	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
-	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
 	  .name_pattern = "nvidia_nvlink_c2c0_pmu_%u",
 	  .name_fmt = NAME_FMT_SOCKET,
-	  .event_attr = mcf_pmu_event_attrs,
-	  .format_attr = nvlink_c2c_pmu_format_attrs
+	  .template_ctx = {
+		.event_attr = mcf_pmu_event_attrs,
+		.format_attr = nvlink_c2c_pmu_format_attrs,
+		.filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
+		.filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
+		.filter2_mask = 0x0,
+		.filter2_default_val = 0x0,
+		.get_filter = nv_cspmu_event_filter,
+		.get_filter2 = NULL,
+		.data = NULL,
+		.init_data = NULL
+	  },
 	},
 	{
 	  .prodid = 0x10600000,
 	  .prodid_mask = NV_PRODID_MASK,
-	  .filter_mask = NV_CNVL_FILTER_ID_MASK,
-	  .filter_default_val = NV_CNVL_FILTER_ID_MASK,
 	  .name_pattern = "nvidia_cnvlink_pmu_%u",
 	  .name_fmt = NAME_FMT_SOCKET,
-	  .event_attr = mcf_pmu_event_attrs,
-	  .format_attr = cnvlink_pmu_format_attrs
+	  .template_ctx = {
+		.event_attr = mcf_pmu_event_attrs,
+		.format_attr = cnvlink_pmu_format_attrs,
+		.filter_mask = NV_CNVL_FILTER_ID_MASK,
+		.filter_default_val = NV_CNVL_FILTER_ID_MASK,
+		.filter2_mask = 0x0,
+		.filter2_default_val = 0x0,
+		.get_filter = nv_cspmu_event_filter,
+		.get_filter2 = NULL,
+		.data = NULL,
+		.init_data = NULL
+	  },
 	},
 	{
 	  .prodid = 0x2CF00000,
 	  .prodid_mask = NV_PRODID_MASK,
-	  .filter_mask = 0x0,
-	  .filter_default_val = 0x0,
 	  .name_pattern = "nvidia_scf_pmu_%u",
 	  .name_fmt = NAME_FMT_SOCKET,
-	  .event_attr = scf_pmu_event_attrs,
-	  .format_attr = scf_pmu_format_attrs
+	  .template_ctx = {
+		.event_attr = scf_pmu_event_attrs,
+		.format_attr = scf_pmu_format_attrs,
+		.filter_mask = 0x0,
+		.filter_default_val = 0x0,
+		.filter2_mask = 0x0,
+		.filter2_default_val = 0x0,
+		.get_filter = nv_cspmu_event_filter,
+		.get_filter2 = NULL,
+		.data = NULL,
+		.init_data = NULL
+	  },
 	},
 	{
 	  .prodid = 0,
 	  .prodid_mask = 0,
-	  .filter_mask = NV_GENERIC_FILTER_ID_MASK,
-	  .filter_default_val = NV_GENERIC_FILTER_ID_MASK,
 	  .name_pattern = "nvidia_uncore_pmu_%u",
 	  .name_fmt = NAME_FMT_GENERIC,
-	  .event_attr = generic_pmu_event_attrs,
-	  .format_attr = generic_pmu_format_attrs
+	  .template_ctx = {
+		.event_attr = generic_pmu_event_attrs,
+		.format_attr = generic_pmu_format_attrs,
+		.filter_mask = NV_GENERIC_FILTER_ID_MASK,
+		.filter_default_val = NV_GENERIC_FILTER_ID_MASK,
+		.filter2_mask = NV_GENERIC_FILTER_ID_MASK,
+		.filter2_default_val = NV_GENERIC_FILTER_ID_MASK,
+		.get_filter = nv_cspmu_event_filter,
+		.get_filter2 = nv_cspmu_event_filter2,
+		.data = NULL,
+		.init_data = NULL
+	  },
 	},
 };
 
@@ -310,6 +391,14 @@ static char *nv_cspmu_format_name(const struct arm_cspmu *cspmu,
 	return name;
 }
 
+#define SET_OP(name, impl, match, default_op) \
+	do { \
+		if (match->ops.name) \
+			impl->name = match->ops.name; \
+		else if (default_op != NULL) \
+			impl->name = default_op; \
+	} while (false)
+
 static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
 {
 	struct nv_cspmu_ctx *ctx;
@@ -330,20 +419,21 @@ static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
 			break;
 	}
 
-	ctx->name		= nv_cspmu_format_name(cspmu, match);
-	ctx->filter_mask	= match->filter_mask;
-	ctx->filter_default_val = match->filter_default_val;
-	ctx->event_attr		= match->event_attr;
-	ctx->format_attr	= match->format_attr;
+	/* Initialize the context with the matched template. */
+	memcpy(ctx, &match->template_ctx, sizeof(struct nv_cspmu_ctx));
+	ctx->name = nv_cspmu_format_name(cspmu, match);
 
 	cspmu->impl.ctx = ctx;
 
 	/* NVIDIA specific callbacks. */
-	impl_ops->set_cc_filter			= nv_cspmu_set_cc_filter;
-	impl_ops->set_ev_filter			= nv_cspmu_set_ev_filter;
-	impl_ops->get_event_attrs		= nv_cspmu_get_event_attrs;
-	impl_ops->get_format_attrs		= nv_cspmu_get_format_attrs;
-	impl_ops->get_name			= nv_cspmu_get_name;
+	SET_OP(set_cc_filter, impl_ops, match, nv_cspmu_set_cc_filter);
+	SET_OP(set_ev_filter, impl_ops, match, nv_cspmu_set_ev_filter);
+	SET_OP(get_event_attrs, impl_ops, match, nv_cspmu_get_event_attrs);
+	SET_OP(get_format_attrs, impl_ops, match, nv_cspmu_get_format_attrs);
+	SET_OP(get_name, impl_ops, match, nv_cspmu_get_name);
+
+	if (ctx->init_data)
+		return ctx->init_data(cspmu);
 
 	return 0;
 }
-- 
2.50.1

