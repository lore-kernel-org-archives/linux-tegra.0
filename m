Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57DBC433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70320619BF
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:41:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbhCYQlV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhCYQkv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 12:40:51 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD71C06174A;
        Thu, 25 Mar 2021 09:40:51 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id d8-20020a1c1d080000b029010f15546281so3459620wmd.4;
        Thu, 25 Mar 2021 09:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7xHWkhn/z0JEymImWDnOlsM+EPtRLYWHNs/Xv1gr+uM=;
        b=Q+0cCvOricq0GsG0pDLQC5rPnSBWSZv1Cw7sGhPN6hgzMXFSUCBwTYYT4gWsaqpp+C
         iZzZRyZ8TTz8Wh/EhBTG29RNDoKhmSfBVG+OnZi6KYwqWRvtOBgFSa1q/slLfTTi7qpv
         juF/luqVjJ83YlDfU/C95TbD0Hn/Ll+X4R6qSxHVguAYHBJVInoTV+aOCvqWVEmB1EK7
         OY5BoJikPRpy+vvbOiw3tHa0sncm/xvjyIcza/aCG3s7KMr8P6DCMHXOf9sARVLzldjF
         PiUHdz+wLNw/npyPjwqeCIEERXsyojS7UAy8yYPT5QGayaVdJmJ3HAAEij5wmjJVkCi6
         w67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7xHWkhn/z0JEymImWDnOlsM+EPtRLYWHNs/Xv1gr+uM=;
        b=kpXAOtOpCXPDMFJGLDokc/VDsOh4syriZdzJg0bk8o8bghv7uRv4Ah5EUYgYSYM8fv
         LO/D2URe83t58F3ttcr8ddsUoLcml+MivJW6Nf+73qRhxnEehbfB2aX2Wve6YJKEo/zw
         xNmjGLYWhDnjaLdC4tSmf+qRJbz25ufgpXws7i5zgMo2o4qpb6vqELZQEQ0Y8t0kDdNg
         sq6l3R2DlWpNuD0RuhLJUQ1AibbJ7yIEpiqUqEkwXTVFutGB9ORWa0CfsKYTbSR6dzoQ
         p14IZeR4pee+H+vaWF292klKPSCk/tc69YK4g49iWPPyu116vhadTEz+OHo6vCFrW5qJ
         2/uA==
X-Gm-Message-State: AOAM532nCSgtOW9mJLay+OZysRrj/bQwgsOYEQz3hRsBa0SrEyZPBdkK
        XWPEie5tLSyT+Je+su+t/yw=
X-Google-Smtp-Source: ABdhPJxqtyCkFdufHDekeuhCqWrE08Px7391PietRFnTEt4dlFECQEGki4iWZXp1/0HZZUGVbBPkmg==
X-Received: by 2002:a05:600c:19cf:: with SMTP id u15mr8645258wmq.7.1616690449958;
        Thu, 25 Mar 2021 09:40:49 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m17sm8496286wrx.92.2021.03.25.09.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 09:40:48 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v8 02/13] clk: tegra: Don't enable PLLE HW sequencer at init
Date:   Thu, 25 Mar 2021 17:40:46 +0100
Message-Id: <20210325164057.793954-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325164057.793954-1-thierry.reding@gmail.com>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: JC Kuo <jckuo@nvidia.com>

PLLE hardware power sequencer references PEX/SATA UPHY PLL hardware
power sequencers' output to enable/disable PLLE. PLLE hardware power
sequencer has to be enabled only after PEX/SATA UPHY PLL's sequencers
are enabled.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index c5cc0a2dac6f..0193cebe8c5a 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -2515,18 +2515,6 @@ static int clk_plle_tegra210_enable(struct clk_hw *hw)
 	pll_writel(val, PLLE_SS_CTRL, pll);
 	udelay(1);
 
-	val = pll_readl_misc(pll);
-	val &= ~PLLE_MISC_IDDQ_SW_CTRL;
-	pll_writel_misc(val, pll);
-
-	val = pll_readl(pll->params->aux_reg, pll);
-	val |= (PLLE_AUX_USE_LOCKDET | PLLE_AUX_SS_SEQ_INCLUDE);
-	val &= ~(PLLE_AUX_ENABLE_SWCTL | PLLE_AUX_SS_SWCTL);
-	pll_writel(val, pll->params->aux_reg, pll);
-	udelay(1);
-	val |= PLLE_AUX_SEQ_ENABLE;
-	pll_writel(val, pll->params->aux_reg, pll);
-
 out:
 	if (pll->lock)
 		spin_unlock_irqrestore(pll->lock, flags);
-- 
2.30.2

