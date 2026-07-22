Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3634BC02F;
	Wed, 22 Jul 2026 11:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718406; cv=fail; b=upTu3rDiPSMmlnUAd3UaWLjTlF7jhWLDcdYSADB2hXI1CVeDORMXCWitgBRLRFKKHotj+oA/kvIRqLip+nW1ku6bxfCExNGx+oD952qob5bjojmJyHKvKuStmmJpCzTJsbUmuaLPx1VwA3H9F5segYGEahMA8Qh+xDvY3dLyi5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718406; c=relaxed/simple;
	bh=d0lVeoekF+seScBSWSO+WNpeqP8B9kJW1QIgg2Y+XD0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DKkR4dchKFh2Gyb3unDEEu9DD6diYQfp90acMvMQlc0OgJT0lbOvsbJrGQDC4UKNJD3aOKc4pYkWGIl3LQio59Rl5p2tfIUL3wGSwy4ZL7NWDCZ5K9zh2DYczJXcB7wYMP+GVKnpKuiJhrhL3FK+6jZEHnUaX4Gz9L24KAOMtO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aPLB5Aix; arc=fail smtp.client-ip=52.101.46.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aPLB5Aix"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhml058JXgFmcXYYDvdOCemBZ9PkV8BUH3ajbJCzPBmxFjiOh+BqgUZu70oHgfShd5aTG8+2Nh6//B4NYzipP/IIUu4MbX3zYWMBp9OTo4v+wKQ5z+1bQjRI0+l79RFcTihatRVPR6yIgVpERBAoKl1ir1Ow7JoGe1TOKSOxvd6+Z/m7v2HxoUymJIY5pHBRh8kNNDpApyVI0NP39++1RZuFw9K36a6Js8iLDSefloaGyxAMDicUoY83dCh0tpQgiKEVwqxEorCMR8yK+LB1S2kCdgOn/N45JJFy44UMEDvQ2wPzjT8Ecx3Fw1Mb06z6Rv1GhgBstMfA/fcBa3wrkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ho0HyniiSkO1n43x0nlOjuEYxYeJikCNE9vBJKRBLI=;
 b=h3wq5WYnUF0dUkzlVz09Lx5cw0EMyuMwtDciuelSvCPvyiM2wSevfw3Sez1JzT4rDe68bgM5CQSyslDHr9y9kO7odzzMt0QIoLIrMWUCtQwt1VWBVWtisKANYJLlkj01BZJjMS/cfls1pEdJkoSF/+A+Ij6AFuFbh1I2+mU0BPZ0iImydSK2qbUtJF8of+EkKTfQai7YMv8ncgSn594L+Beb2dvpmzUISkeg7LNKsgmooDsYAubvpbWe5usR0LLsKDfYqDzuYy4QOyrAD/4gtRifHieQfbqJ5p1xID2nEx7N7oA6yWzwWocrSKgtjJWqlCrU8x8Nc3vDtcmPUAQ7rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ho0HyniiSkO1n43x0nlOjuEYxYeJikCNE9vBJKRBLI=;
 b=aPLB5Aix+72WoSy1JJinuPpJyVFOAoSDotU8mYxD4Dd16HZ2UPMdSpI4CYUBdB/ks3d7E5N0iNaeQnNGyfQr/eCT95TryooG2KxEVdfOhizB1DAg/kM+hyuMvAxJppI03/6BlDNQ9snBI/3axvTf9t4DAN4gyrjKwr9GZRv/+2RjCMuU2q58/lHErKgnQz+ZGHkbInMZNGzKT5Rn8R3rDsba1n/+EUDRJG+hxunQO9naaOz5e2aLJdV488BaFBLCV3pfrm/LDBdb3t0VmQkBiOkA+ncz8IEj+JRBSA3Lw5thA5q3rzrCn3vfH4Ligf7y0rG96FYyf+gS7Ah1OztbAQ==
Received: from SJ0PR03CA0237.namprd03.prod.outlook.com (2603:10b6:a03:39f::32)
 by MN0PR12MB5980.namprd12.prod.outlook.com (2603:10b6:208:37f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 11:06:41 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::27) by SJ0PR03CA0237.outlook.office365.com
 (2603:10b6:a03:39f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 11:06:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 11:06:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 22 Jul
 2026 04:06:21 -0700
Received: from build-anrao-noble-20260527.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 22 Jul 2026 04:06:20 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v2 4/5] firmware: tegra: bpmp: Add MBWT BPMP helpers
Date: Wed, 22 Jul 2026 11:05:43 +0000
Message-ID: <20260722110544.193551-5-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|MN0PR12MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a0eecd2-69f2-446a-a06f-08dee7e14e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6xoH1oRqo/t9n1pGIAGaEoFztD4d+iJII5BmjSv7u3oXAeIXuv5XP6yvpWA+kpqqheO+PH+5hJh4A/OMGWI7vS5PMJ4qDaQRtBE8V3+aoPp+6/iIeudYDiD7geadJXxb6lHTPNon6E5l02hZNpUbYyT65PoNkC+mL32KX47d82sjiN762M7WuAbY3lsXsfDtB2yX4gEJFXAHVesyJx1Rs8c/EskMdW1ofRArn0GNA66IwIIXPqlg8ZjAAXh23+ifoZMdHVOKEXwIb3+5ordK8P0MOVDJpuWHwvhsduLoak6Ymr16E4tKb6KfWuMjnL7+XOlF7Gm8VqdAxufLOn2qIcG1CphwttDihhnT9d3v7ueEb4xPZmH0Iv+hmB2Oo0x+62eSSlRucbBH7qhWFWLUcb0CfwbDSpXNRZDneqEuXhTJbtny7X8PsrV++aO16A4xzPpIeO0Tai48LWzTStdv0qZ8v7k+e7/rCNIH1EJBaRj1aP7jfvbaESG3nF+QM1yh9mYxLB1I64A2vOysABHAD1AhoS9eC1d34aNd670Y7pz8op09fMWP0gikRj6aU2or4NV6mpMb8S+WEN6vv825PvqVeFdLytKJ/Oc7Bu7L1mfACVFsJXR1vfHNCbd6HUak2ouKjBYqiVu1WU/F3C6Fg0fAZw3p+invRnN7mVdSVc4PtvyuijVWk7pyCZcXpUH1gyRS2RLSY+1fO8oLFP5kIA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fO8KVMyhiN8YYk5QaS9EfU/GCecigc2Z78ew3AVu2CwQnLJiTHyo0NaWsICAtFRhvvQRTXAtfE85nLZuboz8q3JqNKXhg4jxkwyx+WUEmnDffi3cZJJP+qet21QX7YB+wZW96BAScskYodYmhEEob5xVmWWD/XAZn39LqCCY9E+AVZ9bLcZIozcy+NT+Y57I9EGmG2pgJXL/+VsyGNskmnjQTXud5smST3IoV11Msx3G/uDoU/gq/UIdmaq8VgEs3TQ1fx66KQ7y/wRMy/mAYPQLFjNMqNAWvVyseLbA997cCdJyEGHSQqNLGygpn0rrH3V3oehGHME6mou+don/+aZfT897dlIiZKHcgkOoA1DOHZ/oooJ+uI4IVPl8R/EiVqGBd11tFTgk05QMCNRz9ytI3SigsFez7NeuBQPnBgpc8uWJrSDFgOgatGDqdiRq
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 11:06:40.0787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0eecd2-69f2-446a-a06f-08dee7e14e67
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5980

Add helper functions that send MBWT requests to BPMP firmware.

The helpers implement the GET_BW and SET_BW operations.

They also provide a QUERY_ABI-based probe for command availability.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
Changes since v1:
- Use generic tegra_bpmp_mbwt_*() helper names.
- Fold the helpers into bpmp.c instead of adding a separate source file.
- Drop SoC-specific Kconfig dependencies from the helper patch.
- Return BPMP firmware errors directly.

 drivers/firmware/tegra/bpmp-private.h |  7 ++
 drivers/firmware/tegra/bpmp.c         | 98 +++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/tegra/bpmp-private.h
index 07c3d46abb87..b3770e71020e 100644
--- a/drivers/firmware/tegra/bpmp-private.h
+++ b/drivers/firmware/tegra/bpmp-private.h
@@ -26,4 +26,11 @@ struct tegra_bpmp_ops {
 extern const struct tegra_bpmp_ops tegra186_bpmp_ops;
 extern const struct tegra_bpmp_ops tegra210_bpmp_ops;
 
+bool tegra_bpmp_mbwt_cmd_is_supported(struct tegra_bpmp *bpmp,
+				      unsigned int cmd_code);
+int tegra_bpmp_mbwt_get(struct tegra_bpmp *bpmp, unsigned int instance,
+			unsigned int vc_type, unsigned int *bandwidth);
+int tegra_bpmp_mbwt_set(struct tegra_bpmp *bpmp, unsigned int instance,
+			unsigned int vc_type, unsigned int bandwidth);
+
 #endif
diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 2dcb74a45b59..2cf8490b8b2e 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -675,6 +675,104 @@ bool tegra_bpmp_mrq_is_supported(struct tegra_bpmp *bpmp, unsigned int mrq)
 }
 EXPORT_SYMBOL_GPL(tegra_bpmp_mrq_is_supported);
 
+bool tegra_bpmp_mbwt_cmd_is_supported(struct tegra_bpmp *bpmp,
+				      unsigned int cmd_code)
+{
+	struct mrq_sochub_mbwt_request request = {
+		.cmd = CMD_SOCHUB_MBWT_QUERY_ABI,
+		.query_abi.cmd_code = cmd_code,
+	};
+	struct tegra_bpmp_message msg = {
+		.mrq = MRQ_SOCHUB_MBWT,
+		.tx = {
+			.data = &request,
+			.size = sizeof(request),
+		},
+	};
+	int err;
+
+	err = tegra_bpmp_transfer(bpmp, &msg);
+	if (err || msg.rx.ret)
+		return false;
+
+	return true;
+}
+
+int tegra_bpmp_mbwt_get(struct tegra_bpmp *bpmp, unsigned int instance,
+			unsigned int vc_type, unsigned int *bandwidth)
+{
+	struct mrq_sochub_mbwt_request request = {
+		.cmd = CMD_SOCHUB_MBWT_GET_BW,
+		.get_bw = {
+			.instance = instance,
+			.vc_type = vc_type,
+		},
+	};
+	struct mrq_sochub_mbwt_response response = {};
+	struct tegra_bpmp_message msg = {
+		.mrq = MRQ_SOCHUB_MBWT,
+		.tx = {
+			.data = &request,
+			.size = sizeof(request),
+		},
+		.rx = {
+			.data = &response,
+			.size = sizeof(response),
+		},
+	};
+	int err;
+
+	if (!bandwidth)
+		return -EINVAL;
+
+	err = tegra_bpmp_transfer(bpmp, &msg);
+	if (err) {
+		dev_err(bpmp->dev, "MBWT get bandwidth transfer failed: %d\n",
+			err);
+		return err;
+	}
+
+	if (msg.rx.ret)
+		return msg.rx.ret;
+
+	*bandwidth = response.get_bw.bw;
+
+	return 0;
+}
+
+int tegra_bpmp_mbwt_set(struct tegra_bpmp *bpmp, unsigned int instance,
+			unsigned int vc_type, unsigned int bandwidth)
+{
+	struct mrq_sochub_mbwt_request request = {
+		.cmd = CMD_SOCHUB_MBWT_SET_BW,
+		.set_bw = {
+			.instance = instance,
+			.vc_type = vc_type,
+			.bw = bandwidth,
+		},
+	};
+	struct tegra_bpmp_message msg = {
+		.mrq = MRQ_SOCHUB_MBWT,
+		.tx = {
+			.data = &request,
+			.size = sizeof(request),
+		},
+	};
+	int err;
+
+	err = tegra_bpmp_transfer(bpmp, &msg);
+	if (err) {
+		dev_err(bpmp->dev, "MBWT set bandwidth transfer failed: %d\n",
+			err);
+		return err;
+	}
+
+	if (msg.rx.ret)
+		return msg.rx.ret;
+
+	return 0;
+}
+
 static void tegra_bpmp_mrq_handle_ping(unsigned int mrq,
 				       struct tegra_bpmp_channel *channel,
 				       void *data)
-- 
2.43.0
