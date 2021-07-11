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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A8FC07E96
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:55:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E77861026
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbhGKX6F (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232520AbhGKX6D (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:58:03 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65378C0613E8;
        Sun, 11 Jul 2021 16:55:15 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id c5so7649418qvu.11;
        Sun, 11 Jul 2021 16:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U0LYQuSmkCfRswWkP5cpCqxrlnDpTD9Qby2KGfuc2Z8=;
        b=aMEeNYujwKiJlv978eN9xCz7d7m5md9tsA+rJrn0nFCK5cXRxtMt1cAREklGY2GzmF
         y0nEjNrEDPHPtBm/kYQhXOiuiY2WwLv0GPouy5Fcs7pzpAQavEpn3LLzwoWbn4hZtWnU
         usXMCjgMpOX++IYajXwcYGnolh3qScGeojzgsdFAa4j8X00lD/pAhlK4ZReAOZKN3w6Z
         8qBeOWfmcKqKgzqMDRJZOfxlwDFmF24jSfJ66LKMNAiWkugoWF+ZT5iPLZbXCjWBh5do
         fKO9lXp8dThbf6f84qGWiK3GnTelzqqwM0E2q59UKC0+M5w4ZgO4JMIoHK/h0QHCoUgA
         FCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U0LYQuSmkCfRswWkP5cpCqxrlnDpTD9Qby2KGfuc2Z8=;
        b=f3V/t0UGFCtmwWrEDNnif5pXkwwHccM8pMFtvxGWTwZrPZzjMtJXcaJesRx4UU6ub6
         /rPgvwol3OlHwe41nKtnELMEzwF2A/ph5H+9+HMBaxalQLBrWZXkMqC49gw82TDRChrP
         YMouiXzbupaNt4lJJ0Lfb4Nq/OGWxUfDUVq4N6lIGbfOS9B6Rdf+U/VAuuOYNWFi8cVC
         d07Weznncn/c5BV5Q41FRT2mLqrOYhdi5+pPvjU2aR4cyF20nigU7clR5UZLKfPHvebl
         Vwa3R4ePYoP0MNbbJEgxO3ItSLWY89mx/mENFAE4t57dNkKMs/RG2MrZGhF7GBoOPp3N
         M3cg==
X-Gm-Message-State: AOAM532T0Z5i8LMP3SoYfuVknjyeNBZ4uQ1O+a2yWvBZjhvQ3WodGhGq
        hUU3pjq9IRr/LzoA5szn10I=
X-Google-Smtp-Source: ABdhPJzcsEbUBMGqZAHZ7NQJRGLRjoZ1aIFgGTQRIBuVmeZ58JNJ4IwZct+hCgAeaiN+QIQqjKk6Lw==
X-Received: by 2002:a05:6214:29e4:: with SMTP id jv4mr43515391qvb.25.1626047714648;
        Sun, 11 Jul 2021 16:55:14 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id h10sm4963133qta.74.2021.07.11.16.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:55:14 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 4/5] ARM: multi_v7_defconfig: Enable Acer A500 drivers
Date:   Mon, 12 Jul 2021 02:54:34 +0300
Message-Id: <20210711235435.31165-5-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711235435.31165-1-digetx@gmail.com>
References: <20210711235435.31165-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable EC controller drivers of the Acer A500 tablet.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 8d5ec5986b42..65d1fede3825 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -493,6 +493,7 @@ CONFIG_BATTERY_ACT8945A=y
 CONFIG_BATTERY_CPCAP=m
 CONFIG_BATTERY_SBS=y
 CONFIG_BATTERY_BQ27XXX=m
+CONFIG_BATTERY_ACER_A500=m
 CONFIG_AXP20X_POWER=m
 CONFIG_BATTERY_MAX17040=m
 CONFIG_BATTERY_MAX17042=m
@@ -551,6 +552,7 @@ CONFIG_BCM7038_WDT=m
 CONFIG_BCMA_HOST_SOC=y
 CONFIG_BCMA_DRIVER_GMAC_CMN=y
 CONFIG_BCMA_DRIVER_GPIO=y
+CONFIG_MFD_ACER_A500_EC=m
 CONFIG_MFD_ACT8945A=y
 CONFIG_MFD_AS3711=y
 CONFIG_MFD_AS3722=y
@@ -896,6 +898,7 @@ CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
 CONFIG_LEDS_MAX77693=m
 CONFIG_LEDS_MAX8997=m
+CONFIG_LEDS_ACER_A500=m
 CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_ONESHOT=y
-- 
2.32.0

