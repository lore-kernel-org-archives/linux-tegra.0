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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3CDC433E1
	for <linux-tegra@archiver.kernel.org>; Sun, 23 Aug 2020 14:48:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDAD62072D
	for <linux-tegra@archiver.kernel.org>; Sun, 23 Aug 2020 14:48:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8HS6Sm7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgHWOsb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 Aug 2020 10:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbgHWOs0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 Aug 2020 10:48:26 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0CAFC061755
        for <linux-tegra@vger.kernel.org>; Sun, 23 Aug 2020 07:48:24 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w25so6768296ljo.12
        for <linux-tegra@vger.kernel.org>; Sun, 23 Aug 2020 07:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dEKne00OAFphAUih2I6Xo+Iuh2ECXbjANMXk4TXpw4A=;
        b=d8HS6Sm7cBHN5XF6NWWOieL4blMWhC5/a8Jyrc2uZaxkVoo/gClum38GeXS2O3lwcy
         UMQNehPszdQ5LbR9tMMMWGQDuuhF1XzoCr3YD+FMNMhvlrKnPr+oSZKBXPhhpjuPk1rn
         L2tbst1q7bX8L3vSZiLplGlOE8iScNjP7zlRAcWsK8TV2VnnH1N0Ej7kF+eWfQtZp3hF
         auBIgRsjVcBS0SYd4rBXAWN4FcclpM+Q26Wc9IZp+315jeJUsmFCzAer2OLPhoIcRZIX
         dG5VQV/HqEDJKahpILZ1MRZa1Ie3tHiu2Qp7razFbdC2NPCauD8CpF5xAp0b/3ofSezY
         5ExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dEKne00OAFphAUih2I6Xo+Iuh2ECXbjANMXk4TXpw4A=;
        b=tgyhkf2tIQX9UmEmn4H6FlAYPpoPX6OZHMComwa6XDwx5Ued+5XEki3+k+kNQo2p9m
         a9mycNBPggfd2SRIjGJ5+0TcM2qJf/FTN+PJVcMz+Wqa485T/a7l/pxoB7Ve9xGr1jPm
         DJfJqP32Eh1Y1iNmklghLCWgWuVmiT1/hYVgOeuHIV5HsLbl/DTXnlgkdcVd9hOr9NHO
         zvSN5MMpsMurHb+e8KwjzqhCXT+R/aRzFlFytyfcHuwo4e4O0Jhx1itvvwrmzMOO6RBs
         Q0Na+Qn/mrS3DJiTqeKf3ASY1KZ1WDq89V7N2gnhahz8pXbDkLOiNU7CUH6/qr6LCCh1
         +oQw==
X-Gm-Message-State: AOAM533iK1SXoTLxSc/pv6ZwDVMIw+9l89GyY+A7bX/1CVc6Z3UwvyEy
        in/xPEIRYPB2212VZi+k/60=
X-Google-Smtp-Source: ABdhPJx6RFvWKbNV/DMaJcu9tbWH86hRTp1irwtQXEi8x7VsrlXHedkFKwGqLXKD6TXbUB4liSwZFg==
X-Received: by 2002:a2e:b0da:: with SMTP id g26mr801449ljl.264.1598194102465;
        Sun, 23 Aug 2020 07:48:22 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l24sm1635560ljb.43.2020.08.23.07.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 07:48:22 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Wright Feng <Wright.Feng@cypress.com>, linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/4] ARM: tegra: acer-a500: Set WiFi MMC clock rate to 50MHz
Date:   Sun, 23 Aug 2020 17:47:23 +0300
Message-Id: <20200823144725.28299-3-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200823144725.28299-1-digetx@gmail.com>
References: <20200823144725.28299-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Previously 50MHz clock rate didn't work because of the wrong PINCTRL
configuration used for SDIO pins. Now the PINCTRL config is corrected
and the MMC clock rate could be bumped safely to 50MHz, increasing WiFi
TX throughput by 20 Mbit/s and allowing to hit the maximum 40 Mbit/s.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 8b4912db0d20..b89e9398f681 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -744,7 +744,7 @@ mmc@c8000000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		max-frequency = <25000000>;
+		max-frequency = <50000000>;
 		keep-power-in-suspend;
 		bus-width = <4>;
 		non-removable;
-- 
2.27.0

