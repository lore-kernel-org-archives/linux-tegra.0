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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41576C07E96
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3083361026
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbhGKXrd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232075AbhGKXrc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:47:32 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1024C0613DD;
        Sun, 11 Jul 2021 16:44:43 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id i125so16199001qke.12;
        Sun, 11 Jul 2021 16:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xvmc8l15hNbrvN9H2NXvXrPct8+V6BEf3jgtoVaM0OU=;
        b=XfCPEzI5BYNyI5SsdWxcQI3twWUAF1tE4LRMZ4xuThCYvmjCyO466cPmiMttASEm3T
         E0y1PCv24LWr42P39BSmkvNjJKm7SWMBiGISXg2D66CNU+K480ASIXIa8j0hOtOKgzcm
         1gjX6JB5yycf1V1A5eWd28kcNn4ebeJ1A+hEspqA/G3SBF5wJLrXMi6qW9Yn72YdYBml
         s5r+K2TMqCoo6h+J9YjqKWjgPsQnlfaaZ7XMQmeR04TL3k0oIbX0PgzK9t7MO3tWF1WO
         Kxntm1nbTs9w7IsFYnxx+ASTJutmuohxRWZoeHsPUWrUN35iPX+q+5BewXpG9/wDv24U
         vYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xvmc8l15hNbrvN9H2NXvXrPct8+V6BEf3jgtoVaM0OU=;
        b=a0BF8s4ikx8V1VqOy0huV1amCpxscXNaFdUk5mbt6GRGp/Cu2NUT0ejlv8eehnSC+9
         6Or5bbbjF3Im2N/erordGrc+ZWrgeJelH7MJF4inOjEa4j+WzYujSAx8S6lcG+N2+lMS
         Y7gmuTkS1vC80bWlbHAOnNmc3WEQYJvGR0s5rbXcCYkeEsJ/yICAFK0SdbremJCWt2p6
         EetwoZWw3jlBIWEqcZtxdBaowIjgKTsTuh94hPR8xdEGQJsIGfhiHJGe02mqTVSrIluT
         WZfMmvgZCSOYBcbU6qu/TgXHDYtWIffBCxwIoi1VIJ1pOEaVnPYO59awwWTKBqHl3IjH
         28Rw==
X-Gm-Message-State: AOAM530pm5tQZyYNM8NUvpitw/NYzglaXgiOO/2LLKhkcSxwJQyol7xP
        sdW2XifWEym1CE+JLJ/lq6s=
X-Google-Smtp-Source: ABdhPJw2xcvIqEIc1R2fpNIenbBxSLp+Y2fFdE29eF9XSFdRDr83QHLj1S99/bRlznUAWwVjd1D8dw==
X-Received: by 2002:a37:ab13:: with SMTP id u19mr14264460qke.397.1626047082975;
        Sun, 11 Jul 2021 16:44:42 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id e123sm2146507qkf.103.2021.07.11.16.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:44:42 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 05/13] ARM: tegra: acer-a500: Add interrupt to temperature sensor node
Date:   Mon, 12 Jul 2021 02:43:55 +0300
Message-Id: <20210711234403.24691-6-digetx@gmail.com>
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
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 1976c383912a..4897079680bd 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -693,6 +693,10 @@ nct1008: temperature-sensor@4c {
 			compatible = "onnn,nct1008";
 			reg = <0x4c>;
 			vcc-supply = <&vdd_3v3_sys>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(N, 6) IRQ_TYPE_EDGE_FALLING>;
+
 			#thermal-sensor-cells = <1>;
 		};
 	};
-- 
2.32.0

