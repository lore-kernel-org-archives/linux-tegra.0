Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2359EC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243088AbhLIRiS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhLIRiR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:17 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D32A2C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:43 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id o19-20020a1c7513000000b0033a93202467so4690794wmc.2
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AJIUYNjPeuEpslfdDolr3yJpzKIrJm3+liUZcjwSiY4=;
        b=Lqo8lEiYPs9ZwMDsq356W+r1jrkgRRr+FUKJSq/azr9x04ycop2jxM/4y1Jp5qhslm
         l6lEDYqCcDtZ9nOSkIXTdNqPpAcYnApY+K09ybmUXBRAhCFEPoPSsQcsUhh7yvwGnYVf
         y1qcdYS+j8UHorc9NNbcW+121d6vMvoCTqimZWQgaZb16EBraiMUW0XyICcm4so1mAyT
         +vNOPxDjlvZRb43xKl+Tamo4f9PfdYlMI9bIKfvSlNFzQIjXOb3zc6szrYYRWHEhoxyB
         b87PhbBFhKIvM/F3n8wtqgsVVITbjIBv9L0rA0ow6wDWlbobkNugI3xMpi8lr6Z4F9qM
         vPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AJIUYNjPeuEpslfdDolr3yJpzKIrJm3+liUZcjwSiY4=;
        b=mgHSX0wgJ4yT7g5/0IGC0p5NZYdFknVUm4UK0VAMZrEXNtNUykuiAKYTOcO4xkITA7
         mhnKKsIjqh3vJF7EQF8R3Mr1/BxAJmU9vZCNwH/U5xGLCEuBUytiYSh0vd9p9W7nqj+o
         WRNMtx5IpL1TnyFKPvhQphVCrPwa0C/wpGskdOhaK/aOa9zZbvCOUUNdXvhaVXWk8Bam
         rWA3+tbeP5Ot0MEesdooTrNVIYIq0jVUKcDjuoXpzHLpNXytAc5LUYO9w8pIfLau14Ab
         qDKuKGQf+6eaxgYukTz0+h8j1Rh6bu6U2aCd0gHv/5k6uYSIZ+dHtaX4pfE0h8byoDRE
         1D6w==
X-Gm-Message-State: AOAM531vzDEdmyk5F5P9DQwAp3YLxTp20Wa6fkXvnY3VL7V6AiAILJ61
        mpB56MXtQtXLdE8FEODsexU6ntqjCeLq5w==
X-Google-Smtp-Source: ABdhPJxL2yHQ/fwAlTI2v9SQke4lxVhRMZy3jQiF+iiAhVaUBjR8S/IyKV1v3RPO0RlDMT/HjiPCDg==
X-Received: by 2002:a05:600c:4e51:: with SMTP id e17mr8901508wmq.127.1639071282379;
        Thu, 09 Dec 2021 09:34:42 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id o9sm319404wrs.4.2021.12.09.09.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:41 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 16/25] ARM: tegra: Avoid pwm- prefix in pinmux nodes
Date:   Thu,  9 Dec 2021 18:33:47 +0100
Message-Id: <20211209173356.618460-17-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The "pwm-" prefix currently matches the DT schema for PWM controllers
and throws an error in that case. This is something that should be fixed
in the PWM DT schema, but in this case we can also preempt any such
conflict by naming the nodes after the pins like we do for many others
of these nodes.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts | 4 ++--
 arch/arm/boot/dts/tegra20-colibri-iris.dts    | 4 ++--
 arch/arm/boot/dts/tegra20-colibri.dtsi        | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
index a05fb3853da8..d2a3bf9d28bd 100644
--- a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
@@ -70,11 +70,11 @@ mmccd {
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
-			pwm-a-b {
+			sdc {
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
-			pwm-c-d {
+			sdb_sdd {
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index 425494b9ed54..00ecbbd5e9e1 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -70,11 +70,11 @@ mmccd {
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
-			pwm-a-b {
+			sdc {
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
-			pwm-c-d {
+			sdb_sdd {
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 80e439003a6d..2350fda3be6a 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -113,7 +113,7 @@ bl-on {
 			};
 
 			/* Colibri Backlight PWM<A>, PWM<B> */
-			pwm-a-b {
+			sdc {
 				nvidia,pins = "sdc";
 				nvidia,function = "pwm";
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
@@ -242,7 +242,7 @@ cif {
 			};
 
 			/* Colibri PWM<C>, PWM<D> */
-			pwm-c-d {
+			sdb_sdd {
 				nvidia,pins = "sdb", "sdd";
 				nvidia,function = "pwm";
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-- 
2.34.1

