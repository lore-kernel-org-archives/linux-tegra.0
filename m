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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4E2C11F66
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2232C61055
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbhGKXrb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbhGKXr2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:47:28 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 941D0C0613DD;
        Sun, 11 Jul 2021 16:44:39 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id 9so16237118qkf.3;
        Sun, 11 Jul 2021 16:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3aEiiLuv1WM/3EAtaGD2DM/Ln5cq0U6ILaZtYQuvvB8=;
        b=L5UKexU3BWudyzMtDyMcftq7e59Yo6K2WboRkkIKoerhbyABJPcvV2AU26Rz50Vo1W
         S5+jDZlUYKzprG1qU/u7qv+dJTPY0+IUhButZGNieuph9AaGxzdtJQAAXdTkY+zSHqVn
         Gq4899fGV+DEyVDpUCgrMxwdZci53tezDdWofB7QdpOMCJnvJFZtXO13NQZsWoAxNlGu
         GRP3fG4rDLqLbu0LowMlncg+iCiTajpa2y3txCDRqkccqkLJlutqMuHwaURIMRQVOcv0
         tQteDvM7Nj8WwQXS4icMIR8EyNf/Awd72WFiBOO3jC264ZFfdYsMiLcvl6WhzA5ySWRT
         +J/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3aEiiLuv1WM/3EAtaGD2DM/Ln5cq0U6ILaZtYQuvvB8=;
        b=bwe8l5xl6Q1pekZ7aqe4ZMbmCWl8tk5BBh1nifv6XOb4xpVJMQP1J5Vk82IBtSFwDa
         Zr9gK+PhP6NmdGRrgiCCabxYpogNDBBE2xFpxPpjeyrfyOas52+SkcxMBA5OHLobtjza
         hV/YTM/hTA6ALQpQ69lQUuYdqJev496pGCsj0rkBv8DuomMj4syL5hZcUtTtrpeTw+/6
         c8M9565myOvjSc6cdWGPs/XVWu2pwCQ4AWw1bGKnE8gg/Me59rvFwFipx+W77Gmg4bI7
         5puIotDTWmA7HsejdnMKX/xhyC+Sk4yx8Za2I7Qa119a7folxAIMu7YcHz631fVtiOYr
         1GhA==
X-Gm-Message-State: AOAM531WMfZrT+DEDo3wydJfgYcOwR6Ama2d8QNJL9spW5NZHwr+qXiK
        rwiFsrA4OEdZ1eAWrL7mawQ=
X-Google-Smtp-Source: ABdhPJzyMMImQnf6KV8C99P2b69aWM47259JmeCDByCWTitrUFNhjYXpuRtOD6FRGG+hBc57NMgysg==
X-Received: by 2002:a37:b42:: with SMTP id 63mr50948051qkl.325.1626047078835;
        Sun, 11 Jul 2021 16:44:38 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id e123sm2146507qkf.103.2021.07.11.16.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:44:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 03/13] ARM: tegra: paz00: Add interrupt to temperature sensor node
Date:   Mon, 12 Jul 2021 02:43:53 +0300
Message-Id: <20210711234403.24691-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711234403.24691-1-digetx@gmail.com>
References: <20210711234403.24691-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The TEMP_ALERT pin of LM90 temperature sensor is connected to Tegra SoC.
Add interrupt property to the temperature sensor for completeness.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 3180bff90756..acc816bfd233 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -503,6 +503,10 @@ ldo_rtc {
 		adt7461: temperature-sensor@4c {
 			compatible = "adi,adt7461";
 			reg = <0x4c>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(N, 6) IRQ_TYPE_EDGE_FALLING>;
+
 			#thermal-sensor-cells = <1>;
 		};
 	};
-- 
2.32.0

