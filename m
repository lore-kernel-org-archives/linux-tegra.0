Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010069.outbound.protection.outlook.com [52.101.46.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C863626ED3E;
	Thu, 10 Sep 2026 09:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030826; cv=fail; b=ANtE4DL8xMlo1jn+cGmncvQvwx68xNU7vH5DzQNjSPjwcywjLa2Gad/8ByyMQ+AgEfjiZtoAROUsNj8E5KK5CGlik+8CdAi8mygyEbPTVlaLcDA/b+a+1Qwi1k4+yJrrchMTCiEepO+YAm2q59AUZRrL+F7MbSNQp6DSdcmdfUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030826; c=relaxed/simple;
	bh=gv5xqPEbbB7ZMZ3BKLz0jgkJd04ciFnPX64QueiCvMw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fDpAnN4sqrpdZ2v0YnkeXuBB58bYK/x6/PJh2P6RSS/ZjkTm00jiuSmlLZf4cZ9thLiZvxEt6496kjj0sF6CqXS6c4f7lDfrgrAGc2BGRQ+F85Dss952y/Q9X2RqJ8qcus980dcsF/wldT36H7EAyKWr9aBN5dJE9ML5hcb7ZFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SsbcNicB; arc=fail smtp.client-ip=52.101.46.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SsbcNicB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QuR56owdPBLSdEIcknii+iwdtWd9dfoe3BHU1WpL7Ql8Dl/JzhbCk5CxgkKxKis+OwiNGGnU7VuBrPjf+NbQW9Nb3ulFCCkzs53xw9PBvDIRUaaj+aJes/kAC8Yv3G9Y0DPH71+zNX55GAMFRTUenHGsiovIhM8AhEk6W8ibnQ+NYpv6ITcEcxSQPUM7wGTOVgntNi2FycHsKYmc5HRsTX4n///SlH32GR38/UBTIiPAfliTikAUJlLwHvAiMAyz3fptLuch3sYow5ecatNgLaWh8zKI6x7v14Ji8A/ckv0RN8KzgTIr2nJd49/yT4F/4sQzULz7XGs3xCUz1AiqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIAkQ4h8SFkVT0fx997joVx2+hyqQ615NvOQc0RGsgs=;
 b=OpjsZMSWbp9O+OY0/olnhiMfh/neHgzTAKOmkssNgCP7UwHMnurZE7cIh+j7mKfAm8eLSoyYLluIlN/iQofjCFTxPII2ub5CHbgJRwN3L1IGPcsSIPAeyTlUbE+IF+zM906q9oN/Vbk7KaprzoOzTjwehFKKS6j36rnOjwrvyvQ6z7UpaGQvAcknNDyvCZK4+yrpL8C7QLqxxBQBHq7H8WzQRMpmR+FsrrejTTfFn1y5RNhWR0/m4ijMgOIUO/Uk+1hvJn9Pi5HDWHFZ6FC15b3G4ymbiVJxc36Pq2ACrwAK0GXHgPZlW77Ou+RABgerJcVGhFJqaZuZvgvaiwGDYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIAkQ4h8SFkVT0fx997joVx2+hyqQ615NvOQc0RGsgs=;
 b=SsbcNicBDudecp1z83nxOgdfg9QFQWriRfZQYr1uCLt/GeQKcpznBZNDpHGQiIO+oe+tgMq9FzMRvblaDaAfjbBroSKj7Z2wzET+3c2oB9dmAmbUMlS+L7eSu5TuYq/7uJ1NnURE3sdGhGIkX18HUq4TLd0Rb9bjXazOPjOZTeb/4HpfiLKmxg/MdQPXesovvV9YcqVHzaiM4NoHKD34nNiDEGWcC7jmtW7ScSHtjeTTYKqzUMnClBv6rEClgcilo4Glry4iZpcbaZCebNqSTwAxmbo0QUFW5FXPabFOmOUVPCNcQTYo1HDE0NeQQXdgI+vrDvNDGrfGzXDXkeGm0w==
Received: from DS7P220CA0035.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::31) by
 SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Thu, 10 Sep 2026 08:59:55 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:8:223:cafe::33) by DS7P220CA0035.outlook.office365.com
 (2603:10b6:8:223::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 08:59:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 08:59:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 01:59:39 -0700
Received: from build-anrao-noble-20260906.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 01:59:38 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v4 3/5] firmware: tegra: bpmp: Add the Memory Bandwidth Throttler ABI definitions
Date: Thu, 10 Sep 2026 08:59:17 +0000
Message-ID: <20260910085919.2522241-4-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910085919.2522241-1-anrao@nvidia.com>
References: <20260910085919.2522241-1-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|SA1PR12MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 0590b500-baca-44a6-ed10-08df0f19e133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	n+C6kgxJTXroRWrtNb7pld017L9WIF939MxX8KEEuR0z9rZwUofNy6p0oL3xbIS8y4n2HIYS06a2QAEn3XxmtoA6QSsnvjk2SlSv1o4IDkOesysVUuJaimI+FOY3NnPgn/QgorTiE1aAlozJQIzc88yDYfNSkF4Vgm12B4qsBtSyPtA2q6ZP+6Se1oD+uMthA7yCDJKlCRDUOHkMNIRNvcSVbqMLu8x3zNnurDuh6bk25SJesN+tQmwWjJKcbyKNLPRJ1amobLsX7EPpL3IDnWV6wxUzQktL3i3WN7sFYKTnA91zOxjItwGi0/Qmrc7O2oi0qDNPuc08iFM413lbpUUsI08wxiOYx5qMsQstXru6PHSMQ+SnHzvM+tlbDjZa+zMVzRZDxuhCvNoiWy/G8ai0Ebj1KNkYlOiEW2RHlcaZVJ4cehUflmkOQzMvtfweSI0AA/QRD1A1AMjUsxZu3s/r96t/0DLVZxtMs2C2LLt7B6fkFD3YJb21hXCYiunabWsnzpyP5PcFRtqyuG3UJ3djJJvg9DF95JNcwKTRgOEsnKDaIula38ZTuPOtTa5RwMkNuShgB3mbaJhMx3lrvQhHPyRxAWhLg7j9ove0+06gXV2q8rSWJOapznW8CkOajtzxc7kVbiI2COA0JvBjX6z3k/bJej7+bQnY59JQN9oxPROmYJYXszAt6ct1H2dd6NpuuQx6652qGzi/Xijpjw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UpI/XCI2TyrErSeGT3+WBfCIxajwKx+XXFX8boYWg5fDNfXDor6iJH7Ndb+2etpxLr9Z3vpw79nihyJpz4Hb8CPr+9jSpTeIPsYJjWT08Y+uswsc+WY3C+th5CnZuKAEOhbZVG1Kf61//Qibiau7Yto4vIUohdoMFZQEAVG5hxjdws6sbtZ6Qw2Om/KATmrtU7Xm3C/Wb6Ga17/kTtE7L1r1XJaa/G0K6/QwLw7WqRR7Kc1K3aJBhV03lrbt+kIHC9e9ZOKaXwtEWjcFhg9d8d7+uqjaUB46Bxfg4ECwQRfhP9VETLJ0l80ErizyeTEFOOpaYvNGvyg8bXm9q8z3yTWm1ryGq7+I5RiufL69WDHGFQ9GnfjUR8PgYSVGhtmo+uWdir5JtY7eceV5EIsGbY5lUtewZrC+Yio8ETNZJz7eCeaRahJn6kj6nTuJhzaS
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:59:53.4645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0590b500-baca-44a6-ed10-08df0f19e133
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7272

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

