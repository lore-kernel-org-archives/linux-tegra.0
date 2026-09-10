Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013008.outbound.protection.outlook.com [40.93.201.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6B83CE0B4;
	Thu, 10 Sep 2026 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030810; cv=fail; b=Vmw/4FBDB4Ha622HvHjsMoNaApzkfxmTZBNORIMxkwGeu+1VxR5eTRp4iNg+e6jH7hg8zWo79DMS6JGyImhcI/VcTb7O8g7dDJ75TobsbxwY3QekAn4opTgfumyOw5dYDa8lw4+jp7TzWIA7U+CHkm/9owuXydACs8iTPm8hdC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030810; c=relaxed/simple;
	bh=0c6Fh3G8fHJ06fnfz6YxylkD6M3eBwDK7JD7QfleQaI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zkbgu/5M9Uq++pbn74FZbTKV0Zd//UWy/N6zgmk5tzT4JepXkCL7QMj3CW2vytXwdGApQ4B55MJGYos/MgsQd5Lp4ffjlB5KZIue96BLe2r1oH7V9FTTznHBVMeYihWNuHO++28LAsyAm4ioaNo5eHZCORYJ5W+OMFweba19O+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W2D3Bu0e; arc=fail smtp.client-ip=40.93.201.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W2D3Bu0e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQKd0FORT6oeqP0wWYbEX10EV0HRIzxOljo5GR/iPsDhKvi8s6uz9NbECf9x1KnFcNRknDaywk+7nptC66iWwZK/z1YCuw05Crr1KWiDnC1Rrd6XVJ7v7EPRKC63MfJTHLc0++ymvOevnRxnp8sO1Tumf4JkE7A/aHNVqJLxFFyRImMqmnoilsplHU1HATZralC34HuTEmDUv3n147Q7fsf6ArO48GJk8lh7HaUx80IeCx+uV3O3nGq23j7ecXs0kRhI4PAPo+/LaCCl6B08HlShGj9yVHwuOQuW4t7yRuFjQt4VtZ2qj/RhzYm1tb5/AB2KoUL1Vk1TNPkQNDdsKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hE5BzOEhSpN5GJBlpoGwjLzC79mMrIKi7QsyA5vXIzU=;
 b=QqNjFnmZ4TkZQc1Nr1r314J39KR4dxwmrEfjUM8LG7D9PA5diF66zTW79bAFJI6viRzT30QYvGc3B2yyK4LONdoSIgdJdXyXNV6D47y2aw3ZVwiMBSC+MyliQ6qcN6DvLxnhrnVJHhfp8E6J7ZM5s6EtlWu4QIxUSYEuGUzdlxIZwAb8WCCF1dC1ArwBMn2lCD32sw4La/w9qlk+ikSaOsG4Ok3kMAWqO+QXeJr2UX1l0AvVbYDJwaYxysh5JNokcy/4j+9YF2ZYFfi1sSpl21ObT3bjjcOgHVlkG87edIhKedesshwwT0Z96FW6uiNfMgAHRD18Oj+YQqyTuvUSFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hE5BzOEhSpN5GJBlpoGwjLzC79mMrIKi7QsyA5vXIzU=;
 b=W2D3Bu0eYRlWk2+liMc+pZsizNrWAq+cUmeDb2xZTXtbiWAVdVJI17ZE3l2CNunNa+wFqFm6PWtj8xny/3+EgO7hJcikEAAI3B5tB5h2/Vz0nLy5NpdQ7baVTRrOXUjVJ1CJFa/d1GK+Tld4fhYz3HcqVjAaNmkJYIeTtiuTyEy2RhyeRYRTxFjnsHKslJmlVtyfdJyaITZJGcCxTOz+UolqZdAllG9PUWUQJWRj5OT9Urmqpl/JaS8XhXja4CxjIEDK0pGRocHGkeWeOCyWQ1/6aTYahqOYsberwVcq4TjaUOiIAE2Nl7oVCMPxnp8BIv6gSTiuUjw2SjQnfLndOA==
Received: from DS7P220CA0088.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25a::18) by
 SJ2PR12MB8650.namprd12.prod.outlook.com (2603:10b6:a03:544::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 08:59:56 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:25a:cafe::8c) by DS7P220CA0088.outlook.office365.com
 (2603:10b6:8:25a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 08:59:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 08:59:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 01:59:39 -0700
Received: from build-anrao-noble-20260906.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 01:59:39 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v4 4/5] firmware: tegra: bpmp: Add MBWT BPMP helpers
Date: Thu, 10 Sep 2026 08:59:18 +0000
Message-ID: <20260910085919.2522241-5-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|SJ2PR12MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: 98bce6a6-58e6-4dca-6b9d-08df0f19e275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|6133799003|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	kUeB2fdvHSpsca+B5U5ZTNMxUvdwhYhHao6C4jNxCQ3mC3xe2j3fQu1mIJlRAZEZj329K/BQOZpW67pP2HhS1cHm47ZHDyUp1P/DDBwS2IEa6AyK/Q/Sm7b4O20B7b86gR2TvgTxL1VJQRFeOevCSH3QJ8gQN+Ok2B322AWG/XtQbhAbdZDmv8Zajx0KGqCE4E+MovgXkqzmTHOiyZH1NZ+S4rUqg+I5JJ2/luWgCTVqtGjBv9vRq3K5OphLw4yYNijfX9dlMLlzcJTOJOU3DPwKwNIj5FWSwpjF5Zqe9SOYp3xCiwtEt0sF+ex9yBzjJCvk1PD6taR/0C/9cieJ5lJzKmt9woiTE9WS56RxpDH928fiXgTEn/ZM0hfzjVemq13rBtSt0S3DCoF5XvoP+m34iFfUVBTrZdkFpWQzdMdpZWNW6Rug4EoeNk3lj7o3hNXLYaba5LcdWO/j/HSZTC3tuimrBtQTULhVyT+j4XtdWtk6TvqF19qt1ZYaTuu+3Y1mnvIRQeis2DLPhy952a8aV+/AeJ95+4T0EgPZ0wTvhIRuu5EuNOhzDU3SZ4tx04kNLJNm9RavfkcxM20MDNo+1p/fQm6k5ng5X+fOsHbhQnk1oCpvYixJ4CIcPbLEapXACRa3GgD8af+V0xIwduPgqxo06VANUwThbauPBVP+4DLW6fGBHmsYrend4/w91VA/WbsBPLRCCcqiE1/dtQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VLuyciqeHEHCCvzyUEVGnnospvYLyBqPXFftFcLTZsqQpjSvX/hpfn6FB4LeoFUTpFA9FBBzMXwbLJ2+i/CLUqMANbUBtLbVLqJosuNG+PdD8gTJfSK2qrLZpyVn+nKWlGienJ6Uc0CPrYiwW6nodogKo0k6JZDN5hjd3Y8Bs3uR/C+gOF0Xxo5PDVz+JFgC2V0MLaee9+mz2aAi0hHermnvAU0+oZMGZciG/N+CJEuCo81Wq0F/RHGqeoE4CHN9F4/Pxe+9lYfBaxfnLVNQtn6ipVJhLpyrpZtwxKeM+F6c3+xQSzlFYEkAJIYrMeKZMV+ZJUxX6dpshK1nGeiIz9VFBwAG+ekAH2U+lzSsruIKDy5c2fkLN/mHGIgtXMwG0ax3UBQppQaOybJkuri6qff/DdJO2dQNSGd2zzcYmm+dr51Z8sLtvYcz+3aNU9et
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:59:55.6423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98bce6a6-58e6-4dca-6b9d-08df0f19e275
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8650

Add helper functions that send MBWT requests to BPMP firmware.

The helpers implement the GET_BW and SET_BW operations.

They also provide a QUERY_ABI-based probe for command availability.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
Changes since v3:
- No change.

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

