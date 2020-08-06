Return-Path: <SRS0=WNzV=BQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50677C433E0
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:08:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A706E23119
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:08:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVZIj/DU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729291AbgHFRIp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Aug 2020 13:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730055AbgHFRGW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 13:06:22 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763B7C00859C
        for <linux-tegra@vger.kernel.org>; Thu,  6 Aug 2020 08:41:16 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a26so25027453ejc.2
        for <linux-tegra@vger.kernel.org>; Thu, 06 Aug 2020 08:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U9JFUlne6UShAIBq+wr4Ss8u4VT71HCKJztGyBLDXlg=;
        b=OVZIj/DUfpgTyO862vHyEBW8kjHpaT9Qlj8c8iQzpI7DtxZNyAT4plE0daDybYXCRw
         F6ZOmszoCafv8KRqdXZuImtAYCPO92S0wvMvcHdfPheB3RcsiU13Z1jrBeQwPLLYecdP
         /fsLIK8xN1Sl1ZiUCogPVOXo7xyHcqmI1borOQ0o/IVRH8pCZfIcJffGoPST0TduCpUQ
         7kFR8MkJclTg5AN1cFxITtTuZPWhUQ61ps475kygGzjf8sqWNB3kqWVuldhB3es44UU0
         fGYpXrn6hkclZP/CZLWmsQhKhvdeIE92im0NufCVSwqSHTIDYz5znpdkFZfet5OL8HQ5
         zMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U9JFUlne6UShAIBq+wr4Ss8u4VT71HCKJztGyBLDXlg=;
        b=VJKtkEU17KPGFqFWf6YHXwZxN3OiXhgPw4YwiwtSCVrPynic2L6SvXb0afJQIrdD+v
         eValASVCXYcQbRFUFb0LGDnZgyZVJshGzHafEKKcXTbVcJK0W4BjKmagx47xC5fW3OYo
         QmN0s49+axKEpJQKvJLyYkaNcTCDXpic2ulaT6YoBQ3Z/N0o75Yiih8qBfXRE2tm5jBU
         ld6SsXKUeKZCe3YSgfelv+NG78BCUmnGL9f1mxwjoPmqTqE+/s/14qV39cWr1Afh/CJT
         7ke0w/SOR7aCaKUeWULxt1dkhtiBjUaV2lXOMRg4hiCTiOoYnZfudSYfp13oxRiBztYq
         bQJQ==
X-Gm-Message-State: AOAM532Mw60mCkkprngbnJqUCd3zzxv9hEyQQibnnmUyjdT/s35d+5BT
        1e3XVr6wuUeFwRjnKHTYbpw=
X-Google-Smtp-Source: ABdhPJxeyVSz8XkU8s1bmhltAitpfa+ugqEMRMNH0+PTeopDwYxgbZabfXsHoELyfyWbIJUiMpX2pg==
X-Received: by 2002:a17:906:743:: with SMTP id z3mr4890114ejb.216.1596728473779;
        Thu, 06 Aug 2020 08:41:13 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n5sm4022637eja.105.2020.08.06.08.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 08:41:12 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 1/4] arm64: tegra: Wire up pinctrl states for all DPAUX controllers
Date:   Thu,  6 Aug 2020 17:41:08 +0200
Message-Id: <20200806154111.3917284-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

All four DPAUX controllers on Tegra194 control the pin configuration of
their companion I2C controllers. Wire up all the pinctrl states for the
I2C controllers so that their pins can be correctly muxed when needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 1ddf9cb6dbce..94c65ca8345a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -346,6 +346,9 @@ dp_aux_ch1_i2c: i2c@3190000 {
 			clock-names = "div-clk";
 			resets = <&bpmp TEGRA194_RESET_I2C4>;
 			reset-names = "i2c";
+			pinctrl-0 = <&state_dpaux1_i2c>;
+			pinctrl-1 = <&state_dpaux1_off>;
+			pinctrl-names = "i2c", "off";
 			status = "disabled";
 		};
 
@@ -360,10 +363,14 @@ dp_aux_ch0_i2c: i2c@31b0000 {
 			clock-names = "div-clk";
 			resets = <&bpmp TEGRA194_RESET_I2C6>;
 			reset-names = "i2c";
+			pinctrl-0 = <&state_dpaux0_i2c>;
+			pinctrl-1 = <&state_dpaux0_off>;
+			pinctrl-names = "i2c", "off";
 			status = "disabled";
 		};
 
-		gen7_i2c: i2c@31c0000 {
+		/* shares pads with dpaux2 */
+		dp_aux_ch2_i2c: i2c@31c0000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0x031c0000 0x10000>;
 			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
@@ -373,10 +380,14 @@ gen7_i2c: i2c@31c0000 {
 			clock-names = "div-clk";
 			resets = <&bpmp TEGRA194_RESET_I2C7>;
 			reset-names = "i2c";
+			pinctrl-0 = <&state_dpaux2_i2c>;
+			pinctrl-1 = <&state_dpaux2_off>;
+			pinctrl-names = "i2c", "off";
 			status = "disabled";
 		};
 
-		gen9_i2c: i2c@31e0000 {
+		/* shares pads with dpaux3 */
+		dp_aux_ch3_i2c: i2c@31e0000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0x031e0000 0x10000>;
 			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
@@ -386,6 +397,9 @@ gen9_i2c: i2c@31e0000 {
 			clock-names = "div-clk";
 			resets = <&bpmp TEGRA194_RESET_I2C9>;
 			reset-names = "i2c";
+			pinctrl-0 = <&state_dpaux3_i2c>;
+			pinctrl-1 = <&state_dpaux3_off>;
+			pinctrl-names = "i2c", "off";
 			status = "disabled";
 		};
 
-- 
2.27.0

