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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29EAC07E9E
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8A5261042
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbhGKXrh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbhGKXrf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:47:35 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC346C0613DD;
        Sun, 11 Jul 2021 16:44:47 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id s6so13370622qkc.8;
        Sun, 11 Jul 2021 16:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qGeXepf/KMG3yJmBmCJiEn21XsFabFobQrJDwifVJjA=;
        b=Kih3GOIoZrs5NCClvBOjQzoMvLrvNXI5MnbfxGUzPQ1LRL7vyC2KWcuJYWKXqde32V
         dr2JpOAH9+AFPciyfPecMUfYjM2x5P2AYC/C6pwSIRIwH0ezCmpnG3bRlP/rWiPD/CPw
         03dWMbvSg3LYHW5zDVWvTad8qNloW+HvaXWcvh388N0XQ4XimdeRs4U3R4rX/kSgep4A
         LoFHwx8v+xHAuXOabV5OoT8YsIGUk89lLKjQzgO3eTYP2zIw2H/LUCG4VHmDiZs43pjj
         vS81yowwdmqGCZcPeabNbQ8sZIYqyCTkU8fooFU3twNHcv4I9cKnN6ZQEH0fD/cxHXo9
         OWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qGeXepf/KMG3yJmBmCJiEn21XsFabFobQrJDwifVJjA=;
        b=l8gESMJdtsmle+EitCLAM4dm0eJmPi6Pfo/RgSHj7vnxOmPz5LuPX3OpOHa7nobQlF
         +svwVYpbwxAAuhoaawB9sY7IT0tD4tqmLRSeCdw8d8j7C9KN8mSMuCNf7wweZ7OY44t8
         9hFlJWCugfVb/jv5MJoGCBXu5YfZHI5p8ZFWL3GDnY+RYEHaUoj6p/hg5mZdOHSY6xPC
         Up0gvUk5akabwJ9Mh4smOIVj28Yrk7r6eeOQ/snUo9sMAH+BaabyiEGWK/eMS8fi/xJI
         wJEwHucf1IZjDFBl+jIjGJr0lWNG2dYrz/WMrDCy0e5zQp4Pp3B0NdsfATpUBulByyxH
         KaZA==
X-Gm-Message-State: AOAM531mEn1SmtBue6oUG71uroSUjonVYhOj9NE8RBzwu01w4EdWuOog
        Tzi4NdAZRdP53P4Xwy71cpI=
X-Google-Smtp-Source: ABdhPJxO3JKt+Zf6lNpwVkFlgcQ247uGXAM7JH834me5xHboBlDJbFY6X7FMAnEe9t53Q/jPKRrYIg==
X-Received: by 2002:a05:620a:64f:: with SMTP id a15mr32232549qka.28.1626047087146;
        Sun, 11 Jul 2021 16:44:47 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id e123sm2146507qkf.103.2021.07.11.16.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:44:46 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 07/13] ARM: tegra: apalis: Correct interrupt trigger type of temperature sensor
Date:   Mon, 12 Jul 2021 02:43:57 +0300
Message-Id: <20210711234403.24691-8-digetx@gmail.com>
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
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 1e30fa405fa0..cde9ae8fa04b 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1751,7 +1751,7 @@ temp-sensor@4c {
 			compatible = "ti,tmp451";
 			reg = <0x4c>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_EDGE_FALLING>;
 			#thermal-sensor-cells = <1>;
 			vcc-supply = <&reg_module_3v3>;
 		};
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 608896f8dd52..a46d9ba9bb7a 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1744,7 +1744,7 @@ temp-sensor@4c {
 			compatible = "ti,tmp451";
 			reg = <0x4c>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_EDGE_FALLING>;
 			#thermal-sensor-cells = <1>;
 			vcc-supply = <&reg_module_3v3>;
 		};
-- 
2.32.0

