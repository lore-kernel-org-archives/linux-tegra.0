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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94B2C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:53:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CD7820A8B
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:53:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730492AbhASXxU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 18:53:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729070AbhASXxS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 18:53:18 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD9CC061575;
        Tue, 19 Jan 2021 15:52:37 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id o10so31589911lfl.13;
        Tue, 19 Jan 2021 15:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kY38Jr/zSrAzwJNu6cLdZX18v4uENGzkZyBc0LDwj2g=;
        b=sONKCQA4mm0zJ54l9T/fgs/3+Sm6huCzz4UxF2Nzo3J7hWcf/n93JzjkwZpQwd5YKx
         idKmoyrYGIBh3DqFxJVi65w1t+VBFAQnfn5yhoU8yGuWvRskZA91USeWE3OuZXLUj7ak
         jArW2asAVNefjtQm+vtC7Y8CI7RW8+B1yJxdKhQ6W1x3xQbfbDk1pfwM90OAqiPcEZqZ
         EAoodYmjk5OMd9YXYXQANqXP50rMGm1LH+23pBPqviWeTYTrsX1oBbMkKtJaj/xjwzMk
         8kyPJQUq5KqKvZ2z1AVfItasbNThXbpaacNl/qqltHb6r/8/7qilsh3Z1GKMD86vaO9k
         Sdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kY38Jr/zSrAzwJNu6cLdZX18v4uENGzkZyBc0LDwj2g=;
        b=is7ZuqkJpsUo1+xuI4rqpHzlEz7WRBVAuv2jHMoSUAG2NTfkDa54ty6dQFIbMl98uw
         2VEPcHF2/dLwXesZJsHNcPR4sLrmASlNnJPeA2lyFgs7xBD4obPOq3fq3KORPi4xp8Oj
         4NzNjysdr+jgq/EOFGz1HGabxVrUzzdZg2wQEFA5tw5497+foiHc6YkWfOdVpLn3cD36
         Sgc9iNo7EfMbvB7frum2GUTqHmWuWXrCb9ux/bSlJ7Jk5/Q2Mh69wDQpfi1ZTz/mSseK
         B1rHaAjzPZJ+Jcwxr+elmsxIvq//at1t5ihz4bLCa0/DqnovSbUX1r2XG+/cc6Z0zEqM
         nb4g==
X-Gm-Message-State: AOAM5308lzcDVu/kWLSxQHou/YUnJdP5n55v5BMIm+1tnfDXoLXZtnbu
        B1YFpr4nH5ajDyqqxeXf1r0=
X-Google-Smtp-Source: ABdhPJxO+KbO8mRXzitiXehaLFyiGOZbRmAG055yLZTlzxiNJMTZE3Q/dhW8knhUnhxxr5o98ANiew==
X-Received: by 2002:ac2:5d6d:: with SMTP id h13mr2926837lft.538.1611100356277;
        Tue, 19 Jan 2021 15:52:36 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id 13sm31249lfy.286.2021.01.19.15.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 15:52:35 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] memory: tegra: Check whether reset is already asserted
Date:   Wed, 20 Jan 2021 02:52:10 +0300
Message-Id: <20210119235210.13006-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Check whether memory client reset is already asserted in order to prevent
DMA-flush error on trying to re-assert an already asserted reset.

This becomes a problem once PMC GENPD is enabled to use memory resets
since GENPD will get a error and fail to toggle power domain. PMC GENPDs
can't be toggled safely without holding memory reset on Tegra and we're
about to fix this.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/mc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 44064de962c2..a21163ccadc4 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -176,6 +176,13 @@ static int tegra_mc_hotreset_assert(struct reset_controller_dev *rcdev,
 	if (!rst_ops)
 		return -ENODEV;
 
+	/* DMA flushing will fail if reset is already asserted */
+	if (rst_ops->reset_status) {
+		/* check whether reset is asserted */
+		if (rst_ops->reset_status(mc, rst))
+			return 0;
+	}
+
 	if (rst_ops->block_dma) {
 		/* block clients DMA requests */
 		err = rst_ops->block_dma(mc, rst);
-- 
2.29.2

