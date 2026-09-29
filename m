Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010026.outbound.protection.outlook.com [52.101.46.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A2A3A7F48;
	Tue, 29 Sep 2026 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676005; cv=fail; b=gxFLSqB1XEWBqTpsXf2Gt9gEsW1tSfWLJiVvHEizwRDklCWFE3mXD6kqj2hrzNCmwV6QObw/0ILGcfY2r7VqW+dFfwWX2qfT78b1IJOIvxkrMn8RgT2iNxQIBjzSI46kv9QQQmCkUzl/k9MsgzLRT5f8ndNwe17GN/3fsCsCYnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676005; c=relaxed/simple;
	bh=Tv59oa17azTq6SLGgOx75RRiau+2NxlMYJ38w7ua4Hs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WNQ+eRSqVZx5wk6NoksIGMDvYEq/79Jltig/rCnxIoSXkIH23zfcQUgKZacR2oXYDDJxSuHwZDyOzoC0KuNDhOxJhJ6R3BOy7o1+nFMidcW0HmDK18Su69j1xZB31edQlP1YrPMeoDcpAHi5rS7MoQXA3hXVWvNbdaX2CTduEjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nZt82Ks+; arc=fail smtp.client-ip=52.101.46.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nZt82Ks+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbMj6k/FdLRPAXIViB2F92PhryuvK3pvT0wnk1VaU3MMFf0chPwU7LywXpFi4ZDbL+DmB4ZNnIks1dKG82mgKfSFjfHMRFHQeBMz6WNxuBZHo1S85Y6e09wFrpUSinNMEWCPUjXv/HcxGTGRKUj9asKKAimE/7ywc5rDprdJCPJeEckn66IxsEkEAp7th7TjdQVPnPTl7unpNjWEPfe0OJj6WbeWCKElFDkIP19G56hORjFO0G4ItOnKQT4oWyMmkboDjkc+nwmqy8BuW571gP79eWOrHoM0ggXxqYhCmlFjUOh/VxIKiR2gamljRb5XVdg0J2GW3l2CPbtdASwZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aoE4B/9xwXekwPRhEBtMsVuUEBC5LVeQwGeRsy3iBE=;
 b=n/enx20xQWv83AX2aP2ETuhpkq90h68lqx0wNnBOzUnzyk8pVCmBsUT0Scrfd78FCWRGNntVkyI0SLNDrNNOefMfSo9kRx68qJm0HzkTYKhkobU4T/BkGHm6gq4SfH0deWrj5EIngUk/as7DhA40vx58mRWrFcGcXfxKFWsc+tUooVgeN6alPhrBobj0buSxeKidsiCOI2TqGiNdt4egzANHLGzqUWNw+9EAHD/gVVoYTYzgwTop3gJ8zbRIVCelqMjMCRyZ3/IibCGi1WkTWyidp8VemOqGpH2u1JeZaJE7dVlJV5SJ8LZI38R9bzF0bZIjWDBw5q6oiumk+bAnbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aoE4B/9xwXekwPRhEBtMsVuUEBC5LVeQwGeRsy3iBE=;
 b=nZt82Ks+whnSSS8F71SmnA7ewbuLluxE2i+oNFOCHY+QIiGgiCQ8PfaD8znmj/aREN/a6n2PAaRa6zpXNwHJEn0VW6IuLTzVrQ8WKjKfy4ArVFcJfovos0T68DS0SZAKXMJl95URQOWXpd4l10xKy7l+SHgXTiyvVGNzTazcUDoU4bBgie2rduz9DOm6izHHvwMEPYeXE4wrl/NcPzSXB7YqVIJfRr4J667L274BdhzOIopREww11xXaTaMFBjgXyDQBMZupUNXOue2P1FhEJfM9tiTUXiiPTpGwWupKd9SNjIQG0PYXt6j6lUkv8QJCwkmscrafMZaWT++k0xHoew==
Received: from CH5PR02CA0013.namprd02.prod.outlook.com (2603:10b6:610:1ed::27)
 by PH7PR12MB7916.namprd12.prod.outlook.com (2603:10b6:510:26a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 09:59:53 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::9b) by CH5PR02CA0013.outlook.office365.com
 (2603:10b6:610:1ed::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 09:59:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 09:59:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 02:59:35 -0700
Received: from build-anrao-noble-20260906.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 29 Sep 2026 02:59:34 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v5 4/5] firmware: tegra: bpmp: Add MBWT BPMP helpers
Date: Tue, 29 Sep 2026 09:59:14 +0000
Message-ID: <20260929095915.2215685-5-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|PH7PR12MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: c338452b-426d-46b9-7b92-08df1e1068b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|10067099003|260925022911599003|260925021911599003|260925021311599003|56012099006|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	XgvJ70rYCs9nYB0xjSqlboR3bDu/R0KSaDsqwB5VYoE+KqRt0bX7mvYpatFElu9JZOeaSOGX3+Zgftp4ZZiaxaG+tZLYCLxE6X+lT9m3wiDcY9RzbU5t1E4a4cWBEBt0eHMYotge8Mq8Avs0Gg2zIi8h2i0HXSchDxGeTS0cjKssCa9bRbnuJ033OxdZg8K7O+xYcRwfvU9VB1usWjJTmEGw1LtAxkBu+1zVNs18Rsz7CzNVe9btKGmPu0o0Bi66WSO0Oz1phD6CyX4SCNB3MWKD2H+pWjEgef5uGdfT7f0Brk3qiR7PsZlDLcXWtmcoeW/fjj1QOdUR/Wdcqlv0mC2n3vP78PgRIACm0ij3k7ORy4Xnyx5W+pgeVCB7Tfn2b5ljJddcufy8k78I5uanpAYzOLqHd4OeyiioMp8cBJ7Gge/vl7unXp0+/Gra20Uqh2shBrHvLuaAC47wjqerzQCf3bW0dC24LYvCYrVldRgbi249QWxx2DDUQlHxXNQ8dLhgVF78GwOZ9ejpUqehKx9+CWW/IVByQxEObREizR4ip/NyrwZJJTiOTQ43ri4x8g32G32AcLOZNX4m8ligCtTe2xLM3P3CAPvAy8DO5L+j3mtsqt+yQ9tKADJPiewLbsMJ3SiHuUujqFUKz1w+eoWYZhsZd3yKRZwLztGICZWVYHU4KnQUeIqNcJrldyXWHzr4wI62ZEOVHW/KHyHgCQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U8TvMTQ7j0xDMVGQHPBu8A7+gjmmlE6vJvIYaR9h3SWLt2uaX33RQ3c8i8Rt8u7IKZ3Ps6NRb4lL9Ky94pifUrLWxwWnyUOysv4N4CLqkra6v4D+IeADr2H0GQNz6uIcEUO80V8zX4GNUxauqUw2viN++jyZc8PpdD4oNncz10fT0btspBI8ESGInpHJQvvaEQDWvrCIAp3tLzYUohRn/ItoDyHM85gtJir+WyXu1a0+9YylZvHx1Rpt3umfSxBaHK8UK4qJSsVv6tNp2Q7ywhVMrLD9KUvH4/dBudE19vZ+yfNP4cL7V/YEs/tfQnNFgPisI23l3GsyKxgyCF9kF67QQSYSU/y2/8jLcypencMdwJNC/BTxRY/oh9k5LXZE4weyVAVJR6LyxtUrnwTKZJ3P/NPzTcdX09wMkklOph7/PRaHL0IzzPv0ENxO7//N
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:59:53.3161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c338452b-426d-46b9-7b92-08df1e1068b0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7916

Add helper functions that send MBWT requests to BPMP firmware.

The helpers implement the GET_BW and SET_BW operations.

They also provide a QUERY_ABI-based probe for command availability.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
Changes since v4:
- No change.

Changes since v3:
- No change.

Changes since v2:
- Move the MBWT helpers near probe.
- Explain why the MBWT helpers are needed in the commit message.

Changes since v1:
- Use generic MBWT helper names.
- Fold the MBWT helpers into bpmp.c.
- Drop MBWT Kconfig dependencies.
- Add firmware error handling for MBWT requests.

 drivers/firmware/tegra/bpmp-private.h |   7 ++
 drivers/firmware/tegra/bpmp.c         | 111 +++++++++++++++++++++++++-
 2 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/tegra/bpmp-private.h
index 163b1c82d445..f0a7d6254bdc 100644
--- a/drivers/firmware/tegra/bpmp-private.h
+++ b/drivers/firmware/tegra/bpmp-private.h
@@ -32,4 +32,11 @@ int tegra_bpmp_init_ping(struct tegra_bpmp *bpmp);
 void tegra_bpmp_deinit_ping(struct tegra_bpmp *bpmp);
 int tegra_bpmp_init_dt_providers(struct tegra_bpmp *bpmp);
 
+bool tegra_bpmp_mbwt_cmd_is_supported(struct tegra_bpmp *bpmp,
+				      unsigned int cmd_code);
+int tegra_bpmp_mbwt_get(struct tegra_bpmp *bpmp, unsigned int instance,
+			unsigned int vc_type, unsigned int *bandwidth);
+int tegra_bpmp_mbwt_set(struct tegra_bpmp *bpmp, unsigned int instance,
+			unsigned int vc_type, unsigned int bandwidth);
+
 #endif
diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index bd8564865638..f2b739977f13 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -844,8 +844,117 @@ void tegra_bpmp_handle_rx(struct tegra_bpmp *bpmp)
 	spin_unlock(&bpmp->lock);
 }
 
-int tegra_bpmp_init_channels(struct tegra_bpmp *bpmp)
 
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
+int tegra_bpmp_init_channels(struct tegra_bpmp *bpmp)
 {
 	size_t size;
 
-- 
2.43.0

