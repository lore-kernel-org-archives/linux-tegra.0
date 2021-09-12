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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5929C4332F
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Sep 2021 18:19:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADD7C61051
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Sep 2021 18:19:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235893AbhILSUo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Sep 2021 14:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235521AbhILSUk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Sep 2021 14:20:40 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9834FC061764;
        Sun, 12 Sep 2021 11:19:25 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id k4so16065967lfj.7;
        Sun, 12 Sep 2021 11:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HbaOAxGVAztZri1qSzD8HoQO2IqKS1yX08nrpK8PDQo=;
        b=mlUhiAYWkdFy4OAZOFysry4dlA6s+NKwSq3a34DOiJVKAN1tDJnh+dclkPYkK9rMA1
         S+IAhKeNmxgyxjrXYtPJ6vP+EJoOCwaVR8ahxP/qqxuXuTrCyaan0/s5fU1vphf5jq8Y
         gBWASwWGJlkkEarpSvN+Y2ii0qWeT5kU8Gm+MlH+nkZr6XAW0bqAgXWjgeMs00xWFr81
         NHQyjD0M87vU7t704E6MYEYukSJFuCU7ofktBPmVVMPUk6ru2ARzllBDqz9vXu9Sz/eL
         7BgbWZG3zawn03iJpeHHUWV143K8iCKbirG36sJQ+7fwdLo7Wy/QSr1TUvOEQCYbj0bn
         zckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HbaOAxGVAztZri1qSzD8HoQO2IqKS1yX08nrpK8PDQo=;
        b=gstU9Fh8iNweTT7RUHJvIZNvK2/UAOH78qDsfifqw9YSVvHR9+6NhuxUnpim8PMEYN
         DOwT/iVj8yHQyl/X/YGoy0xxZEo7oVlr2qYH6VJTLaB8jLcG95DODmYoos24ANaIhqbB
         Nabimdyu3h0akNuvWnKh2n664E/ftR2Ys+4UJNo41dFEyEK4u5XoAlgn9yTqUwi/gkGi
         ZA20hVEYuHjoGN/yiZlDskpQYbGB2TkAlM2Ojp49tscZIsmgkw8ZhxXJpieVNen3tgzL
         LwHEVKprfWinOupHmKl1FloPnsiyqiawFnqwWr0WrCZMLWfOsOV7pwFkd5lt9YGQsUbF
         5w2g==
X-Gm-Message-State: AOAM533IXqkfjsLedKIZMcEq9TnpdNn2bre36vBl9llp90nCXfSG4Q7E
        kb5d+u1EhgoKCaBtUYDQ49U=
X-Google-Smtp-Source: ABdhPJyavKdv3Upf9tYo3aYR93ollOEQW3Wp+R2Ulmb+RKGYvt7RIZLxXryC2BJJf7EvpSJvWucMYA==
X-Received: by 2002:a05:6512:1087:: with SMTP id j7mr5980123lfg.515.1631470763976;
        Sun, 12 Sep 2021 11:19:23 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.gmail.com with ESMTPSA id a18sm664556ljd.4.2021.09.12.11.19.23
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
Subject: [PATCH v7 7/7] arm64: tegra132: Add new properties to USB PHY device-tree node
Date:   Sun, 12 Sep 2021 21:17:18 +0300
Message-Id: <20210912181718.1328-8-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912181718.1328-1-digetx@gmail.com>
References: <20210912181718.1328-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add new properties to USB PHYs needed for enabling USB OTG mode.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index b0bcda8cc51f..5e1b9f28cc0e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -1123,6 +1123,7 @@ phy1: usb-phy@7d000000 {
 		compatible = "nvidia,tegra124-usb-phy", "nvidia,tegra30-usb-phy";
 		reg = <0x0 0x7d000000 0x0 0x4000>,
 		      <0x0 0x7d000000 0x0 0x4000>;
+		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
 		clocks = <&tegra_car TEGRA124_CLK_USBD>,
 			 <&tegra_car TEGRA124_CLK_PLL_U>,
@@ -1142,6 +1143,7 @@ phy1: usb-phy@7d000000 {
 		nvidia,hsdiscon-level = <5>;
 		nvidia,xcvr-hsslew = <12>;
 		nvidia,has-utmi-pad-registers;
+		nvidia,pmc = <&tegra_pmc 0>;
 		status = "disabled";
 	};
 
@@ -1162,6 +1164,7 @@ phy2: usb-phy@7d004000 {
 		compatible = "nvidia,tegra124-usb-phy", "nvidia,tegra30-usb-phy";
 		reg = <0x0 0x7d004000 0x0 0x4000>,
 		      <0x0 0x7d000000 0x0 0x4000>;
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
 		clocks = <&tegra_car TEGRA124_CLK_USB2>,
 			 <&tegra_car TEGRA124_CLK_PLL_U>,
@@ -1180,6 +1183,7 @@ phy2: usb-phy@7d004000 {
 		nvidia,hssquelch-level = <2>;
 		nvidia,hsdiscon-level = <5>;
 		nvidia,xcvr-hsslew = <12>;
+		nvidia,pmc = <&tegra_pmc 1>;
 		status = "disabled";
 	};
 
@@ -1200,6 +1204,7 @@ phy3: usb-phy@7d008000 {
 		compatible = "nvidia,tegra124-usb-phy", "nvidia,tegra30-usb-phy";
 		reg = <0x0 0x7d008000 0x0 0x4000>,
 		      <0x0 0x7d000000 0x0 0x4000>;
+		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
 		clocks = <&tegra_car TEGRA124_CLK_USB3>,
 			 <&tegra_car TEGRA124_CLK_PLL_U>,
@@ -1218,6 +1223,7 @@ phy3: usb-phy@7d008000 {
 		nvidia,hssquelch-level = <2>;
 		nvidia,hsdiscon-level = <5>;
 		nvidia,xcvr-hsslew = <12>;
+		nvidia,pmc = <&tegra_pmc 2>;
 		status = "disabled";
 	};
 
-- 
2.32.0

