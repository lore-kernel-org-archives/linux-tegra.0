Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010026.outbound.protection.outlook.com [52.101.201.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A123749EE;
	Fri, 14 Aug 2026 09:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700229; cv=fail; b=ZHlp2EP6NS4AZo3Daab740n/QHx+rgyYWykX9OoaYXKauuyYq2x7MnAV7DrGq8W8X5tzC33putp/jQAc/9FIeS7ezP6+DRIUHSI8wn88+DWx810QJREdTS5zTHInMHFwmyYbHbvLhyjcJ91LgzfbCWRjf5m014NGyvh0UJ2BL3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700229; c=relaxed/simple;
	bh=S2aZM7eG+gTw8uRnMMeXV2f/IOXxAHqG02RI1sZ3+rc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T+1VKmFKJtvI37vfJpqkicQIxxStpwaiB3BfMcvWrrncZJThciz9ckVLhAGUWGa/FUTgTGLcDSbToi/pQ4nHm6nIjLZo/u/zxWD7g1w5F7hE6tSxYIQBfUM7nU1GbmFyDzDWuzytXie3km7BXzcsRpUUuucRGnmOI4zytAtnG+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IlAPx/FV; arc=fail smtp.client-ip=52.101.201.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IlAPx/FV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxhZuIKx3Tf/N/8Hbrk5fW5QBcOOY7LG3vmCRKGYiHYQ24gfuRzoSMF0sagTsFc6f7h6VwBEahV6CQDpn1aLEdc2S8MmZLVTW7DHpE6pF8CKBGqvqlmahl8lWXe3rCO1kbWj77Rp+VqTMr1MeHn3mRhx+gc2bdfMC8Ha7CF0fsndNNlBhOCcE7ZPG5ojuSn7JMLfq5cYaoEKDvRrfUG7a5bwPr7N36KZxtkPW2WQCMYSiFRZlufx+jrGiGR2FsI4vCFcZpbxP70ng9s8MKNrp66FEPJQf9Jia/sRS888uSUQXWr7ejrBRMnPoQTZ1qaO7UPomBzczS+n9vQktleZvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jISeOBArrQgP0yikF//u0IHg5pZjym7XTPN5SyPAJPk=;
 b=Q946pV1at0AapoekK/Y+RbsNBM9LZfW1pQ6RjrfI3yumTZ8EN1b8IVq4bTn7kYGkz4ur/mNJzhJuVKICX/9otooB0mekYgtzvJsH8Dgr9LLz9HKPSlglsdYc1i5cSTl60qz8UR3u7EJALq+WdrC24Ub7Bh1iDUE9MkdCQiWHvWlvPFGK7i5pBO2/jF8QZ0f9rgzNWDeD5LtyWK6msu1olbRjSAEH1noPj5J1Ie4RgnuPsZ5shNcbtbWPKeqrHaHRW9DqCEMipDu43PmEzmKKGb0XxQG5lVuAyf6B97lmvwaEUwKidukIGrkw+LR6laUuWjBtHXuG2dSDrMumtnMwuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jISeOBArrQgP0yikF//u0IHg5pZjym7XTPN5SyPAJPk=;
 b=IlAPx/FVEOgrTl1q/vlCwGMsGkk/FPcN6cKoXor2aiB+//D2umgO0qPQucbIEeQIExG3WihpwjsFiTycolNEHqBG6OY8XHCwMXsEsjNU7iz1zjplCeR2EIGp2XZIfnZcBUfQQbRiOECZiHd5yjUeywtQii+095EouVEEqKyhR/qEBlz0TYO2DmmAVAU2dVcp5eHLkp6Sk5LrFVdFfQyb5R9tCCD/N6v81ttC9xC6teHHvfN8Vtm6WxcJXZYxne+qdTmA7CjBHW81WM9Y+ClC3j59lx+3tquGVKyk4uTWFDMb7dkfxZ9UX6kYp9H+YB70FgwniPweOah0zbnqjbuGPA==
Received: from BN9PR03CA0922.namprd03.prod.outlook.com (2603:10b6:408:107::27)
 by SA1PR12MB9472.namprd12.prod.outlook.com (2603:10b6:806:45b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Fri, 14 Aug
 2026 09:37:02 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::59) by BN9PR03CA0922.outlook.office365.com
 (2603:10b6:408:107::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 09:37:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Fri, 14 Aug 2026 09:37:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 14 Aug
 2026 02:36:44 -0700
Received: from build-anrao-noble-20260527.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 14 Aug 2026 02:36:44 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v3 3/5] firmware: tegra: bpmp: Add the Memory Bandwidth Throttler ABI definitions
Date: Fri, 14 Aug 2026 09:36:23 +0000
Message-ID: <20260814093625.1567353-4-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814093625.1567353-1-anrao@nvidia.com>
References: <20260814093625.1567353-1-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|SA1PR12MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4b11ce-8af8-4739-8fd7-08def9e79887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|6133799003|10067099003|11063799006|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	Z8UUFNVOR1n3RSBAk5Ovfr8BTdLlCrsM6rZvlxfiJ/0GsB8mVoGiWSqXC0F+/PTsK/mEZ2NWjzPUiM5ocGxEcO7civor7OhlTDxVoNJy8kvfEkJJH22zpQpMABmezo3jO5bkOSNq6+mTEbt/fDa4yYjycKEKo9IEZLtH8YpZ26nB1mWxAMuXETmUsr0zyQdN9C+HtfWMyItT96cLD1/AfCItw5Sf5xcGjFhyatbI50A0NugYAfojUmTzTzsYszDZyPID+sn+sdRjGQV3jjfTlPyAgDE29nS/hvGrkNOHOpOiOAu8FAxKkuDvzw4TibJmLQSZh804+yxXDLRzdbzgeIopoftifBvOVxd8IbLZkJ3InzXXZUhYnG65elxGdjAltLdBk5UWCMBNlOegLWR1z49/A3fHgUVs2lMRU4GerZSdQqb2O/+i4p2Vr/x4pTRhR+ZOagzBBbpUWMtYEBbQplHPxFeTVMi/bAcn8u7vMl3gzY8gAbcam58NddVelXFba7pUTMkckHT7REEDdJ3uEsQV68l77yORbLFgyQbiDYMSa2fNeBg97YB1W24+Wwgw8q+oP8S4aw33i7jx2vTGXPO+B/Tws3CxyVQZcW78RpSG/+MCflzbrV3iOSf3JB8EN2QDylb5RLARv5sWS+0CoTQmoPiQSQIW9RuWJxyGCObRBgrO0O5idqjWlRAMq92DzifJ+ucULe1P82RPV/HQNQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(6133799003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VQCZuTfz1eMYqrFNrjwvVKDHFQBlrtNtjaxanTBkLIwKG/suhFGISAoIwsqApJSsNA9lJ9DbeJKcPtANxMwhhLd5MuW8K1QWsuFdtz/OIZqdxPh6sIrsgBNQzO/uq9HEPgrcrXWrEtWGS70FVaaCHwywOmbsMgAM+eLX2nsbA43nXH+ZMpLz0rY01taZm5OA3DckCpgdw4RHma602hcgbWbecvF0A2SkDQQdwOPHIcXcugl2iQP+uIicol2DqB/a71byxhtDMMCMf6gZIisv0QxVAjnHj62cJYp17zaLlB4ziMsZ63VwWiVyiga8akQArm3NFx6hmO6O2TFu6bcZuLQfzs8EAQh+ftOlL+P/BinYiT7Baj8MTTF/LFk5qG9dznVm5tEmc+IcmOA2zFIJM8YliFtXw72JIJOR/XOAAjPQ1b1IUJQML61h8ahiAqu/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 09:37:02.3196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4b11ce-8af8-4739-8fd7-08def9e79887
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9472

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
