Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B484C47087
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:56:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CD2760C40
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:56:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbhEWX6H (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 May 2021 19:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232118AbhEWX6G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 May 2021 19:58:06 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D22C061574;
        Sun, 23 May 2021 16:56:37 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id q3so7935053lfu.2;
        Sun, 23 May 2021 16:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uG0wF9x5J31B5QovgpxzHE3VxGkFw0gZRlBKzlTkO48=;
        b=GXlfBtDsEcz8SOTu0s85MYLXwpR3w4tYPEhGTnICUEGdahTvGlMK/PtnMSsb2eurc7
         zCwGraA3D6irN8HTs7OVdrueAJ2HNKmWfv3PzWZXJnbUrayCn1umhI2wNiqyAfFphrZ6
         pzz6E74ZtVZ0uAX/VJDTmHzup0SxbwyoOZBPvQ4TILThtLQh27vCfiTwsN+0jrLQtuJ9
         Z7hBWWjtAx/QxkvS4+4UYmesyNvD3o0qqXqa6PMveOUsWVqvryh0abHwW6xWtYMVO/Zt
         bdjYZb5N397xKdYL9xcQ5oK+R9wSUXzjC2FfTdtc6blD7PgS9HajavDbM1Zd1qum77aA
         3viA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uG0wF9x5J31B5QovgpxzHE3VxGkFw0gZRlBKzlTkO48=;
        b=Ay5bu+DWXWomOGyrCBU1OwCxnc9JLZ0vZGZusCon/VTKDfaq46VBm6o0dIaAwdNLa9
         YH7YQpxHJtLAx6HoK0SypOycaon9hot5LmB5uV2tF9jBVeDwqVfuYv+uw64CxKG94z4z
         OMwAZO1NjkvJ0kPAHLAeHo6swfdKnk2HswOTVXitAUExLsBV8oI4GLHBcwbq2En50KWf
         TQg7iFN5VPtJT8SRO0pkZceu7oA4CT2xj3Gc3RxANqo0iRkpWztufO4aveFvtXA045Q6
         lBHciV/8+KbzRr6JekmtUWceQENEJu5QHzVUfQGIqOk+KaFy2pifQu3PNHXxtm/bk9FY
         LVOQ==
X-Gm-Message-State: AOAM530JILaJEeR/3ezlyuLapHSx+30qVcyFFYMVL7iL0GewZQjwKO74
        y+j/bt6r8FaTB7oGR/spol4=
X-Google-Smtp-Source: ABdhPJw8cOaLpHsBtUfzGgrnqy96pVFl4VAe2Ohcac5CSdlltqtHzTYmr9H+N5urC74YZaZx42jBCQ==
X-Received: by 2002:ac2:5c1a:: with SMTP id r26mr2323180lfp.344.1621814196277;
        Sun, 23 May 2021 16:56:36 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.gmail.com with ESMTPSA id h4sm1092987lfv.247.2021.05.23.16.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 16:56:36 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Ion Agorria <ion@agorria.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 6/7] ARM: multi_v7_defconfig: Enable CONFIG_TEGRA30_TSENSOR
Date:   Mon, 24 May 2021 02:56:19 +0300
Message-Id: <20210523235620.31538-7-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210523235620.31538-1-digetx@gmail.com>
References: <20210523235620.31538-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable NVIDIA Tegra30 SoC thermal sensor driver in multi_v7_defconfig.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 52a0400fdd92..fc346f87d7f9 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -523,6 +523,7 @@ CONFIG_BRCMSTB_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m
 CONFIG_ST_THERMAL_MEMMAP=y
 CONFIG_TEGRA_SOCTHERM=m
+CONFIG_TEGRA30_TSENSOR=m
 CONFIG_UNIPHIER_THERMAL=y
 CONFIG_DA9063_WATCHDOG=m
 CONFIG_XILINX_WATCHDOG=y
-- 
2.30.2

