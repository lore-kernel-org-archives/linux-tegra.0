Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012061.outbound.protection.outlook.com [40.93.195.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B1135C6AC;
	Fri, 14 Aug 2026 09:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700231; cv=fail; b=r8wGr+IR0vmxNN9QscFV58S3/lNYlBJi2lfmQM1kzdPoDrxSOt18aYWy5S2rniyZqWjvVhSnSiVpu636uHUPBkVJumAars0SmZwzP09F0AxmXQi8TXsvnJW8e7Un5YstP2y713ZH/6GvWJzox7pBLwriFu5jxB29cybc3JGjifY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700231; c=relaxed/simple;
	bh=ylsrIOeb/ZBF48m8qFOHdDj8aOOrjbGu2fP/Vz41Zy8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ewGR5c4DuvcsUdVgfpOpuJrqf5Nt/vzCP04yaT66PIkVbGSuta1zYZVgtT76gXX0B8hIGgRx5y3gdp7lCadFPgwWeyTJ8qcD+1MgN5RhMx/D7PVTdSdNfn/rZf6JdKx+MkjZH/tbkg2r2S3bbwMlXNKask53cZC2PRh3UQyiOr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hBW7m6eL; arc=fail smtp.client-ip=40.93.195.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hBW7m6eL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qx38WTbhrUA5pwcWU6ou/5HEDGlzFMcHgNRdtOJLqQspn4cpconDliZHbOEyu6Z81ZkFq55HrVknp5r3dzi0FbrDfGEoQ2fEhsoJnU+fbnw4y2h3n6feI1GhYg72Vh1zbaVIdDO5Sb/kYDDl+hM8NJ0iDdfN9aJ63ankqOo1g59mFIv3cRU6Xa1hmgQ3Zov+mDrpYsDoLigi3sIVRzeO33CUwF1wqzxG3YlLM5j6W8kuII+25c22vlj+pW+Dw5ceRKOoGQ2yn2bBk+B2E+5sZF51FLE1ZWiP3+KRQC/DiB/XfXH0/pBPLvcF2nfo2xPDk2ujdtg5VucDERHcWN+46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufmwB1r0+RfhIS+5xwb2O3SY6OIvBZFfxSGFX+3a10w=;
 b=Sd+Td1HHJjdNHIaDRZfaXLfM0VGvKGhzOjskPWPasNyUg8VR97DmxuYiryPWGsFs7zfpIrcUbhtmDehn7O7837FifyjfrmPHzkuCyOv2mHrFuVBfF93NqoeYsBeSZlLOUz71Vwe7ZfO066aZ0QUe+qfsvXK8MKPEOD3PDUA5gmoqfTCkxbokfskURdM8RiZtSs5l4rLRPnrg+N+it46sArYh7r/XUx8FUjyV4ka1pU8vcvJPfkxnMnbT0fO5NUtrH2WGSoo5N9O52M2uX5JxHtPdZ03U97BPY/dZkbccqvWSAv/lmJbcRXzdCbRqIPFjjUnvEXv9DfnIcTsv1j0rtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufmwB1r0+RfhIS+5xwb2O3SY6OIvBZFfxSGFX+3a10w=;
 b=hBW7m6eLGHFHpEvjpdGO0g/ubz3FG1n52QWKhAK276Qr16BMBOzArrktJ4S2u4xsYXfb9a5b+OB/YukkW8hqWatGguijdgydtghsjoW56ZFAtYUqRd+xDnMvg3TSdLCfuIXyvzLjImRqfnj17Ym0zgU07IdDMkw8pVn76N8mWhqX4wSP9Chy8Ub3DlY9qk9cix8k9MOeeCFDMUYlqICxMZm5wEPYrdMGO1oA1wfuN8cllK+JpnHMP6Sg5HTyKQyD+2EGFN0SKM17XKvJWgc0gy2dBCSikds1pr3wBynf03LR76abpMG59QwHGWWDjQf2hp2BNL/Z7tgqBSLKFQMdHA==
Received: from BN9PR03CA0922.namprd03.prod.outlook.com (2603:10b6:408:107::27)
 by DS0PR12MB9058.namprd12.prod.outlook.com (2603:10b6:8:c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Fri, 14 Aug
 2026 09:37:03 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::59) by BN9PR03CA0922.outlook.office365.com
 (2603:10b6:408:107::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 09:37:03 +0000
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
 2026 02:36:45 -0700
Received: from build-anrao-noble-20260527.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 14 Aug 2026 02:36:44 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v3 4/5] firmware: tegra: bpmp: Add MBWT BPMP helpers
Date: Fri, 14 Aug 2026 09:36:24 +0000
Message-ID: <20260814093625.1567353-5-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|DS0PR12MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ad8641-88a1-4367-5439-08def9e798e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EK7nRtdgrrD1eFQZifrynQXf3+4tLvh+4ZJDJUMvo+ekM/4Lb4Uk/Uw9Mt2yO23JCrNoY2dRFtecZTx5P0wYjOwc0Pq1GNps8o6FdYlV7s+L3s98nJ6TAu2DJU38o9VQwgClLZju9zF+TAHfp7T4ZxUtpjCcmoeJYHOSLFocV9ZBuYCg6e7GP2aTg1Pm1zoSLXfDHEtL8fdSRTKSUbQ6iFcutfrBUYT2O4tySYhH50EUr1flz4mme98tMag8AOBgLUrlcL/fdOF7zfIRtW30SDeCytDVRYoAwViXgYI8h88OKg3vPWwJuZ0q+7e2oWNAw5QinBCR6fW9wXB+6ubRDzcBpQiSNEFa/cYuxElYLs9Mt9s6DYLJg8Q7nAm7UBZPp+NVaLSIMtgZVWyfWv2N+5a5lDsv0z0AEJmCXJzlwg1b/k/W6AnLLp6LUXLj6krBVQYr8bNglU7fktedb3SKzJ8Mom+fauVMBb+CGl8u33OD/MZh2fFWrPeeLD0yYF+BUrBkJHEpJsXvePwJEaPda1GJgD9+WIectqSxfGcZAblGYBuD2+NI7SP7GOfVT5Q7tAuCz8X0MmmMU5JdFOrF+84cGyYzyRLKU0nLAZ2MacrW0pRTVJMK3DjOdt5MvtTed5+WbyFPYg1qaiHO4+wQ05RTACHo4yCoM2v4wNqgukEeDX2+xzt+A2NcYHI4sjGEUul0ZJGuoC5G9zM0hyWhCg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pknAFULfnGSRNsEC9mHd/KVQ87PGtoRLDgJKcBghFqTtMYNXHbjjavSErJ8RzkL3AGOQXfcUsoUSlHw9g9Vop2y4HJmO8zfYdl6rdmMy19Am9rNM7aqZRL3aTNCGrIm5p8XZh0rpKuPXntb+q4XEIJKlVrGYfemu2ex6bisGbz+RxHsgczqK5e3FvnxqJmxaD5Ty7AqsyLD0cLnNZQ0rNEVibvRH3zhxbZyayZ7ZBvte55bWuuGoF7a4Bsn5JySXDu8mrSEgX4VzRrQUNRdRt/c9McrfdrejbBu3oiAQH7sF0NeYYGDKxlPJYYBWT4N4GH7tlVMzdsXvg+qUNreCdXMqQDkkVZvDLy+f2zlareuQfKQ3eVB/7+k108F5AaDHTcpJCidfO6RR6JHhGH6uXD3+cMkZ7nwhYUaT3FivooYhCExyqK6fA4rKDuEB58kK
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 09:37:02.9345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ad8641-88a1-4367-5439-08def9e798e6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9058

Add helper functions that send MBWT requests to BPMP firmware.

The helpers implement the GET_BW and SET_BW operations.

They also provide a QUERY_ABI-based probe for command availability.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
Changes since v2:
- Move the helpers near probe and document why they are needed.

Changes since v1:
- Use generic tegra_bpmp_mbwt_*() helper names.
- Fold the helpers into bpmp.c instead of adding a separate source file.
- Drop SoC-specific Kconfig dependencies from the helper patch.
- Add firmware error handling in the helpers.

 drivers/firmware/tegra/bpmp-private.h |   7 ++
 drivers/firmware/tegra/bpmp.c         | 109 ++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

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
index e6cf08764997..4bfd96ba9919 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -844,6 +844,115 @@ void tegra_bpmp_handle_rx(struct tegra_bpmp *bpmp)
 	spin_unlock(&bpmp->lock);
 }
 
+/*
+ * MBWT controls are not exposed through ordinary host MMIO and are accessed
+ * through BPMP firmware requests. These helpers provide the request wrappers
+ * used by bandwidth control callers.
+ */
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
+	if (msg.rx.ret) {
+		dev_err(bpmp->dev, "MBWT get bandwidth failed: BPMP error %d\n",
+			msg.rx.ret);
+		return -EIO;
+	}
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
+	if (msg.rx.ret) {
+		dev_err(bpmp->dev, "MBWT set bandwidth failed: BPMP error %d\n",
+			msg.rx.ret);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int tegra_bpmp_init_channels(struct tegra_bpmp *bpmp)
 {
 	size_t size;
-- 
2.43.0
