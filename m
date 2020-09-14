Return-Path: <SRS0=22zn=CX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACF5C433E2
	for <linux-tegra@archiver.kernel.org>; Mon, 14 Sep 2020 13:38:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA8A220E65
	for <linux-tegra@archiver.kernel.org>; Mon, 14 Sep 2020 13:38:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vFq1f6SK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgINNil (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 14 Sep 2020 09:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbgINNhw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Sep 2020 09:37:52 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45B3CC06178C
        for <linux-tegra@vger.kernel.org>; Mon, 14 Sep 2020 06:37:51 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j2so18787097wrx.7
        for <linux-tegra@vger.kernel.org>; Mon, 14 Sep 2020 06:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JiAbE/SJFaiXXWha+UZiz5ngLuS7vuLVdaMJTivRPyQ=;
        b=vFq1f6SKOxtpuKxNma+7ZA9kDXv2zGVkGU9v9NUmImjiKTQeM/2i3e0oTmeVt/DY6w
         tgv1Cx56ozRP1TV9Gzlxb12Mpwf6bVRCXJLQQ3zah/nXpAILn+H/HklrAZtRC1zNOSXT
         hZcDsubA6BWg8/Oef67y/vmHzS3XmbgaY7QSBMu01oBGi5jH5l8gpDkRwETb4VTVXjha
         q2UlYokEpJtwGYhuKm3a6uqsnwRNvKcsTpr24JoHW8MYjWbnMHicviAIBXfdWJpTu9ZR
         5jmJs3VbdGAmNmGqYTMsr4eJhd4Is+6XVh4O9Ab3gDtftBYU7SKDZol7RNTOsA9e9AT5
         kqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JiAbE/SJFaiXXWha+UZiz5ngLuS7vuLVdaMJTivRPyQ=;
        b=BONTVJaCXB0d0DKYN5uMuBR6otZXYkBk1cujhF0GMLZgIsFyKX1x/CdZx6NEShgOOJ
         JLTu++Bry1/HlObDBnxweLa8hNB5W0oI1KWIZnAovwl6rYr6pnrUyJNOpKCt/OOhCOED
         osw/feG8p9uLvnCRR5oJ3WURK6QprLw+zbL0wN8+b7a/1tX1oJphCD3See9jKxZVHipr
         oCX7ZCQd5kW2jpao2XqmKWEktbPsb3GohEadXx0JoCLm4tmHQ2lopuYMO+PquktSPbxU
         /ihXE9oQsqwc/5D4mwS6jJCuhsGYwAJv8W5CaS5QXn9DbVvxSnJ2CGRbWJCuuY9Belkl
         h/jg==
X-Gm-Message-State: AOAM53288ufkYp9VQCDdmq6xPYWYtGzNWkEZUm4nBnougvSWPb0dUKYm
        6i5/GWD+JweA/LyMGsqsjSQ=
X-Google-Smtp-Source: ABdhPJw87PMqYf884sc9nCWQvnZpNiQyODT4J/UycBGllM2p5oMrTfGriEh/cMu4n58JpyTmFfW65w==
X-Received: by 2002:adf:f3c6:: with SMTP id g6mr17355339wrp.340.1600090669198;
        Mon, 14 Sep 2020 06:37:49 -0700 (PDT)
Received: from arrakis.kwizart.net (lfbn-nic-1-212-171.w2-15.abo.wanadoo.fr. [2.15.59.171])
        by smtp.gmail.com with ESMTPSA id a11sm18532488wmm.18.2020.09.14.06.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 06:37:48 -0700 (PDT)
From:   Nicolas Chauvet <kwizart@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH 3/4] arm64: tegra: Add missing hot temperatures to tegra132 thermal-zones
Date:   Mon, 14 Sep 2020 15:37:38 +0200
Message-Id: <20200914133739.60020-4-kwizart@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200914133739.60020-1-kwizart@gmail.com>
References: <20200914133739.60020-1-kwizart@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

According to dmesg, thermal-zones for mem and cpu are missing hot
temperatures properties.

  throttrip: pll: missing hot temperature
...
  throttrip: mem: missing hot temperature
...

Adding them will clear the messages.

Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index e40281510c0c..cd913e59ba26 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -925,6 +925,11 @@ mem_shutdown_trip {
 					hysteresis = <1000>;
 					type = "critical";
 				};
+				mem_throttle_trip {
+					temperature = <99000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
 			};
 
 			cooling-maps {
@@ -975,6 +980,11 @@ pllx_shutdown_trip {
 					hysteresis = <1000>;
 					type = "critical";
 				};
+				pllx_throttle_trip {
+					temperature = <99000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
 			};
 
 			cooling-maps {
-- 
2.25.4

