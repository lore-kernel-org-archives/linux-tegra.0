Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B9BC001DC
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jul 2023 16:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjGZQaO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jul 2023 12:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjGZQaN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jul 2023 12:30:13 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D5F26A1;
        Wed, 26 Jul 2023 09:30:12 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99357737980so1116764266b.2;
        Wed, 26 Jul 2023 09:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690389010; x=1690993810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uMUeN6i0AZIyMwOpXe7L0Fie2E3ehqc4AeXRJFKbSCo=;
        b=jvVWT7f6q7gu4ON6FmOskAOKxKOH52airf9WH3efJKgmIIPzmBZM042AsQ86ji8Lkb
         aHufa8cyT09Vp/F1om7VMgxYlm48xDFgjfG1gy/WWNkZoP7psLVCeDfKoSApLirFSeY3
         MMkC4zX/PaP2jfTouyjSqUwQsxydZVzsaEIB0SyM+JLqzVgohy3itsoxQksAnDV8wG58
         EdMetSH6Uy06P7JgMyUctDR5x2zCiEEuH7j0MPtI1i3lXRpr7yanAXvHr/5xugmhAuBl
         8XIfA91L1oKoJ3rQUeJk+3LH+zKuQQK6j7wswEP6PkBesPEFYh2ASuA8AYohD3cuGz3V
         rtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690389010; x=1690993810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMUeN6i0AZIyMwOpXe7L0Fie2E3ehqc4AeXRJFKbSCo=;
        b=TWsmrhpLKPmDGw3qJRVlfi5+KudDRXnLxOaWRkV1nRIFjyLtBhMFClu9uL6L1Xhnfh
         2NRr27OZ7M4qVkxbEY+zT27bZXjGYq8A/Xfm1UhSoWklZSjGY/e5rbQghllyxWIN3xm9
         yNmtW88MBKSbXiCr4qNi0TNetqAx67LWZjtaZTJ2Rj22eR8Y5RVtcGtBUQ1CrlkH2UxL
         Iucv0mLnNMan2eg0R1QBhBdOgYLlzrB1BwASIHYzynPYnVQEL6eiXOUfCraEYsvTdM6Q
         AuLnASDinbc0aIMeOqtZRo8rvU3KAovGKoLQLEDuwTjb59MTi6i9bTRKjyCJXqSKDKNt
         D+zg==
X-Gm-Message-State: ABy/qLZXQp+YhtXJvddO4nwYywTqpM3hB1FJLVzYZBSbWQOxVoBoy2nj
        40W0IGSZ93jBwLFIFthocMBt3HKG4Hw=
X-Google-Smtp-Source: APBJJlGXNp6lbqwFjpwUXVMV9wq9OJO+K/ClISnoUjsC8SV3glD5iHG9cTmS46PqFSIkfIrlw+Sbfg==
X-Received: by 2002:a17:906:30d5:b0:98e:3b89:5dc6 with SMTP id b21-20020a17090630d500b0098e3b895dc6mr2232689ejb.48.1690389009587;
        Wed, 26 Jul 2023 09:30:09 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ks27-20020a170906f85b00b0097404f4a124sm9804152ejb.2.2023.07.26.09.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 09:30:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Marc Dietrich <marvin24@gmx.de>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] ARM: tegra: Reuse I2C3 for NVEC
Date:   Wed, 26 Jul 2023 18:30:08 +0200
Message-ID: <20230726163008.2129659-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Instead of duplicating the I2C3 node and adding NVEC specific
properties, reuse the I2C3 node, extend it with NVEC specific properties
and drop properties that are not needed by NVEC. This results in a DTB
that is a bit cleaner and avoids accidentally using I2C3 and NVEC which
would have them fight over the same hardware resources.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra20-paz00.dts | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
index 898b4ad3b427..afb922bd79a7 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
@@ -311,20 +311,19 @@ hdmi_ddc: i2c@7000c400 {
 		clock-frequency = <100000>;
 	};
 
-	nvec@7000c500 {
+	i2c@7000c500 {
 		compatible = "nvidia,nvec";
-		reg = <0x7000c500 0x100>;
-		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
+
+		/delete-property/ #address-cells;
+		/delete-property/ #size-cells;
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
+
 		clock-frequency = <80000>;
 		request-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
 		slave-addr = <138>;
-		clocks = <&tegra_car TEGRA20_CLK_I2C3>,
-			 <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
-		clock-names = "div-clk", "fast-clk";
-		resets = <&tegra_car 67>;
-		reset-names = "i2c";
+
+		status = "okay";
 	};
 
 	i2c@7000d000 {
-- 
2.41.0

