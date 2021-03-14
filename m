Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD03C432C3
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9ABB064EEE
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Mar 2021 15:46:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234237AbhCNPqF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Mar 2021 11:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234096AbhCNPpa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Mar 2021 11:45:30 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5D2C061574;
        Sun, 14 Mar 2021 08:45:29 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id 61so4450204wrm.12;
        Sun, 14 Mar 2021 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oD3FaI4IefheXyOruQTSZ8GPhKjZkAiPZDDxvon3Qf0=;
        b=KKfe44JVwuQ/IBwSvIg3rcroBJOZn6rWeUXbyoRs8WuIzwBr2SVINJDN4xhqpXSpQC
         6rUZdgP/vS9Ok7xTyvcLS2Z6WjYgYF7lpIUa6URhis1da+S6ZVBRR8U0EHMyVZZ3YCx1
         47PVHWWsiJZdFIkfqk48U+oVdRaafucgvDrdM0OtvuciQlPfuMI1+QcGF5RA02uJ2TAC
         lD2mjwiCeVk8WBmriPbIuSph0iDaYZMVl78ua5zuqENTJXFrEz6+FIcGVsYae+s31CuC
         +YNaXKPLeUY5Z55WMGTRfXMaMXKKdaTMS0Ja62pj0fFzj3mn3li2zc15e+N7z5j7I88g
         q6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oD3FaI4IefheXyOruQTSZ8GPhKjZkAiPZDDxvon3Qf0=;
        b=l47M+Eq+WlqMG5xMygsJZUdnpNCqeeXhfiJrBLCZzHr2mlU9+iqPPtXvlkTVvG1sEQ
         YKI1nBDAOpmzu+z0Kx5VBNiBGsePRWYlCXyyF7ExrjGr+/5Y7heaOueEDggOidP5lFQH
         ZA6IeznD4ywzda5WBHd9Jw2KT3a98eDfLDVfIO+6bmWgkVWHuQtg2gnI1DUMAst9mKIw
         Rf86W6CcKjH+X0ZfT6P0Rz/VLnL8tu/ESzwcm7dEq6N8g1YKVLVb3xefOgsRxfukYTab
         heweBbG14YfQWszA9chvQUgS5/YCY322AhUvTUz2khGbpPpUWkTOtb2X+E7wIMMPuu70
         XYlA==
X-Gm-Message-State: AOAM531XKUHT12xrkUdvg8kM1pQfYRlnRKSXeq7vA5y8bEY2RDjmbZ+G
        RJ3ZqM5ZFBAKVqZzxCvMZDU=
X-Google-Smtp-Source: ABdhPJzDp5zth7DowoByIIzbNFBq6dWh7HlXTtOifkclsw34ZZSdE40cm2y12jMfgTOfLaOfYumI7A==
X-Received: by 2002:a5d:4203:: with SMTP id n3mr23094069wrq.116.1615736728700;
        Sun, 14 Mar 2021 08:45:28 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 08:45:28 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/17] ASoC: tegra20: i2s: Add system level suspend-resume callbacks
Date:   Sun, 14 Mar 2021 18:44:50 +0300
Message-Id: <20210314154459.15375-9-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314154459.15375-1-digetx@gmail.com>
References: <20210314154459.15375-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add system level suspend-resume callbacks in order to ensure that I2S
is gated before system is suspended. This puts Tegra20 I2S driver on
par with the Tegra30 I2S driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_i2s.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index c0af5352b483..267517446d27 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -460,6 +460,8 @@ static const struct of_device_id tegra20_i2s_of_match[] = {
 static const struct dev_pm_ops tegra20_i2s_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra20_i2s_runtime_suspend,
 			   tegra20_i2s_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra20_i2s_driver = {
-- 
2.30.2

