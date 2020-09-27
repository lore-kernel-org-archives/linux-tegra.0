Return-Path: <SRS0=p7a/=DE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F721C4346E
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Sep 2020 06:39:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0760239D4
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Sep 2020 06:39:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUKwgJ5V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729125AbgI0Gjo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 27 Sep 2020 02:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbgI0Gjo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 27 Sep 2020 02:39:44 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290F2C0613CE;
        Sat, 26 Sep 2020 23:39:44 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b124so6544268pfg.13;
        Sat, 26 Sep 2020 23:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MTiTHadi/nHgC5LvCcfwAGdh6E0z8YNmPT7uOrkAcuU=;
        b=RUKwgJ5VnPoNDRaHVCTwOKF38tRZ3EMMJ/0ikPifFbEVl1UPetFrqyr8rTy14hfjcS
         AU4j55odb5UgGctrVDVVqWxRwCvSln+a7wlPGOkDU7JTeDJon35x4J7Yb4Ao69zP5DGU
         1KpoUu9lwUeLtK10PS40VybPmto7vvHpN9IPsI4sJ2lS/8bfvQ60b/aVP8hy9ybL/x50
         BfIvKaUEJjwIIrUjnI9PCb7bvhLnosE+zaJZyRVqVJMny5K7qfq9lPH+csJnPEMWCHTq
         uYoDZs7gy04K4g56KPXuYDC/Hrp58elrdVA+TwnuQ7fl3s6v9/Q6NS5VtD9MCS9o3DwH
         RGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MTiTHadi/nHgC5LvCcfwAGdh6E0z8YNmPT7uOrkAcuU=;
        b=RdqYewEQM6sa64aWmJcVOYLUFv/eQBjGgfjyX4+vospszCo1Br6pAfB2AW/MkFUrDL
         S5aOiuphb78Q5/xjCCkeqXO6H3zeROuA4NRa9ktZpxbmyMtnMHWZVsneahEt8frb2s5B
         Wj2OLWcWMEqJ2dMrceK4gdVNWx7FfmvvegDghJyqgbKHeG969Z0nEXGMOPpXEQVx7mAQ
         +vPXO6pID75ZbOGVf893OQIz8AG/iaiCO3WfcFW0NBphosk4yWeJarppzlgUROoAMVHf
         7kNO1Huubuw1MQMWJUvnGtezYBrf6QXvs23z39/noi6WDdjCZ2f5U0hsPONfYAYD9jHq
         IfkA==
X-Gm-Message-State: AOAM531Gk3q1JZZUfbRWoOqODrbedng9LFsSVTcJv+Uj2oMKpLhMTjMu
        g22KxuPq5/3yjpDyyK4DXZ4=
X-Google-Smtp-Source: ABdhPJwE1IF/AzfvEKpfFlfzMsmPTo6wXC2N4AGL7zeIpPleIExsmgINrC/ivYJ+C01rr1JEPNP9MA==
X-Received: by 2002:a63:fc41:: with SMTP id r1mr4846352pgk.179.1601188783643;
        Sat, 26 Sep 2020 23:39:43 -0700 (PDT)
Received: from localhost.localdomain (cpe-70-95-82-187.san.res.rr.com. [70.95.82.187])
        by smtp.gmail.com with ESMTPSA id b20sm7748072pfb.198.2020.09.26.23.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 23:39:43 -0700 (PDT)
From:   Ryan Kosta <ryanpkosta@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     marvin24@gmx.de, p.zabel@pengutronix.de, ac100@lists.launchpad.net,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, Ryan Kosta <ryanpkosta@gmail.com>
Subject: [PATCH] fix double next comment in drivers/staging/nvec/nvec.c
Date:   Sat, 26 Sep 2020 23:39:37 -0700
Message-Id: <20200927063937.14614-1-ryanpkosta@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Signed-off-by: Ryan Kosta <ryanpkosta@gmail.com>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 360ec040774..a80996b2f5c 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -289,7 +289,7 @@ EXPORT_SYMBOL(nvec_write_async);
  * interrupt handlers.
  *
  * Returns: 0 on success, a negative error code on failure.
- * The response message is returned in @msg. Shall be freed with
+ * The response message is returned in @msg. Shall be freed
  * with nvec_msg_free() once no longer used.
  *
  */
-- 
2.20.1

