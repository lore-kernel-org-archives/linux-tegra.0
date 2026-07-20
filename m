Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013000.outbound.protection.outlook.com [52.101.127.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7004E3DB33F;
	Mon, 20 Jul 2026 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541592; cv=fail; b=G8dwX9XWtAzXIxqqkDXwaLyfM1jBFglIwbnMf8q9ey3q4zb9XtTN4dAkhb7jQI9QIQwlR7xo1D8fPao2vkU+yoo+3fjJjjblYmWAOvlhGS8NFKuTzUGh8PiARWM8GXt3e8MgktNw6Nn8mCCJBKHNOukjJHzOFdVUcLwg/xshm/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541592; c=relaxed/simple;
	bh=f2y5IoyRsVo625tw/4ONsmLR2r3QdccnVgPmleoY8CI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WdiL6bT6NPjgjJGKaBNlGF7oWLZdJJqKolLWCIsjlR1H0VJpkAfLAYq4q5ehxRUHSKL9UTKPB79hJRMu+JdQxJBNLSybdrZcKtTgJsgiKwXrMPwQ+y1quyflZbvwLfio7eE/5PbErTRDLDeceIVGcDa/vWHgPJ3cIv7n3w1KGDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=OcnLdXgN; arc=fail smtp.client-ip=52.101.127.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="OcnLdXgN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5eOGliAa/tl/qoP98rZ2yQU8xHeY9wGik0BN3KlFmaYxNOpTCDeyr3fpV/tc7TBUEZKJmtMxwNPGysQBIk1kcRFv1FkEIySVylTJxNDvNUYZWhCsz4tef6MckBPCBLFPacUiLZ2eK9rbnP2ZBiqGmKBmxSimnJwSTADtZlsj3Zo6vK/6AovncfrUZzpGNZJtxiTJqwbHMG5MUlL8+PJRnWJ5TenaSw8c7OZn3MgLNdyB6F33DEGDhh8REKP9XXEH6GfgEYnYpIo+yd/VVNz+QiPGd0CRzsMEzWooAdzOf2jh7saug9M+DJyRhsYaavYPnvUxlaTgF+g+TM7xvpltQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Coof0Ig6LFxjL2XopV7Z88B1ZXyxYx/OOQmbszRM7Cs=;
 b=FRzdCvSUhAWpghsy7N/Jy6DOsvCzYOZQ+JJyVNkaslo9qUGBCjWCnOR93gUfqtD2EIGyiJOcdoNP9/u5+6Y+Iloj/DQY6ItLt1efAaHz1/Hxf30k3AQRnwY6OscWX6YPwHiwkWxFY/Q2w3hILg9T4lrx2VcEFAaKCau5o2cbOP/9/eH7nn7NUgoAivp9Zo/d3msVufmEFzRjEclbcswZZjxtMwLr6JrTjwu1FyPCj5bKi4tV4AXNnKCJXDwc9BaIv9mhR6muZG/dsVQGdA0qFQJqc2FIdu8jsBW8RN6SrRQlI/RZRJa2+u23LTU6Q0HCfIhxAbKjeVegNfn//XLxQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Coof0Ig6LFxjL2XopV7Z88B1ZXyxYx/OOQmbszRM7Cs=;
 b=OcnLdXgN5d3FEHS6dQXuAOVl3u5TKKnO3nxfHQ2r25oVrf4MUnG8aEssIuF3fKUTbtY/V2NDpagsEBB7HDVLo1Esuodp9zPMJKWvqY0Km0KrgkYtQg3aLuthivg4hZ7yjMaI9c/qJI5cE3pzty1zzjOU4sd6SJGtCKvc9b5Ernq1iBrThdGj03AJLsPGq+BwyxbblUmfHQfOWmE7Nk9AbPHoZxkry0Rks3ePPu7BS9A9l5TuA46C+DsYiGnyv9Xgvx5KoqEXNqfrFBzTPhKLNuThkZ9etT+nptrn21CObYeC8RH/0z+NsPvNUrwQCD4flKJKSQJDTu0sOagIsihg/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5828.apcprd06.prod.outlook.com (2603:1096:301:e8::11)
 by KU4PR06MB8458.apcprd06.prod.outlook.com (2603:1096:d10:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 09:59:47 +0000
Received: from PUZPR06MB5828.apcprd06.prod.outlook.com
 ([fe80::1d47:987a:ed97:769a]) by PUZPR06MB5828.apcprd06.prod.outlook.com
 ([fe80::1d47:987a:ed97:769a%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 09:59:47 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	=?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	Pan Chuang <panchuang@vivo.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/7] soc/tegra: cbb: Remove redundant dev_err()
Date: Mon, 20 Jul 2026 17:59:11 +0800
Message-Id: <20260720095920.542801-6-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720095920.542801-1-panchuang@vivo.com>
References: <20260720095920.542801-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::11) To PUZPR06MB5828.apcprd06.prod.outlook.com
 (2603:1096:301:e8::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5828:EE_|KU4PR06MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 6adcd7f6-4424-439f-bd4d-08dee645a15c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|52116014|376014|1800799024|56012099006|11063799006|10067099003|6133799003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	a2WKH+umtv9zwGGVAoKv9Bkf2IHmhXXtagw31YXqBwU0VjNp0i08WaTD+UmPH9+bE6PYtE/BVot+om1dUFbCDuwlIgKqLOUQDY05U1FZzdRpQLrjozhQZR8QPuoEesd6UCG34+TiA+RDbsnCBNSgC730+zwEauZLZ8JOFVrrIXUukPXmzGSvxdTzEouwXLcyilAq7249+WVmhXhLm16nZ3kOQjOhnT1JI80al8h/2PlXrCyCJmdT4uNyIq0sstIIazBZMfmi6sijYFGewjHQ0NDqluwRiZsdMr/gbifHBcbWsVIezUp5zM5hYuiigHx0EQKGX+SBGlok/BwTdZF3oj+k+0tnjVXMIieIBN48ukJQvHbB2E8hvaA875RqOhoJMtQr/gosC8UDwZTxETAVH3IijOuFhrc5208161m66DaZH8P5b8wTVJXJ0PTTXCLKAzaNvVxPXw2cdL9jLAzoiByEXUzEK9ndf5JjNtw0nesKK21OU6Gc50AyOr7S1GPPwUqcgMBwmr6ziYjpyzR+PMEsVpH/OZLwMtBuATX4Zs4fvQeD9Z7zFAwZQe0KE5ewS2x3CuKHwJaGC11BTKg/aKZ1LLtfIsjgD8dXw8I7qiwKFMGyeR/sC9tWNvPiMRQ+I0YRTCtAojr+rj9dlXKe/45BiKIn0FfAT81Bh3H/p/nMqQ/OGqya74xdr/HXhc5lm38mN21cGRktcLDwoAEst0haA3rH6ctSoejE5UX99Co=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5828.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(6133799003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qgsIYcaLs0kCEsBPoN8T/36iWrdu0Nuxtxbw2lASIm94R+XI4garlfqjYQJc?=
 =?us-ascii?Q?juW9BrR963bdUCWi24IV7JHnylq6ArIqO8lbKq0xUoIRBMsHYHe66tUQGFqG?=
 =?us-ascii?Q?0YyFQCTIt6oWb2/KwWrhgmKHUKjKWbfnQmJhzBPd/X+LcIpKBJ5QMMQIQ/9/?=
 =?us-ascii?Q?CtlQpzLwrDTycyNSI4goTkJuPo89JwS8oOE3VdCDqA6JUdXcZcSMK7yaMkZW?=
 =?us-ascii?Q?iLZUz2AOYeTsyoVSZrF+8oas0Pzch91w7u9NLoCjGh89EhIXJ94FJ5e3jgkn?=
 =?us-ascii?Q?A2InQfIRiLEiPrcrgsjVKPXjWL0Xc+OxHdFwGGfW9mzyA1vomb682Biy2y6K?=
 =?us-ascii?Q?+T0XcV8piR5ctejTZyVlw2k6rQz1vEepWixr28BOqMXOYYsF1E9ayQZzWtKH?=
 =?us-ascii?Q?P98t/hEhmfBXwL32qUXN0Xywt9137YSx8aJnvD3yuvnLjr10oE+27ggp/Kk9?=
 =?us-ascii?Q?5l3k79UWE0N9VtLJXVa4sOOy0tU+tdNGFPakQ5pvxKETbZQDj6rd00lKz3lb?=
 =?us-ascii?Q?B8k4PnetRzHri2SlVW1OzCfb5sNBuWBNkJUBR6igNkT2FB+95deO0x1lXMy3?=
 =?us-ascii?Q?gqjNm2qCQ1B51NXTwwuYT8NjDqQr2VPAWxZTEvNSL5+t9AyJ6UpqXkCstktU?=
 =?us-ascii?Q?cnSBeSzqmvSPeWHy2lWBI/nfAjDgkbXq5o/GiSZ5QyX5APYF0gp38NJpJ6yp?=
 =?us-ascii?Q?xAqs4JM8SmViU1hoG+HA91ZxrYK7HfTUZpUa+ZBR4wrmXbc4olgo9lTKoHqd?=
 =?us-ascii?Q?ymXjNYcVe7FTGhL5Qd/arp6B0ZHRWMNIh6Y4NqqFnPvzrqv3PVEBoEOdpWGU?=
 =?us-ascii?Q?zKTX0pFyzcimJRAx3WnS+BueNC8W+d2djTd6KWGqoCTgzjmF/h0ZYGlljiB6?=
 =?us-ascii?Q?EReb9IS9+8fVGrayuVrsE4+GPl5gqWlsQ4gabmR828A3DQHDIknYvoh+CZkk?=
 =?us-ascii?Q?p9dyBcZpUOZHPrRi4OBIYD0HZmqUgnDPEFsle9EKXyi/vfuNrz4ihf1n5OoW?=
 =?us-ascii?Q?r5asQm8auqGMdPREju+iptOP+lv28S/qeQIkszmGcHvUIKPvUtSexAaWNqmp?=
 =?us-ascii?Q?6tggaLjrfdmLvqE4cFeMoUzHrJB9o3jWuAtLZM7wvk+VkjvNobQ0NVNf4+PH?=
 =?us-ascii?Q?TygQUJwn3P5olkvkhWa8VJRzbllQes1jJ07XBjUiAxX13YRaWJkj4MCs8WKV?=
 =?us-ascii?Q?4MpmXI3Fb9kftqDaV9xf/Wd7jSmlfsk7gKm52U1IYtNEXYLT2YBBsT+YvXps?=
 =?us-ascii?Q?1iaq+kNv7JlMXXaBURO+opr70oJH6aSO5gydGAu7Ni4OiocaR5Ynfhr0ogxM?=
 =?us-ascii?Q?rYq3PAWDueWtBxwMbCdV2Xq/DxqhFO1JMJ6UJZEVVVRmvJl800yIm20mB6aa?=
 =?us-ascii?Q?TWMDDVh6mlylGHB9ytO+WSs5YV96049aoWtkF3w1/785JNx1hsDDtYaniz2y?=
 =?us-ascii?Q?SJZs+Ih0bsYw8sFurfmmJm+VhCkGx8WmAf3cksn7PzZPJiDJvcj4HlUkR7kP?=
 =?us-ascii?Q?ir1t5LvYuigmfTC3HxvqeqWRST9xiXL+mpByg6SzMcx5riVwxsanUnNRfweB?=
 =?us-ascii?Q?XHE9M2fONXuBStFrLJZ5wWd2sCXbzwy4Z6eHK4W+SslqBb8jzA3EIxJUYcwQ?=
 =?us-ascii?Q?ZC+qBEBJYgRp1HGsP93Ek2dM67wT+pushYpWhdjOe4oey4T0BbtQ3MDgU5I/?=
 =?us-ascii?Q?isrIL+Dw0+1zkN+1FJxTMK6hGVUqyeg/RIhOPbXQXqh1id1ab4Uu1+FIw4R8?=
 =?us-ascii?Q?r6qIBKr9Tw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6adcd7f6-4424-439f-bd4d-08dee645a15c
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5828.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:59:46.9408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YiKHrMoWCNYmfDpcUID8lnQw4gbWc+YBSuJyOVJGnHeYxtcGfAfcbbx5egSB82Sub+0J4ZOeUjdPrQHOw6y30A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU4PR06MB8458

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/soc/tegra/cbb/tegra194-cbb.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
index 2f69e104c838..69ef929e04f8 100644
--- a/drivers/soc/tegra/cbb/tegra194-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
@@ -2072,20 +2072,15 @@ static int tegra194_cbb_interrupt_enable(struct tegra_cbb *cbb)
 	if (priv->sec_irq) {
 		err = devm_request_irq(dev, priv->sec_irq, tegra194_cbb_err_isr, 0, dev_name(dev),
 				       priv);
-		if (err) {
-			dev_err(dev, "failed to register interrupt %u: %d\n", priv->sec_irq, err);
+		if (err)
 			return err;
-		}
 	}
 
 	if (priv->nonsec_irq) {
 		err = devm_request_irq(dev, priv->nonsec_irq, tegra194_cbb_err_isr, 0,
 				       dev_name(dev), priv);
-		if (err) {
-			dev_err(dev, "failed to register interrupt %u: %d\n", priv->nonsec_irq,
-				err);
+		if (err)
 			return err;
-		}
 	}
 
 	return 0;
-- 
2.34.1

