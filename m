Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013017.outbound.protection.outlook.com [52.101.127.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E651305062;
	Tue,  2 Sep 2025 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819596; cv=fail; b=npfAXZP8NN2erEO2a6/CFtXwSm5qdJToaxKqPfGadZ2WkYggeOGzJ1p11qJSPJScXd9VTDYeRpPY9m7GxFWskGDVYKprAWapzwxvJfQgOuGe1Jyjf6W4gnXEtZ13VD7ye0Z56RGO68eC13uXViJv4nxFdX/Rr3vUriUv0/LiU9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819596; c=relaxed/simple;
	bh=kafDs09stbl4RDuYLmmjasRnAnWCNprgM3KZ1Dnd5EY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=cCKbImyq0d5ociBn0/p8gnfQb30aw43ydoL2G9WsvHp9BqeNEODk9tSg4FYBBTlDFnqV3PK0thDeTQFqrlxW8x3lO+bgR4GJ0l25jNzI2oVgZ8mrsIKgxH7NkXExzCN5z9RKCt68QQZgs7KLsR5tyRvvTpoou4Drw9KEw3Q2h4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=i89wwht4; arc=fail smtp.client-ip=52.101.127.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="i89wwht4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9hOVi8IRF940avQ4cmJxCZo64VInEomPDvo6EnGFFbHPfpsX6Gk1Bj7nPm/0jERIWOMX+fNsV4KYGbZL3yAJahhTqFjcyT5l9O2tb43xavML0ejtKSX63EVv1H1OXC1BIBr004bkLJVJHVemT2CTy+RHgS0IXRrp2HDT+K9p5x+eDSdKGNhRwW4j2NkRh1CWubH9G5u+QEp7qYBGvU7IVcu4HOxcD5/kPUzfCJDwiPS14H6MJc+ydDsJCTM8LRdk6NSf/h7qvzRGBKQvslvNRizurPPW9huOZQt6LZ6UdA/H4pdKIgQ3C7VXVY3f13+ge0bIHmeiS9ZwrC3etxUPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NJ/bPjM5558QzF5DWIpqzCq3swRFnx85TVvt8K8ksQ=;
 b=dPPhw+1319y3M5foO/Ed9nToUPMxXicF0T+pBeCiDR6/fCL66PO//q7cQvEXLiMAZoQW670irha6IWonMuzJZbcKuDJGwU7fB47u/TiKji0ikYdhA2/6qWujqfBaZQoE40v6Ih6NVN5S9/tsjynMRoaaFLqRyJPJf9OmdTp51Q9PXmgigXOFWHMsiclmlUOTfwhUFyJxiEB3E83KZPsZVj7Wt6nLx/KzQRe3GtSEUJ5aXPkSlMZqxLhiFgxXB+A1FcE/dPJcXbzzUPDsN07Bylj/MADF7FoURx/GFizkdbXPfKNmqd5JWd82PXJLoll9xgrSvybTtPboJNWtRtFgZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NJ/bPjM5558QzF5DWIpqzCq3swRFnx85TVvt8K8ksQ=;
 b=i89wwht4Brz3TzrKbgxHBZBVqGYSpTnkFEroSm3X0ctxSZ8PtmGpwMHoMIN91Z9s19pNzZkXyCfZHZD5lcHRhkYNrnbXjmGm+tJi/CHHcymZ0Ssm9bzE/CUMLKsvKY+TFjhX7d6kQdmnfIk1sCzT146uxdoBgCteYfvtzUEBlgjvj+93gyw5Reu3W7zw3VgTpx6nZ4u5yrKbkea5+J6mqlRFvgnBdB2v0HCgrM4qwSpIV6pzmny8iP2532Q25k6VOUllfzREx3JQGFNaYPKlOzpO5HQ+6wfrF12oIWpDQOvCd7BJB0KB4R6xN7+1KnF2UvSaDccBWO71mUDw0wkAJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB6379.apcprd06.prod.outlook.com (2603:1096:400:424::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 13:26:32 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 13:26:32 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Wayne Chang <waynec@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] usb: gadget: tegra-xudc: Remove redundant ternary operators
Date: Tue,  2 Sep 2025 21:26:08 +0800
Message-Id: <20250902132613.84876-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0023.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::10) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d1b753d-d41c-4c30-9994-08ddea24549f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ozBuVOLKi6eCDT7KnE6sL6jA5NGmF9mrSM1RyaDfjp+605RuMNXZbXDZaPav?=
 =?us-ascii?Q?S+Gn582llwvfyYAwe8QloAO9Y2LHbR5CR9/enCZAD8792Z2ScEm4HI3lHiG2?=
 =?us-ascii?Q?eB1/HWOqJlSIzOMgvTBcwkKCxJcFdyJAd/IHEMrCv24H+C/UTr1/QsxEOj56?=
 =?us-ascii?Q?UhUy6cIgczbNZ243KRuNizUC3FlZSwm/eyXgU+s8dLGxnOHPIKKZp76Hg0HJ?=
 =?us-ascii?Q?pGN+fygUzoqfSn8wTmHIo9bxPlFnnGFwICmylbp/Cwjb4MLOF4MQxB2drhor?=
 =?us-ascii?Q?rF0DqcgVnMCTxXVN4b5ZSwwx47taUmWQoHgqwN/zVwLcVCjXHb9zCslmWEoj?=
 =?us-ascii?Q?S3FRGQpkDQ96FOOz7Cdql8aZZI8Wr0y03gR7mGnAKDLY3yKMvD+6aJcWqrdn?=
 =?us-ascii?Q?3eEnjvA7TYutD4qtkXON7pcitsKfaJbqxpQ+COQoFak6GQpnckEt0/XgYSRU?=
 =?us-ascii?Q?58qllL3qo/ySNdTqlVdiTxMiWLFrRA5t3aaDLmj1EI7nTcP6SxQ3xaK5Owe8?=
 =?us-ascii?Q?nmt2DHRtcIyEg6+oL0E7iyamxL+HNZ1E57MT3oS7oSJG7RwbjaeFJTPc2Af5?=
 =?us-ascii?Q?dm5h4n6S+xK6hXeKPafuxcMW2wjYB0yFaw9+S0O1quuzZBak1Rd7rABeT0Dh?=
 =?us-ascii?Q?wKDyl3BLzIjPZCje4Obq5rsGT7339sBVnbcJZLpk6n6bh1bUz3O3PfYBDjL/?=
 =?us-ascii?Q?j1RJVlui0q9lHVFgd6xtCek5/qPOnDAPm1IS+T+yqZRzRFRUz1NYOdVH6+zp?=
 =?us-ascii?Q?FdjjBg67WsLR2MRj6nNQbUVLnvmlnJ/+RqZMxp8rR77HJ0Txg2rhVWQnc7rt?=
 =?us-ascii?Q?e3fqtC5U64Mxbz0d/adgx4XQQpV7JWRvYljkKMu64wdQv0r0C+s57VdI7he0?=
 =?us-ascii?Q?gwLi50/AswNREyjbzRvdu2iajGyVIurrFn8a2TEf/auU8XnRpnf97gb7yoPc?=
 =?us-ascii?Q?eWwq3TAYXBV8ONrwOlHBlXQ0VJ8izs9h71PbJ1l3nsWRI8HBnjhN9xSl8g1H?=
 =?us-ascii?Q?fB1mTQamVX6bvJWUaCtzVDvP74f4KFsWQyMGvnRrhrQJgYbkCodN9lhz3L/w?=
 =?us-ascii?Q?wdIjkwfoYJnVNZo2W6PG2TfYMtXAfoB1vw4LX6HXskkzCZcGq8qpFr8s3Fgm?=
 =?us-ascii?Q?pgtUUz1H2GSY30HlxMgjN7HDsz3iHwh5DaXII4tyx34TYn8iGYitw+0qWE5n?=
 =?us-ascii?Q?Mj6InIthJuZRMuMupyrb5IlLIgjqrcu/G/mD3Jbvc5FE76eNg9oJkBw2wi2I?=
 =?us-ascii?Q?ecCZyVsO9tU9Ezk7bn39h+j2yOYL1nVOwtxcUjVtUIkg7GPATj/KLA/eoSB4?=
 =?us-ascii?Q?tfhgic38OqvBjfW5Royx43/NZEP7u2PksYGEDcnZZIUVOQzqWCEtqUFSrakt?=
 =?us-ascii?Q?Bn/9NIS5J0QWYFu+7CxJm388AatnSiDHOvU2DpHZ53a2jz4ZYl4pnRXZVEz8?=
 =?us-ascii?Q?JzZX681OFyw1UFYrcui366WhI+Jr5wAwvSKpWSNAKFZIV4uRW96pBQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q4rxkOfwAXnniYVLCJJxTdJjswmBgL/pkjGlPmvgW6rHG+txdWMDrPJtDF5i?=
 =?us-ascii?Q?UgOYeknb42LQogqLx9kuzn58EAoWDo+AB6Z7Wq3WuR5802+MJcFuJeUXVgGb?=
 =?us-ascii?Q?3n7QIZGv5qr38Ozxs7QftmBpm7gmFq7vMNQBcj+HYvFFE1kqn3IsaLcku8lF?=
 =?us-ascii?Q?WZFjz6l11WiQ9FFp9wLpZl8eMaaW8A4yKGFZx5yPLLMhRqheriggNwjrTSQo?=
 =?us-ascii?Q?IV6CIG2gxaj+mOxAMwkrAFNzCUEKPrLCjrhy2YLcuMv8nxoVar2/olCSz1vM?=
 =?us-ascii?Q?b4lCvHzKYmCEYE008BW05D9JqkoMTsxNVYGD7kg2BL/1NzRRSF/mUfZHZuA8?=
 =?us-ascii?Q?fAtdgekKAm4SiE1O0kkX0b6txvOOvB6WUEAFDPY0VziD+Fn11T9UmSAxROZz?=
 =?us-ascii?Q?IpkC/Q4Fz4HmDheS9k6xstXDndUfXqyS0u7mx/me3Z4dVY+q6BNrZsBgKaNm?=
 =?us-ascii?Q?ycf89yo/V5mLAeErhJYGAeJpuI+mD4kBYfYHPVIKS+10m7i9beT+G/SvA3gD?=
 =?us-ascii?Q?SzY1pCobrfC2TTR5BQcY7zC61A9HTrV6ZcwPnQ8gpfRZLiR2WbgZr8m2iXW2?=
 =?us-ascii?Q?YecydDiYmtA5xMSP/MQKDw5hTlML5COwk8jqvC3Jt+g1aSSwMNON+EpLQbDT?=
 =?us-ascii?Q?+6DWPXDimSkqBP17k4a+f5VI6BXlq+MHsn/GglFq/gzxpminctCDpgBrE4UH?=
 =?us-ascii?Q?ch2SwAtBp99m7xWq3jCfEanycaWyB/6r1XP4hhb8jO6zoHdjl7Lb4ccK6LP/?=
 =?us-ascii?Q?h1TR5sOsgT2b72B2ArCgdZkPjo+xfE3fuxmEXDy+y4wvZoYNgwhPf7qFp7Tf?=
 =?us-ascii?Q?43qJzHtY2nFGhfSIMALpA1gBVzkhOim/Dt8K7heQrRpyz0nlJ89b2VPreXEB?=
 =?us-ascii?Q?QaNYW0C+nyDG5ECbwzqI4boDeqVYZ8GLf9ZMdhsksa0Pf9bsUiI3WHmce0U7?=
 =?us-ascii?Q?OnM+0KLA1GveIRMs2BHN+izthlXVGrR5M19i/Bp9Q3MG6OWCADker170n7++?=
 =?us-ascii?Q?sPPezCwggVjCf2oXrs6/EEeDxgwRtfiBX2xiIYCoKmejATSEscBxKN+R5drg?=
 =?us-ascii?Q?Lc/MBiezvf9TcqvPLD9xD3qa2NBopoNIccL7RRrx4bSrtPpd3Z2yxvqxH0pb?=
 =?us-ascii?Q?7BXspblH48ETV4zmqIFrkeObmxCvNj0Z2/+dTAmd2sHDemXGFxUAPRi07LtG?=
 =?us-ascii?Q?uRmnZNaVr0eVcspC+wZX+cbLVqfxeCNb63VRtBLCiP8hGy5xR81M+NBX++Z9?=
 =?us-ascii?Q?UORfwdKUuQguw36UPPHO83o6bU4v7hZkiJRaTrxfuQ+OJqy5eluIZlv422sD?=
 =?us-ascii?Q?IojIkaGJNzxeDcrMFFOn9DXlG+6aR8Db9m70A6rNvKSgx3hGdGLRc9aGMjAi?=
 =?us-ascii?Q?7rmd+NDbPdv5r5L0u5X9PcarFcmND3ZplGL8pl3uTy/8jUhnhjQuCeAyZVfK?=
 =?us-ascii?Q?cq5anT3+Hva472QpniKB62tFU8isn0YpQsrr6VjUeuEVqEuK9Xv1aUpyAChn?=
 =?us-ascii?Q?aEtyeLwZv96UxpNXxIWO5+6i68/v4MHbhN9l6px2OTKwvlQjw+iBINsSqJ45?=
 =?us-ascii?Q?ULvyqgZABYecfBABmMrkcQ1Q+2B6GUGtbw9JCxJh?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1b753d-d41c-4c30-9994-08ddea24549f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 13:26:31.8904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8wg8YsR7pqZW3GD0SRkXQGcG7Rs+uK/YRG3CRc+Uxdx+0zhMUSbZ3ZGr9oLv5xk16LWawiAxDVI9DR184PhSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6379

For ternary operators in the form of "a ? true : false", if 'a' itself
returns a boolean result, the ternary operator can be omitted. Remove
redundant ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 1d3085cc9d22..0c38fc37b6e6 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -812,8 +812,7 @@ static void tegra_xudc_update_data_role(struct tegra_xudc *xudc,
 		return;
 	}
 
-	xudc->device_mode = (usbphy->last_event == USB_EVENT_VBUS) ? true :
-								     false;
+	xudc->device_mode = usbphy->last_event == USB_EVENT_VBUS;
 
 	phy_index = tegra_xudc_get_phy_index(xudc, usbphy);
 	dev_dbg(xudc->dev, "%s(): current phy index is %d\n", __func__,
-- 
2.34.1

