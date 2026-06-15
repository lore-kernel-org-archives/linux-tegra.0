Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012060.outbound.protection.outlook.com [52.101.43.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650013CF03F;
	Mon, 15 Jun 2026 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512694; cv=fail; b=faaF4OjYSOsUJuiLkJlFYiGQU7dWQDcbNikk7hWNa2DyvBmT93t9fKm5w8jd+V/hxVBlviwR4HsbbFCeVAR7Wooy1Zz8InnS8ZQV+q1mR3X7aBLXrDlUMi4tuGvULjhZz6lBr1CbJNN2awwEqES4c4BlyQSgzGQ2zg/3QkT+Chg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512694; c=relaxed/simple;
	bh=KMOoztrSz+KeYeJtti3HySpyQ1F+KBQMsufM25plO3U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cf6gOBf8GeYsmO2mCVXZFkZnrBOElSWDW6YzPF9DJM+GO4etQMCZmc4MO0ucgKIXg7QR0HlHWbarBumuuQLuiOIEoc/KcuJjyKZtfG0+fDYFxxbSzQCoZRYefCxuHBumS2I8dFhAtX7FpKMfGOvb7J3hCCr0pzcxmxijRO1OhtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CSvYrcBR; arc=fail smtp.client-ip=52.101.43.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CSvYrcBR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2cPOGwpcLMF1Av6Gm3nZo7xizKeW8q46NUhFNCB/kz1lxKCi3ITFQur7Vn6tLPmkv1SIa9x8eG8vGU3romZM+0lKvWoJdkSaOC4wi9Q2OCyS9qi0J3aG/hlv9xyjWdW/EObkJpJrXYb/QvFzYjwCNt7W9TiKzxf94SHD3JuJgnBFzuzwiGiH67rOvmSca22t14m3HZ2ei2MMAhb5wTstSahuTBGEJ5MACttO4kyhUb/u33z42shrfFaQVxWa4v+buMx16+e5NzFKI38tqCwsxlQG2hrCGbzvUfyTAAIeN7OX8fNuJgTjb48S9/HZdsGaLRpKYykTJnisS9sm91a/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOcHU5rB2LOZJsPUaB8qIEmSmZ1brGvmCrrAsG6t8GA=;
 b=OKLMSLUA7aZlpobWTg0MAw8tPjW1DdtUZ6Q1Us1+3wYy6knSBQWuv5WRLwW4m5Zi/FrRFCDy2J99gV9Lb4/sOAW27oltliUQ0kmJv+jxZvYYTxnzSsvW27qp3jaKhgQcea/dk7Zz7rhTU0TQtPilWfY9pJc0LlM3KmrRNdiI0vlMhdD5sPp3Zyew4ptjOJM1Ss4otWS0cZIzfJplVSeRVNrAVyWUbRM3SWrKhJ05fToQ8nyADCh1Pjc/sl0Xk2XCWR//g60nGePB9u+XJumqD9R4WMoFe1/mARQO8q/bNwecCWyvWI820oZIBMTCu84dyLzAmgJfAb4/GyU0GD654w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOcHU5rB2LOZJsPUaB8qIEmSmZ1brGvmCrrAsG6t8GA=;
 b=CSvYrcBRdWHCG5sFFX1GdbDcjodCMDgaxabAtzROtqFfdRs3yzkPlr9HK7kqZxjimCeNWQtyT50yja9d+5WzNykbi7Ajz6Ks+azjmVjVSc4gTE2KH7B9Xz1C9f269J1Gaj78ZRpU6XtVBllO7DbC7osbh6DaPPCG5z6a05QKRuasOH7oKAHgUKut+xPQ6yVzqJ1UD9vdSdwuskQxuXhvMr11TDyhq7694xX4uULhhTVXocEZUHOjPmGHCr/T9GaxOBzTmWOFNYl4o115jJA95uuo27Kka49QKxdqe5aY9pt4j2CL/pXnbTqkqgEjvrAEGPQI2f62DeGzL7fOjKb7DQ==
Received: from SA1P222CA0182.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::20)
 by SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 08:38:07 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:3c4:cafe::9c) by SA1P222CA0182.outlook.office365.com
 (2603:10b6:806:3c4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 08:38:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 08:38:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Jun
 2026 01:37:53 -0700
Received: from build-anrao-noble-20260527.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 15 Jun 2026 01:37:52 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH 5/6] firmware: tegra: bpmp: Add Tegra410 MBWT BPMP helpers
Date: Mon, 15 Jun 2026 08:37:30 +0000
Message-ID: <20260615083731.888055-6-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|SA1PR12MB8697:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7ef4a7-9332-44f9-cea3-08decab96c72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	4ZJJVe3JSudH84DrYnT8ch9QfHpWMzl069ZZpARjzm51QJsZ0IrcxKLVsgRyEjNz8t8mKX7jNFoX+v/G8Jl5oMvmU3ok/dMeVC4DKqylBgcrcNnDIke5XetxZTGQRWROfPljQTXm7m5KouqSgDznWm4YgRXMVS0KIlTgDYkuA+3yqSq5DXPcStsJyd6Q6PvOHFbGmuKBczg6jDEZ6v+QAj7mb0QwQGxv3D+AF50roXLrdh7T1VoOwo3xetveM9q6Av7pQZLKvgJXwx5MByGzQWBCyWYVyc3VXukHyPoqhHoRSaH4O8uo0RKpOFJrVQdnuDshH6hf9w8FWxTKmjcpzS0N+hQnLpDz3V0wVOCKupXe1n/rx/t14S8Qa0TQdqvQxviNv3SlhS+gr9+fjUlXg5/tyWQH81Gwf3geVa0z8a300VO/RDpL7Gn0w8MqGMk/yrC3BHq0Wz1lXdN0TBzXhIUvKJckQNOQvi2QtXadePCc8P+Pz6wTtgQIFOnI8FCV1L37aNRGaaDnfcq2tj3XT7EjirH2fFPCeJycu3BRecAYRGgwE8GvQcpQsKpa4fcz8H9lblFh75LoNMl2hjwBVlQsDk6poFnqvNmFdjECxJvn3/XpN5tCn5RbnyYBEyqWCgmx83usFyNlPFKsK2WYAA0ER4mSSyZ19cFNVA8lmDod13it11NaklrxUjTZ4ptV+OBwSlOaza1Lm9q7FsCak8ZDI7tPNIXeG6k+4GSdszQ=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3ySbQsufLwlYGhTystOiQx8579K4eOnEEooJVaGQte2de84m9H9ffCKMidiaWt6PQ8PmU/V+QGtHRog3lZIm9ZqxkSGkKxaY5iVUJykoWIQZwJq6eoV+FoX/SAzHgYV6iga9pBqtNVudJai431e+cD+3lnS1JrHXR5N6S4ZILmNDMRzT4ovzI64pUoX3okvnfmgbCg+lrgY54gJW5Ayii1+Rn7FJOpmAgxc2488JyKHga5voQ8sLPXMAOX9IBS+PBBcSuLEBAWzawEwu3ssw3jdJrwZW9G6c8Od+qZkikB/p6c5m+IULDX2fkcqusTbI7dvBGykdHJ6Bn/uQv4kOIa+/LV+u/V/NX9oEOVD6lQaZdiQuSoIbXW+2yiYdOawdQBXWXHWzM7BuEi0b1N7IadokjnsW5cwuONB9CCzFFqIi49Pk9M8tceDVPrlE0Tmf
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 08:38:06.8940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7ef4a7-9332-44f9-cea3-08decab96c72
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8697

Add helper functions that send MBWT requests to BPMP firmware on
Tegra410.

The helpers implement the GET_BW and SET_BW operations and provide a
QUERY_ABI-based probe for command availability.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
 drivers/firmware/tegra/Makefile        |   1 +
 drivers/firmware/tegra/bpmp-private.h  |  31 +++++++
 drivers/firmware/tegra/bpmp-tegra410.c | 108 +++++++++++++++++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 drivers/firmware/tegra/bpmp-tegra410.c

diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/Makefile
index 41e2e4dc31d6..4310cc0ff294 100644
--- a/drivers/firmware/tegra/Makefile
+++ b/drivers/firmware/tegra/Makefile
@@ -4,6 +4,7 @@ tegra-bpmp-$(CONFIG_ARCH_TEGRA_210_SOC)	+= bpmp-tegra210.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_186_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_194_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_234_SOC)	+= bpmp-tegra186.o
+tegra-bpmp-$(CONFIG_ARCH_TEGRA_410_SOC)	+= bpmp-tegra410.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_264_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_DEBUG_FS)	+= bpmp-debugfs.o
 obj-$(CONFIG_TEGRA_BPMP)	+= tegra-bpmp.o
diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/tegra/bpmp-private.h
index ebde0e36ae20..c3f466ae5979 100644
--- a/drivers/firmware/tegra/bpmp-private.h
+++ b/drivers/firmware/tegra/bpmp-private.h
@@ -35,4 +35,35 @@ struct tegra_bpmp_acpi_message {
 	u8 data[TEGRA_BPMP_ACPI_BMRQ_DATA_SZ];
 };
 
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_410_SOC)
+int tegra410_bpmp_mbwt_set(struct tegra_bpmp *bpmp, unsigned int instance,
+			   unsigned int vc_type, unsigned int bandwidth);
+int tegra410_bpmp_mbwt_get(struct tegra_bpmp *bpmp, unsigned int instance,
+			   unsigned int vc_type, unsigned int *bandwidth_out);
+bool tegra410_bpmp_mbwt_cmd_is_supported(struct tegra_bpmp *bpmp,
+					 unsigned int cmd_code);
+#else
+static inline int tegra410_bpmp_mbwt_set(struct tegra_bpmp *bpmp,
+					 unsigned int instance,
+					 unsigned int vc_type,
+					 unsigned int bandwidth)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int tegra410_bpmp_mbwt_get(struct tegra_bpmp *bpmp,
+					 unsigned int instance,
+					 unsigned int vc_type,
+					 unsigned int *bandwidth_out)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline bool tegra410_bpmp_mbwt_cmd_is_supported(struct tegra_bpmp *bpmp,
+						       unsigned int cmd_code)
+{
+	return false;
+}
+#endif
+
 #endif
diff --git a/drivers/firmware/tegra/bpmp-tegra410.c b/drivers/firmware/tegra/bpmp-tegra410.c
new file mode 100644
index 000000000000..87c5dfab864b
--- /dev/null
+++ b/drivers/firmware/tegra/bpmp-tegra410.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, NVIDIA CORPORATION.
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+
+#include <soc/tegra/bpmp.h>
+#include <soc/tegra/bpmp-abi.h>
+
+#include "bpmp-private.h"
+
+bool tegra410_bpmp_mbwt_cmd_is_supported(struct tegra_bpmp *bpmp,
+					 unsigned int cmd_code)
+{
+	struct mrq_sochub_mbwt_request request;
+	struct tegra_bpmp_message msg;
+	int err;
+
+	memset(&request, 0, sizeof(request));
+	request.cmd = CMD_SOCHUB_MBWT_QUERY_ABI;
+	request.query_abi.cmd_code = cmd_code;
+
+	memset(&msg, 0, sizeof(msg));
+	msg.mrq = MRQ_SOCHUB_MBWT;
+	msg.tx.data = &request;
+	msg.tx.size = sizeof(request);
+
+	err = tegra_bpmp_transfer(bpmp, &msg);
+	if (err || msg.rx.ret)
+		return false;
+
+	return true;
+}
+
+int tegra410_bpmp_mbwt_set(struct tegra_bpmp *bpmp,
+			   unsigned int instance,
+			   unsigned int vc_type,
+			   unsigned int bandwidth)
+{
+	struct mrq_sochub_mbwt_request request;
+	struct tegra_bpmp_message msg;
+	int err;
+
+	memset(&request, 0, sizeof(request));
+	request.cmd = CMD_SOCHUB_MBWT_SET_BW;
+	request.set_bw.instance = instance;
+	request.set_bw.vc_type = vc_type;
+	request.set_bw.bw = bandwidth;
+
+	memset(&msg, 0, sizeof(msg));
+	msg.mrq = MRQ_SOCHUB_MBWT;
+	msg.tx.data = &request;
+	msg.tx.size = sizeof(request);
+
+	err = tegra_bpmp_transfer(bpmp, &msg);
+
+	if (err) {
+		dev_err(bpmp->dev, "MBWT set bandwidth transfer failed: %d\n", err);
+		return err;
+	}
+	if (msg.rx.ret < 0)
+		return msg.rx.ret;
+
+	return 0;
+}
+
+int tegra410_bpmp_mbwt_get(struct tegra_bpmp *bpmp,
+			   unsigned int instance,
+			   unsigned int vc_type,
+			   unsigned int *bandwidth_out)
+{
+	struct mrq_sochub_mbwt_request request;
+	struct mrq_sochub_mbwt_response response;
+	struct tegra_bpmp_message msg;
+	int err;
+
+	if (!bandwidth_out)
+		return -EINVAL;
+
+	memset(&request, 0, sizeof(request));
+	request.cmd = CMD_SOCHUB_MBWT_GET_BW;
+	request.get_bw.instance = instance;
+	request.get_bw.vc_type = vc_type;
+
+	memset(&response, 0, sizeof(response));
+
+	memset(&msg, 0, sizeof(msg));
+	msg.mrq = MRQ_SOCHUB_MBWT;
+	msg.tx.data = &request;
+	msg.tx.size = sizeof(request);
+	msg.rx.data = &response;
+	msg.rx.size = sizeof(response);
+
+	err = tegra_bpmp_transfer(bpmp, &msg);
+	if (err) {
+		dev_err(bpmp->dev, "MBWT get bandwidth transfer failed: %d\n", err);
+		return err;
+	}
+	if (msg.rx.ret < 0)
+		return msg.rx.ret;
+
+	*bandwidth_out = response.get_bw.bw;
+
+	return 0;
+}
-- 
2.43.0

