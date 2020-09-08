Return-Path: <SRS0=mK2W=CR=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8C7C433E2
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Sep 2020 20:14:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3C792166E
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Sep 2020 20:14:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQQ5gfR5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730170AbgIHUOo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Sep 2020 16:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729971AbgIHPLL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Sep 2020 11:11:11 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FDF0C0068C6
        for <linux-tegra@vger.kernel.org>; Tue,  8 Sep 2020 08:01:41 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id q10so2197143qvs.1
        for <linux-tegra@vger.kernel.org>; Tue, 08 Sep 2020 08:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=jX/oUhvQ6rppkjSjuwDLk72A8u6aXMfjXLIcv0mZ0V8=;
        b=jQQ5gfR5VPftZ/qA/pYe9P4cnnvCC08gGQlp52hJt8TvBXCO3N6mrOR4UBBItazpUT
         /2cyb9Bfr+9oKphd7lc0Bs6usHeOch98OONEvpJR2h9i27auGv/AXdOlRV5xmtaoplVv
         NANIMgstLgl/+KXFk8cidXAN2OGw3Rk4ozWr2+PJf2xeunGgicFqhMdm1hk+lgSkzH9x
         qVU4CfYB5fZ/ex6igd/Cq5KuCtcFG3A7Z2KzdAlU+yZ5SPARuBoUROG327hJ1LihEXt+
         n5MVgmKytjD6Jbbi4qTOwv74DiRN0no+qrzUHWRSAK88J1pWOGly7JaMSDxINtniNE66
         +y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jX/oUhvQ6rppkjSjuwDLk72A8u6aXMfjXLIcv0mZ0V8=;
        b=PLQOEd0X5yVAw3xzyagX+aJBv8auMibi5mTj9+2x7gPzf8S/fYRGJRs9TkDBqxFmh7
         8s0SqaM19HzwEiY/tqMFO3EHWNOd0jJ+UgaifDeEpCBU4TpoITSYD35iqWAK4z7vMgRu
         1sFNyMQ6Gt/vL1RrvokEvWbColgUjvhBx3SjG7Io0+tGiQ5HCI/dKLofcqJgl6kjCUtF
         Kj73bxUEoM1T7VrDiMxNps1isXZXF52JL1pm/7Mv6fPRlErgFDHH/radzqsUjTpazivt
         wdFSCiU6TDdZBrY/DGeFBQYP0Ocj2nFAGucNrJE7UH4HdsYcc654cPH5rnS+UmU7dEct
         YQJg==
X-Gm-Message-State: AOAM5331dZKhV0Q2TQai7U3UUR+Q26x3BrNQXefyjZZxWqJqzGeqRWvn
        wVCwVUBKzPfPGQaUoKcwpT+0ZSoj+qRFgBlJ
X-Google-Smtp-Source: ABdhPJx2y+5MfUQS/16k7eYrnjKuVFUZ2TqaIy/qV9W7ZzDIdCw+l28rRM8gaZ5RlPifTDhRUlHnCw==
X-Received: by 2002:a0c:b2d4:: with SMTP id d20mr483674qvf.1.1599577299563;
        Tue, 08 Sep 2020 08:01:39 -0700 (PDT)
Received: from Master-WinVM.sparksnet ([2601:153:900:7730:1418:cbe9:1543:1190])
        by smtp.gmail.com with ESMTPSA id o72sm14034704qka.113.2020.09.08.08.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 08:01:38 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     linux-tegra@vger.kernel.org
Cc:     Nagarjuna Kristam <nkristam@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Matias Zuniga <matias.nicolas.zc@gmail.com>,
        JC Kuo <jckuo@nvidia.com>, Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH] phy: tegra: xusb: fix xusb backwards compatibility
Date:   Tue,  8 Sep 2020 11:01:24 -0400
Message-Id: <20200908150124.31336-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Prior to implementing role switch support, all enabled ports enumerated
as host devices.
With role switch support enabled, device trees with otg ports which have
not been updated with usb-role-switch support now bail out during
enumeration.
This disables all xhci ports tied to the affected phy.

Retain backwards compatibility by forcing host mode on otg ports which
are missing the usb-role-switch flag.
Disable ports explicitly defined as peripheral mode that are missing the
usb-role-switch flag.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
Reported-by: Matias Zuniga <matias.nicolas.zc@gmail.com>

Fixes: e8f7d2f409a1 ("phy: tegra: xusb: Add usb-phy support")
---
 drivers/phy/tegra/xusb.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index de4a46fe1763..c36dce13e0c6 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -734,10 +734,12 @@ static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *usb2)
 			err = tegra_xusb_setup_usb_role_switch(port);
 			if (err < 0)
 				return err;
+		} else if (usb2->mode == USB_DR_MODE_PERIPHERAL) {
+			dev_err(&port->dev, "mandatory usb-role-switch not found for %s mode, disabling port\n", modes[usb2->mode]);
+			usb2->mode = USB_DR_MODE_UNKNOWN;
 		} else {
-			dev_err(&port->dev, "usb-role-switch not found for %s mode",
-				modes[usb2->mode]);
-			return -EINVAL;
+			dev_warn(&port->dev, "usb-role-switch not found for %s mode, forcing host\n", modes[usb2->mode]);
+			usb2->mode = USB_DR_MODE_HOST;
 		}
 	}
 
-- 
2.17.1

