Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012070.outbound.protection.outlook.com [40.107.200.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35044385D7D;
	Wed, 22 Jul 2026 11:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718408; cv=fail; b=jmKe2PyKLU7LsX0hRgNnTlSM4TfbKajCbWcKAts3gU7tkZfzZtkkb1zS0mdTDDjB7TwF7R2qMrYbTLupjQRKGrmlkE3xZW8Zf0pUmcoBTW+BtAkZWOAxnyGVoYlNQSw3B5vJCxGi5HlkCKsTAYt0Tzcac0KpvD0NtFiRtKuM0tM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718408; c=relaxed/simple;
	bh=hFMtOjL7tL/xufPasV+F0SXrKAzCRiG8yZHftsDqoFw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y2xvbo9SSvvR5vHTXuSPlgKs0mT8aE9tEXABaV1zFuT37JkHrkxpoBZ5IZp/Yowk4MfXRT+IRHqAT4pBQoQi6ltce5g63/4HW2oxD6GQLRGaj6uF973LXEBnt6EZGFXt9yYpCdtcuKg09CpPsus93Y2eiPPKR12WYJ80PuBvE0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p5phBFM2; arc=fail smtp.client-ip=40.107.200.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p5phBFM2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mv4o9//1REgbemrm/6nwONhfGP9IKi/Z4Fm/xKAUGhP/UsUQEgnadZ3EMeZlIjXtXPfHs2kj+fXOLvFKq5Neo+S1mssdgnnAcm3T9UMrBaqiBptZsOoyjHXbT2DYUOIVxXaRt1kQszoVoiQacYBLZ92W0fALEj71jCgRvIlTJPF9elNC3phcHRIq7nuIbLQzGperFdnbRDi23fqnviJ1nhF2smDMO61fLSbgjxfRKNsxT/6y44zNeq4M64kQUWQgyLEbmWBmjuwt6nB2MeFQrtUX8dN3Wdfpou1pFg3beDowi8drlb2hUhyaHSYDZruG8sazbY6a31DQRUk4RvLZcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VD5cTNzd2I/cZTYfxkR+Ow/uAQHTX0u3xRmZvCNpyTc=;
 b=rC4K3IoYRAXmMsU8ogMEZTLaa1IFCVRN3ROMhu8uQK/K3y5jUF5ZCoM09YmdFGNa5ttdMVdWGamrB648ul3nlCxxR65DthMrDsE3W42TXvlkNK6vkwIjo7WOqMED+McVFCYmdG1G6Z5ImoBqyIGi7jMrrsJY3pvjfc2NfKgdtrImq8HcPQAFwOanxgA/dM8bCSo6f+7cl8ePw4eb2sPVW7kWJzieWyHWGMdRKX2PR11J9LEE6/JGy1f+Nb0FQ2K8+X6FJypYkPQCqgQ3apgWiheEtPdTnSwKn25KlQNQ4ERhsTM8vDCL8MNmnxbz4Qa8JNS2Pwxe3Sr8rosI/wK/Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD5cTNzd2I/cZTYfxkR+Ow/uAQHTX0u3xRmZvCNpyTc=;
 b=p5phBFM2UYz7yexKbLRjb0gLO66H8nr5YqjmSdjE4rm1ycz8KqGi238vfdxcgvncCNL9oVHHIf8SOOaQozplqSYqNGW2QqWKtCn1AT6wPTBafhkT9YsUt4X9KinQaPUY7XAh2sl6PgCfVXIKhWh9BQ5unICbAIWid1ZcR1hBTXxvOcRlfvWAFA4dx0EyDLUT0wy65Em72L8nWNdjmWqVtYBerGekOREnPVUi4TedWfW+Rc76hujMH/yq2mwOA1SySFm8b8K1XdHnCDF8BWfr9B85a7y0S4X9Qm/uPITS1B46V8looysa3ujXMSgs9eih9LRpPKA9HkFRCpIiMzLIfg==
Received: from SJ0PR03CA0145.namprd03.prod.outlook.com (2603:10b6:a03:33c::30)
 by MW4PR12MB7142.namprd12.prod.outlook.com (2603:10b6:303:220::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 11:06:39 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::31) by SJ0PR03CA0145.outlook.office365.com
 (2603:10b6:a03:33c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 11:06:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 11:06:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 22 Jul
 2026 04:06:20 -0700
Received: from build-anrao-noble-20260527.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 22 Jul 2026 04:06:20 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v2 3/5] firmware: tegra: bpmp: Add the Memory Bandwidth Throttler ABI definitions
Date: Wed, 22 Jul 2026 11:05:42 +0000
Message-ID: <20260722110544.193551-4-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722110544.193551-1-anrao@nvidia.com>
References: <20260722110544.193551-1-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|MW4PR12MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a751103-4750-4c54-69d0-08dee7e14d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|10067099003|6133799003|3023799007|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	y4fAl3aOfAq3B7oUtdsafFqV7W7OqhUbABxfDCwcxLX84CSkK6s/0OSyD/PjbMorks6Xam07aRBsjFfPzJsrfFY5/s/UqDEzw3oe+ze/GHdLfahfomrRfljRWbnTpX76jHVOVxVmxgcxjiGMJNAQYrF11ZsZIqeE9grqezJKe7pezs654sBYhzSNAKOkbRsFuERUKBx+eeVnR9LjRovaYNHnYAPreyi0Nr32+8H7AnzN5lpKByyzG9Rp9gHHiPfyrIP2IXuFAW+S574Jc4aDjjDCK+uXDLhmiVYwwm9zxEFKf7SHU2ScxugNecURQExOUGxUDiR912Ad//N8cMkrd6DLdO5TZYNYhTor1UuiKTtf3wi2cDPq3XpnFufp29//FUHt2YGkDhkIU1e4tdRCHmce22Cl6coVroQgcywJNysCNCKcZ5wO+I9rGx5wg31Yr77OFoQoZb+shGMMNrx44XciBQvO0nMR6bxskJCsOVXirjpUf16zniue60IfLYO2dJiZN+WTu2GfYyu6UbLY/c8n9SOO4mUSZxtTs8oofa6I2NRgNqh+J2+9sRvoEDPqVx52CqNtT2skNHXZq4JXUlD7abW3CgWDc3OLTck15kSEAxrmyPY/iKDkNyjLBD86xsdMDZpXTAMExJf1iF6Qf1Gp6TCYgcGmT6DhC3cL7aNNpNdRdxcKG//dvfCNU1iE
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(10067099003)(6133799003)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hkNeQgD3k8Sh4eN7257HgnW+qSNdbt1idbX5zRXL6D5R4wH0LpT2amL+D15CEi4LNk5IRfKXbapux5Iz5RV2xWK071N/ab1IeqZE/axfp5UGq6BI4Q9dog2duPH8ffQebdiQjf3LL8yw1ofsdniB91pZf7oDnrQsoNKM8WywXFb2v6FuR/jDe2ecTGpDCLJlXl59mQaoVZJUF+cSP7+PUDetuqD8qVulcEiNAJkKBhStHe57VRiaKQHVNW3ohj2axKFTBrOw/P35L68N2enYSJvQxTR89aa2EvZ3yY3M2d8w0QZNepvwM1euxqfDoUkByDuK/0I1wrTCJTPocjt/BK2GRSrOJc53njKzQcs6CKtVPXel281pS/cpUJu2P8HKO4Ntc/PODLSmqbRXL5dCJAuQYjDD3irs2fkOhgYk1omC/COD1Hn+Shwp0WOpAzGQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 11:06:38.7757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a751103-4750-4c54-69d0-08dee7e14d9f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7142

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
