Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013045.outbound.protection.outlook.com [52.101.127.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3767B439F84;
	Thu, 23 Jul 2026 09:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800524; cv=fail; b=ayVy4HP07KwpZcl3HPOSc387E75YieMHPjBc5W/3dGvyYjYpYeBoXsIJPHuReBScnJOoxDCnnVAMhgReMD+vry8N/8LmShqI0lCz/FJl5JvX2POvqESwsOQbyBbsWZIfhCjzjGvvZluwTFNodxZSTyGUVjlwZx7Y3k/gP1eypZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800524; c=relaxed/simple;
	bh=PT5fUszSwSDXsBh/7yUMBgkmagVlnxGDJMBEodleTbs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IFzK9xgqmt7aB3tgsTx2wG1+qpgGFDfPXhLsoHc5uZgAVp59XthfV81IROONtxQ0SntKCJ1x9k9outxSkO+grR4snFx7bth8JLEIOGjdVKdocKLbemBsWfTKqT0F7U/VjYeHHo9FFHuU2oqU+R4DCqoECzqNPz9pQqwhrOJsBNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=iOvRcBhg; arc=fail smtp.client-ip=52.101.127.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="iOvRcBhg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBRO3VtxshEiq6nAm7UGqKpy6/KgkWxX2Hqz+trfc1VqOdQeRbBYRVwdlAS52niXXm3sfemI2u8O+wiZZZGbGqY33E0a3bhU/lPVksZ/p6OD9e81VNBZj6xpk53vBjNkOD4P16NLA6tWffN3CTG8rEyMvmW+ga/sZk7eMHCZlZ/ci3o5tuLk/6YqTjLLAqG/Q7ABYA2jNMmoK2QERz/n1tQIK+th8LICBMWqlMyXoF5mK99QZrfqcHWgnKOPRPhhlykXysXc5IkwyYfqTRo60R+nnjDDmu+Lqe5qO+uY6ZDJt0Ebh+2AVl+Ob4zfo/Cv/naQMUqTp9Ru6TiKD3b9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGjm0rh1TfMc5ydIRoM4hzZyTgZ+YqO/PfejQQtrYu8=;
 b=dmQS92xWibef3FttN8KcNsYRoHSs8SwP/I1A2eRq9YvfuzTElIxfjYFTE4M5ULYZ7Wd3I/9X4xwO7jxvDW8X6mRNFCyR2+B+3ZZjIavz2k1KbUSfKe3K+/FVBL/omFXDVGt/eSOOJN+kTwaZVrWuJ8AoA27zBCgtyXYe+XydtvghtuHqZXjsvgRYVMWTi6LycqYSyOC2peIqWAUIo2f9GAAGyCPCCcMFvAIPbmj7o7r1zhyRhGr1mFX873ccokngYbARhS8JqS5TO/MxhdUesJzlv04L9fzF+IVsOJgFGVKLOhm3gzJVndMwARXima+2rPHPzEQdWKUSt127Nt86TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGjm0rh1TfMc5ydIRoM4hzZyTgZ+YqO/PfejQQtrYu8=;
 b=iOvRcBhgNqmyLR8IJGWBcSemuNzDnIBVk8XB7+fgi6w6sW4rcUa+N2N/d095NkBrOv3SsqTq3nN5B83pNNubw8HnMu14hui02OgWnQIq+AxrEzKUSP+aN7J2scS++PPU2JSWGUOByz/3MSi8FM7jnv0RElAf8HOz95H6HrNNS5LgJVlTY0EyEqKY/csGNQRGjCP09kGjpsL3x1op2AvabbEW9HWHJCay38Z5CvKCt3AT3sOdyMl0xILvRzx8NLBAchy9D4gkvFWlhbQfDEwzo/FVQBMOPgLb6MJMjUp6P9gnWT5UAtHp4QlI4Z0KFk7tQrbCdpoGn33VenzF8csT0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SE3PR06MB8500.apcprd06.prod.outlook.com (2603:1096:101:332::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:55:19 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 09:55:19 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org (open list:ARM/TEGRA HDMI CEC SUBSYSTEM SUPPORT),
	linux-media@vger.kernel.org (open list:ARM/TEGRA HDMI CEC SUBSYSTEM SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 3/3] media: cec: tegra: Remove redundant dev_err()
Date: Thu, 23 Jul 2026 17:54:59 +0800
Message-Id: <20260723095500.523448-4-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723095500.523448-1-panchuang@vivo.com>
References: <20260723095500.523448-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SE3PR06MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: e14e79d5-c31c-4924-944e-08dee8a080fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|38350700014|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ZQkObpEkIxmtFOrEZ0XTxgPMhnzkbK+A9OTKWY48fQ74IOoFRQlRwBBeE/yi37GpauPjYWqDKIybf6GoOKumYYp0FIGNJzgvQzCTSbQnDigfOYfZxFyKDEQEuKa6h//3S3gQTr2bGPcWoeUKJcmD0yhXN+EYptg42JkQ4+xIDctnFJAu0+DkYlSdKjjYxGKNWS2oCkCir2m9n6XardBYMpLhdBEbGJY2Jnj/ZI0F+Spzpxs9/lT2tudbkMliOPQzkdpLu60Kcny0HsuEi6LYQE2BUvXjK1rkFv2dJXE7nPYPqNLTYA9vldN5n/FzXmwxKuX8t54dbGschc/7TEzIysGefGe2QKBD+Va5gtwwsHHuRj4eapcF5ipWk4VhtedEPybyejyobsHisIrXKAPAUrbu4kGbRq63bRBpN0tHgNxqxyAZWobjrJYdZZ+RzMaSxEAr2oufZkGOan/XLdLKu8DhnDbZ/YsApgjbSiKJtLTUwLYOlt/A8pT3XIocX8b+/C0lcAMaHiG09KHdsn1ql22HQ/JBsXXnofGnr8Zhr4T4/Fdr1HiXK8bIAJpZQdXDOf7KK2JHhriqb8f49dTVY5uMqQvcvLIK21xD1SFJBh/3DghDJsHfM0xXw1A0VNGlpDnE1cr9gOP/QsXi7S/ApkkrdtRZ9sTH1SxD1xCEyF7KrTVX4GDhR9g+fr1NVksB/gHAwk4wvCd3Yp6bPCNNqtPlqbzoD6cAhsV9AwIAiD4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(38350700014)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VolCpQUdyzmyM0Bs3m5ADi92DF/I7ehpMLFK1yTLI5vu7IrRVLdD1QbAGLrE?=
 =?us-ascii?Q?wMT9olkF8tXTEBxg0mXgLYNIYzfvX48DY1b2lK/mo8s98VM+EA44kPI3w4Mx?=
 =?us-ascii?Q?XNTowKgGLz31RWC+R4Nhgd5j4nvkOs+O7D1k8ZjD9sSIbrz1BvC8uQe/G6Ig?=
 =?us-ascii?Q?WbV6NOcFWvM4tzz08rZWO2I5EdjjsyC8v2gelawe4tI2n0MaHMBr426aKZw8?=
 =?us-ascii?Q?uxJuzRoMOjKPqhLptbHFyWSkTy07Ey6yjzSbtH6hzEIKAPsC4kuKbuvs0Fa5?=
 =?us-ascii?Q?BkfvbxHzqwhnDZIRnOhlgsFx5PqOWqheLCXqcSMla4I5YNbOaIMfL8hCCqrO?=
 =?us-ascii?Q?AzBhu4ltgs7P8js/fXqTYMWUNXyOcrvxuHF38zBSu7MxWDW13Mzj6uCqy5Y6?=
 =?us-ascii?Q?6BNr/CilwQhHcYij0de+4HCz5GKpjt9cjJccS9HGDmMkyVaANzNSg62dHsTJ?=
 =?us-ascii?Q?C9gyn3VPwgUbHZPnVdPwLIWGkkJU+NEkAFisZ6YucAvhGvYhVp7gvXxKf/9O?=
 =?us-ascii?Q?ayvNPoXGCIXskQCAtYF+ZWWBPK5I4PnpYBYhxPbOqylvhrdVlz8Q6+AG/uog?=
 =?us-ascii?Q?7d04Kv3tnXJTqKBHP41knlERfOJ8l+xfSoV2OHTxyTw78zNQLq4bu4jM+Yez?=
 =?us-ascii?Q?K4DjZpxfPZ1i2OkbKCVyOzzRsFC1o2ZxgSlpAvC7nrIP3CBMqbo2Qyk26PgC?=
 =?us-ascii?Q?PZ4x7nW5XuhZMhX+4nOPul0ComM28hoFop1BvNX05UwhtDibkLZ+ChiaH+Xv?=
 =?us-ascii?Q?YZ1i9zlBPO8RCzBLCa6NKrL+RAPF0TwarCFSjRGpMkMKv5cEL8pDBBMFAmmY?=
 =?us-ascii?Q?Y/ULkZsnE2VJvT+0MqCRPP7XOwSTU0ZWL9zD31+wXDIVUvPciTMxVgGwsqo4?=
 =?us-ascii?Q?oKi4d+ORqqeGihmDbUqDkUZ7GNWKYDlWpI7OTg81mBkKqK36XTpZG495+i3i?=
 =?us-ascii?Q?Uv+g63aP0asDpekY6COcILbZg6rmeWe8JMXRlz+y+A1e0H4nMKblWTPxao5y?=
 =?us-ascii?Q?4iEcDBEZ1VCV1R6mjss7Q9qUy3CNsBDLuFpmwLyJBVTctYcuPopwPZkCAuOn?=
 =?us-ascii?Q?BmG6yg9A7BoL02KBT58BuBPE74SvR5WdQMA1OlmKMqTSk/BBGAm6MLhZqw1x?=
 =?us-ascii?Q?sDaHrj9yKyV2EPjFykdshMwLsdM0QHHkzU0LGJxWfScRgVxTxpLezuCPhLvf?=
 =?us-ascii?Q?L3/7Zwsi/8BqDIv2+aNVXqfOTMPQJkL4jHL6MTbLhsUzQRwELIwcWbvl5Tgq?=
 =?us-ascii?Q?jpnYmFyCOFkjOVB/C6oEFgwk/QCBLBjjd9pN4cbl3au6MBKcYqnopuTAeB7K?=
 =?us-ascii?Q?0vbKpug8SdEK1ui4g5INszcVzaWPsZERGo/PDfsBjLtQYHFDSY/Ghgel/ryP?=
 =?us-ascii?Q?N6lO53uHR58QcnXKHbMMopOiUNvOOxUDnlTfv8lemCImGEWtyM+5BO435k9W?=
 =?us-ascii?Q?jygbQ4ysbkKCvXadKgYV4dB/YfXjRsNpf/B6MPoem9YZQJI4TddVMd/qETsT?=
 =?us-ascii?Q?p8deDAw6SrHIcIm4xwVrFbNigpsZlIWAPr5Slei0ZzGyS17d95hrb3eKnRae?=
 =?us-ascii?Q?K2Tt3yDfmVeVIO3qbsFkfD+ZtxhNUlC0ziqBqISr7rXRANAfO9Rk2JbhOP0x?=
 =?us-ascii?Q?fRv5+MNz9Pe2XGMDfLYljHkYpCo/E2DFcFXFSliPptm18M7N8vxVNPweyA31?=
 =?us-ascii?Q?0ARYchc00/vNZf7FiKn8397h2GEjBrJp+OYcI6/hBaft7DlBQo6/e1DfjX5s?=
 =?us-ascii?Q?gfvpjbxHtw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e14e79d5-c31c-4924-944e-08dee8a080fe
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:55:19.1510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QZzIJbXyct4meSjuTVJDO40me01Un8ClGLmwZN3N3r8G8GbRVjPnQd84ti/haE9GbGVOuPajpuWrJbpFYlNKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8500

Since commit
55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()"),
devm_request_threaded_irq() automatically logs detailed error messages on
failure. Remove the now-redundant driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/media/cec/platform/tegra/tegra_cec.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/cec/platform/tegra/tegra_cec.c b/drivers/media/cec/platform/tegra/tegra_cec.c
index e22a4625f192..d64e1662249e 100644
--- a/drivers/media/cec/platform/tegra/tegra_cec.c
+++ b/drivers/media/cec/platform/tegra/tegra_cec.c
@@ -411,11 +411,8 @@ static int tegra_cec_probe(struct platform_device *pdev)
 		tegra_cec_irq_handler, tegra_cec_irq_thread_handler,
 		0, "cec_irq", &pdev->dev);
 
-	if (ret) {
-		dev_err(&pdev->dev,
-			"Unable to request interrupt for device\n");
+	if (ret)
 		goto err_clk;
-	}
 
 	cec->adap = cec_allocate_adapter(&tegra_cec_ops, cec, TEGRA_CEC_NAME,
 			CEC_CAP_DEFAULTS | CEC_CAP_MONITOR_ALL |
-- 
2.34.1

