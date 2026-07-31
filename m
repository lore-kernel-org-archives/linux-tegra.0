Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013071.outbound.protection.outlook.com [40.107.44.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77CB352C34;
	Fri, 31 Jul 2026 03:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785470137; cv=fail; b=uK1XNfoMIK/G5NAkYVVn5PqPWVvG2sLhM81UpuWZ0U3lyoD23dFk/rgbHtpytzAwyaLKvHmmQ1m1mOxm7QToUYyFrRKGXneREG+bWmzgQiV/03K/SHQnfOXQ3DWclfUdiDHUl9v/C4Qx/0rCZ9Oq5G31Jov/M7LoQ3rvj3qNf0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785470137; c=relaxed/simple;
	bh=lDWqOny6Eg6uaaXrrwjUBTO3ptrW9QM+ja4NSuXHmpc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ci9i0ddlNkrjTrg6O68L7k0cEwdnBoFV7G6rwyUaQ+VguPu0eZCnB5DE/ufBUA/AcJ6eJn2roBL8+rg6y+s8oWPJBu8oLrhdgRbvydCmSXx/a6NGCAutf6fWRWT1KwLj3W5l5uCXEhytLHekxTWfB15O6IG1UAljXK7FhgNLIhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=PDD12ZtE; arc=fail smtp.client-ip=40.107.44.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="PDD12ZtE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqfONQ+r4SQqlXITw8/5xwwRdzcL3JEepact8cnhYID0+u1+mP7T4jokGr/aXLBSVLevE7+WXN3Rx2AB9CD0FUul2Iqd0gAc4cClFrZtRwn4nNeAjPc+qSEdGKKx0GRc0kYlfiSUmFpCTxn+KtJ++xKIDnKUOtmdhQXep7rShWUpHh7v006nNXz+k3HlQItJlp2UqqcHO1Qpo+LEs7TI+rQRLRRNiioaI+gBijTdxFEhngp3yrBqozGrL6JqVp6Vo1S2HhUmGG8BeX6mzgnLPqi2kUhwZ8UFSsDlsAFuSb9frwg6RRP4bGYekrTxajkRFx0OarxHnWbY0SDl+owF+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBotJ0vFdiWCEidGTkW4KkD3/pOB9X0Til/cDMgVdZg=;
 b=HD1NgCMoWozsq0PitxgDXm3T0kYlrvfN6nDPlu3PANRNvcQVjMBG1cxdA58Izj+uqNq8CfWNU6H19QsQ3BTXhob/gE/8m0j54bLtWNDYXum1RiINfGaCaPQXjEAeEIvZIA0DNHOWQH6tibD4dNEhJGmlSZEsoZKYssZpOV4xDW+3PkkQXoriSuuQJA5Sy2TCNsxaM/G2HZKK5wnDQT48ylBpWsZV6XDPXPPgy7nQ/RSUbVXzgmkc8SzmAIFDpFu+YX5LMn/u1aleWC8xDXdvqcCfa1zU21WjDu1xUC3T8OF8HPdK3kpQEIE7Wiav5whgn4Vr85+n5wzxguFvdvJf7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBotJ0vFdiWCEidGTkW4KkD3/pOB9X0Til/cDMgVdZg=;
 b=PDD12ZtEYTpmYBMWgupi9ALR3uMUuHwLngZmlFqYPwx765nMOdYBoFXjAGBMmN2yqNbWn8/TgFBF2KqMb/wVLnBpBfiRFVxV6w874Hr1UewFBBTpefJsPNn4yWQnhYeS65lB6KVcRpVs2nWAvTEL7QpUM/5o1pci+un35X3rw+v1mevpmhCwLvRrL7ID1VcV6l17g/w9IAZI9YZPT6xStY0nfJ8V9GWK4sOYLxXmvVhVOcbXsDT+DiPZ39zgTgKm4X8sZgPdQsc2idrtu1Gu9iYfhkA4l5jP7c858G9mcJNDYEZILUKQmJlAddMg3GPvgyHooClom1Y9hKLAUb7Odg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYNPR06MB8782.apcprd06.prod.outlook.com (2603:1096:405:3c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 03:55:26 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.012; Fri, 31 Jul 2026
 03:55:25 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-usb@vger.kernel.org (open list:USB XHCI DRIVER),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 06/11] usb: host: xhci-tegra: Remove redundant dev_err()
Date: Fri, 31 Jul 2026 11:54:40 +0800
Message-Id: <20260731035448.252289-7-panchuang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: f01f5e9a-cf4f-4c73-95d3-08deeeb78d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MobI6ZJfzAYLe7uznsWSQakLxW01CppFrEVLBNCqk2RaGUmg2IwzYsHvj7qBTMHuyqon2WLxjWuQ7wlIdkjyUeQOaZsK6WwLj53PL7IWmtfA6iM1lWvye21ACS3U9Cw1TKyhPN40c8Oi4NCOn8AV+tzWWlKPnIWrOH5hKcvHlB+SOtZd8AWOG4+o1zvf1pLj0kGXt+PPkUDOWRAfd7/wP3Wa20qAajoE+S9jcrGYMd+SnhMGv7O3a2XDH+VhQTRShY0RykTBIciozjkYqeB5AEULv+5Lx+MbgXq2ZxY8boM8X9hfSbprb+PBo2JU7MvKBVXAqcpfB+CsqrXpDVt0ky4O7j3w5eWjmq26Zseaa/efgAX+FazL1WT6MoTIQ8enVE/FB4+TGB6WgyIaxl+m26rT3CDA0wMQeSkF99hTN8mabsSM64ueY+02vRqNqzF6hKOlI0pSyTxQEOE8gEMBbRJBqD1dUVy2J7ftjiAZBfE3vre3xjsGgFZBDXe1k3/MzCNtDp12IvSnIOlwIK4MVzrZxBgnuaWKswI0eO1s8/IADUsEPD6secVaxBIn1+8kXYo9ygAX8Rz461GAWpB7vWzGihfW2/rPkPmDfqSF8qZZ517bM8d0KdOSkrr/cumXKIYg1TjrjQlEIOFIzzymjlpNAgCzspgu2ffBeysXz7UkEzPojP5/s+gz15RQVBEnhQZxtNY7joyp70pfWwxmKLH+rqK2ZTX/6q6gEGbTg1c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5YXcJ3GgY3oyRqKQGWsioS8uK6CrUUGjGUqI09MVwcEbshDzqg0ZmvlWcLih?=
 =?us-ascii?Q?berpmX3AmEwHG25F93+Z/mtVwaB96soBDomGvS+Okus1iiYtwEkgmmFTbWy8?=
 =?us-ascii?Q?Nxh9HQxnmwDCkbQUTvY13ujXVBo6X+/wRiRibOsFtny0jAbNpyqtMAokRd3Q?=
 =?us-ascii?Q?1VIQBDANofFypmveK00NbB2Q0wlKReYX/VEbA6yeZnTTBkINV5G5H6sbJmX1?=
 =?us-ascii?Q?oYC3278yVIssPSscsqSuBfXjLnuDILfAENEP9pHnVfk1gE9ZQCaejd35OFN4?=
 =?us-ascii?Q?l5eDxm4vMsX/oemESegpcxKQa83opBwTZXaY83gREm/tSux/1LJkTLkFzvLA?=
 =?us-ascii?Q?HXmbQCWg5JYxS7vp8hyAVACkrj8VwXInYhmQRqcx0Ab/2bSIXoLJLwWIgspR?=
 =?us-ascii?Q?HhtC4prBf/traM3/R04YkQnD3XxbSdKbu+/oa7hk/EMTLfhGGOnmgK3sCZZL?=
 =?us-ascii?Q?LdLFguhgsjgajUM1bKZlGsfg1HA7V9IkTOgdEFDKpetuisYDOyu+XYuNxPYX?=
 =?us-ascii?Q?smbYi2Y96CD6aUgpmbQvphHtVk86LTV7Tw6YycUjGaKIYpp5amxO6hlpy2f1?=
 =?us-ascii?Q?dNyazg4JvwE4DKrGm+USBzkYwWfGlHWLs/9FIwQFKmvLQOLxLcwFgXIRIavn?=
 =?us-ascii?Q?o5IXQfN2ukUmwrGGVtWRuXmAcg0oS0++VYDTtJNGPRyFIphWyL2HdudeNo5L?=
 =?us-ascii?Q?X5pZlEojyPiyD+jmlikpha8j7ZWuDUySymCEoRdMIjAhlqN1HV73W25xBfrH?=
 =?us-ascii?Q?Y/WSYAqSEY4IcKUk9MImCAKNJJEKawqZHMRIZdYHC/+8/ZuvgDBoLWHUNsUs?=
 =?us-ascii?Q?e11Bis28NWaunmp2Dn95RLob+S5vI9ckCRQdSA8yIAZoCRRH1Xu3/0GurBGh?=
 =?us-ascii?Q?VdrqVfbT3YLCpHYP7jy5QUcJIBmUYXQ0WWW0LJVLaQR58oHjz265Q2Ncq/nw?=
 =?us-ascii?Q?/5DacFxcXIq/u5iJJRQqEhfc4oTbiKSB4MHEBp5A7eqeRbrT5sdS62UXMMUd?=
 =?us-ascii?Q?NxJIkC9jR7/ngPQ92BSgkK+YgRDUSTw2g3RNk5nr1EFZEd1ZbY7SUNsML8h2?=
 =?us-ascii?Q?5yRTOBxYiyB7O75RzeEwro/cxkHMu7fLVwyai/P6rmQB1+jaEHoI6MxJFuRA?=
 =?us-ascii?Q?rGb7vA3xVkxMsUX+6ln0sNo447Y7QVz33V3ijpQVaBa/8bc7HqGZRbD/kNXu?=
 =?us-ascii?Q?3JnQevjR56mvzodvlxBxszbaqCMXnW7JdPDeXVUHJsaffnKVamHy/ID4+p/M?=
 =?us-ascii?Q?wPHoQ3ftcvcALK9I9qehCCyVFby/0TgKcQoDP90FTFcwwcWmjlmEV8eYi6aU?=
 =?us-ascii?Q?9xP57kat5FHHxkUMk6KLYQlyAjgVua7WTOFxsNeT4P80Ea2Int55XbUXfCeM?=
 =?us-ascii?Q?t272ymbTs/9OcsrIv3OkB31XJE0vNXCT1PEhqftzuotK9fGxxMBGAJG77RpG?=
 =?us-ascii?Q?j9hsEnvbO+FbHL/wwyI7aQM/5F9IMFnO0BvnwTF6ArVWCqRJRsg8QiaXDLhf?=
 =?us-ascii?Q?V89HXKk5X1EWZSAmgf566HEcmvFGs8R1OJLHIz3fsj6Vn2euhDIqLW1Oolef?=
 =?us-ascii?Q?dhDNqLCKlwjMJBFxGF8ngnaocLsiUpG5covgOmvN0xB87f77QztPq8oTIsIA?=
 =?us-ascii?Q?1lUtJx6ODxN6xZFkLG+EYrrpBhyFOert28D6UeQrfKNFvgowRJpRx6fPLd4O?=
 =?us-ascii?Q?Y4pbjHWA3sQ0g9RvDv+SGjHArYiVObREWtme7rm9Yqyke54YofMy74HedOcf?=
 =?us-ascii?Q?sb2tuXyOvQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01f5e9a-cf4f-4c73-95d3-08deeeb78d9b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 03:55:25.7568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dsDClhJ2nAVI2wwLu2qwlgJJq1jTqsoGUOCdK/P+wmnTtSHkBTOGn1ufEMxbctaslPbR2o9nzqqSWbJyXwtv4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8782

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/usb/host/xhci-tegra.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index e7e6d569f1db..626a41804cd6 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1908,20 +1908,16 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 					tegra_xusb_mbox_irq,
 					tegra_xusb_mbox_thread, 0,
 					dev_name(&pdev->dev), tegra);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to request IRQ: %d\n", err);
+	if (err < 0)
 		goto remove_usb3;
-	}
 
 	if (tegra->padctl_irq) {
 		err = devm_request_threaded_irq(&pdev->dev, tegra->padctl_irq,
 						NULL, tegra_xusb_padctl_irq,
 						IRQF_ONESHOT, dev_name(&pdev->dev),
 						tegra);
-		if (err < 0) {
-			dev_err(&pdev->dev, "failed to request padctl IRQ: %d\n", err);
+		if (err < 0)
 			goto remove_usb3;
-		}
 	}
 
 	err = tegra_xusb_enable_firmware_messages(tegra);
-- 
2.34.1

