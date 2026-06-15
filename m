Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE143CF696;
	Mon, 15 Jun 2026 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512694; cv=fail; b=GHjfoLP+wn/X1oIzti1ikD0kCfZ1YAEq5JTjcMHwn/e5fI9ol0YnXnYv3sBwGeVcTGiwPccjwbwYSeQU/zjhEcJEkmpsIKzD8kU9gVdkrrgYLC3IVn7BUEtd8BkprKB/vUGCijXo8Oqh742c9cdFc8T6sV4fcjzqf6DQNXjtp0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512694; c=relaxed/simple;
	bh=HTovOYQqL+rvd8jdO0bHeLC15yHLVGbNOLJqdmDIzO4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QONsK8eQEl5mUrs8Gdq6WPVPbpFwXsDY4fBeIdaP91wwRa/WjuyQzdcu5gEYv2WjFzxHHmyrik1RYKLBuKOiHUzEXXuHXYS1RA7aFGymbAO+Mdf1Sdd4w36TRzmgcInbPC9ew11k9k99VgwV44TbbYo1f+poXGExSO6w+4+5ghM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mIvKXoWO; arc=fail smtp.client-ip=52.101.48.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mIvKXoWO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlYRzA+KELAY30ThRN2+YetXTp8aRzmTJKOXJXFxCakwe5lLzR9z5o6qu3P6KcedqArbpa7odFlyfyo5dlQhhmdL9LdI5HtRzmoz6g+vgnGEXQokP1uBj8TIiRBNcAsBN16IMmAr6BT5BFega4ve74dCvi1E/TGT8kAh3cM6gz9axmspjVbwCreFPfb8B38bzvMym/DlNKkuwjVlgtDJ6I7sTNF0B7pp2ZgpGyAmJfvNEryPzbNRX/cseYnJWGCy394i5/TyCVD21rZqJSszZ9JAqcEehjStjy5M9KqSkXc34hNgGO+hKRsUhpy+BDd6A/UrYzUDzpDO64GiFqt4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYEbpNqLt91OgaXSZfXDDYHUO2H8mQ9Yg/kqvHXhvQ4=;
 b=lQIfZu3fQOxGck+prYGUd/ZVB6IKNuJWXee2dMqnuL9IRycPdAFPWn7yUA/y9WoqzvXTeMdJn08/qTF/y9NZVVXntiH4qypV1Tp9RtqwwRa0oAVpcwF4vyPuA+6CheJDEbLyXenkBAk1uvW07gnkrXkjYMN8K7BnEmgJ8HdinVKrF+QnTWzM3Qz1iLdLtPuE9+yAoGFB0p56JjJUXKCMxs+MDM4SjnQbaJzuiSKN0XxZGC7H5iBjgF33B/MQjxAClPv8vLuDTP9Op0GwdbQDNnA/SyrOZDNM2SmNQ5PbsSFRDBt5QTnp0XLrk3/9jMLFWgPVMLcMBzgUHQblTEUMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYEbpNqLt91OgaXSZfXDDYHUO2H8mQ9Yg/kqvHXhvQ4=;
 b=mIvKXoWOORRfyDWdSFj0n3CMl0kcOrUQ1WYuL6sDptF3bN8qnKCvJAqdi2c+97wL2K2fYNSEitJ5CPTRkrbNJJSAvdFfUBKgbg0oTbbP9LISP2d6HsQa9QayIZkwbF3ve/DHtAPCd3CEpskI6VNNPrmQpEtRvoTFKiAAp4arWJCS3ST63HP+B88qQ/K/97L+55csDddF5kzGfAoefPLAx5+HMX8LES6IapFSDotOfq6xxeqNZAzApch2noLuHqDTWHNlT80wLMCwh3PJ0dtTjZ6qARn9H/RnkORS8YbNZXJ7TJseXhneljjJ44Ue6WD9L60syI9eL3brVWlemIaFKg==
Received: from SN7PR04CA0162.namprd04.prod.outlook.com (2603:10b6:806:125::17)
 by SJ2PR12MB8011.namprd12.prod.outlook.com (2603:10b6:a03:4c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Mon, 15 Jun
 2026 08:38:06 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:125:cafe::90) by SN7PR04CA0162.outlook.office365.com
 (2603:10b6:806:125::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 08:38:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 08:38:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Jun
 2026 01:37:52 -0700
Received: from build-anrao-noble-20260527.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 15 Jun 2026 01:37:51 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH 4/6] firmware: tegra: bpmp: Add the Memory Bandwidth Throttler ABI definitions
Date: Mon, 15 Jun 2026 08:37:29 +0000
Message-ID: <20260615083731.888055-5-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615083731.888055-1-anrao@nvidia.com>
References: <20260615083731.888055-1-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|SJ2PR12MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: 175a7c31-3e1b-424f-da2f-08decab96bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|22082099003|18002099003|3023799007|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	ltco0rFf4x+c10mmxy0njBuT4+g0/UUOVjqH1RBjQ1Mi5E8ykBmLO8fBDSTy5nfDzt7OL1QE5n6GmSFDzNVfWBDHYrv3Isua1TWM74fPrGLoxurUqbpWI76SbE81L3ltnwWaXIgCGBtSt9rcOUz0LE0jVo/enfIaujq9A7noA0YuPWGBHzPJGDTYNt7QXEB9+qyBYIe4PnL4ng9NVjIrdufn6rMPOfIXTr+gtuXVaH8i1Vk6AvOm+dMZwW2laFqyjTdYP/o55xn+nllfQUbw7c1M+qOnvwkb9KVXPnNHGMicef5oUKkH1i0EHht4BsMc0fXr79faw5gb0RVTMy1SGu/kzEu8zhD739+vjyahJwn3ZMzFyJgNETekmsNEEoMCULBRx0TGVJx6XvMBlN4OcCJmBJ+cO/smBDC6vXNnRjd4yzsVGcFhWrAbyHYMhYTU3cKiX7qqlGc1aibPCCx4uOiCLQNRkBVmr1BOlovensgzReN3xNw1x13kIJUwT+8eRttRjtFiL7kWmevVUc5FY4jExIrNA3UJGjCbXb7xG3F9kZy12b7wQISoieXArgiJ2tBOCbh6G2gZteURoGISBMAEJK/xfyGcl1cFoN48WizBcT64Mit1anyJ/FQpVzn1JvtNDv06EdA+PervbPG/pSLSTE49poUscJ3nD73JjOLM6SWw7WVWd3+NF0G91OPXpj9WbcgjFNeawZ+4pTTtZ6j6/lWMvOWAy+4vvuToBwc=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0WUo7U+GZihnUyL76X23DwIMVRjjGfJQZQI6NRdVlRGsVAsD3EidcN+CM/zY69Vu/bAXwhR2KJ/U052f/Sg5SrVo56Qy5T/HtVc7DeauSLaOxdfArRnKZILhQjMP6SdcDDE146p/DUwo8aWKoIIovvyUP+1rqImCqlvGMbXmSCOiIs+aChsdouuALy0XHgsZvaad1qED5HFYpc5ORnMpvm6gs+yTPElhJHo/ebO6PGTVTDk2taLYNxUfRtzaQF9IA9xKCqBJaO1j1shBqs3jvIGPmYAd3uqUSB85UmaTCgB+rgXpLu4+lYuW+6+dPvbN9o3PdqRD3jL+quHRdjpYU0+6JORPYdRACI47Xc884+nz5I7jX8N0MQq3EU5EiL/Ge9rVnA7JSZ88Cl9Oh5Uma2VC8XJP7tZ4wmQzQBXliZ9t2utv3IE6YBQ5BC3XCpAu
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 08:38:05.8906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 175a7c31-3e1b-424f-da2f-08decab96bda
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8011

Different workloads can place different memory-bandwidth demands on the
system. Tegra410 provides Memory Bandwidth Throttler (MBWT) controls for
PCIe and GPU connected over chip-to-chip link (Nv-Clink) traffic on the
path to DRAM so software can query and program those bandwidth caps.

The MBWT controls are not exposed through ordinary host MMIO and are
accessible only through BPMP firmware requests.

Add the ABI definitions for the MBWT message request (MRQ), including
the MRQ ID, sub-command IDs, and request/response payloads needed to
issue the MBWT control requests defined by BPMP firmware.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
 include/soc/tegra/bpmp-abi.h | 161 ++++++++++++++++++++++++++++++++++-
 1 file changed, 160 insertions(+), 1 deletion(-)

diff --git a/include/soc/tegra/bpmp-abi.h b/include/soc/tegra/bpmp-abi.h
index 5c64b3e02211..0660b1d669ef 100644
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
+	 * * Value 2: GPU connected over the chip-to-chip link (Nv-Clink)
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
+	 * * Value 2: GPU connected over the chip-to-chip link (Nv-Clink)
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

