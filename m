Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1D12E284F;
	Tue, 12 Aug 2025 23:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755041917; cv=fail; b=FB+P198hxSDvrfiDoYJsHpf3M025Qfz+YroegyYTcyRaOwO6skA4MwRIkT1N5yvSKYtEQOnQ+Vzjbj6TOUOsSYqJWmQpm95GuCFBnOIXG+ui5y/SstmBFXmFNLzBHBE6Wtfx3c45m7FBiVG7TwjM2d8q95HnZBJK/siYwkcL2hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755041917; c=relaxed/simple;
	bh=xhOubbpUQLz3Y/SDTa36Ypd8wE0Ldxke9IWsJ5ycwzE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WUSQXk85zrv+HpZYF0l2/9xHtRD1zSY/EiYdlq8tOPvfucsMWYnsKy/25tHo0MBFuKtQRvVovPBty8jasyAfq6c/BqNzFumnfd0srJxJtnvXK2i6wTOXWj9rBIYdACcKLFwB0svyG/cHVNIPI5AYvobAUdfoAdWsik5lsLHgcAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a7pY77NV; arc=fail smtp.client-ip=40.107.93.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a7pY77NV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUi7xjiYH7533Oig9+AuOy3h//uoZAscKBuuc44dFh/alq3zXUQ/py8Ow8r1eX1D7xUkICqzNgKFJGPkrpdzXupipWOWfEVPh5XM64H5gsRVvm57imfV8VPtpmL1+4u3FlMCpm9I1Heaxd71xLo8D48SVLTLhI2N6M1Y8nl9+wRpNAMuWKAN3Z9JkqZZ1L72JlwkmqVTak5+CK1r4H+OijDLl+1L8Ee+Z3QYWS/SbXtc2wjrCkDw8QbXyVx3lAUkOAy4+6Kj7t/f5voiTrlV7NkhIvMRxAx/I6GorwsIGTu1pTS/3G95N2bApwrmZzcRjyG+V+RNo6MjgvVWTme8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRVTO5TYKLQpXiJhmRSHeF6dodri11gdX5oSZiEhqSg=;
 b=K9OpGsVLwIRRnyxnbQNm1wtx5KRbD8Htt2Hao4L3rv2TmkM0JK+ufhJUGkcLbBfY+k5ArdjtYBerSAJurdOZNx58RoUUtwTZdWvxQQz+JUR2SOS2BXkJjJQQ2d+fqVbOGLrioV064x39slBiuDz0MhXhbTt9W4UnMcCm4/olILUOzVmqUZJvDxOiAkkRLr3DJiI+/6Ilg2sduz6N5cY2WwqLvbjSYLYJXlp2z7g74+Yt/xvXPl7nhcTulbH5B57UnBy5GWmJ3kNxpsGNz3j5P1VzC+HBzZwMlJ6m0puoGy/n5ehlQ1z6jUvCYAO+y7jZ3TDyG0OaSC6Hxo9HaWiOSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRVTO5TYKLQpXiJhmRSHeF6dodri11gdX5oSZiEhqSg=;
 b=a7pY77NVFMxKVpMEhYtAx6bkwQkQO60XwqB8qmziSsFG0t0vkrTfslcKnY9kfoR7qaFVEW+mvMU1IMyeWK9q3cBFzUMPinf0aVnAM1CZWhc/Q0wLBgHI3PbjkknNcYrUsySIAs7S9qyBbqNav96iA2Uk2kcs/j5a4gEVZoSnJjwOWDUuB4ZBCu0b+vtqH/LQohw8Tsm985meJC4sjk1vFWCVBsluQefDV1859768LBvxjZ3uvGfizz4hoqy+oF9JLzelIkmdcjIV8UbB93dZAUY0Q2To77taMvQK4ArQ3yziRjEdo+CXu8EbmsAPMOu1cL0PhhNooxA6F0NpB/5jmw==
Received: from MW4PR04CA0323.namprd04.prod.outlook.com (2603:10b6:303:82::28)
 by DM4PR12MB8569.namprd12.prod.outlook.com (2603:10b6:8:18a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Tue, 12 Aug
 2025 23:38:31 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:303:82:cafe::52) by MW4PR04CA0323.outlook.office365.com
 (2603:10b6:303:82::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.14 via Frontend Transport; Tue,
 12 Aug 2025 23:38:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 23:38:30 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 16:38:16 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 12 Aug 2025 16:38:16 -0700
Received: from build-bwicaksono-focal-20241114.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Tue, 12 Aug 2025 16:38:16 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <suzuki.poulose@arm.com>,
	<robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH 5/5] perf/arm_cspmu: nvidia: Add pmevfiltr2 support
Date: Tue, 12 Aug 2025 23:34:11 +0000
Message-ID: <20250812233411.1694012-6-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812233411.1694012-1-bwicaksono@nvidia.com>
References: <20250812233411.1694012-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|DM4PR12MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd6033c-1df6-4382-a6b4-08ddd9f95846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IwCaLgg/yKAxuK+uUvGGFNP9Jut+yddtmmcC0YR4064jXJJZEHdLkmnWBHEW?=
 =?us-ascii?Q?mC3NIoFqqcFgGKO4jLhf2kYRrcPYfsiIS0usYJnpOFZCob0hZeM9/mpmBLcT?=
 =?us-ascii?Q?SRIdrtnValFR3f22M8vjWGJ03yza38lTeZZ32+I0CoyoNW0Iv2k/SPS2agbS?=
 =?us-ascii?Q?pyor9X6ASdcIfvr767dD0FS0n5a+YmTT4HZUdAto+Wjl+1hKDSl2OEtXFalY?=
 =?us-ascii?Q?WEoQytT+2j74lWWbiFcTuaHt8j4VusG9/O1geXhXsNOFBJy6mXdD7UkP7D4r?=
 =?us-ascii?Q?FrvJdnSl3KRDtER4dpXI7duUgpGs11Dh5+D0/Q4s57oLjVCiJovPyCx6P8yX?=
 =?us-ascii?Q?A/n1TfYDI7zOx1V0zRVXlEKDAR76oPco1IdnPwoM3HQnTYpfcqowx1Fm0tdJ?=
 =?us-ascii?Q?K84DsLvahD7lfqd0o7ToThFkZAn2q3OvrWCcnSBvds1EesuqOHtaL1+NisXz?=
 =?us-ascii?Q?mpq5bn4gs8kd9wj/MwIbYsOiyTt3+gWCTC+LOUpNE6vEJoO4hDKi9bB3eU50?=
 =?us-ascii?Q?36SXFhTFzeCNRsbYKQf4j7ApLY4MzwVfiN3OsNgQa1734jFA+bV5yQSC+WST?=
 =?us-ascii?Q?cJa8IInotjKxuRztzYVWy0KNOi0RxHB7xbZDo1U8dZ0FiIA9ti8szzdspcb5?=
 =?us-ascii?Q?m8Z7uRy4tS2xDU1PJ/BfgBBrXKF1m6k2qDudAtcHrVeCNFvAdBWD1X7VSfgo?=
 =?us-ascii?Q?uHpRmKGecGDI2bYcrrxqusjHEHxMrRD0Dfs4OftH5Bo3dKtzQUBZIidoLQ5I?=
 =?us-ascii?Q?5pOi5FU9oxYT1t1dfndfEtkaM7C9G73Fok31yXhuTn8aavoXdyxl7zhsUwOC?=
 =?us-ascii?Q?94WFpxsBD7UhfdeuKm6SGnlux5AL4PuR/qSXLSQftcV2ftFcz9ayNQ2/K3WK?=
 =?us-ascii?Q?/r607dEC1W1Z75VQdimahFkHckihYI0OzDCubOBO8zNu5lZ4k+u5BKmzvVLb?=
 =?us-ascii?Q?YWaeM+g/H6JCqx2u7WqFwUEx5NVUDnALJhx1puwaNertpLuWi/KY+asAqv7e?=
 =?us-ascii?Q?sSvZWN/uSmTleGf8mjoPiLOOUFYgm54QrWwHTah5oLwPJurfWQ6nzpJk8Kpd?=
 =?us-ascii?Q?CXMnKpyXGwzm3TFajycBuNel/KRsOBwaeOf2V+THx/jrQMKo0gjORH1Bcgrb?=
 =?us-ascii?Q?6peM45ni1j060mNRP3C2l8Oh2ZQj5bokL6vap4cAznx0chVL8gKOhAkseHOd?=
 =?us-ascii?Q?v2UW2hF7tJXQOh5rczx36mE/y64m8tI8ht0um1aHmiauP7oq/6Y2Jkwv+kQi?=
 =?us-ascii?Q?WwbkBD+29sJMCRtGbH4jrlGVLswpA8pXtgHjR5ZXPbJ1rjxTJgM9W4NkbQUV?=
 =?us-ascii?Q?tv9G2NSteTznjY69ejCSwx59pGC0KvpfRZ+lPDBt0WW6JBEDvFl4r5CTtAnS?=
 =?us-ascii?Q?jlL2VOu3O0UAED0GRm3/tLYyM4qerFSNDkOoQV7zgAca7ThfasmWlElfOCZm?=
 =?us-ascii?Q?eKOt9T1CQ1fxDN2vtbTi65uRCfPR3u0XRxOJAagPROP05oiBLQ65zyoYbjZD?=
 =?us-ascii?Q?wbNYNOKldxZdcJ8sFSkhJ3CNFXx2ond9SGjA?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 23:38:30.7283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd6033c-1df6-4382-a6b4-08ddd9f95846
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8569

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
2.47.0

