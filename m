Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216D64F7CD8;
	Tue, 29 Sep 2026 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676010; cv=fail; b=NzpujanCa3nVIV+Uz6lYAZsdkON04CeEWEYvnDgTWQYlapA9MLKTaqqva3GTecoWyP+NEYEq8J6MF/J3/jvyf+c0WqvOg6Sm7sFUBxyi9xi9bCV0t3pVdUgsCPVa59t9G5nYGHDdSS97GFGtxNLg0Qe8LXisYq5kiJILCi9Uyq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676010; c=relaxed/simple;
	bh=lAH80bLZUPjcb9Ey3TeEaM/Zx0+xjeo3sNnYRR3DTr8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HEpBqwoWu0Kizl0m7FLMwr1g3ZNWzj7O1byvXSGh0Iy1BWObRzJA7WsgixO8VIHn5o9XnmoE9/+wWFh+3uwP8u2zjgNC5sor7tatmRl0y7/gMLWKUZJpqUj8ZgRC9xyzvFJIvFintBhsf/WGbgzeAUK3oanIFS/xPOqwzXDY8cQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iwcuVAz5; arc=fail smtp.client-ip=40.93.194.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iwcuVAz5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYw5KbhPFn8EGqVkFPS44or1Z2ZbJa37z3xgUKyTA7qjyPC2hj307dEO/+K5hvWks+eAjooj5YCT+rvO0oLFq3HroFvWQFjx7tDaOL7SXAsQSwuL2oBIF46ECIRTKIqXJyaXvYG7olkuQxKraR/YsVQIXV9IkyB2mWS6cHAB1H3owGujKxMtpvvnVidI5VMI90iYM4Vgi+tDgsd2vxl1AwymDYNTW6ZV1Y6OMry1K5ssa5lXkiYaeFK5fhWEuzc/1CIQ219r1pVNeryKxNdMtrPphG+U7RYmCiO2hUAx8SuPSF/uj4Pw/8yoJGwXM6RnJ/7A+1OvUKCaE9VdGDDxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIgGCGMLDKny2igzUWbZYs4k1/lkK42FDCs8uoE+kB0=;
 b=vi2/qVpP7JRkLJgRa2CYLXpSWXvc8i5hZBd7cSkXTzTYKmv2tdpNqTrRyVpgc0bV5vc4EK0oWJYoG0LHS9Pgh30q8Bi6ZeQae1/19xvCq3uXj5LlX4yJA4i5hNtYGLml7FR7LzH+CKgWJTFcTJgdUKWpcsG5nZL8DFLZPGk4C3tIwGUNsSIaoJzuDQ2OKY5gJ4R0sAoO7RFv6VrQaqK0Xu3AT8DDfzrIA+uqUn7CDqeUrUBSkifdmrt2VnE4x5iwUkROILEXWY7OHlwZyQ7zG9jGzm/tW8CR5vB0o9DzjDX41+zl7IK2XEV9X9i5q1hRQA1/PT9KROHApmjrbdf5aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIgGCGMLDKny2igzUWbZYs4k1/lkK42FDCs8uoE+kB0=;
 b=iwcuVAz5bs9f8qy68rC/bulHrdXGu5B+hjlukVJBuCzTySOAtzWZcQC1xtpJCN8JWFC7lqZm/U+UMhxGRgfT8fa6X+OodIsskFPLESqmuHtRBjC8Wk1vrOv2WLvgtf8AMm6ZMPA4namXOJwjnaNFjzw31FKxod6vc0pyuDaE9fZTE8bEMAFqYlOu1szA6aw4D90af84CjGfQYd7no4Q8XhyAiZpP5W3Gc2py1b+W14GIRHM1iLmodwYwCE78ulXHXI8OXPrdYwDy+aoJSRYZZMcSZuzn239A1X34/DG4Dkhj5PQs91wDNwfcMsQCk18sp3/68Bg/j+Xcr7r0vHyD/w==
Received: from CH5PR02CA0020.namprd02.prod.outlook.com (2603:10b6:610:1ed::25)
 by CY1PR12MB9628.namprd12.prod.outlook.com (2603:10b6:930:105::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 09:59:52 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::19) by CH5PR02CA0020.outlook.office365.com
 (2603:10b6:610:1ed::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 09:59:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 09:59:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 02:59:34 -0700
Received: from build-anrao-noble-20260906.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 29 Sep 2026 02:59:34 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v5 3/5] firmware: tegra: bpmp: Add the Memory Bandwidth Throttler ABI definitions
Date: Tue, 29 Sep 2026 09:59:13 +0000
Message-ID: <20260929095915.2215685-4-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929095915.2215685-1-anrao@nvidia.com>
References: <20260929095915.2215685-1-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|CY1PR12MB9628:EE_
X-MS-Office365-Filtering-Correlation-Id: f06a6871-1e74-4458-7ee7-08df1e1067b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	AO1y4AVfxL+n5tG9U7ZmkadsQN/xAoOLNNKz8DSIMfksk/0OPATiNcXSwhkhe0VD/YhOzQ0CPzDiFIlm0IRHfayRUzsGBIOTHi2hD1EHcOCkL1z5lftOL7C8KUVtCy4rBbESQA8fJek1N6fWozpwuT97kKDuSQDK0uFhvW9iL/W8aZnPw4JNXpq6+NMuTRf44fKkwz1PYt6aBpIpgmYmBMeB10+OPo5K9p/jvc6awnTUxOiH67awdGJLC3MuLLOuH07P8BThzUzRk6OCQpsfyIsl4KJjDpvE/3tXoiPmQSgrnnu+MulVC/tmUwRTY2Od7hJAtZneZbKR4yNcX8gAm8Pm4I5+NoR6cUOwjnLP/nLCB0XFG613KK3R3vIKIPxKN9J0IIpaRz5M4mDkFIx8Na9IJlzTzQUHuh4QeHgm9ouYg4hNpgAWjwhn7cIPg6s0iMKkYczf7b65a8dIpHirN/X07hqzhVc0/XHFbwVjwh1uMrYYT6rqd7KmuZOFs9iribCpmqR/wz+UOd8C8WLtvGBvE5rP7FxTTX/ktYiCZVuFIhl9YKG3n98SMD4oGgX+Kbr7uGixGaHyTbaXpHym7lyE/LFT5S8s5DUYkqRLgOKcQn8GmKT9rJylppV0hvTjGhss4KoFo+55m1IqInGwozBOGYIihgvILq43vR1m+XEgGEhUzLsZO34y/WNBH6RO+Dix6E0u0tgbPUt9G7Skdg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ysub63pK6Dmfa+NqC/qG3VQqr2UjU0D9VxrtrP4u12gqWmd638bdrGJ3ushex9439XGaLuvNmuLmDXl0raE43pzNYRS8VFVMiEDbk6tmrJ7/3U+vGhRAhWTLygRJm25UexvINWxQ9cfiHdF4raCnFPtpptnmC8d3rHaF1E1q7oc+KEVN2MlM62ouMKAWWfSP+exp6LF2bqmBa8K3FmfB/rLYmNodNXEZsEtYJkBdJXkybBLVa8cNhdfHHGi6eUhKkddfTDotTwfX2LhqAWsuIx0QcyE02baY5tytSPu1q7RvNnJbFwY64rS/u8eNt2wcRsk8/iwd6rpeQWU04Rtr2Hv9/Omn2Wxh0pgZ9A4AEmAJUjrifSz+MvWnjNsoD05iJXaC5bgTnjbOMYEyEOCRUSh5tq7bT82G3m1Dv0HoUiKFlBUoVOqim+1aLsHk7+Ea
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:59:51.6535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f06a6871-1e74-4458-7ee7-08df1e1067b0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9628

Different workloads can place different memory-bandwidth demands on the
system. BPMP firmware of some Tegra platforms provides Memory Bandwidth
Throttler (MBWT) controls for PCIe and GPU connected over chip-to-chip
link (NVCLINK) traffic on the path to DRAM so software can query and
program those bandwidth caps.

The MBWT controls are not exposed through ordinary host MMIO and are
accessible only through BPMP firmware requests.

Add the ABI definitions for the MBWT message request (MRQ), including
the MRQ ID, sub-command IDs, and request/response payloads needed to
issue the MBWT control requests defined by BPMP firmware.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
Changes since v4:
- No change.

Changes since v3:
- No change.

Changes since v2:
- No change.

Changes since v1:
- Use NVCLINK spelling consistently.

 include/soc/tegra/bpmp-abi.h | 161 ++++++++++++++++++++++++++++++++++-
 1 file changed, 160 insertions(+), 1 deletion(-)

diff --git a/include/soc/tegra/bpmp-abi.h b/include/soc/tegra/bpmp-abi.h
index 5c64b3e02211..6f25126f5fb8 100644
--- a/include/soc/tegra/bpmp-abi.h
+++ b/include/soc/tegra/bpmp-abi.h
@@ -587,12 +587,13 @@ struct mrq_response {
 #define MRQ_HWPM		93U
 #define MRQ_DVFS		94U
 #define MRQ_PPP_PROFILE		95U
+#define MRQ_SOCHUB_MBWT		96U
 
 /**
  * @brief Maximum MRQ code to be sent by CPU software to
  * BPMP. Subject to change in future
  */
-#define MAX_CPU_MRQ_ID		95U
+#define MAX_CPU_MRQ_ID		96U
 
 /** @} */
 
@@ -6686,6 +6687,164 @@ struct mrq_ppp_profile_response {
 /** @} PPP */
 /** @endcond */
 
+/** @cond (bpmp_tb500)
+ * @ingroup MRQ_Codes
+ * @def MRQ_SOCHUB_MBWT
+ * @brief Configure per-virtual-channel bandwidth caps for a bandwidth group using
+ *        Memory Bandwidth Throttler (MBWT).
+ *
+ * * Initiators: Any
+ * * Targets: BPMP
+ * * Request Payload: @ref mrq_sochub_mbwt_request
+ * * Response Payload: @ref mrq_sochub_mbwt_response
+ *
+ * @addtogroup SOCHUB_MBWT
+ * @{
+ */
+
+/**
+ * @brief Sub-command identifiers for #MRQ_SOCHUB_MBWT.
+ */
+enum mrq_sochub_mbwt_cmd {
+	/**
+	 * @brief Check whether the BPMP-FW supports the specified
+	 * #MRQ_SOCHUB_MBWT sub-command.
+	 *
+	 * mrq_response::err is 0 if the specified request is
+	 * supported and -#BPMP_ENODEV otherwise.
+	 */
+	CMD_SOCHUB_MBWT_QUERY_ABI = 0,
+	/**
+	 * @brief Get bandwidth cap for a virtual channel
+	 *
+	 * mrq_response::err is defined as:
+	 *
+	 * | Value          | Description                                    |
+	 * |----------------|------------------------------------------------|
+	 * | 0              | Success                                        |
+	 * | -#BPMP_ENOTSUP | #MRQ_SOCHUB_MBWT is not supported by BPMP-FW.  |
+	 * | -#BPMP_EINVAL  | Invalid request parameters.                    |
+	 * | -#BPMP_EIO     | Failed to retrieve the bandwidth.              |
+	 */
+	CMD_SOCHUB_MBWT_GET_BW = 1,
+	/**
+	 * @brief Set bandwidth cap for a virtual channel.
+	 *
+	 * mrq_response::err is defined as:
+	 *
+	 * | Value          | Description                                    |
+	 * |----------------|------------------------------------------------|
+	 * | 0              | Success                                        |
+	 * | -#BPMP_ENOTSUP | #MRQ_SOCHUB_MBWT is not supported by BPMP-FW.  |
+	 * | -#BPMP_EINVAL  | Invalid request parameters.                    |
+	 * | -#BPMP_EIO     | Failed to set the bandwidth.                   |
+	 */
+	CMD_SOCHUB_MBWT_SET_BW = 2,
+};
+
+/**
+ * @brief Request data for #MRQ_SOCHUB_MBWT sub-command
+ *        #CMD_SOCHUB_MBWT_QUERY_ABI
+ */
+struct cmd_sochub_mbwt_query_abi_req {
+	/** @brief Sub-command identifier from @ref mrq_sochub_mbwt_cmd */
+	uint32_t cmd_code;
+} BPMP_ABI_PACKED;
+
+/**
+ * @brief Request data for #MRQ_SOCHUB_MBWT sub-command
+ *        #CMD_SOCHUB_MBWT_GET_BW
+ */
+struct cmd_sochub_mbwt_get_bw_req {
+	/**
+	 * @brief Instance ID for the bandwidth group
+	 *
+	 * Valid range is [0, 5]
+	 */
+	uint32_t instance;
+	/**
+	 * @brief Type of the virtual channel/traffic
+	 *
+	 * Valid values:
+	 *
+	 * * Value 0: PCIe read
+	 * * Value 1: PCIe write
+	 * * Value 2: GPU connected over the chip-to-chip link (NVCLINK)
+	 */
+	uint32_t vc_type;
+} BPMP_ABI_PACKED;
+
+/**
+ * @brief Request data for #MRQ_SOCHUB_MBWT sub-command
+ *        #CMD_SOCHUB_MBWT_SET_BW
+ */
+struct cmd_sochub_mbwt_set_bw_req {
+	/**
+	 * @brief Instance ID for the bandwidth group
+	 *
+	 * Valid range is [0, 5]
+	 */
+	uint32_t instance;
+	/**
+	 * @brief Type of the virtual channel/traffic
+	 *
+	 * Valid values:
+	 *
+	 * * Value 0: PCIe read
+	 * * Value 1: PCIe write
+	 * * Value 2: GPU connected over the chip-to-chip link (NVCLINK)
+	 */
+	uint32_t vc_type;
+	/** @brief Bandwidth cap in GB/s */
+	uint32_t bw;
+} BPMP_ABI_PACKED;
+
+/**
+ * @brief Response data for #MRQ_SOCHUB_MBWT sub-command
+ *        #CMD_SOCHUB_MBWT_GET_BW
+ */
+struct cmd_sochub_mbwt_get_bw_resp {
+	/** @brief Bandwidth cap in GB/s */
+	uint32_t bw;
+} BPMP_ABI_PACKED;
+
+/**
+ * @brief Request payload for the #MRQ_SOCHUB_MBWT -command
+ *
+ * | Sub-command                   | Request payload                        |
+ * |-------------------------------|----------------------------------------|
+ * | #CMD_SOCHUB_MBWT_QUERY_ABI    | #cmd_sochub_mbwt_query_abi_req         |
+ * | #CMD_SOCHUB_MBWT_GET_BW       | #cmd_sochub_mbwt_get_bw_req            |
+ * | #CMD_SOCHUB_MBWT_SET_BW       | #cmd_sochub_mbwt_set_bw_req            |
+ */
+struct mrq_sochub_mbwt_request {
+	/** @brief Sub-command ID from @ref mrq_sochub_mbwt_cmd. */
+	uint32_t cmd;
+	union {
+		struct cmd_sochub_mbwt_query_abi_req query_abi;
+		struct cmd_sochub_mbwt_get_bw_req get_bw;
+		struct cmd_sochub_mbwt_set_bw_req set_bw;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
+
+/**
+ * @brief Response payload for the #MRQ_SOCHUB_MBWT -command.
+ *
+ * | Sub-command                   | Response payload                       |
+ * |-------------------------------|----------------------------------------|
+ * | #CMD_SOCHUB_MBWT_QUERY_ABI    | -                                      |
+ * | #CMD_SOCHUB_MBWT_GET_BW       | #cmd_sochub_mbwt_get_bw_resp           |
+ * | #CMD_SOCHUB_MBWT_SET_BW       | -                                      |
+ */
+struct mrq_sochub_mbwt_response {
+	union {
+		struct cmd_sochub_mbwt_get_bw_resp get_bw;
+	} BPMP_UNION_ANON;
+} BPMP_ABI_PACKED;
+
+/** @} SOCHUB_MBWT */
+/** @endcond */
+
 /**
  * @addtogroup Error_Codes
  * Negative values for mrq_response::err generally indicate some
-- 
2.43.0

