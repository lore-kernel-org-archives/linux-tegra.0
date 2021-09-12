Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBE4C4321E
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Sep 2021 18:19:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A548560F9F
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Sep 2021 18:19:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235933AbhILSUp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Sep 2021 14:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235454AbhILSUj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Sep 2021 14:20:39 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2EC6C061760;
        Sun, 12 Sep 2021 11:19:24 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id f2so13001591ljn.1;
        Sun, 12 Sep 2021 11:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mhtGFKsHUzTaL2MCRyNEETLxWQghXk5mgR3qIkfiMRo=;
        b=ksHscgz7ojDYRwTbR5og8n3+wbF50rcqdWoq1MjSyV5vu71NqFoxdeGZwGBTMVe4qL
         /8SkzahPc02IV3oNwd6cTKRPCONeXobAg85R5s7N7yjiwPWDTqVq1F9Dit/V6/lgno3b
         usyCsdbbof2zP72dQfHeRbRrYi9dgMXcG+qNDnZSh4UU3DIr+Aeg7K0sOW9m7gi+KzFB
         lC/UPmCADn7pHB6xMTQzj758sREslXCrMDZw/ouRcC2/d/fzU7Ea2UxSHA5pneXX3HP/
         lcm1RaOajIfuu1eS6bSAf/8U43wqVEOC2yV8rjcM8Cxvcmo8azR435RM+6JEO0N5GJhs
         Z+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mhtGFKsHUzTaL2MCRyNEETLxWQghXk5mgR3qIkfiMRo=;
        b=IyB1ahrBRFvQoeRyHhOuYcdr53/+7lSGxPSMqdOqAwzqcEkAE87nGFJv6rFMNcuqLK
         bo+jXIgUOgFZPROpoEJZT5sjEBBY8ED4eFOuXKxlQHXkGIfDvE8SXwcJ9elfayg8zh2y
         sRjZ5CBRTnFgw98VSUWobPUzHE9OwQ+bWA4zkSsSPa0q2d3jfcIEXxOTIMOag/6bCfaw
         kjIE2c41EM9ChLloNUFx9gPjQXp1fpfzfUnMVGmUqfj8TY3eqoE9c2jJGu3dzbMIUMR5
         lCH+uX5on/yR2qmOVKwPreYs7eeqDORfXO+benmI/4d3bb3J8rTy/IOj5J7qFrimrmVy
         TVIQ==
X-Gm-Message-State: AOAM532UfW61mysmvInU5++kAY/HUzs3/kyiXxPUgUPMSkMiwNpATF7o
        VNYWRfUSzhc7kZTuCfQYkg0=
X-Google-Smtp-Source: ABdhPJxgPha0D9TVqi3cVPbyszBxSErxfU4fDAya8N1hrOOHfCGiH5IPB0f5Wk7QXWxWePJkKqIiXw==
X-Received: by 2002:a2e:5708:: with SMTP id l8mr7240238ljb.481.1631470763309;
        Sun, 12 Sep 2021 11:19:23 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.gmail.com with ESMTPSA id a18sm664556ljd.4.2021.09.12.11.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 11:19:23 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v7 6/7] ARM: tegra: nexus7: Enable USB OTG mode
Date:   Sun, 12 Sep 2021 21:17:17 +0300
Message-Id: <20210912181718.1328-7-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912181718.1328-1-digetx@gmail.com>
References: <20210912181718.1328-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Nexus 7 has OTG-cable microUSB port, enable OTG mode. USB peripheral
devices now can be connected to Nexus 7 using OTG adapter, switching
USB port into host mode.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 4f116c26f6ce..798ac22a50d2 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -941,9 +941,29 @@ power_supply: charger@6a {
 			interrupts = <TEGRA_GPIO(V, 1) IRQ_TYPE_EDGE_BOTH>;
 
 			summit,enable-charge-control = <SMB3XX_CHG_ENABLE_PIN_ACTIVE_LOW>;
+			summit,inok-polarity = <SMB3XX_SYSOK_INOK_ACTIVE_LOW>;
 			summit,enable-usb-charging;
 
 			monitored-battery = <&battery_cell>;
+
+			usb_vbus: usb-vbus {
+				regulator-name = "usb_vbus";
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5000000>;
+				regulator-min-microamp = <750000>;
+				regulator-max-microamp = <750000>;
+
+				/*
+				 * SMB347 INOK input pin is connected to PMIC's
+				 * ACOK output, which is fixed to ACTIVE_LOW as
+				 * long as battery voltage is in a good range.
+				 *
+				 * Active INOK disables SMB347 output, so polarity
+				 * needs to be toggled when we want to get the
+				 * output.
+				 */
+				summit,needs-inok-toggle;
+			};
 		};
 	};
 
@@ -1017,12 +1037,13 @@ sdmmc4: mmc@78000600 {
 	usb@7d000000 {
 		compatible = "nvidia,tegra30-udc";
 		status = "okay";
-		dr_mode = "peripheral";
+		dr_mode = "otg";
+		vbus-supply = <&usb_vbus>;
 	};
 
 	usb-phy@7d000000 {
 		status = "okay";
-		dr_mode = "peripheral";
+		dr_mode = "otg";
 		nvidia,hssync-start-delay = <0>;
 		nvidia,xcvr-lsfslew = <2>;
 		nvidia,xcvr-lsrslew = <2>;
-- 
2.32.0

