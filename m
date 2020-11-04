Return-Path: <SRS0=aGvU=EK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8C8C2D0A3
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 13:48:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78E9C2236F
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 13:48:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOZnFuQ1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729833AbgKDNsY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 Nov 2020 08:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbgKDNsX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Nov 2020 08:48:23 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EB18C0613D3;
        Wed,  4 Nov 2020 05:48:23 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id o13so14715785ljj.11;
        Wed, 04 Nov 2020 05:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ytoc8gbQUDyOgaglB+32jBnVlyKYOz5e2vCwW8mLjjo=;
        b=LOZnFuQ1B28S8e69LNKM/tEzTfNfu/ZOcuYxktkpMk0WVjlJMBHxC6tyTY4IzNwV8h
         xMf+q/Rh77bRqfW3ityzbjpaxQSGi1s4iZ7m+sVhYe4w+qevk7w0bKcSVsCpcnbL7AQd
         q14YA+ZtaKvQmuXZO5BQgxceCOacn0EojDRp4P8OmR+VqUWnm+AcnTO1LyitzeAJxPjP
         5xY1U18OHP6/y6IGl3dBylmq87K0upzgK2p+Zf2bxQ7sxRlIH8Oi0rRD4kvLr6t8ijbG
         aFhM9xIzTf61jLPEkkI7kQwHA2qDA6Cco+hJox0FLdL5178gKK1XtMeBivHZIWzsdpla
         mzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ytoc8gbQUDyOgaglB+32jBnVlyKYOz5e2vCwW8mLjjo=;
        b=hnK8811UrSp0bAE1MnukUouh6/bne+Vj1U1L6hXVVKNDiwMRruAhxfBCltVgAOpxTB
         IIck2mK1PFwXwsQn/rV1kR/N0ZD9CF1EnYZYznTWLPhlQSnU4W6GTPSLzmNHlA+trIyi
         OMaf7IjM2e7rcbbyo18RzD0afyV0T29s80x7JReQo5xZnxzC7cQBagpA4+0+lmacbUsd
         sVgh8kVdwyDQv2L7DLZmZgz0k4GKaCZKocFhU8fiOq7INUp2VFA7DhP2UV0hRspo2cDT
         LanKCQSh6MD5w4LVwB8R/dxlMeyVUf4oAaYf0lUp4ILDZdrayOYwIfAHDWdo9d7P8wv+
         dYjg==
X-Gm-Message-State: AOAM533GZoOYoL7ihO4FrrJMv7fJoJki0b2xwRY88jGwlw30cqo8ALQ3
        9dFzTBhfPRPYyICPiGPWI0k=
X-Google-Smtp-Source: ABdhPJyQSEp+WkiYOYwmRzA0uLKwghwnflPICJVu2nTr07SU14+W1Em1gKcDZIxxgKtGGoO1pTqi2g==
X-Received: by 2002:a05:651c:1050:: with SMTP id x16mr11573542ljm.100.1604497701949;
        Wed, 04 Nov 2020 05:48:21 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.gmail.com with ESMTPSA id r19sm407350lfi.286.2020.11.04.05.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 05:48:21 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] clk: tegra30: Use 300MHz for video decoder by default
Date:   Wed,  4 Nov 2020 16:48:10 +0300
Message-Id: <20201104134810.21026-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The 600MHz is a too high clock rate for some SoC versions for the video
decoder hardware and this may cause stability issues. Use 300MHz for the
video decoder by default, which is supported by all hardware versions.

Fixes: ed1a2459e20c ("clk: tegra: Add Tegra20/30 EMC clock implementation")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 37244a7e68c2..98923c4674bf 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1248,7 +1248,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA30_CLK_GR3D, TEGRA30_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA30_CLK_GR3D2, TEGRA30_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA30_CLK_PLL_U, TEGRA30_CLK_CLK_MAX, 480000000, 0 },
-	{ TEGRA30_CLK_VDE, TEGRA30_CLK_PLL_C, 600000000, 0 },
+	{ TEGRA30_CLK_VDE, TEGRA30_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA30_CLK_SPDIF_IN_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
 	{ TEGRA30_CLK_I2S0_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
 	{ TEGRA30_CLK_I2S1_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
-- 
2.27.0

