Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBE4C433B4
	for <linux-tegra@archiver.kernel.org>; Thu, 13 May 2021 20:09:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C11E3610F8
	for <linux-tegra@archiver.kernel.org>; Thu, 13 May 2021 20:09:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232458AbhEMUK0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 13 May 2021 16:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbhEMUKY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 May 2021 16:10:24 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3DDC061574;
        Thu, 13 May 2021 13:09:14 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id c3so40155220lfs.7;
        Thu, 13 May 2021 13:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jxf9jaPVKrVN10b1Yr8Cdt+6V7OtY9FoC2+vz0B4zXI=;
        b=cJLYDPYytrPRYiG9h/uzjB7fFy1ElNt9yk4YCZpwchSCrU6xsrfTH9+XbdEsTe+0Uq
         ISAkn5iJzOMKzQJxSekK0/p2dVBLDaMOEOYh9did276nub/I7X14F8n9SvYl9gxMwGRv
         8SePcpFfr/1lRdM9ObxcZVduXHkFwR+OR3j150/ZzZgxynUTMUpSofPqLNyIRNIeGcwm
         pFY+gtSYkk3Q260bXnI122L1Y/+HYDIUOglzGyL36Pogw5xIrVmHbJmM+eecN1yrCMet
         gPsFI3lmcKWO6DZV2EzfR2K9Cjbf+UZAoeXejiX5ExG4/aWSxQQqWslF8/en2cvKjUDB
         LdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jxf9jaPVKrVN10b1Yr8Cdt+6V7OtY9FoC2+vz0B4zXI=;
        b=VTt0gvst7MdtxFcg8nsymuK7ucpLySOwGBQnzdK4Au/+vqrN82B44uK2M8W47dE8UE
         dx6IKkS2RKgb9fUogON4638hVyYqUMwovQ0XEWbmY0vqpdr0/S4c3YYG0LWp/nhJmknP
         pbWrR2hV5wPwgK0VYIcL5q18hwfsJupU2zvWFKZq3VVbVoXDnpYOgNfXnLrUIWLI0a7P
         Cwns3SRlp0jNRJYogk27u6g1NC0IbFPg2ivIqA+WdfRuYdfnLehNyEkWW515DNEDWzWo
         RKaPhh//bHLrEgMa9C3eqwSCr+4RKLaQgRXqooAapsX6HY5V42rPNMLcNRxbtB/mmwaS
         nlUg==
X-Gm-Message-State: AOAM531mIQkx0X5wr7PxcXBieX4uQ7ytegg4tOSe1BdoWcqCXmOIqqh0
        oFzFIvmWoXxwhjOtu+TKDlo=
X-Google-Smtp-Source: ABdhPJxgk0QpMH3Qc/Nbvp/HLZfxypEYo+ZT/4nnEFjy3OA8GKGQkkI3eO0MuhdjwAoHQD7DITqK6g==
X-Received: by 2002:a05:6512:25c:: with SMTP id b28mr7581024lfo.94.1620936552616;
        Thu, 13 May 2021 13:09:12 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id u12sm107054lfc.75.2021.05.13.13.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 13:09:11 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] usb: gadget: tegra-xudc: Constify static structs
Date:   Thu, 13 May 2021 22:09:08 +0200
Message-Id: <20210513200908.448351-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Constify a couple of ops-structs that are never modified, to let the
compiler put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 2319c9737c2b..66b19db4c6e6 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -1907,7 +1907,7 @@ static void tegra_xudc_ep_free_request(struct usb_ep *usb_ep,
 	kfree(req);
 }
 
-static struct usb_ep_ops tegra_xudc_ep_ops = {
+static const struct usb_ep_ops tegra_xudc_ep_ops = {
 	.enable = tegra_xudc_ep_enable,
 	.disable = tegra_xudc_ep_disable,
 	.alloc_request = tegra_xudc_ep_alloc_request,
@@ -1928,7 +1928,7 @@ static int tegra_xudc_ep0_disable(struct usb_ep *usb_ep)
 	return -EBUSY;
 }
 
-static struct usb_ep_ops tegra_xudc_ep0_ops = {
+static const struct usb_ep_ops tegra_xudc_ep0_ops = {
 	.enable = tegra_xudc_ep0_enable,
 	.disable = tegra_xudc_ep0_disable,
 	.alloc_request = tegra_xudc_ep_alloc_request,
@@ -2168,7 +2168,7 @@ static int tegra_xudc_set_selfpowered(struct usb_gadget *gadget, int is_on)
 	return 0;
 }
 
-static struct usb_gadget_ops tegra_xudc_gadget_ops = {
+static const struct usb_gadget_ops tegra_xudc_gadget_ops = {
 	.get_frame = tegra_xudc_gadget_get_frame,
 	.wakeup = tegra_xudc_gadget_wakeup,
 	.pullup = tegra_xudc_gadget_pullup,
-- 
2.31.1

