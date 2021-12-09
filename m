Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96268C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243074AbhLIRhp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:37:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237367AbhLIRho (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:37:44 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED652C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:10 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 137so4821363wma.1
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rGEh8VVHgWzWZAbzr7aP9gEQLHRnSNsnCj/2tRQ8Yws=;
        b=hJY+xG481nRhTR8+DzX58Mqv6gBaIgjhuuZ/21jyMYEFTMBn1YPrFK8orKUjmyQsA1
         HTEFHrUrVVdRuug6KiYMBxJg5hp23JPPm7BZ0nLHOb7Ahf8TMmPI2O5weDZHHpzdR99b
         +MA3qyvgIuSW5vVrt2zZhZEKZcQcTiIhsyHzZuNXi9KQ7VCUp5dMsIurxPQQdk5XTIHK
         up/xUyjW3Y9YHCRBbbsVkZuaK9PFzryQXQo77jMc2A+Kl7+GnCqg44N5v9QAKm1JxiCf
         +U1YXuvmVj5OrYB86uNskUnWqSn4YUzheB5WlnyU77+Yhycr7EWEbUPo47EOy2od4eTI
         IG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rGEh8VVHgWzWZAbzr7aP9gEQLHRnSNsnCj/2tRQ8Yws=;
        b=YAE45UwL2pc6NA8zqdb0GB+e6fSav87tXg0JdPAdWKQNV4ozvLTPWkUVEN550p2eKN
         Es6bhF9/dltjlakCJQ+TypuLQMNL4bgC/EO09T3U+2G+24xb6m4BGA8bSO3mY6eUplUM
         VQ/rJaobaqq7BQxXEKZLqCS+tAH5iAcM8rT00sIwbeBKEFykcviihGvycNSZA0clEhmq
         66Mw9xzo0sZ8sT2efQs4kUR7qkAy4JmHd5w7QTYQX2Yqo/fIdHF4zLgaXzNCYUFbnzoA
         obl6UVdOziNHMhAjj9g0s6skp90VaY00jM3LCZkhZVMCZ7Yb9Jk2GThFHLqHo+9dXxHz
         yGvw==
X-Gm-Message-State: AOAM531yRczLJa7MiyekHWTVpndZwYvLkaBxq/Hc2FzW10ZJHpXEOL+O
        cqbllIhSxhlzcTc51EbfopAPnV7WdnjkYw==
X-Google-Smtp-Source: ABdhPJyZXw00OIgF92a5zZ8k1mAHmYUasLN/AhNwxQPuwSffa/pEa3YdX+yS4S5+GrlwcL0nKC/uHQ==
X-Received: by 2002:a05:600c:1c20:: with SMTP id j32mr8822607wms.1.1639071249436;
        Thu, 09 Dec 2021 09:34:09 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id k8sm298644wrn.91.2021.12.09.09.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:08 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 03/25] ARM: tegra: Rename SPI flash chip nodes
Date:   Thu,  9 Dec 2021 18:33:34 +0100
Message-Id: <20211209173356.618460-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

SPI flash chip nodes should be named "flash" instead of "spi-flash".

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts    | 3 ++-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 3 ++-
 arch/arm/boot/dts/tegra124-venice2.dts    | 3 ++-
 arch/arm/boot/dts/tegra20-trimslice.dts   | 3 ++-
 arch/arm/boot/dts/tegra30-beaver.dts      | 3 ++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi     | 3 ++-
 6 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 82caefe5928c..e64199ba82cb 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -1084,7 +1084,8 @@ pin_gpio6 {
 	spi@7000da00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
-		spi-flash@0 {
+
+		flash@0 {
 			compatible = "winbond,w25q32dw", "jedec,spi-nor";
 			reg = <0>;
 			spi-max-frequency = <20000000>;
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 35ab296408e1..b2b3eea81232 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1655,7 +1655,8 @@ spi@7000d400 {
 	spi@7000da00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
-		spi-flash@0 {
+
+		flash@0 {
 			compatible = "winbond,w25q32dw", "jedec,spi-nor";
 			reg = <0>;
 			spi-max-frequency = <20000000>;
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index e6b54ac1ebd1..02cf986c7567 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -881,7 +881,8 @@ battery: sbs-battery@b {
 	spi@7000da00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
-		spi-flash@0 {
+
+		flash@0 {
 			compatible = "winbond,w25q32dw", "jedec,spi-nor";
 			reg = <0>;
 			spi-max-frequency = <20000000>;
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 4bc87bc0c2a4..beae368f827a 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -287,7 +287,8 @@ dvi_ddc: i2c@7000c000 {
 	spi@7000c380 {
 		status = "okay";
 		spi-max-frequency = <48000000>;
-		spi-flash@0 {
+
+		flash@0 {
 			compatible = "winbond,w25q80bl", "jedec,spi-nor";
 			reg = <0>;
 			spi-max-frequency = <48000000>;
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index e159feeedef7..f724abcdb1a5 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1898,7 +1898,8 @@ core_vdd_reg: tps62361@60 {
 	spi@7000da00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
-		spi-flash@1 {
+
+		flash@1 {
 			compatible = "winbond,w25q32", "jedec,spi-nor";
 			reg = <1>;
 			spi-max-frequency = <20000000>;
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index 448f1397e64a..e7bfe0e5ee06 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -374,7 +374,8 @@ vdd_core: tps62361@60 {
 	spi@7000da00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
-		spi-flash@1 {
+
+		flash@1 {
 			compatible = "winbond,w25q32", "jedec,spi-nor";
 			reg = <1>;
 			spi-max-frequency = <20000000>;
-- 
2.34.1

