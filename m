Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013066.outbound.protection.outlook.com [40.107.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95753353A72;
	Fri, 31 Jul 2026 03:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785470138; cv=fail; b=VU6exWEmGkS6TCeXnqe6FOVv0GTQZVIJvDUj2pwtmB9tl/jMRD/WHO/+FKzdzE7uQvtehASxfbKDkbwhcWBM1vl8ghIvNdUV94H7fIcyapd5s9ru37nMtDVmWHGUQ1qn98yODbSFgFWWgjTJs9xDX3XJ8TQ7fiShlI+wTERKJjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785470138; c=relaxed/simple;
	bh=J2YezQSgAEka+JvbWc+qO/hfxlHXVvc5jd2fLEggzgU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=arfRpRxkMgsoE4Cx9vgmfmdARFNHRmuJN7jvulhRpblsqinIV6W0gPd0PLT+rLAjeGXTV1VOT+uuqxEVRvLBhhTfi1RXVEdVX41QFVF0qgS91WSux/lZkqZjQugDZOvZy5ssUPeIJMEE/A2KzoXaB5i+aYchQUTC9yYOSrr1m0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=jpRGM2QK; arc=fail smtp.client-ip=40.107.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="jpRGM2QK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRhSpSghEoC4ZINKsyLgH8mGLpDEwUM57ReYfGL1bYXLdjKoFo0D+qK7/GsADqB1inqJpc8FZIASfhbdLMPI4mqDQ2GkU7tBaF6s9GMuFUloQ1LoO9aN5a57JuszmIvVgYmpCUugJDM847kBdRJw686YKfWaVlCCI+XL7r8bOga07bOt61l182wv8omJifIkaWuu3gJO36TTmEJSFQeeHoBiLcKak0m9E+Qw4FiYlOLi+Pl+qWNW73Zo+UJryBwOkPeGOltc9yzSp4hRiaF6UqgmOInqow9V3bGTDMHY/0C/ZfFTQK2mAufuPIaladQ1Z5dXam0xHTN9x29pbZ/XGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tmKYx1LGYyqO5LcciGF24d6pBD8GkljLeec8yTVWl0=;
 b=TT5hvNlDGGmMRUkGh4O3DOMFdFlfns4ke5wDMOOmMXutBGNCzjyjjETQqDp+IiV6oivpv0Y/8pxYMg2i/YywKq1ed+mdPzyaBY3JDnypyhDM87BUXRD+Forvbi8Ag+fyeZdIKLvgPXvfYZARsAjeOHhzNruxFV0qXmAoXRUPAPa+f0uFoTYQ602pdwTneOrJB1nSq5UPmCOxQ+aIlaumYNiKpUFKwUiT3/b30JknnttO1GOfoUgXj21O8+BMk9imOWQZLZIhov+G13sSi7fVl0n95v5vJ9r7hAF8lNxtIAAnnpDjZ+MXqhV60OQYveKhP0hGtBPJaQddUE0IA5g8oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tmKYx1LGYyqO5LcciGF24d6pBD8GkljLeec8yTVWl0=;
 b=jpRGM2QKryEI3SCZxw/TmS9z98Dhu/xB4nVayuBN7SfpSo7auxxJljy1swzqmraNLU0Oz/5kzS8XNUS9oOQfLi0qC2oRXOfm8KtIfvHZK4i0HqzxGglNlY/mHyCEvB17hNA4v9FY9OWUWmQHSQRB2wM/+lQzP1/Jsw6auUgkzI9TYBnN2wbepjOChAaFGLVfZ8jK/FWjJbw3UQwAS0H6398zaJTio/+bdWq/8AB4eyED6zj7srPWg326E+X+XP9aMTBSw2a0zyUwJ5uR7Cr2bQi6A/gdQ+ab8coW0nb0GT3HdSkBVapx8Nq5KbHB1KmEbiEGQAWYFNE8qZzmoreYyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYNPR06MB8782.apcprd06.prod.outlook.com (2603:1096:405:3c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 03:55:24 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.012; Fri, 31 Jul 2026
 03:55:24 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Neal Liu <neal_liu@aspeedtech.com>,
	Cristian Birsan <cristian.birsan@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Herve Codina <herve.codina@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
	linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 USBF CONTROLLER DRIVER),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 05/11] usb: gadget: Remove redundant dev_err()
Date: Fri, 31 Jul 2026 11:54:39 +0800
Message-Id: <20260731035448.252289-6-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731035448.252289-1-panchuang@vivo.com>
References: <20260731035448.252289-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:405:379::17) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYNPR06MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: e9be1bf0-f77c-4d18-470f-08deeeb78cb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|38350700014|921020|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RuceXVeGNkOG63WoYcLIgsAlPcydmFncr+Yj82TF75MbqJfq15jokmiPbw6/93pkm3FKSUjqf3woUpk92WlsMC6gqAsJUgmFlVo8t06pAHkDGJwWj0KZJxwDyte83I7rhUxzV4nVJWB+auQcrXHFNq9HXCUNXmHJ+9tVqX2VmmFZIGN+mKQAYE2dPdnt4anxSDyOgPzBMlPwdWCIluFGFMf65EmFAZ7BgUEbDuNP4F5dxQsr+I4Mdrh2+N/qenuHvQH9lFChq5qIEikfPTdZADZkSt97yFlmBYK7E9qd+n16v3g5o7Hjd4Olb3ozDWsKpR9GIS98vz0VrkTCLxvDvt28bSuNS9A5rQ6WdE/XUh/31eCFG0NkQrHX5d0szH0Y2Uhu3KGwA0sCIUOvwt24EwvbFrg0H5iKi10eEdyrUkYdrf8ji1p4lSl8Cy0wf6HJr4xwWNA8gN3KoLvCx0uoLvmsKYcSTsG3Vs8rdQZgRZNjJN8eU2hppH+XjsyN2odmunaIuVGYuN3stLvbF3GgL9rDn+WKOqGbO3RLdUE5vI4SsfkYNdLMY+X3XcHmof5o9wckyBhdI6iGgyH0nzquOp7BXSvctL9xZaPv7orfvC8hGysTF2cgvCyVP2zsypZlZm9wKiAVlnWyY5Gl0cHXvK7ij2x2XtmLcDyI1vChBjs87XkZjl1IVOYa7CcfD67R7nZ0WkT0odhtrpWz9Nb4DnmvVgU0dzTmiQTD9sYOWuXxQUq4ee3vtGsoyjfe4ldi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(921020)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GhRikCzZHES0yOgiL9rNU2BzecAWJkUyi+VY7SiwocDHF/tCfV3o2SB1+fDD?=
 =?us-ascii?Q?s0+23cSlDT0SiHgevbIVuqUy+jzAOuD+lrfaXNPzGccpZ+FHBeijMdcxBj83?=
 =?us-ascii?Q?PHgNTsLO0XoU3RaNG72xsCbqe8tm3d5ebyQraQ/c/V0qVXOky0oL6FOFvIjQ?=
 =?us-ascii?Q?Bl+DkdTB168sIljXIn7hZZFgJOpNDPzhLVlFLwTOW0/xHXSf3Epy01EjJLte?=
 =?us-ascii?Q?paQPlZTDtO2e5/7PhETzTV133KKGy/da5I9/7blGd1pMspXLD6cr48NioNAL?=
 =?us-ascii?Q?X/thIx4ZoX7Zikp/t+cM8UJqlvZRWwV1iXIkVp6FZfeZ62VSxJSHDKVMJs0I?=
 =?us-ascii?Q?xzJK+UG/KEMa7X0xwk/AZZCpKPNPMf0aUqG+ZFM3l1EVmgGOV7+ZHwyaxV2Y?=
 =?us-ascii?Q?sSu55A1ghcTlvbfL8SIoE95egsgkdM2s1wh+g+1fu1maZ652RQiFvhMjfXwF?=
 =?us-ascii?Q?bSyhujObN2SD+Yz4w09lO3pDTmw6D7+8iF5/b2N07Ye9J4S6N40Huhgy2CLl?=
 =?us-ascii?Q?tyROg4goZMgKKfsQ19dP4n9gGMcfxmQUUvkPYwkS58aHxWaI3iw/ZKVy+dBc?=
 =?us-ascii?Q?4BXylxbw/9WndeWUXttQeFf14JXCTYbZTog/qBsYlCHpo6ehl25VhuhAiL2b?=
 =?us-ascii?Q?18bq+qvAklWie5a7cclF5KPE1QXUjkLrNnbjIzDezN6kfRANQakpR0lFpDlp?=
 =?us-ascii?Q?f2XknIJEftsbiTLrtG0Xs2FLIOC3+79WD9HY/8JsVxU3ROBcMpCESLQD3C+D?=
 =?us-ascii?Q?wyfsrUPNBog+zvB7o74WVShI9ndGhTTCsU3wVQhYDtDhol+OKVyHY/nBKX5H?=
 =?us-ascii?Q?8Z8lEsGpchvm/rl0kN+IlsgC/6G1QhWLB+KpYsVwaGcsZpooblDnWYmumdPk?=
 =?us-ascii?Q?MsLhSFRMhSbFI2kefce+TOikbgCLuUr6m/alCwwFqMlBQ0B3HFdVuRJcScO9?=
 =?us-ascii?Q?VAfnB5Z5wQogpes3GrA02becEW1A3BSbVw0r8AIXvgD9+rI6wjLK+zDmDuGH?=
 =?us-ascii?Q?erIMJYpxfmvC6rrkh3xZfNnFDedjaqF7RjcajehTmsj2jwvRgR/biYdgXP/e?=
 =?us-ascii?Q?A6sY5NKcsr1h+d6D8fTLU+kDA0sRRBYbR5NmYPTSGOFyLKPyxABLFmBM1MUp?=
 =?us-ascii?Q?UPRLdy3QpR/UqYiFFoCK8HXDL0I2yKGwrujw5g+ZIFMb+OSY4sCfZaZwLcU1?=
 =?us-ascii?Q?mGXoNvCxMHDJSphpnrooip6Lj/oJeFjQh+UDgv+q/5gZkWuVwZaVJqtpvPcY?=
 =?us-ascii?Q?q5MRuB51pGQJu+96fO9x086bMne1thNQsptXEbxvV8zMFVFS5OrEednCoGTn?=
 =?us-ascii?Q?z/izPg6xhF8BoEgrxklI+vqmCNxr1QLImqeGVTcDCe9iiCdaiMjwGaYTrjbZ?=
 =?us-ascii?Q?6pFVunOAxyKwxawQXxr/FwzoTkX66QqCvi0BEiDVXdXFsVa/i9XiuiRLF9O2?=
 =?us-ascii?Q?S6AnMYTpexbEg/Vl1M0J7q6j5qTw3Eata4N9g3hYpDhOWo75c6WgTVCHkfge?=
 =?us-ascii?Q?OnvOXT2Xo6mzhQIlF2fhfMaL17t3hjV5n0GfG1Fc4c6T4gzwmh6/5Ln+IlZH?=
 =?us-ascii?Q?NVqmH6MWgC52crhiY/Vi2UVgUE1H3uLZZhvqjg9qmsnbEI1v6fMhygNNEPlC?=
 =?us-ascii?Q?HTK92wVJYKACmhZtU5/wAtldg5ZfbHHvvBhhLRmXVqmxFaohcKkyrw1WXnnN?=
 =?us-ascii?Q?JOjkVUCwcz7P9pCJsQRcV/ZcwuaPDXM60Emrtk2WpcwmxB57AIQA4Dcr3on2?=
 =?us-ascii?Q?7/rTsXW3Aw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9be1bf0-f77c-4d18-470f-08deeeb78cb6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 03:55:24.2122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tLOBZYcFqlxK2XgStPZElbj5kE3Xspsht36hjj+4Gz1R1DoNB5o4Hu2j/7oFa5A8dzjlnPQxeN5hXg5tcNjVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8782

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"),
devm_request_irq() and devm_request_threaded_irq() automatically log
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/core.c | 4 +---
 drivers/usb/gadget/udc/aspeed_udc.c       | 4 +---
 drivers/usb/gadget/udc/atmel_usba_udc.c   | 5 +----
 drivers/usb/gadget/udc/r8a66597-udc.c     | 4 +---
 drivers/usb/gadget/udc/renesas_usbf.c     | 8 ++------
 drivers/usb/gadget/udc/snps_udc_plat.c    | 4 +---
 drivers/usb/gadget/udc/tegra-xudc.c       | 5 +----
 7 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index 4a8b9ff8368f..4ac990553a86 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -379,10 +379,8 @@ static int ast_vhub_probe(struct platform_device *pdev)
 	}
 	rc = devm_request_irq(&pdev->dev, vhub->irq, ast_vhub_irq, 0,
 			      KBUILD_MODNAME, vhub);
-	if (rc) {
-		dev_err(&pdev->dev, "Failed to request interrupt\n");
+	if (rc)
 		goto err;
-	}
 
 	dma_mask_ptr = (u64 *)of_device_get_match_data(&pdev->dev);
 	if (dma_mask_ptr) {
diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 54f81e668009..08b24902c7b9 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -1568,10 +1568,8 @@ static int ast_udc_probe(struct platform_device *pdev)
 
 	rc = devm_request_irq(&pdev->dev, udc->irq, ast_udc_isr, 0,
 			      KBUILD_MODNAME, udc);
-	if (rc) {
-		dev_err(&pdev->dev, "Failed to request interrupt\n");
+	if (rc)
 		goto err_cleanup;
-	}
 
 	rc = usb_add_gadget_udc(&pdev->dev, &udc->gadget);
 	if (rc) {
diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index 72a2f95ff018..18b4b2358d1e 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -2332,11 +2332,8 @@ static int usba_udc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, irq, usba_udc_irq, 0,
 				"atmel_usba_udc", udc);
-	if (ret) {
-		dev_err(&pdev->dev, "Cannot request irq %d (error %d)\n",
-			irq, ret);
+	if (ret)
 		return ret;
-	}
 	udc->irq = irq;
 
 	if (udc->vbus_pin) {
diff --git a/drivers/usb/gadget/udc/r8a66597-udc.c b/drivers/usb/gadget/udc/r8a66597-udc.c
index d190e16d43fc..915786c9628c 100644
--- a/drivers/usb/gadget/udc/r8a66597-udc.c
+++ b/drivers/usb/gadget/udc/r8a66597-udc.c
@@ -1894,10 +1894,8 @@ static int r8a66597_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, r8a66597_irq, IRQF_SHARED,
 			       udc_name, r8a66597);
-	if (ret < 0) {
-		dev_err(dev, "request_irq error (%d)\n", ret);
+	if (ret < 0)
 		goto clean_up2;
-	}
 
 	INIT_LIST_HEAD(&r8a66597->gadget.ep_list);
 	r8a66597->gadget.ep0 = &r8a66597->ep[0].ep;
diff --git a/drivers/usb/gadget/udc/renesas_usbf.c b/drivers/usb/gadget/udc/renesas_usbf.c
index d67002ea049a..367c9e73f366 100644
--- a/drivers/usb/gadget/udc/renesas_usbf.c
+++ b/drivers/usb/gadget/udc/renesas_usbf.c
@@ -3335,19 +3335,15 @@ static int usbf_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 	ret = devm_request_irq(dev, irq, usbf_epc_irq, 0, "usbf-epc", udc);
-	if (ret) {
-		dev_err(dev, "cannot request irq %d err %d\n", irq, ret);
+	if (ret)
 		return ret;
-	}
 
 	irq = platform_get_irq(pdev, 1);
 	if (irq < 0)
 		return irq;
 	ret = devm_request_irq(dev, irq, usbf_ahb_epc_irq, 0, "usbf-ahb-epc", udc);
-	if (ret) {
-		dev_err(dev, "cannot request irq %d err %d\n", irq, ret);
+	if (ret)
 		return ret;
-	}
 
 	usbf_reg_bitset(udc, USBF_REG_AHBMCTR, USBF_SYS_WBURST_TYPE);
 
diff --git a/drivers/usb/gadget/udc/snps_udc_plat.c b/drivers/usb/gadget/udc/snps_udc_plat.c
index db842a6de643..9e4f04476595 100644
--- a/drivers/usb/gadget/udc/snps_udc_plat.c
+++ b/drivers/usb/gadget/udc/snps_udc_plat.c
@@ -193,10 +193,8 @@ static int udc_plat_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, udc->irq, udc_irq, IRQF_SHARED,
 			       "snps-udc", udc);
-	if (ret < 0) {
-		dev_err(dev, "Request irq %d failed for UDC\n", udc->irq);
+	if (ret < 0)
 		goto exit_dma;
-	}
 
 	platform_set_drvdata(pdev, udc);
 	udc->chiprev = UDC_BCM_REV;
diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index e9d33be02866..5042c13f92be 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3803,11 +3803,8 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 
 	err = devm_request_irq(&pdev->dev, xudc->irq, tegra_xudc_irq, 0,
 			       dev_name(&pdev->dev), xudc);
-	if (err < 0) {
-		dev_err(xudc->dev, "failed to claim IRQ#%u: %d\n", xudc->irq,
-			err);
+	if (err < 0)
 		return err;
-	}
 
 	xudc->clks = devm_kcalloc(&pdev->dev, xudc->soc->num_clks, sizeof(*xudc->clks),
 				  GFP_KERNEL);
-- 
2.34.1

