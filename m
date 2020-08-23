Return-Path: <SRS0=c9q3=CB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6782DC433E3
	for <linux-tegra@archiver.kernel.org>; Sun, 23 Aug 2020 14:48:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48174206C0
	for <linux-tegra@archiver.kernel.org>; Sun, 23 Aug 2020 14:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pj1w9/QB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgHWOs2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 Aug 2020 10:48:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbgHWOs0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 Aug 2020 10:48:26 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95FFC061575
        for <linux-tegra@vger.kernel.org>; Sun, 23 Aug 2020 07:48:24 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id f26so6788985ljc.8
        for <linux-tegra@vger.kernel.org>; Sun, 23 Aug 2020 07:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6ONtABTiYfSUQ8clPgMZc79cCbsGkPneBjqfhKzy+e4=;
        b=Pj1w9/QBZQsA7AF/9pj4P+zBruYXFa4sbwc0wuQc+Hm6VuK5h6zfSff+wAdWNErcDn
         C0H59a8RcnGy6/CYqNdoLpaRGUmx6/qtTt39vfT6ICg0BOv3PdSvt2styDplLojzOA7S
         Gy2S8Y4hK81emFdpSLx2rHnlHeWxKuPVA+iPgNTEudFEBBkprTirATyHryx8RwXDVvv1
         1xlozrpEjaZUf9NBKuL1sAqFGBAUk5083fHL5kS9XaEJxqTM0tGAEJm5TeucfCPxOrZW
         Z7QSlOQZc4aU6sKIhKMVyAbqOIjC8eSKhKKRvKe7yvEwp8nB1+VtHsXyzC4nvGxZk7Nr
         wjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ONtABTiYfSUQ8clPgMZc79cCbsGkPneBjqfhKzy+e4=;
        b=LGLqArnjiPTjm84sTAz/Lca7E+LN+PhCqefgP79CNJJuefjXyjTNTRf8AGqu1Io7ZK
         Bk79qJLIdycmapiWfzcNTHbqPVdIgJFiNQauES9qnUcL2j+leGoGw4pIvJ9fNtkUbzbR
         8pWt1X7+z9t49BBwdxLFT0inkQy/vOxgt3c8zbQGpIBH2DOOjfk/A3L+LVY0R5MOTyuq
         94m66ihGdg4s8uhooeB/FuyHgysDMOmasEXSaVH2X33DNNsWXQ/VjeqUzzQCb7kRsPoP
         G6T5C6TMNrP/YVXTZ+PpcZaq2tlu/pJ3M5CPCJTUPjY1hyDP9z6siNh40ibeagHOgjHJ
         vhkw==
X-Gm-Message-State: AOAM530wwIQpLHCe0Rv79aWNQrHIDiOGqomqf90QDVk9agb2rCj7CMot
        qFSYaDnYfqSsLJGqiWLCmKI=
X-Google-Smtp-Source: ABdhPJyzfoQa/yopBPURQRAkLl8zX6X38WQdMY6/B8ZXBFtmaCRYyyNxY6tTi1QFOz6zi03YY1regw==
X-Received: by 2002:a2e:3019:: with SMTP id w25mr687626ljw.291.1598194101591;
        Sun, 23 Aug 2020 07:48:21 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l24sm1635560ljb.43.2020.08.23.07.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 07:48:21 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Wright Feng <Wright.Feng@cypress.com>, linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/4] ARM: tegra: acer-a500: Correct PINCTRL configuration
Date:   Sun, 23 Aug 2020 17:47:22 +0300
Message-Id: <20200823144725.28299-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200823144725.28299-1-digetx@gmail.com>
References: <20200823144725.28299-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The low-power-mode drive was set to DIV_4 for some of PINCTRL groups,
while these groups should use DIV_1. This patch fixes the wrong PINCTRL
configurations and adds a full drive-setup for the changed configs, just
for completeness since the added values match the default configuration.

Now WiFi SDIO communication works properly using legacy signaling mode if
SDIO BUS clocked at 50MHz, which is a maximum SDIO clock rate on Tegra20.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index f92712e4bd34..8b4912db0d20 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -314,16 +314,24 @@ drive_ddc {
 				nvidia,pins = "drive_ddc",
 						"drive_vi1",
 						"drive_sdio1";
+				nvidia,pull-up-strength = <31>;
+				nvidia,pull-down-strength = <31>;
 				nvidia,schmitt = <TEGRA_PIN_ENABLE>;
-				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_4>;
+				nvidia,high-speed-mode = <TEGRA_PIN_DISABLE>;
+				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_1>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_SLOWEST>;
 			};
 			drive_dbg {
 				nvidia,pins = "drive_dbg",
 						"drive_vi2",
 						"drive_at1",
 						"drive_ao1";
+				nvidia,pull-up-strength = <31>;
+				nvidia,pull-down-strength = <31>;
 				nvidia,schmitt = <TEGRA_PIN_ENABLE>;
-				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_4>;
+				nvidia,high-speed-mode = <TEGRA_PIN_DISABLE>;
+				nvidia,low-power-mode = <TEGRA_PIN_LP_DRIVE_DIV_1>;
 				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
 				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
 			};
-- 
2.27.0

