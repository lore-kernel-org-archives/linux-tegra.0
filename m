Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E963C433FE
	for <linux-tegra@archiver.kernel.org>; Sat, 16 Apr 2022 22:39:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbiDPWmE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 16 Apr 2022 18:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiDPWmD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 16 Apr 2022 18:42:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C7A4237A14
        for <linux-tegra@vger.kernel.org>; Sat, 16 Apr 2022 15:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650148769;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=BpOVvGdiVmOkFc6Vxt31zxMLOJ/JVW56iU3zr83wB70=;
        b=bZTdoS/1CJ3gH0qA6kcUItAJ8WpoHWkUpnQiNoT04RQbmr5k60KWp978ih/t1I0OwnOjYl
        RCC7U2CWufrG5AJKgS59kkvboTlba+cpC28jnsWCGlJm4kePcYIW8LcQSS0+U1ejpqfQfz
        qDWNTack5zOvBYrmIfZfPxkX0GpPxBQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-fAgRUPY1PHuKukMfF2xR-A-1; Sat, 16 Apr 2022 18:39:28 -0400
X-MC-Unique: fAgRUPY1PHuKukMfF2xR-A-1
Received: by mail-qk1-f199.google.com with SMTP id i2-20020a05620a248200b0067b51fa1269so7726222qkn.19
        for <linux-tegra@vger.kernel.org>; Sat, 16 Apr 2022 15:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BpOVvGdiVmOkFc6Vxt31zxMLOJ/JVW56iU3zr83wB70=;
        b=wdSOdDtlZzlzLtDziHhYzbfxNiYmndz2NWKaB9udVzTroSinpIGA+S2R3SRd2zkd/d
         q5Il1OCIU0DVzRjC5bFAgaSV+4IZNQyk0VcTNoTEuaFIJBGeip5pUFt29hcKK49StOzI
         5rHk49KGy25iVYX98dFAr24ZdHgivKeDuIIyyiehRViSSGlD080ZdAiLF1MuIVAhLS0m
         VFmHuLvsZMQtfXIjtIYPWMnXpTFDNQyTTDp9VG/zujVaGdFGhuH4VvriNWYrv9O7mZet
         llezi9zT2cUM4QJ1H5NHRysaj4GN2ifHgocYVNSEGgctSEjtTl+tItruiCsWDMCmHqnc
         j1lA==
X-Gm-Message-State: AOAM533lC2le4KppnfcQiRIrk3hX7OyhuP40671hIGvYSuPHspSIErV9
        /SVVomJZmFHGvg3R9/uxbk3KwO/OTVPk8Xe4bXrFZseHK9Qnbgq1jUoPzQcYXxLw5x2BwyfbhA8
        po4DbrvmW1EmBsgWHUQ4CerQ=
X-Received: by 2002:ae9:eb87:0:b0:69e:75b3:6527 with SMTP id b129-20020ae9eb87000000b0069e75b36527mr2243516qkg.386.1650148768198;
        Sat, 16 Apr 2022 15:39:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDR9RLRp+qTWzVkbCtfQ9U7EuTs1Feo7WIWOwOFw1MB385IjzG7j183dip8VZh/DlKz9M7Wg==
X-Received: by 2002:ae9:eb87:0:b0:69e:75b3:6527 with SMTP id b129-20020ae9eb87000000b0069e75b36527mr2243503qkg.386.1650148767997;
        Sat, 16 Apr 2022 15:39:27 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 8-20020ac85948000000b002e1cd3fa142sm5346012qtz.92.2022.04.16.15.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 15:39:27 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, waynec@nvidia.com,
        rikard.falkeborn@gmail.com, zhangqilong3@huawei.com,
        jakobkoschel@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: gadget: tegra-xudc: clean up comments
Date:   Sat, 16 Apr 2022 18:39:21 -0400
Message-Id: <20220416223921.2881719-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Spelling replacements
cancelled to canceled
endpiont to endpoint
Compliance to Compliance

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index d9c406bdb680..0aaf01e1551f 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -1330,7 +1330,7 @@ static void squeeze_transfer_ring(struct tegra_xudc_ep *ep,
 	bool pcs;
 
 	/*
-	 * Clear out all the TRBs part of or after the cancelled request,
+	 * Clear out all the TRBs part of or after the canceled request,
 	 * and must correct trb cycle bit to the last un-enqueued state.
 	 */
 	while (trb != &ep->transfer_ring[ep->enq_ptr]) {
@@ -1343,11 +1343,11 @@ static void squeeze_transfer_ring(struct tegra_xudc_ep *ep,
 			trb = ep->transfer_ring;
 	}
 
-	/* Requests will be re-queued at the start of the cancelled request. */
+	/* Requests will be re-queued at the start of the canceled request. */
 	ep->enq_ptr = req->first_trb - ep->transfer_ring;
 	/*
 	 * Retrieve the correct cycle bit state from the first trb of
-	 * the cancelled request.
+	 * the canceled request.
 	 */
 	ep->pcs = pcs_enq;
 	ep->ring_full = false;
@@ -1434,7 +1434,7 @@ __tegra_xudc_ep_dequeue(struct tegra_xudc_ep *ep,
 		return 0;
 	}
 
-	/* Halt DMA for this endpiont. */
+	/* Halt DMA for this endpoint. */
 	if (ep_ctx_read_state(ep->context) == EP_STATE_RUNNING) {
 		ep_pause(xudc, ep->index);
 		ep_wait_for_inactive(xudc, ep->index);
@@ -3423,7 +3423,7 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 	}
 
 	/*
-	 * Compliacne suite appears to be violating polling LFPS tBurst max
+	 * Compliance suite appears to be violating polling LFPS tBurst max
 	 * of 1.4us.  Send 1.45us instead.
 	 */
 	val = xudc_readl(xudc, SSPX_CORE_CNT32);
-- 
2.27.0

