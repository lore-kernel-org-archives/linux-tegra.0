Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DFEC19F33
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 13:22:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45815604D7
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 13:22:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237776AbhHLNWm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Aug 2021 09:22:42 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:41712 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S237471AbhHLNTM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Aug 2021 09:19:12 -0400
X-UUID: dc0aa88cf276494a86dfc6e401f87968-20210812
X-UUID: dc0aa88cf276494a86dfc6e401f87968-20210812
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1136894012; Thu, 12 Aug 2021 21:18:45 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 12 Aug
 2021 21:18:38 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 Aug 2021 21:18:36 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     Pawel Laszczak <pawell@cadence.com>,
        Al Cooper <alcooperx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Eddie Hung <eddie.hung@mediatek.com>,
        stable <stable@vger.kernel.org>
Subject: [PATCH v2 2/7] usb: mtu3: use @mult for HS isoc or intr
Date:   Thu, 12 Aug 2021 21:17:58 +0800
Message-ID: <1628774283-475-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1628774283-475-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1628774283-475-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

For HS isoc or intr, should use @mult but not @burst
to save mult value.

Fixes: 4d79e042ed8b ("usb: mtu3: add support for usb3.1 IP")
Cc: stable <stable@vger.kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: new patch, split from [2/6] suggested by Felipe
---
 drivers/usb/mtu3/mtu3_gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 5e21ba05ebf0..635ad277cb13 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -92,7 +92,7 @@ static int mtu3_ep_enable(struct mtu3_ep *mep)
 				usb_endpoint_xfer_int(desc)) {
 			interval = desc->bInterval;
 			interval = clamp_val(interval, 1, 16) - 1;
-			burst = (max_packet & GENMASK(12, 11)) >> 11;
+			mult = (max_packet & GENMASK(12, 11)) >> 11;
 		}
 		break;
 	default:
-- 
2.18.0

