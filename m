Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772C7EB64DC
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Jul 2023 16:33:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbjGQQdi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Jul 2023 12:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbjGQQde (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jul 2023 12:33:34 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A3E1B6;
        Mon, 17 Jul 2023 09:33:32 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so12301110a12.1;
        Mon, 17 Jul 2023 09:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689611610; x=1692203610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0+X5Bzh9ofroKMtXJYCqTS+rc8Y+kJckF22io467ig8=;
        b=bvCa63pUWHxqqkp/F5Cw4eWohpCdje7D5fL5aqPpGTmf5jh/pQ1MP+HqtvjGBHxuru
         IQLnPZAo5F4yIddJDgNR8V6T82zbkSys6qLNQYrqhH3vlEz6sLyMMQwhF81Zrqi1rQBI
         6QWQRmQ7XKRZUohunvzbOrBU+2q8Alo4lFfjzEciYBQ91KXYZSIUr4xTPuI03/upKfFD
         /E0kouTiTnH7PNY/Czj7upZFHgGKloe4YJDZnCK52ntNajiub10jiiOgpFmiOJ5wTxZX
         Fu+qCz9OToHWLcDAaaub2gQ2gWtKjysdOJ5hZnpzfrs5tPZspQliLM+isTTHDCDyn1Re
         Dmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611610; x=1692203610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+X5Bzh9ofroKMtXJYCqTS+rc8Y+kJckF22io467ig8=;
        b=f/OtnVSYfql4EeXoDeYpfmfZKFScPzv+oaflujEbBq1cZWv+eZcd+6nWSrHNEucBUD
         aikSaGKVsBneSIqlEEqYQQi669XFn5cyJ56Fcs3xiAInlbZLRRdkaaG2O4uBHSwXuM2u
         F5ibIXMJxvZU1IWLFdT+QTS8+D0pAt4RXHRERY1xaDcd0LdjUMvLD9Wuq9i5xqJ4+RYW
         L8EcarK0C1XMmvJp4XPXz4NhkDPWlfoB096hOvza4tngiLI7dIFo5Q+ZBWJB+c3zwjuM
         u2b7TzyXClbEEetBupS5UDBiDSwX7+n7tp5keWJNqcwF1EcDjDJFl5HBEjFgsyG0ZqQY
         /d8A==
X-Gm-Message-State: ABy/qLbIxi5mnJZb7yRX/mg/1jy86UTkA8HIMv6oIJFKGUckIzNpQyt/
        uRzo/SjsolatedkaqcudgeJfQsjLcu0=
X-Google-Smtp-Source: APBJJlH7qTHSqwYPNsx52+YNmMj4pb6gpfmk8Pw2VBzW5QEREUZC9xkBh8dJD5eaxAYJ2N/BrLmBRA==
X-Received: by 2002:a05:6402:11c8:b0:51e:5e3d:cb92 with SMTP id j8-20020a05640211c800b0051e5e3dcb92mr13043137edw.16.1689611610154;
        Mon, 17 Jul 2023 09:33:30 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l11-20020a056402028b00b0051e26c7a154sm10106448edv.18.2023.07.17.09.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 09:33:29 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/3] ARM: tegra: Remove dmas and dma-names for debug UART
Date:   Mon, 17 Jul 2023 18:33:27 +0200
Message-ID: <20230717163329.1033725-1-thierry.reding@gmail.com>
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
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts      | 2 ++
 arch/arm/boot/dts/nvidia/tegra114-dalmore.dts          | 2 ++
 arch/arm/boot/dts/nvidia/tegra114-roth.dts             | 2 ++
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts              | 2 ++
 arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts      | 2 ++
 arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts | 2 ++
 arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dts       | 2 ++
 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi            | 2 ++
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts          | 2 ++
 arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts        | 2 ++
 arch/arm/boot/dts/nvidia/tegra20-colibri-eval-v3.dts   | 2 ++
 arch/arm/boot/dts/nvidia/tegra20-colibri-iris.dts      | 2 ++
 arch/arm/boot/dts/nvidia/tegra20-harmony.dts           | 2 ++
 arch/arm/boot/dts/nvidia/tegra20-paz00.dts             | 4 ++++
 arch/arm/boot/dts/nvidia/tegra20-seaboard.dts          | 2 ++
 arch/arm/boot/dts/nvidia/tegra20-tamonten.dtsi         | 2 ++
 arch/arm/boot/dts/nvidia/tegra20-trimslice.dts         | 2 ++
 arch/arm/boot/dts/nvidia/tegra20-ventana.dts           | 2 ++
 arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts       | 2 ++
 arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts  | 2 ++
 arch/arm/boot/dts/nvidia/tegra30-beaver.dts            | 2 ++
 arch/arm/boot/dts/nvidia/tegra30-cardhu.dtsi           | 2 ++
 arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dts   | 2 ++
 arch/arm/boot/dts/nvidia/tegra30-ouya.dts              | 2 ++
 24 files changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 84a3eb38e71d..763ab812eb87 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -271,6 +271,8 @@ serial@70006200 {
 	};
 
 	serial@70006300 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra114-dalmore.dts b/arch/arm/boot/dts/nvidia/tegra114-dalmore.dts
index a685fcb129d0..c06b52fe330a 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-dalmore.dts
@@ -755,6 +755,8 @@ drive_gma {
 	};
 
 	serial@70006300 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra114-roth.dts b/arch/arm/boot/dts/nvidia/tegra114-roth.dts
index b9d00009d1f4..a89b16573b42 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-roth.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-roth.dts
@@ -779,6 +779,8 @@ drive_gma {
 
 	/* Usable on reworked devices only */
 	serial@70006300 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts b/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
index f02d8c79eee7..bfbdb345575a 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
@@ -50,6 +50,8 @@ panel@0 {
 	};
 
 	serial@70006300 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts b/arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts
index 2df2d8a6b552..0f3debeb294b 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts
@@ -52,6 +52,8 @@ pex-perst-n-hog {
 
 	/* Apalis UART1 */
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts b/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts
index f4521fd15f6a..d13b8d25ca6a 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts
+++ b/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts
@@ -53,6 +53,8 @@ pex-perst-n-hog {
 
 	/* Apalis UART1 */
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dts
index 4196f2401c90..00b62ed243ec 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dts
@@ -1404,6 +1404,8 @@ serial@70006040 {
 
 	/* DB9 serial port */
 	serial@70006300 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
index 0c35ca2e9121..a2ee37180200 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
@@ -70,6 +70,8 @@ gpu@57000000 {
 
 	serial@70006000 {
 		/* Debug connector on the bottom of the board near SD card. */
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra124-venice2.dts b/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
index c697301c443c..3924ee385dee 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
@@ -609,6 +609,8 @@ hp_det_l {
 	};
 
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts b/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
index c2a9c3fb5b33..494d2d07def3 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
@@ -482,6 +482,8 @@ bluetooth {
 	};
 
 	serial@70006300 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra20-colibri-eval-v3.dts b/arch/arm/boot/dts/nvidia/tegra20-colibri-eval-v3.dts
index 612f4e54cb20..be2ead4147f2 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-colibri-eval-v3.dts
@@ -102,6 +102,8 @@ usbh-pen {
 
 	/* Colibri UART-A */
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra20-colibri-iris.dts b/arch/arm/boot/dts/nvidia/tegra20-colibri-iris.dts
index 25a9f5dfe62d..1da202ad1ded 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-colibri-iris.dts
@@ -102,6 +102,8 @@ usbh-pen {
 
 	/* Colibri UART-A */
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra20-harmony.dts b/arch/arm/boot/dts/nvidia/tegra20-harmony.dts
index 11f21aeba8e9..5c31a6c8dabe 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-harmony.dts
@@ -273,6 +273,8 @@ i2s@70002800 {
 	};
 
 	serial@70006300 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
index e995f428dc2e..898b4ad3b427 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
@@ -279,10 +279,14 @@ i2s@70002800 {
 	};
 
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
 	serial@70006200 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra20-seaboard.dts b/arch/arm/boot/dts/nvidia/tegra20-seaboard.dts
index bd4ff8b40b20..e944ae9b86c2 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-seaboard.dts
@@ -324,6 +324,8 @@ i2s@70002800 {
 	};
 
 	serial@70006300 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra20-tamonten.dtsi b/arch/arm/boot/dts/nvidia/tegra20-tamonten.dtsi
index ddb84e4a9f8b..5c214dd060bb 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20-tamonten.dtsi
@@ -288,6 +288,8 @@ i2s@70002800 {
 	};
 
 	serial@70006300 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra20-trimslice.dts b/arch/arm/boot/dts/nvidia/tegra20-trimslice.dts
index 1944121e2dd6..7cae6ad57544 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-trimslice.dts
@@ -276,6 +276,8 @@ i2s@70002800 {
 	};
 
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra20-ventana.dts b/arch/arm/boot/dts/nvidia/tegra20-ventana.dts
index 433575a6ad38..f3273941437c 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-ventana.dts
@@ -323,6 +323,8 @@ i2s@70002800 {
 	};
 
 	serial@70006300 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts b/arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts
index 842b5faba285..fc284155cd76 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts
@@ -59,6 +59,8 @@ pex-perst-n-hog {
 
 	/* Apalis UART1 */
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts b/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts
index ca277bf1df78..9d08e2b094b4 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts
@@ -60,6 +60,8 @@ pex-perst-n-hog {
 
 	/* Apalis UART1 */
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-beaver.dts b/arch/arm/boot/dts/nvidia/tegra30-beaver.dts
index 51769d5132ae..1d74179dde79 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-beaver.dts
@@ -1733,6 +1733,8 @@ gpv {
 	};
 
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-cardhu.dtsi b/arch/arm/boot/dts/nvidia/tegra30-cardhu.dtsi
index 37a9c5a0ca30..caefa7c2adda 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-cardhu.dtsi
@@ -170,6 +170,8 @@ uart3_txd_pw6 {
 	};
 
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dts
index 36615c5fda2c..1990bf8e122d 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dts
@@ -38,6 +38,8 @@ hdmi@54280000 {
 
 	/* Colibri UART-A */
 	serial@70006000 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-ouya.dts b/arch/arm/boot/dts/nvidia/tegra30-ouya.dts
index eef27c82987b..e3309908b1ca 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-ouya.dts
@@ -2033,6 +2033,8 @@ bluetooth {
 	};
 
 	uartd: serial@70006300 {
+		/delete-property/ dmas;
+		/delete-property/ dma-names;
 		status = "okay";
 	};
 
-- 
2.41.0

