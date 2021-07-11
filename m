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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B971C11F67
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04D5A61057
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbhGKXrd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231998AbhGKXr3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:47:29 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B42F8C0613DD;
        Sun, 11 Jul 2021 16:44:41 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id q190so16244714qkd.2;
        Sun, 11 Jul 2021 16:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8urCBMft39SinX6pTZXVMVPwus5YNF2nzxVXIu9iO4E=;
        b=qZxyYNRs842RGL7AiNI8Yfv4Z/FqTmdXsl2S079yDU8cDy6RVKSj//d1vwwTFy5tNa
         pFTrZ5Ndakgs2S1EOvTSaJE+9No58GK0H8Ay2WuwV75iyVLXZBsQnNlTA4AkM+olcdj2
         HaXzJu387lI+nPcWRHPy74jYM1oD2dN9mWspr0cYp+Ns4qrS8RLgdU2hS1lw7hy/5h2B
         kXLjYxYZexICa07suvlV84/EHNuGKf8m/h1/6GoH3H/iY73K0AtZXFdoG6h/Y2F+Lh5v
         v03akSUFzukEUZ3SWis3kKp/iYpdzYHBodT48HmDJz7Ib+kXydXHWiyO+l1G5LrRV1po
         FHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8urCBMft39SinX6pTZXVMVPwus5YNF2nzxVXIu9iO4E=;
        b=BqAOzMMUVub4uPHkzimsokkJPeukz0ubI5NXh04jnrbVOTAaVW/wp96ag+FrWW+5xp
         5B5IWGW899jrleQWtRPqrQBD1L6mGGxG2sejeJIUplT0BDMxNk4yJ1IxIRwJpJgMmsnl
         ymSd332mdeaD4bw5Ea0i3N4evgNkN5MgQeNJX1eJf3vBq5FFNSVZGgTmcpTfiQR/h5Ar
         xJdKHbSgkfZuoc2q+k1VOBFGFO4+qrvMU6ZWOGB979Qv+9OwRgkxffLdOmRhgy0MEr/N
         pNJ74aeaZGc9XpThds4HUyzxZaco7dGcBSsyVjSmEr5Y46XloVapddBKn/xDuHtkaZVe
         BHmg==
X-Gm-Message-State: AOAM533qiA7UJtTiIGSvCkFEUb2+kfQyggpu++0BBO74D64TNJy3DiQX
        fMy/r40HS0yHmr2NWQE5jtc=
X-Google-Smtp-Source: ABdhPJzUs5iz33dzqbE9HrwO20rQCeVU+vDnAXWc1OaiRm0yuszXCAquG7ZepHMylPncpaNl2eyagA==
X-Received: by 2002:a05:620a:29c8:: with SMTP id s8mr19888826qkp.99.1626047080909;
        Sun, 11 Jul 2021 16:44:40 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id e123sm2146507qkf.103.2021.07.11.16.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:44:40 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 04/13] ARM: tegra: nexus7: Add interrupt to temperature sensor node
Date:   Mon, 12 Jul 2021 02:43:54 +0300
Message-Id: <20210711234403.24691-5-digetx@gmail.com>
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
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index ae8300baa2d4..33985fca956f 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -920,6 +920,10 @@ nct72: temperature-sensor@4c {
 			compatible = "onnn,nct1008";
 			reg = <0x4c>;
 			vcc-supply = <&vdd_3v3_sys>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(S, 3) IRQ_TYPE_EDGE_FALLING>;
+
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.32.0

