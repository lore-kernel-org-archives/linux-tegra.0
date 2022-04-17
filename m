Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE10C433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 17 Apr 2022 13:07:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234110AbiDQNJ7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 17 Apr 2022 09:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234135AbiDQNJ6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 17 Apr 2022 09:09:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 581693A5E4
        for <linux-tegra@vger.kernel.org>; Sun, 17 Apr 2022 06:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650200839;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=2NwAEZe2oe/eBcVmeVKeLZ3JZbCLX6HoW7jxxZnMSXo=;
        b=NOSfJ2HG7a/e3znqzIOfdKbuUZxmsR1H0sHmUjc8xbC5Tp33iPVSZ+yRAa4ZvspIZcPOcI
        gPp0ofcHYNv4OmzN4JrWYYvlW9cbZzR+SniZKjfVH6gqotgZmcYmZCiNSQZ0cPH/IDOzIz
        0gJEUEA5lqeB89JVdgtgD6Mbhmx5Hsc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-itQZvKjTPzqE9A-MMXO7Jg-1; Sun, 17 Apr 2022 09:07:17 -0400
X-MC-Unique: itQZvKjTPzqE9A-MMXO7Jg-1
Received: by mail-qk1-f199.google.com with SMTP id bk23-20020a05620a1a1700b0067b32f93b90so8628339qkb.16
        for <linux-tegra@vger.kernel.org>; Sun, 17 Apr 2022 06:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2NwAEZe2oe/eBcVmeVKeLZ3JZbCLX6HoW7jxxZnMSXo=;
        b=bh74PfeHMRuJh629eNt1kaCz1mIHKqp7msOYXJQfQA5Imqmu9MtH+TI1CMN9u/oyTl
         70HNkAFoJBjqD1QmlLWGQF2v5efYu/OKc3Qn3lVbPc+ZQJIeied5x+0JSuZHrfs9QtZX
         D1a5zM4zGY5jfZB9AlqqyHuGEfwU9q30DWjVZPjE5zG2niv18GFJeXpubh2vvPhx1+VA
         JsjNZ3Kl0zmwG9qMVJHGRz3Fe5UxZnq7WCqUjjYHZXSGUM0q+Kv0eo0r2LIcm1yRUV6l
         uZg4Naeh3IZepJFSSz6knP6KYB4YIdOqOegHW1ubWkxK5Mf+dBl3kxpxa74ybd/twxnd
         rR0Q==
X-Gm-Message-State: AOAM531yROSqSmfKKSQ9fBCwEijagc1/G8tgfiYI8jpl3FT2dUn+aiEP
        9eWe7q+SQSumGdmFLB9CSd2lqySSnoDH6w6rE6QK4/LQCqODq8AdNKGF84LdB2WRDb4R77oA4Ee
        oSF/eTsK3vAnPLaBUrAuLQgM=
X-Received: by 2002:ac8:764e:0:b0:2eb:d973:50bf with SMTP id i14-20020ac8764e000000b002ebd97350bfmr4337881qtr.70.1650200837191;
        Sun, 17 Apr 2022 06:07:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrP2i7t47KIvWqNguloCZux/VuEEyEN1n3q2TYFEbHP5vZgWRTRM5xPvnuLycqPfDYW6jDDQ==
X-Received: by 2002:ac8:764e:0:b0:2eb:d973:50bf with SMTP id i14-20020ac8764e000000b002ebd97350bfmr4337853qtr.70.1650200836938;
        Sun, 17 Apr 2022 06:07:16 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i136-20020a379f8e000000b0069c7f8b69b8sm4583861qke.82.2022.04.17.06.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 06:07:16 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, waynec@nvidia.com,
        jakobkoschel@gmail.com, zhangqilong3@huawei.com,
        rikard.falkeborn@gmail.com, chunfeng.yun@mediatek.com
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH v2] usb: gadget: tegra-xudc: clean up comments
Date:   Sun, 17 Apr 2022 09:07:12 -0400
Message-Id: <20220417130712.3932247-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Spelling replacements
endpiont to endpoint
Compliacne to Compliance

Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: restore cancelled, fix commit log

 drivers/usb/gadget/udc/tegra-xudc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index d9c406bdb680..6d31ccf6aee5 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
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

