Return-Path: <SRS0=lnQj=EA=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D2AC5517A
	for <linux-tegra@archiver.kernel.org>; Sun, 25 Oct 2020 22:42:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B6E4217A0
	for <linux-tegra@archiver.kernel.org>; Sun, 25 Oct 2020 22:42:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmjzbHbB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1420337AbgJYWmY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 25 Oct 2020 18:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1420334AbgJYWmX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 25 Oct 2020 18:42:23 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785C7C061755;
        Sun, 25 Oct 2020 15:42:23 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y16so7768902ljk.1;
        Sun, 25 Oct 2020 15:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V/owtm7CKL7aXeAomkI0+DszZCxQFPYFDuDBIRrRH/U=;
        b=nmjzbHbBiymbyAdZ9y16ECopOtAhsBxwH3sstAI9BqTJ2qGz4hTeopEmj5otITQXaK
         3pu9xRpCDD0FL2IN9SrVZr6UtdbBvPbK08OgwOAGP2Ubp9sqwFk9KAdfiGIp69cjWhVA
         hzEknW5b80kp6j739bOWPl7NDPv1yZDuUUXZkgEyZ5LZ0U38K5tNoKBTCX/rJvtd3iqw
         nqIetuLDDxDh4v7DpZvQwr8upo64QuZMbQijJ8fKtaosVwWi5DuPYBsm87UoG+XgihMr
         yKfwArtme5WKCXYJnVYJZMjVJVGKJ7pjPUwMOjYM2sXhnnNtcn0wK1tnGK3nPz2mHqDC
         KuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V/owtm7CKL7aXeAomkI0+DszZCxQFPYFDuDBIRrRH/U=;
        b=UlxZNin69gQT934FDNSvBLTXLlbB/s0N5ilfcLYSnD8vCPVGy4Lp6Sch7WfqdmI1KD
         iNMPb97Wn78GDdS4+Y8za6mh/ioI/C3ueVuT0dcZoS0lmSII79SFfIE6b+TZCPa6Phsb
         QfQyjJ8cTKpcMDmDuss2UzAVVuVjxtHElKJiOHqSvU0BNkIFAG+W/Jloh5LGgCG3aF0y
         wKILAm2JMUAG8R9X2WnQu69HF6dBJMkjVHDAyCBv3seb+oWDR4UVbGewNTJY+m4Z7y3P
         5psHfEUWIF0EjM1wzv3juR/S7fg0key5W+i6PmaOeMnSSCjaaM1JnQPfuHtepusfDaAS
         FGoQ==
X-Gm-Message-State: AOAM531YAfsvr0Ll7ws6yzLfx7w7aDJfJuV7MLV0QI6bVeu8pSj8KbsP
        Jvrt+yh0jQc1wrVqh/J49Js=
X-Google-Smtp-Source: ABdhPJy979kPb7xmaWdqVdvrVukWTGOgZ34wsKFY2mm6Y2SnOmUQhksAixqTM9XZ+aBw5ZKSvfDOhA==
X-Received: by 2002:a2e:9b8e:: with SMTP id z14mr4241146lji.26.1603665742036;
        Sun, 25 Oct 2020 15:42:22 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.gmail.com with ESMTPSA id e73sm855959lfd.199.2020.10.25.15.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 15:42:21 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Chauvet <kwizart@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] clk: tegra: Fix duplicated SE clock entry
Date:   Mon, 26 Oct 2020 01:42:12 +0300
Message-Id: <20201025224212.7790-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The periph_clks[] array contains duplicated entry for Security Engine
clock which was meant to be defined for T210, but it wasn't added
properly. This patch corrects the T210 SE entry and fixes the following
error message on T114/T124: "Tegra clk 127: register failed with -17".

Fixes: dc37fec48314 ("clk: tegra: periph: Add new periph clks and muxes for Tegra210")
Tested-by Nicolas Chauvet <kwizart@gmail.com>
Reported-by Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-id.h           | 1 +
 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index ff7da2d3e94d..24413812ec5b 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -227,6 +227,7 @@ enum clk_id {
 	tegra_clk_sdmmc4,
 	tegra_clk_sdmmc4_8,
 	tegra_clk_se,
+	tegra_clk_se_10,
 	tegra_clk_soc_therm,
 	tegra_clk_soc_therm_8,
 	tegra_clk_sor0,
diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 2b2a3b81c16b..60cc34f90cb9 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -630,7 +630,7 @@ static struct tegra_periph_init_data periph_clks[] = {
 	INT8("host1x", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_HOST1X, 28, 0, tegra_clk_host1x_8),
 	INT8("host1x", mux_pllc4_out1_pllc_pllc4_out2_pllp_clkm_plla_pllc4_out0, CLK_SOURCE_HOST1X, 28, 0, tegra_clk_host1x_9),
 	INT8("se", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_SE, 127, TEGRA_PERIPH_ON_APB, tegra_clk_se),
-	INT8("se", mux_pllp_pllc2_c_c3_clkm, CLK_SOURCE_SE, 127, TEGRA_PERIPH_ON_APB, tegra_clk_se),
+	INT8("se", mux_pllp_pllc2_c_c3_clkm, CLK_SOURCE_SE, 127, TEGRA_PERIPH_ON_APB, tegra_clk_se_10),
 	INT8("2d", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_2D, 21, 0, tegra_clk_gr2d_8),
 	INT8("3d", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_3D, 24, 0, tegra_clk_gr3d_8),
 	INT8("vic03", mux_pllm_pllc_pllp_plla_pllc2_c3_clkm, CLK_SOURCE_VIC03, 178, 0, tegra_clk_vic03),
-- 
2.27.0

