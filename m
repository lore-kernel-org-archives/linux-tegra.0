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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8904AC07E96
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75AAF61055
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232540AbhGKXrm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232566AbhGKXrk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:47:40 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1812C0613E5;
        Sun, 11 Jul 2021 16:44:51 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id m68so774328qke.7;
        Sun, 11 Jul 2021 16:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6ZG/CfQ7+SyXq5/Fmh6AgcZxsemHZ1ybrnhIsEVAHzs=;
        b=HO/i9X/Vw82c5SZtb5P0cGGgwo2cwsdXBm5f0+DwmjFo72s6UkqGAh8PfmneB1+D6k
         gdAm1b9rgDU3dKxfVLLLaAl8K3xoMrEP4NRLi1XP6zVuPKK3FyLFEpqX1caDAxVKycNL
         oyEv9DrfdbgolgzhKGP1R6u9JdCOGTuz8IwH3Cuk3MIqk+QA3IJSdwgui0U9uFXKPKe5
         2NnJREmZQD+bMDAah6HnnM2TqJ99SXBH0Lyr3KlpS43A3+uvr7Jg9qr4YcadW+kXB8Mj
         SrEqkEaewU/qd83OJRme6Or/3k7NIFEUALX/qyAvZAVYCUsRy4lqE2lD7qa9bV+efA95
         u0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ZG/CfQ7+SyXq5/Fmh6AgcZxsemHZ1ybrnhIsEVAHzs=;
        b=O3jWHnxSdZI/cDmOnMgqLHFcptfkLV0fQGkphZsdKORBT03h3s8jEfYS4S8fnFErUP
         F8nZBGbfl5WZGSMQv43fyPTGBOuTgHvY0vyyt3yktIZiDLQW38b2s6i8jTLF81hTFupb
         hWdb2jko7RKZVMqUFcjPgKg+sPl3FquvpOAxHTuSFjmu4Tyr6Sg1qnAOPZ1p8aj5hT+i
         Uq8R7n/S9xaUHEeqbMqU4kkuydbc1NcT+5NtONl7TFbjepubE9GzCVL73AlGs+Ldahtm
         QMjbBWLHxpAnBTJMdy8hmWRcLFUVrG9LQf8xODorftAl94/wYI8sZ2dD5KkaHDhnTqFz
         OGbw==
X-Gm-Message-State: AOAM530EyogYRbEzL4mzyuGv9wv0RO5oaRdJYSIBXH5PyY3WBX4xeXJE
        Qw7cXNPcSJTGaSq/Yh7LvVo=
X-Google-Smtp-Source: ABdhPJwcqsRzJRxinOQA2PLpxDnRwgVyNTP2G+NklfeDJ93QydnSP4nuqVHkCkpm25sdmBa3yGCeJA==
X-Received: by 2002:a37:468b:: with SMTP id t133mr50614527qka.244.1626047091260;
        Sun, 11 Jul 2021 16:44:51 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id e123sm2146507qkf.103.2021.07.11.16.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:44:50 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 09/13] ARM: tegra: dalmore: Correct interrupt trigger type of temperature sensor
Date:   Mon, 12 Jul 2021 02:43:59 +0300
Message-Id: <20210711234403.24691-10-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711234403.24691-1-digetx@gmail.com>
References: <20210711234403.24691-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The LM90 temperature sensor should use edge-triggered interrupt because
LM90 hardware doesn't deassert interrupt line until temperature is back
to normal state, which results in interrupt storm. Correct the interrupt
trigger type.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index c04162ddec3c..7fd901f8d39a 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -788,7 +788,7 @@ temperature-sensor@4c {
 			reg = <0x4c>;
 			vcc-supply = <&palmas_ldo6_reg>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(O, 4) IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <TEGRA_GPIO(O, 4) IRQ_TYPE_EDGE_FALLING>;
 		};
 	};
 
-- 
2.32.0

