Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF29C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237418AbhLIRif (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhLIRie (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:34 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB7CC0617A1
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:35:01 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id q3so10981309wru.5
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HdS+aHtpowx/tX9ufq07E04i2WBThsjsPDg43b+XIx8=;
        b=GSYRO+2jX685WQFl2LJCNUhNrKghaAE8yjESki/6BPCGDSy2dWXbeld+maeeE8J4pf
         zbgLCdB2iys+je4I4pDbum1pcKRWxjsIzLtQqLGNkMNcx64ul9X7r8r2u5daGZkxkLkb
         fs1iAFGVcNhLKPgLAnogfrryLBLYUKIDNoreLp6CqjXraO5g7DoMkQQHw4JFd/QikUjn
         6Ktj9cwDE4lFL3JJXfZ96wn8FisQJmmGhIILMYRWPdAdP3QH5NWdg07E6gFj9mzPiWxc
         UTgatGkX/tqxqu3lwLI9AZAnXmgihspoPSQopRzZZNqBzo16eJpDXIjF35M3dtz0TTNB
         Yq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HdS+aHtpowx/tX9ufq07E04i2WBThsjsPDg43b+XIx8=;
        b=wu3jdpQBIUzoUJLTBwEcSDqIinYGLRlVFRjwSdajvPZAC9MikSmdo/zlofDiorOfKM
         yRoMBdNl0WfqO6tMHjVT2vO8M+g7KCTVIKqqlBJkmx7xaflIgBvfkSf4v65+1Nng/0Q6
         RMi5wCHw3INVDdCPfTDFxzCjb0v8vHc/t/OxxsYdLndILBZSiwdMWbzJ72wZsjaeX16v
         YqaNJ4YaQbFvIyWfO36Paisu6CyyJwqpn6y2YkBhRpAP0LONlemk0k13gOGR7DiLpZvl
         1AY8R2IrwKuMMAUnpVgZxRE4yxivJG+7lxgMeehGzqy6F9rEhCofGRIcCBi1uRJN7w7F
         P3mw==
X-Gm-Message-State: AOAM531eGpT7HKaDsYbCiJtQFK7zlpLpyiRpi1aEgl5jb4//1NuIRhfw
        jC0AZ9CRG5WrNPN4AQj6Z/Y=
X-Google-Smtp-Source: ABdhPJzPUggygPssTvjzi9fsn/y/rxm/gHYa2BTiyc8LV0xN4+5RPeEeRYS5WEUWc4key84i09RsXw==
X-Received: by 2002:a5d:584c:: with SMTP id i12mr7929671wrf.95.1639071299709;
        Thu, 09 Dec 2021 09:34:59 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id d8sm293586wrm.76.2021.12.09.09.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:58 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 22/25] ARM: tegra: Move I2C clock frequency to bus nodes
Date:   Thu,  9 Dec 2021 18:33:53 +0100
Message-Id: <20211209173356.618460-23-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The "clock-frequency" property for an I2C controller needs to be
specified at the bus level.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi | 3 ++-
 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi
index a044dbd200a9..d5f28e424244 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi
@@ -134,10 +134,11 @@ gmi_cs6_n_pi3 {
 	};
 
 	i2c@7000c500 {
+		clock-frequency = <100000>;
+
 		nfc@28 {
 			compatible = "nxp,pn544-i2c";
 			reg = <0x28>;
-			clock-frequency = <100000>;
 
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(X, 0) IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi
index a681ad51fddd..713bb2c36fcc 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi
@@ -197,6 +197,8 @@ gmi_cs6_n_pi3 {
 	};
 
 	i2c@7000c500 {
+		clock-frequency = <100000>;
+
 		proximity-sensor@28 {
 			compatible = "microchip,cap1106";
 			reg = <0x28>;
@@ -223,8 +225,6 @@ nfc@2a {
 			compatible = "nxp,pn544-i2c";
 			reg = <0x2a>;
 
-			clock-frequency = <100000>;
-
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(S, 7) IRQ_TYPE_EDGE_RISING>;
 
-- 
2.34.1

