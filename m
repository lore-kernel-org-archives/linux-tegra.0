Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92797C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Oct 2021 13:22:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7534F60F92
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Oct 2021 13:22:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbhJ1NY1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Oct 2021 09:24:27 -0400
Received: from ixit.cz ([94.230.151.217]:35134 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229981AbhJ1NY1 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Oct 2021 09:24:27 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 6675D20064;
        Thu, 28 Oct 2021 15:21:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1635427318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=tRtvLsIyTzl1Po9E5wDOrSjeOosw5eO3XZEpRHlLuvo=;
        b=UiHtoW68Y5aQXo7yUDPn3YqqEXayTa44ULi0V79pXd25hc7dw86Md4dGdAt4pT/ourOMvx
        JVHNpaEYDtEdhiC26vs5biOCowMVOCUm5kZmqCPCFsRoMzlCcSTi+V+FXPQQgeKbF+c+Dt
        cU2I/nRvDOnamwcOBUMUrqeBRftjAQE=
From:   David Heidelberg <david@ixit.cz>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: tegra: add -hog to gpios hogs
Date:   Thu, 28 Oct 2021 15:21:52 +0200
Message-Id: <20211028132152.44232-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Comply with dt-schema, fixes warnings as:
$ make dtbs_check
...
arch/arm/boot/dts/tegra30-apalis-eval.dt.yaml: pex-perst-n: $nodename:0: 'pex-perst-n' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
	From schema: /home/runner/.local/lib/python3.8/site-packages/dtschema/schemas/gpio/gpio-hog.yaml
...

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/tegra124-apalis-eval.dts      | 2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts | 2 +-
 arch/arm/boot/dts/tegra20-colibri.dtsi          | 6 +++---
 arch/arm/boot/dts/tegra30-apalis-eval.dts       | 2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts  | 2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi          | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/dts/tegra124-apalis-eval.dts
index 28c29b6813a7..3209554ec7e6 100644
--- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
@@ -246,7 +246,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 
 &gpio {
 	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
-	pex-perst-n {
+	pex-perst-n-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(DD, 1) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
index f3afde410615..814257c79bf1 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
@@ -248,7 +248,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 
 &gpio {
 	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
-	pex-perst-n {
+	pex-perst-n-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(DD, 1) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 375b60eb03af..618d35647a43 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -749,7 +749,7 @@ &emc_icc_dvfs_opp_table {
 };
 
 &gpio {
-	lan-reset-n {
+	lan-reset-n-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(V, 4) GPIO_ACTIVE_HIGH>;
 		output-high;
@@ -757,7 +757,7 @@ lan-reset-n {
 	};
 
 	/* Tri-stating GMI_WR_N on SODIMM pin 99 nPWE */
-	npwe {
+	npwe-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(T, 5) GPIO_ACTIVE_HIGH>;
 		output-high;
@@ -765,7 +765,7 @@ npwe {
 	};
 
 	/* Not tri-stating GMI_WR_N on SODIMM pin 93 RDnWR */
-	rdnwr {
+	rdnwr-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(T, 6) GPIO_ACTIVE_HIGH>;
 		output-low;
diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 9f653ef41da4..93b83b3c5655 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -239,7 +239,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 
 &gpio {
 	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
-	pex-perst-n {
+	pex-perst-n-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
index 86e138e8c7f0..fbfa75e53f32 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
@@ -257,7 +257,7 @@ reg_vddio_sdmmc3: regulator-vddio-sdmmc3 {
 
 &gpio {
 	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
-	pex-perst-n {
+	pex-perst-n-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 64e4a375bfb1..9cfc6c7d2065 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -1056,7 +1056,7 @@ sound {
 };
 
 &gpio {
-	lan-reset-n {
+	lan-reset-n-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(DD, 0) GPIO_ACTIVE_HIGH>;
 		output-high;
-- 
2.33.0

