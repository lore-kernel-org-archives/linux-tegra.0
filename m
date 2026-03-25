Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010004.outbound.protection.outlook.com [52.101.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2803B39DBE3;
	Wed, 25 Mar 2026 10:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433745; cv=fail; b=TE6SNS5nmVMvDBQT4y8FsKvMrjqS2zIAFDw2yPRTCVsnmzKZTxKI0uMCSZR7B1pazLakUnEQysXN5Y0sidTjO+I2e89Z5/5/prFFemFyQuIy10B2VMU2/AhXS9EJwRRk0A1EEKkascHZo9PqGWWXBvvMlmoIipebUVl5TikiHMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433745; c=relaxed/simple;
	bh=eq6D/9y9tBBXJq/xF9P241lhIv/ebegFlUGcqgUMJhY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aXBIZeOaiYKiyy8QVRzr794IdmjBpCT9UrQ7YNJyiusnjxMzCxEWq0lEDLzwSPMr+MuxOBCNk7t/M700BiVqBYytcaoq0wZ3Zo1c98+WD+wFMrTKrisKXyFwHaWT2gCqK7qwa2Aq7BagYT9C4/DKrYp0UWEbkSTqoldjeY2CKx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I7nijx3x; arc=fail smtp.client-ip=52.101.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I7nijx3x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XB9pvKNvvW6josqGAdtSUpV3Pa+F0QU5DB0NBFjD8Kq1R3RG1Wa8eCmI5G3x8qXby4Dcxm3oRscMEU/7Zi38/ZS6PjAbFAWT1i/9X5SvWJSfu9ej2LX5IhjsaGt4FsrHR+tp9bA4QWSj7yvYYNvYhCfPylj2usUHyTb3Jn5pB3OKaiKAJrrMm7a6Ti+3d1PVGDFRSHW06CTKGgFmf3p/fNdQ9cRHKf3mavtuCpGcGbGwoD7ABfteCP1y3isSVXrno1L84zZjhaMaB61rov3MaearWmJSyIDEk3jelW+6SaVElHSmPOtsUXeMfaUTkW+Y37cf7Pk7tseyG/ObUVe1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC3XlTC0CGoRFuMVIM9gkHvsqjutTC/byxic0kG5Pqc=;
 b=hjH+4Itxn9HDPODyzAEX+viO28JnlNBXP3SnDn4BfXHgNz/PBoTsiz4m3XoDd/1GU02NXPDC/zzT1tQvFgAk89HBUM6bPsXupwbuQHUJ40BwISLMJuKfxR4S0XjaP7nt/0WatKABymqAnyW+d6MYS68pEbEEkxYw61PFUEK4/uSnuyErrFZMoby6SMU+pseO66sL4m63r1xmKFDPb1F/yJa0GgQhI4g8uOuYKsPDHR/AmE2g/76swLCT2WKxL22vRi/ns0FFbRJLlXSW5Ql1KWkzw3YdKjbAha07Pue2CQAkafYXeLTKbFfG8s6x8REgKD9RLgPbKXdDlY17PSwRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oC3XlTC0CGoRFuMVIM9gkHvsqjutTC/byxic0kG5Pqc=;
 b=I7nijx3xrvHZ13YXqCX69zt7iVmgAZ0M4IvSt3T/SGvC8D+SUKb0WkZxKl9Yuh93VZb/36T9ojnZzeBe+3x4lH0MM8n2A+pKyMX57SL/WpYhW/Qw+feypD/Gya/47R70JXgXUJsN+SdOQAAxq6dn1t3dX29jZ7t7GQtYdKo78FqdKFwWfzEaZqHeUjkbSqYX+Y6xNiQ7oReRQlXGUHt24RY1QYmrsvLKJYxYTSxkUu9hc68ldnNKXizZKQOTlR7ksHU+KwJ+GFHWdrVeY4aNC2foYvnW6z/jvLG+1NqBlSiB8fQLTC5G93b3ton/wUau0wndpbJvkHGvlaqPqHNpHQ==
Received: from CH0P221CA0027.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::8)
 by DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 25 Mar
 2026 10:15:39 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::13) by CH0P221CA0027.outlook.office365.com
 (2603:10b6:610:11d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 10:15:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 10:15:38 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 03:15:25 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 03:15:24 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Wed, 25 Mar 2026 03:15:24 -0700
From: Sheetal <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Mohan
 Kumar" <mkumard@nvidia.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 10/14] ASoC: tegra: Use dev_err_probe() in tegra210_mixer probe
Date: Wed, 25 Mar 2026 10:14:33 +0000
Message-ID: <20260325101437.3059693-11-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260325101437.3059693-1-sheetal@nvidia.com>
References: <20260325101437.3059693-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|DM4PR12MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: df2a18c7-2b6f-4afb-e796-08de8a577694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	t2JsOF4nm1wwboOhVterXzw9enhW0ilugiRywRmpYlkQXMjtVGedo6m4ftU3r0W/cYyJVEgfKqdGHxTTMRKX2bcXiQTcZ9tyR0BUDvXsMsB+zKlm+RWJcunpMIiYatWxfPIukHGeRh6eYBsYMlRLiw2XUXmp/859DUMmMp3RaPWdWKbCZARIMUncX7lxrWqhXhbrpsipDuGZiuNg4BHKptm/cAr8rDSP6WGPR8kQ6eL9RpByTEDHdCNADm9dZg/a2VNnow7uxaRTEfWhr3c3yhFipWJdwfUZu0czs9OJScx6Piimc/CksAmD8hH9DxKdg8s6E+HJ0XnMijpL6dPE9d1qw/bGNHXtpexr7DG0zlJ1nH/sx/c4D9LwazMx+hYX62bR/0OI+AAj9pfI2kF/antCXXO7ygFD9d93Zto2h6VFy/7zf8IeUfLRsIaRkxNeE0o/6RmVIfzcHZitkzvy3wwVx0pj1YMk1XJmGF6ulIgFNaTF2LPjmZrKZBA5MhzZBYY8XQA/1OATFLADkHQtcx8N++OaNLf2SEoIPTHuLvBfQzI16mov/cvL4Lg6WOxg7JbZhVaGoxVTfGmcsud7iDLG4SREdrYgZh5mBsEVk9YWLiDKE8fltY4N/sw6NciHnvldEnd3HJa4QdfGgTFajEHm5mwRwzXkRFvk2ton/ByKTjG4ZZmm/fRyTPW2fXOQKEVE5YCKlxuMY8mhRwE01rAoqg61LNAAjyYe5pW/iJuus54XdQYGhLtCXhNoVCKFBWLCP7DynVadURRiJuWoLQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	goFElro8utYY8UKgcyHPmRiXt5eSnd6ILGStenLGiVbJydDOkAo/RZ+RNAYrS4cB1xw0xbYSZ4m/cZ3Rz14k57PAxYxNF8O5cGave102EY21edrTy7WzTtgS0mqm9IX5Q6ySU8r0XRZPhLaFIdlTLYi5qBe/kEHFkLoAuaVXeFqctyWugdrbN9dOKXAkSLnt+Vdy56lYFI5tbJ3f3DkNy4t/mprDPlErbQRFiCJXg6nAi6j9iG2tlkRQghlezNJyI1X0q90xBKrRVsjkc5naLZ5GUiQVcEKPDpDjHR+VGSlvF25FOpOdAN6ywe8Zv2YOIItXQNGI6USlL1THuzZp51IX6zdHjyMQe7x5/l/hlZGkHlUYiKi1+QsaSL3WAFGLXePaHPq/0++2KeqZSnbur5n0OZZOaCvjTncvU5dqDgCH1PNUSuSEkD4q/WJeBviD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:15:38.7951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df2a18c7-2b6f-4afb-e796-08de8a577694
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6063

Log errors in the Tegra210 Mixer probe path using dev_err_probe().

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_mixer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index 6d3a2b76fd61..d9318aaaf32e 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -651,10 +651,9 @@ static int tegra210_mixer_platform_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(dev, &tegra210_mixer_cmpnt,
 					      tegra210_mixer_dais,
 					      ARRAY_SIZE(tegra210_mixer_dais));
-	if (err) {
-		dev_err(dev, "can't register MIXER component, err: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err,
+				     "can't register MIXER component\n");
 
 	pm_runtime_enable(dev);
 
-- 
2.17.1

