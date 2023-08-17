Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320BCC41513
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Aug 2023 14:14:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351770AbjHQOOX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Aug 2023 10:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351859AbjHQOOR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Aug 2023 10:14:17 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1AD19A1
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 07:14:16 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99357737980so1027200666b.2
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 07:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692281654; x=1692886454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvC17pQ0MckM4cMoMks+jYN8SAjVrF0smMZ9co8N6Y8=;
        b=GwhqqYUx/AERcfNsemuOWjspXWM7xEjBIOcrdUaqiu+/Vz/fNbTZMMb3pm5vSt70Eo
         U2AgZbpGQKKcQiNwdSk25uoMYp1Sv7lDjWbNup5V2Re3z0wXhVFcV3Gx5Oo1ZK+Tw4bj
         E8uiTALATumnUctLQjxTSI0w4eZlpdN2j0F1+aK6pUvlXwvj7fSS9MpnAfFsDYWhkYzZ
         ZwKzulXRAxZOxoQJX0zfgTfF+nYLa9KO8o6B2T/JhEhiwBietzvIUn/xSiojbwtJJNZ3
         7NgLAkRHDzx4fC0rNBbWs5LxQx5D2xiai7nrO9/p4oFirJ1G/GAfbH5CqoO8uCZztiQB
         rH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692281654; x=1692886454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvC17pQ0MckM4cMoMks+jYN8SAjVrF0smMZ9co8N6Y8=;
        b=GiKuvB4QypuBkbzK6G7iJuqFUWsw/p1RCaRd2cLb8Xrk+h7uYgk4wT/G6850ziFbYD
         ya632uWbhc08EaGm5X3SHcCTamqJM1BdD/AAR+NrG4HO328fYxfYq1v3XfRF28NEVkbc
         Sqo+wj+QmivEvGR7+McggXNCciCjG53c/7awaA2pclzn1OnJrlu1Fm6yVa+/gZbCw/V0
         FC76sxVRXRARBgmhRTWo9HakyKOl2Ksr0nItW+VPd2O477p0VJfluziZfxNqP9D8xY8m
         pSOu4fSj3yPC+lmd8DgRQxZgEyRGkrpE42CI0SS62fbrE0/bbAMbwiCw2t7j5WYjPGlf
         mcxQ==
X-Gm-Message-State: AOJu0YwRFnpOYO+2FlpmuZxrjvr9Zr0oHLs6sM61Zugd9abPzBUwmnBH
        RCSk3nlepmy/FwLIVhSxkp4=
X-Google-Smtp-Source: AGHT+IEyCyhvxcIaxCfSIVeJDQ5+DigBuFF1119wULL4b2jKQcGcuaU6E7OpCxVjMl6fi4OkwfFV2g==
X-Received: by 2002:a17:907:7613:b0:994:555a:e49f with SMTP id jx19-20020a170907761300b00994555ae49fmr5346827ejc.31.1692281654322;
        Thu, 17 Aug 2023 07:14:14 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id kk16-20020a170907767000b00997e99a662bsm10100276ejc.20.2023.08.17.07.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:14:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/5] arm64: tegra: Remove duplicate nodes on Jetson Orin NX
Date:   Thu, 17 Aug 2023 16:14:04 +0200
Message-ID: <20230817141407.3678613-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817141407.3678613-1-thierry.reding@gmail.com>
References: <20230817141407.3678613-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The SBSA UART and TCU as well as the TCU alias and the stdout-path are
configured via the P3768 carrier board DTS include, so the can be
removed from the system DTS file.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts     | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
index 3b7cd0e2af21..c923b865a69f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
@@ -24,14 +24,11 @@ fb: framebuffer@0 {
 	};
 
 	aliases {
-		serial0 = &tcu;
 		serial1 = &uarta;
 		serial2 = &uarte;
 	};
 
 	chosen {
-		stdout-path = "serial0:115200n8";
-
 		framebuffer {
 			compatible = "simple-framebuffer";
 			status = "disabled";
@@ -126,10 +123,6 @@ serial@3140000 {
 			status = "okay";
 		};
 
-		serial@31d0000 {
-			status = "okay";
-		};
-
 		pwm@32a0000 {
 			assigned-clocks = <&bpmp TEGRA234_CLK_PWM3>;
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
@@ -186,10 +179,6 @@ vdd_3v3_pcie: regulator-vdd-3v3-pcie {
 		enable-active-high;
 	};
 
-	serial {
-		status = "okay";
-	};
-
 	thermal-zones {
 		tj-thermal {
 			cooling-maps {
-- 
2.41.0

