Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BC6C00528
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Jul 2023 16:32:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbjGQQcb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Jul 2023 12:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbjGQQcW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jul 2023 12:32:22 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EFDE10CC;
        Mon, 17 Jul 2023 09:32:16 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9936b3d0286so675492166b.0;
        Mon, 17 Jul 2023 09:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689611535; x=1692203535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QwmJ3yCNTCffdq4//w6fdOcgjZ1/3t3V+Qy6dQDsUO8=;
        b=JQyoefJbnZhc9GPOFmzwe2Z+bDw9EHQ7Z5VwTp/otpSVy/PddtFLcl8+7d2zeJ0Lx/
         F7tXrtgElYDTGnIC2Hr49UXf1ubMs0DPoik8V9LqNyBPcycwoGPY5DXcHF6gwvZRVOeF
         tNTyVIzhmYx1IJS8aZ7N1VcK6oEmoZNgpF3DbrgMFXFtQ0cpMHcrGso7RpWzx7HIRmP0
         v90PBfnimdyNKaaV1AJnQGy46rEJt8K9Id/25I+VV1fHy6aSthJaONMfzpD5tqu3H/gN
         iNsKtJXrOUfbo+Y2cAPk2VkXWIgCOTDcCxuCkl9RaXzF8VECpCL2sqFdf13L3fjFcw6v
         WBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611535; x=1692203535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwmJ3yCNTCffdq4//w6fdOcgjZ1/3t3V+Qy6dQDsUO8=;
        b=aihhMNBwhrzVZoiWyFSK3rT2UxJaIG0QHhuVtnsmRF5/roESeKtA+YdGRxIsCKbEFJ
         7DHeRYZfMrGbvw55i/tNWVxpHc4pqsVY7imsTKuqylTTPsBrG3TBMtvWhoVIuspheL7B
         zQKpK/c6r1eJtXbm8On2VglXy62QXOrNOa/fY3EIvmS9qX8+iKARceVZtYz75EHCrNeR
         7JwurKx3/zmh9M5fEE7gLzkpS3qnCCpwH5GF0UN3mPAnzjD5/foo1vhbfmFhyAy8ZF1j
         4xPhaHUymtRYjDXHcNAh3cROzYy+mQm9rO0Wl7UYSn/NxDb74/WU1hAQmtt8LkgOA86T
         No3Q==
X-Gm-Message-State: ABy/qLY3vYAwSnHlKGVBaDfC0TBnN9szQX0n8lx8qIksFayfw8343cHI
        qizi+cOQR0LAdlef0Fz1yb4=
X-Google-Smtp-Source: APBJJlFO7FNcPt3ZvGbp/akaO6GeHf+QICxrDDUS1ywejfsEUPYjxrf5k1/ZMmd4h/mBw3xHcZbENQ==
X-Received: by 2002:a17:906:b213:b0:992:a80e:e5bd with SMTP id p19-20020a170906b21300b00992a80ee5bdmr10234037ejz.48.1689611534628;
        Mon, 17 Jul 2023 09:32:14 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h19-20020a170906719300b00993cc1242d4sm9366116ejk.151.2023.07.17.09.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 09:32:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/4] arm64: tegra: Remove dmas and dma-names for debug UART
Date:   Mon, 17 Jul 2023 18:32:10 +0200
Message-ID: <20230717163213.1033592-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The debug UART doesn't support DMA and the DT bindings prohibit the use
of the dmas and dma-names properties for it, so remove them.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     | 2 ++
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     | 2 ++
 arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi     | 2 ++
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     | 2 ++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 2 ++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      | 2 ++
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts    | 2 ++
 7 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index d4c034ac1244..bbc2e9bef08d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -531,6 +531,8 @@ soc_warm_reset_l {
 	};
 
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 92163b680980..0ae5a44f7d07 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -28,6 +28,8 @@ gpu@57000000 {
 
 	/* debug port */
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
index 0a70daeffd85..f0d53f0b4117 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
@@ -21,6 +21,8 @@ memory@80000000 {
 
 	/* debug port */
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
index 1f263fd32a7a..bbd6ff0564da 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
@@ -1321,6 +1321,8 @@ shutdown {
 	};
 
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index b4cc7d40911c..ac8c91f548e2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -126,6 +126,8 @@ dvfs_pwm_pbb1 {
 
 	/* debug port */
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 9c9c269158db..515a0e637cb7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1312,6 +1312,8 @@ shutdown {
 	};
 
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts b/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
index 5804acfc428a..9f3e9f30c3f7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
@@ -19,6 +19,8 @@ chosen {
 
 	bus@0 {
 		serial@3100000 {
+			/delete-property/ dmas;
+			/delete-property/ dma-names;
 			status = "okay";
 		};
 
-- 
2.41.0

