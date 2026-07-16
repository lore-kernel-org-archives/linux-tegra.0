Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013021.outbound.protection.outlook.com [52.101.127.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E2D1DD0EF;
	Thu, 16 Jul 2026 07:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784187276; cv=fail; b=usQI6SAD50fbdFLPJN6/2/qnnbMQz9/UMTvo44BCTZGDrKjGzQeVfBNugCIn06iygloj5aQEMTqPGWmIqufuHb5fefQzmk5bV06PIFYZpyrQdB3bBcHDGgGr5ZvrtVIm98ysYe3A732hZJwyu7XvRZkuswHDEc8rsttAtowc8qA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784187276; c=relaxed/simple;
	bh=Hrx3mNNVt419Zi2W4/CSHD+SICOCmy9u4ycyvKoWoUE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=rSP98wt8i67UIbOmpuH/nk6gKM6Z0N6GAYnGqVwoneMGNbnH1Rh3gp3pTWg/UAUHgjIUP1afhRyvZ5HVdmq1q6Kjinz4OuKAD3BrvQScjSPz+4Ao58PC7nbL5pPzsZ8J/1uQpNSWNUU09u5QmsgkICTppGMEwpwaN3zRkBd7+Ic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ECFvOgMO; arc=fail smtp.client-ip=52.101.127.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ECFvOgMO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXlQ7NHgya0HcwXOrxy/cwy76Fu4luU4UdCotbmPv0SAj84VD6k2Vw8NNh+SSTXLJvnpXWLxzvnU7JB56giELcxfkLMXhJSAPC0yFPQe9Jq+xtd1ccaYEWG8D5BbQQjMfklHUOyiRdhP+Xz8k+H5FMqitPbpD+YfUgDwFZ0rfnxmwWORPp8jl42M+ee+CvvPDZ5CASXXEL2WDATYfetgDzztIwI/vuBNSyV75ACvtdH94ZA9gyp7CCQ04XJamnB588T6dJPaJcnXOvB00Z6PqE1BS3Pf8gvndoQQIm2BJ1o7TheLrIft5wjhJEUsJUX5NdEUp+WRlMK5DpyUHQm0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N70XCo5coJhz1jn5rPObf7lgZRPusW1X0FL2Smea+D0=;
 b=OSuPo5JU0WkwcFdKWFQVZJAsjldVKTZZiCMzDFm1VYaVH1DxzHttDvNBhoPFPtM4ZHDjs4DD/0ksuyvDJq+52D2Vsp0Vv79LQ9+wEogbyv53eei6xeR932a+FGgl2PfQSYoM/jdgXBVaazOILJy8zpMNZOAIhoIeLqF6mtBRibwrkmwp4tSTkco9oofUK+W+ghMwCi3skTtY+Ci855gwCudapbNyyhP2A0CZqpo0JHEakg62alEsbha7/C9Y7Xo3+P3pzpimU2aSgEdDTPvHmsqQ9L1IHOqWO0k26Gje1COBViyxXg5r3X58vSjrWrnvKKt6rbfq1QdVXGz4ubivjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N70XCo5coJhz1jn5rPObf7lgZRPusW1X0FL2Smea+D0=;
 b=ECFvOgMOGr5NDREir8vtijU+3VXIkTD6o3XtIXNA4ISg10gSvr5VfnV1CsPaCWVIDZdHZXxwwoU6SiMahExAV8eSFKPhhc87B2ZGEYC1ijTcItuJkA8Qz6VyuFB2FAFHEF4csg8HE78GY+v6Fb1SER0LYg1UyDfmdjrIRhDBzB3T/s2+4+9FPp5ATT7Z/bvfZG9lAoWWq1mVReJdv7ukAg2fnror4cHmSTr9/WKMp4lRPp4/4CcEiVPodTTsi7LtBJlI7OKutIQ1lFor908gb5EcGGgD1ctpRmsm6JYy/ExxMzPQ/Cj7c9vVYy8HeSphTLrUinG/yhgo086W6JNLpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TY2PPF9333C0ED6.apcprd06.prod.outlook.com (2603:1096:408::79c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Thu, 16 Jul
 2026 07:34:26 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 07:34:26 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Dipen Patel <dipenp@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	timestamp@lists.linux.dev (open list:HTE SUBSYSTEM),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2] hte: tegra194: Remove redundant dev_err()
Date: Thu, 16 Jul 2026 15:34:15 +0800
Message-Id: <20260716073416.530829-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0057.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::16) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TY2PPF9333C0ED6:EE_
X-MS-Office365-Filtering-Correlation-Id: af530a0e-fa24-4de4-0b66-08dee30ca9ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|38350700014|56012099006|11063799006|6133799003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nZkgrHEOrV15rvB9Pgc1LCl0g4uCbbtQfmLTrbOYgxBkph6wlmp1TQ41PLEVeld+VJ420xtBG5Ff9L/g8JB0gJPs1lDQJg7aI8SPsNL5GgJ8Jw9liNFKHUp+OYHo7ku3gU80T7IxY+qmEGvGSNenzvtT7mI5/oJ7n+W6hEZTD0ZMj6Gp1KdiWJVVReNuPy8aOD6UXlRw8SAzYB32vITtRd9pOnFbxTWsnkvmlBqAmYsjkyKhmxK86pTMyS1xVC+SpggHr0rY4RffGwKdIm4OWW9T1sbVUVA9gIRYhZGxdz4vtrYxWLP750geOhR1KaQsMjnmQpFR4HmtQQ19DPsyZT5ZZn5jAvWzHm12Kxog18EzE+qY8gO4HHPogRSO/db87lqkbv9P2eebDVnLK3RFgYSI7AAq9iBGYcByI53KsBbM80iD18plpujDiSIxdLuZjgaU/yYwVqBVX51LAJdEcNnbJhnMPZPn+YxbE6C5wjtaj3arrqgYgo6HFz0yQrWjnLampJUTXaxiS1FyxkKW1tp/AtoZTV1pVp3kLrtA3mIREd3rLnFTjG41txXX48U1JrodzRgKULFG/0ysyj0MR92dC7XFAgcxcoMEKmsJn1ObJPgR0mIwVGp0L0VlTjfRdNFoK0Fx8qbpnDg+nO2pXTI7PIhHTuHqPkThE1YUzBHL0OzsYyRNsJ78GBSFhWQe9GGkosLkNWIsQl9wtfcnyvDyqtYBrhTk3izQaqY0idc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(38350700014)(56012099006)(11063799006)(6133799003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HNBHfIBOk8vzyttKfOIa3TRz5RuLuADgl3zvuidMvhkDkzRR6SH8aj0EkFKm?=
 =?us-ascii?Q?qvw1p1oBWmMcXMw5RHujjh1EmIsEAJYZrk2uB0+iYutBaoYXgdVFYzrRD+tf?=
 =?us-ascii?Q?4Q7S5pZmOQIFDN51q2GckXpsm2Wc+jBeR1hqHHO0xkYeMZgFmtVcsrjPEfej?=
 =?us-ascii?Q?QcBSkDwJ2HX2CWUprpoSJUaiIbGQODTs1qzGSgdktqvljaHjIXL6zq8bjGgs?=
 =?us-ascii?Q?jG/9PhYZYPplxjmGZ2RPiV71adtJ1tRm9LWR8awh/flL7fUUAkDr28cxvSkX?=
 =?us-ascii?Q?UQuFqHFLzDQ44/EjNrIpqgCTCI4R0Z9dG6E2wqCOQU0LYwM9B7N8ViJbwWWr?=
 =?us-ascii?Q?kXNmqwgVgJC9jZypUpl4llAbIleGX11nA55ogFW39l+ErUedDjWI/s+KkD2W?=
 =?us-ascii?Q?b+6HpD6r20zi6VKxEBThzYhZwTR43LeBQcNqF26DX+4+a2HXYbAfH46TjzZR?=
 =?us-ascii?Q?oOAG7HdLNeBOCisAC4ZjCDrtGnV2YNEbgNq/TabgcTAAYs19L46DeSlN7Gai?=
 =?us-ascii?Q?gOnWpMoL6djXWVu3xni8Y2xCbLo3A5rW+AR0PWB8IWj2b1jhQiGWbMOp7br4?=
 =?us-ascii?Q?9nB/t4NKADNd0MlYK/aYarGBtSoc7iHd1whQWrsXBva5Uz77wf3iwuy3iTtV?=
 =?us-ascii?Q?CjAkC6vXGYjWxaLdHW+rGBRiWAOZILZhy1hTwqIy/rlbdS4gn4feo1sqwnRb?=
 =?us-ascii?Q?MO7toRRY+SZs8QkLVg6EI+fzB21nLWXlig7pzrUONPDGnCrwcFokxHhu4Bwb?=
 =?us-ascii?Q?0qqVbTsHJEQsCw6MRLPZQFc+xXZP0IWcGsu2tS33oEH+lEkwwSHh7YNxb1VU?=
 =?us-ascii?Q?PtI1T9+gBw6m9Xo0hWxc9kGalZtQuZl/ZNu1yUxr6VoDZO9M9FF0iVlEgDGp?=
 =?us-ascii?Q?1D7sJzvS+WN6kMaV9JfM4UGgOr7ohYsf3SP7GMNION85Gy09Cve25jPmiNLN?=
 =?us-ascii?Q?UHVvHBQM9AuyufQO8ogXZi5MZ4pJNvauLHKaGMCkvuT2pv+PaX2sgagCsq23?=
 =?us-ascii?Q?DB7+TFqjnXqRJ06lvYf322GcD7cpoRQh5iWT8ErnyGnLtVSEnA7jKsrvRGNy?=
 =?us-ascii?Q?9YQHBqbSj2a2KjoVMkJ6XEXdyw5+qDTbuRIuJd38ukkkhwGZZHOSTGifKgNB?=
 =?us-ascii?Q?04EZJ+BpSNx30++K4cTyV5rTKdseS2ymakTxiJtAD78bFdX0fsc3K/zjVt0K?=
 =?us-ascii?Q?FDhCTG7imKw5kcodpFeBVc3y9Mh/1Xpdm4b38Mt/5revX4rXu6bkmUyBJeUQ?=
 =?us-ascii?Q?bDNi6jSx4/pskucUmv59OPdqszY0k0DBRyhFtBYp/M8xk9PgFoTy4p7fbwnu?=
 =?us-ascii?Q?R71lu2SggXj3m1G7sncpp68uHfHOV5we9Dqcz/p3c9NRscXvlhUqDMCQXSce?=
 =?us-ascii?Q?nxQzaaM857dt5jod+6x+4/dLU4X9Nt0XtroMbiCCj4RM+0sWpN37bpwa/XLg?=
 =?us-ascii?Q?eaRV9GycHMY34W5QRsI7KzQM6hp1iX8wzDYJUwDbBQ1gDpLetGB64aP7TmPJ?=
 =?us-ascii?Q?hXf7uD8HehnXkeqOYPMkMl4sdk2N1g1faKjB0jWbxnOqKRrEDnZYj82syFTE?=
 =?us-ascii?Q?syk8Is4ze4cNarLp+GjMgIoqtpd/imzmkqcO2eHIi29xBuBK/UU26G6t7P08?=
 =?us-ascii?Q?4rpeXxLXuUw2XQ0CZpi9BCTFFyVwNZ9OsSu2qTDT/u/NzQyXRrjbZQB0ePSJ?=
 =?us-ascii?Q?zRhsnNEBbLfafS1WkFznKrpjZQ0RuYTdeazIu+nn7Twi/o09KvryttrSbAUh?=
 =?us-ascii?Q?54lYgSxjDw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af530a0e-fa24-4de4-0b66-08dee30ca9ee
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 07:34:26.5083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eS4TgEJ6cYw8m+vTb+GkejrjTuoTNxCUExxR5d5blHfd9bU4/KR9Kb7ZikO2ML8Qvk4GM9/4BuSmO42kji+WXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF9333C0ED6

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/hte/hte-tegra194.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 4a7702b32b24..e29fb105ca2d 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -856,10 +856,8 @@ static int tegra_hte_probe(struct platform_device *pdev)
 	hte_dev->hte_irq = ret;
 	ret = devm_request_irq(dev, hte_dev->hte_irq, tegra_hte_isr, 0,
 			       dev_name(dev), hte_dev);
-	if (ret < 0) {
-		dev_err(dev, "request irq failed.\n");
+	if (ret < 0)
 		return ret;
-	}
 
 	gc->nlines = nlines;
 	gc->ops = &g_ops;
-- 
2.34.1

