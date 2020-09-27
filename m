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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A294C4346E
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Sep 2020 17:29:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F89423718
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Sep 2020 17:29:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jm5+voUS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgI0R3g (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 27 Sep 2020 13:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgI0R3g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 27 Sep 2020 13:29:36 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A7DDC0613CE;
        Sun, 27 Sep 2020 10:29:36 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id q4so2292945pjh.5;
        Sun, 27 Sep 2020 10:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H2ne51E0OC00G+XGm4/7Oiftb+fIPcNupoPj2jSF7Tc=;
        b=jm5+voUSxOT1hkFK/U/6V6PljCVLKzwhyxE6vQpyOPp4CHAYM4cSz3SOQ70102BMlR
         xqkPipQ295I94D9BtSHecW50PRGIjzENm9tb9R4q4u005pEQkT+SE9dv977LLg8RbGqJ
         52kNvb4qJ69lxCTaXTfxd1eJEg1vP9qgdAHZgc3gtO9A1Df3pgQAnxm1R5dtu6MZvscT
         ivukUp4aPX3JuRNFLyvmVX/bAIvYiiJW0TTdknFdJiFoLSItPDuTbZYRDAIsbLA4L9sc
         F6LH2oA5en9eXXPAmbWMecS+0hrrBPQHZVrKT5Z6OeMBLbScXE7WkacC8nLqUQ8BwEpn
         gBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H2ne51E0OC00G+XGm4/7Oiftb+fIPcNupoPj2jSF7Tc=;
        b=b5Qf2IDxXbCYWfKlkWkq0P5naG8OTz0Lr/Sp/3gl+rf6xDm2Wq8CZmQFwomNKQ5KIM
         uUcLQmkZaL4RGs1y2Z5DPX+Z6L6eJo3rR/L0fRDr1FfVZSjIxdt/p1Qz4WLouKawdDEv
         RMXEPIHwu0F3QdJrlOIOEqw8fKxPSLSiG+ijPDmkPdM2O554o4Ca+K+Ae4sHMp49UXxJ
         ECufGjsVyHtoKR7OyqqBAA1S9X0mhKLa48fFIfCpstqmoRe5MBkzS/cBkjWoXA4gdVll
         kEtRD5IvnobUxvAA/xMrVlhfC/Sa3322lbcG0Ntg4VvK9e83hC4JOKyhC9qINheNTQGf
         ymfQ==
X-Gm-Message-State: AOAM531Y6OPI0o8YrbgE8gU7JeARbwxqKEKXeaXmOst3i2hiGNN3S8gf
        PZuo+ztgcTVCfDufojRgI1AxHvB6qIeZaQme
X-Google-Smtp-Source: ABdhPJxl+ql0T7Q5Ay/5aWfJh6kYGpeJNzskFTiWrbLwmG2aGZ2xaeoCKQuU8Zx2NfbR88loopslqw==
X-Received: by 2002:a17:902:a712:b029:d1:cbf4:c583 with SMTP id w18-20020a170902a712b02900d1cbf4c583mr8186666plq.16.1601227775544;
        Sun, 27 Sep 2020 10:29:35 -0700 (PDT)
Received: from localhost.localdomain (cpe-70-95-82-187.san.res.rr.com. [70.95.82.187])
        by smtp.gmail.com with ESMTPSA id fw4sm4434030pjb.55.2020.09.27.10.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 10:29:35 -0700 (PDT)
From:   Ryan Kosta <ryanpkosta@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     marvin24@gmx.de, p.zabel@pengutronix.de, ac100@lists.launchpad.net,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, Ryan Kosta <ryanpkosta@gmail.com>
Subject: [PATCH v3] Staging: nvec: Removes repeated word typo in comment
Date:   Sun, 27 Sep 2020 10:28:55 -0700
Message-Id: <20200927172855.9813-1-ryanpkosta@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fix a comment typo.

Signed-off-by: Ryan Kosta <ryanpkosta@gmail.com>
---
V3: Fix commit name
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

