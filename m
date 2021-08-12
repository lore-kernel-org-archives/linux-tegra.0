Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30552C4338F
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 12:26:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FB9861038
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 12:26:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbhHLM07 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Aug 2021 08:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233613AbhHLM04 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Aug 2021 08:26:56 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D993DC061765;
        Thu, 12 Aug 2021 05:26:30 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id l34-20020a05600c1d22b02902573c214807so7004744wms.2;
        Thu, 12 Aug 2021 05:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0+EmnY4+1z7kfFUVMdVbVYV08tkcPwwbd8e7sst8c3Q=;
        b=jirXzJ8I9BdKYH3nq4S23MCdS8UdMOST882NEVCO/729Hm6rlDaBM0lKU/8pBEu8Mw
         Ea/zdfucXlBMD3zYrXnRTZ2yaQSNfYcJ0qu8dc3O3MIyvNG9QsW429ygEI1XJLzpuGRH
         EioMk+HmzrEzuOvhYTQlfwoqMgSiPGi/f4lvuanqouwa0jC9rxzwBvWKgZ12yErTxsrh
         KmE0M/FRnKKmWfkgwFh5gt84Hy6WUpdNpan7o92XMZagXBcmUK1U6U2Yfd1EgUJLMVcx
         HPFfgwN/7bDi/0zJ/fp0VSsU6jQWDmqAQFmpdXBgja95jpgxq8TDcXsJCXoZ3bGYamgr
         rQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0+EmnY4+1z7kfFUVMdVbVYV08tkcPwwbd8e7sst8c3Q=;
        b=sfBSTuevvSzdh9GJPObdX5zw6wzUyK44joE9xRYPJJJ74upBbzIwIwlII0WfUhxmvJ
         88k9yJdY2ctsFVUvkelaJ8Wlh6xdFmO/PgwdOuvgTb9NydKz2NaM5C0v+yelixYaJ3TA
         onf/FN+38gAoNy2JFJoObB2RoqEYMI+CCFLvBsSdM8op3Up1FIMBXkMfqgpqFg6CrHCE
         nZwY8ytABatwz1xb670RIgfePDnF38R3f/tlwlSov+i8rnOrq+vzoYLmQGuDmPRtKziX
         SZ0Pe5idpCNxDQ7co6YXU++4QPy6bxRlzfo0fMdjIi6xciwLgWb4YQsJYOVbiip1V2Ne
         oMDQ==
X-Gm-Message-State: AOAM530w3bAgkvBW5UbhfU46kvd447/kg/SDIdxBIAemqpZPaNejetzd
        5RqTW8wqMDTD41GsnUJacrI=
X-Google-Smtp-Source: ABdhPJzVRGyrnv5M50eSJSXWj/CQHqM9HS/rufUyCvZz3HNlDC8aXJjVEfOHjtLpf+KQMmoOp5z26w==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr15330876wmi.177.1628771189350;
        Thu, 12 Aug 2021 05:26:29 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id k17sm1431608wrn.8.2021.08.12.05.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 05:26:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] arm64: tegra: Add PWM nodes on Tegra186
Date:   Thu, 12 Aug 2021 14:26:16 +0200
Message-Id: <20210812122617.2378605-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210812122617.2378605-1-thierry.reding@gmail.com>
References: <20210812122617.2378605-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

These PWMs can be used for fan or LED backlight control. Add the device
tree nodes for all existing controllers found on Tegra186 SoCs. None of
these are enabled by default, which is left for the board DTS files to
do when necessary.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 88 ++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 5c45fab0c9ab..cce3db252ea5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -548,6 +548,83 @@ gen9_i2c: i2c@31e0000 {
 		status = "disabled";
 	};
 
+	pwm1: pwm@3280000 {
+		compatible = "nvidia,tegra186-pwm";
+		reg = <0x0 0x3280000 0x0 0x10000>;
+		clocks = <&bpmp TEGRA186_CLK_PWM1>;
+		clock-names = "pwm";
+		resets = <&bpmp TEGRA186_RESET_PWM1>;
+		reset-names = "pwm";
+		status = "disabled";
+		#pwm-cells = <2>;
+	};
+
+	pwm2: pwm@3290000 {
+		compatible = "nvidia,tegra186-pwm";
+		reg = <0x0 0x3290000 0x0 0x10000>;
+		clocks = <&bpmp TEGRA186_CLK_PWM2>;
+		clock-names = "pwm";
+		resets = <&bpmp TEGRA186_RESET_PWM2>;
+		reset-names = "pwm";
+		status = "disabled";
+		#pwm-cells = <2>;
+	};
+
+	pwm3: pwm@32a0000 {
+		compatible = "nvidia,tegra186-pwm";
+		reg = <0x0 0x32a0000 0x0 0x10000>;
+		clocks = <&bpmp TEGRA186_CLK_PWM3>;
+		clock-names = "pwm";
+		resets = <&bpmp TEGRA186_RESET_PWM3>;
+		reset-names = "pwm";
+		status = "disabled";
+		#pwm-cells = <2>;
+	};
+
+	pwm5: pwm@32c0000 {
+		compatible = "nvidia,tegra186-pwm";
+		reg = <0x0 0x32c0000 0x0 0x10000>;
+		clocks = <&bpmp TEGRA186_CLK_PWM5>;
+		clock-names = "pwm";
+		resets = <&bpmp TEGRA186_RESET_PWM5>;
+		reset-names = "pwm";
+		status = "disabled";
+		#pwm-cells = <2>;
+	};
+
+	pwm6: pwm@32d0000 {
+		compatible = "nvidia,tegra186-pwm";
+		reg = <0x0 0x32d0000 0x0 0x10000>;
+		clocks = <&bpmp TEGRA186_CLK_PWM6>;
+		clock-names = "pwm";
+		resets = <&bpmp TEGRA186_RESET_PWM6>;
+		reset-names = "pwm";
+		status = "disabled";
+		#pwm-cells = <2>;
+	};
+
+	pwm7: pwm@32e0000 {
+		compatible = "nvidia,tegra186-pwm";
+		reg = <0x0 0x32e0000 0x0 0x10000>;
+		clocks = <&bpmp TEGRA186_CLK_PWM7>;
+		clock-names = "pwm";
+		resets = <&bpmp TEGRA186_RESET_PWM7>;
+		reset-names = "pwm";
+		status = "disabled";
+		#pwm-cells = <2>;
+	};
+
+	pwm8: pwm@32f0000 {
+		compatible = "nvidia,tegra186-pwm";
+		reg = <0x0 0x32f0000 0x0 0x10000>;
+		clocks = <&bpmp TEGRA186_CLK_PWM8>;
+		clock-names = "pwm";
+		resets = <&bpmp TEGRA186_RESET_PWM8>;
+		reset-names = "pwm";
+		status = "disabled";
+		#pwm-cells = <2>;
+	};
+
 	sdmmc1: mmc@3400000 {
 		compatible = "nvidia,tegra186-sdhci";
 		reg = <0x0 0x03400000 0x0 0x10000>;
@@ -947,6 +1024,17 @@ gpio_aon: gpio@c2f0000 {
 		#interrupt-cells = <2>;
 	};
 
+	pwm4: pwm@c340000 {
+		compatible = "nvidia,tegra186-pwm";
+		reg = <0x0 0xc340000 0x0 0x10000>;
+		clocks = <&bpmp TEGRA186_CLK_PWM4>;
+		clock-names = "pwm";
+		resets = <&bpmp TEGRA186_RESET_PWM4>;
+		reset-names = "pwm";
+		status = "disabled";
+		#pwm-cells = <2>;
+	};
+
 	pmc: pmc@c360000 {
 		compatible = "nvidia,tegra186-pmc";
 		reg = <0 0x0c360000 0 0x10000>,
-- 
2.32.0

