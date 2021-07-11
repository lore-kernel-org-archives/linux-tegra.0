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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD00C07E9B
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:55:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C265B61057
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:55:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbhGKX6B (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232010AbhGKX57 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:57:59 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D4CC0613DD;
        Sun, 11 Jul 2021 16:55:12 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id z12so12588959qtj.3;
        Sun, 11 Jul 2021 16:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oyJAfedgOPc8tSH6ijYKS5lQLiUTrKGYK4pKkxiNy/k=;
        b=rISWGaCKhMAHW+gcj6ljrcbRRw5D7yRFooyvNV6Z6+ojyql+xh9p3vJvGn5NYRz612
         HkHknZX/ewxIwibKsIVG/OjMBkf7HcolaKPT/11kXejyj6gr8ImsrLLodESLG83jL6EU
         6TVTCge65SLTApx+y5F0WgJkAfNjdwYGXjmemV/Cyn1MyDX4E+gWHUKbYb7Z32Be8Yg7
         Pe8yAhJnIml7E34xxK5Z5nqAmwSuVM13PDdQApm/jpxDcUI/Htp2wSPvKWjXbtytZpIl
         Q1oUKoqH4kv2K+TBUvN8VWS77aJl9T52aEM/IdXAdy6Xs44rZVQLhYFE4zdWanoh0s2t
         rsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oyJAfedgOPc8tSH6ijYKS5lQLiUTrKGYK4pKkxiNy/k=;
        b=UO8VBiYYN3sJ0foTSU3y2IhVIr8nPmF3GhcwoBiKRYqegNXuzQmRmXDDG4yKk1nNu7
         3isuvqMN8831IQCdk7ngvruhJt6Zx6qOeMkYkWmK8nvWMng1Nl1w0HRGNcSEhpVZ94Ix
         vdGYBodKFq07he2iOl/C1pTLPX4P95Ul53yvYTL9+CcR8YRysnF3AunaeF44CajxBJym
         JYrnmYaehbvF4a3PC1OiXg3wiroift7dlRzH0r5nO0JB/WFCbrOagP0HAkaj/p3oZydC
         OOmLrhUmyOnsueF7iDa19XD5C/fAWOer8PMeDhs6cKtSy703TvtVR4QjHm1GgFfZ1f4e
         yiXA==
X-Gm-Message-State: AOAM531MwIIPWudGOwIMesMe9xNTvq+sFCKdKGvIT04S/uzzsRt2TUDM
        8sq8IOUKTHnulu0oucDK9+ZpUWdt9qM=
X-Google-Smtp-Source: ABdhPJwhMYbPzFg85Q8gLSW7Pi+J6za15ME7snKZqehqScJh0+lH/U0DTzNuzPl05kBLATDHPK8jlw==
X-Received: by 2002:a05:622a:486:: with SMTP id p6mr43696144qtx.163.1626047711324;
        Sun, 11 Jul 2021 16:55:11 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id h10sm4963133qta.74.2021.07.11.16.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:55:10 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/5] ARM: tegra_defconfig: Enable CONFIG_FB
Date:   Mon, 12 Jul 2021 02:54:32 +0300
Message-Id: <20210711235435.31165-3-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711235435.31165-1-digetx@gmail.com>
References: <20210711235435.31165-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Previously CONFIG_FB was auto-selected, now it's not. We completely lost
framebuffer in tegra_defconfig. Select the CONFIG_FB to fix it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 63e7f3261e6d..ced01b114cd3 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -209,6 +209,7 @@ CONFIG_DRM_LVDS_CODEC=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
+CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_LOGO=y
-- 
2.32.0

