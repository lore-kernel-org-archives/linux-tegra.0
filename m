Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B6BC43618
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 20:28:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A07E561139
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 20:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhEJU3S (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 16:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232305AbhEJU3R (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 16:29:17 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 171CBC061763;
        Mon, 10 May 2021 13:28:12 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i9so18746479lfe.13;
        Mon, 10 May 2021 13:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VthzfLnOcS1voIX7rvlZGQPkXf9UVyHeTP7Ir4OMTuU=;
        b=Aah2B2cxNpChpZvLpT/W8Hhl24iGAFZuqXGu5HBumfAV81rQtPcit14fXMaNd3703u
         56utdBv/5QmLvyRRy6nHfD+YSkchUaHj0ScUPHCZGvrpO7GfH4ibT5tcfm8gA3+cjZ/O
         FXbAHCOzQCJUDMXWqoHEGmFWu5izE8E5zAdw8/K1nKoPjXKtobtSRfHw34lKKp12LeZW
         W9UzB74cV9Ce0LchP9pEKVIBM5vIq1O3tc1GhUr3KJ0mDzYB7yVQUedGgVehn0FohTWn
         3r7v703mBk64MxlEPhaApyIWyHfJ+XIDtixb6Rj2veCmjN4qP1x4S+0Y9SsVcg5+bhLI
         Iulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VthzfLnOcS1voIX7rvlZGQPkXf9UVyHeTP7Ir4OMTuU=;
        b=Po4hxEZpD55yeKBMuCgqP6dfe/6V53u8t23+j/vSLfq+dZ9kD2gMtFM8WXlw5VpLKT
         kgJG00TSuBDOeLM+fx9AGlNwADqPKomJnsWjAMT4DKdMaKncGVu7JgnrT5tVfj8cqO+q
         b53a3mJJ3fJAhK/5vF5Q6qmxDNlkI7QDXnJk9BCtWcjSQxa+Bg5sJjokwCVan9mMfAk1
         AEHy2Q8xFDLEJdS36vM37OBrIL7JDIYK0O2bBpwXaXUBcHNzbtM9uiGnim+b11kvgv0a
         MNfuLJcAwOSczjxvSn7m8317UuRSpurahkfm8fLJuBQ7eYiog4DNOml6h7XG1mDZ61Tg
         02uQ==
X-Gm-Message-State: AOAM533v1fGMVPRomAQkefjo4EnANwzixiaw6BiHdIcmaEUfbfV2SK1U
        t7FrXWZLKz8DECbZo8vQykY=
X-Google-Smtp-Source: ABdhPJyZGmyI0lkpKbgU3c+esrFXfMQ3L785lmyDLHjEHHbT1lEjebks6vyO/KKp2kCSie2OgzFPYQ==
X-Received: by 2002:ac2:4ed9:: with SMTP id p25mr17663561lfr.576.1620678490666;
        Mon, 10 May 2021 13:28:10 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id z23sm2360662lfq.241.2021.05.10.13.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 13:28:10 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/10] ARM: tegra: nexus7: Correct 3v3 regulator GPIO of PM269 variant
Date:   Mon, 10 May 2021 23:26:00 +0300
Message-Id: <20210510202600.12156-11-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510202600.12156-1-digetx@gmail.com>
References: <20210510202600.12156-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The 3v3 regulator GPIO is GP6 and not GP7, which is the DDR regulator.
Both regulators are always-on, nevertheless the DT model needs to be
corrected, fix it.

Reported-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
index 06b5e8a5ce5d..9365ae607239 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
@@ -144,7 +144,7 @@ vdd_core: core-regulator@60 {
 	};
 
 	vdd_3v3_sys: regulator@1 {
-		gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
+		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
-- 
2.30.2

