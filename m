Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD03EB64DC
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Jul 2023 16:33:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbjGQQdo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Jul 2023 12:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbjGQQdg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jul 2023 12:33:36 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB8210CC;
        Mon, 17 Jul 2023 09:33:32 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-992e22c09edso570441866b.2;
        Mon, 17 Jul 2023 09:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689611611; x=1692203611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWtR6SJ906blw3T455FQj8aguVmGFVuFiMBhdGW9kL8=;
        b=iTEoRJMRFZcuWkcFXgiIBQkJtajufMdliw5PtvZ/fO7BEHFNOG8ImkJXNx3WdSSAbW
         HVCA6eAvyct+BGG01eFGpdmifeE+0vFJFyD5Jg2tglYNRt2AcbI77+74CIFeWwwefJVS
         7Cekcs4c6+PHJ/0wQNlsMJS59O4NN8iGN6qYy7LFnZ1fAhADT51ooFyQ/tpYi6Vj4n7r
         3kmrmNF0xBOBsN+qZeAqggZHnEonlZ5UN/s7Xtu8r6W5DFCFz36MvkLJIzWuOL2kPfRt
         m2bLgGoEkQcfOg8fsi9Yt1hPhvXOqDd9xcV8qChN+hzQIcDCHsMlJngWjXiYYXadCiMb
         vzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611611; x=1692203611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWtR6SJ906blw3T455FQj8aguVmGFVuFiMBhdGW9kL8=;
        b=NmIu9t/3c0UkfHqxhyuU4Lek04D5IOR8TswCp0TUGJVWNKqRHpYZ6JZkKVUDrtLJSq
         RGkIEW6BFGPOX3MtL7EzRMEIUroUs5ffBfWzLIIukLivLu290te4ePVsYLxw8ISJxbAf
         bBifecIEdw1njpyCVmM0mvPHH7THIJmcivQLLc3HaJ7IYDhDHmcIuFdJZqHqLqQK3NBZ
         vusAXgl7xMTXVZZ1tCa26lMTd+S1AoCjVhPnpHtYErgtTnBQEFqkkXf0TN3tWghjBoGA
         +RcGvSXrSDrJSY2VyFJpSxe3mVwAHkYobUlV9gwP9eQXIQAncRQa5fHy0ThHYvTzg3c0
         adLg==
X-Gm-Message-State: ABy/qLYWxMZjV0xSNud/QE41KDlxOVmCnFCPMmrcYvJohCMGamv6w1KX
        K0TLpaJmX9HPqt47h7GpZrc=
X-Google-Smtp-Source: APBJJlFxq2FgR/rrD5pKwcR6t/ZimYYfTnORfnq7mU+zqkMlYULPYmQYgWNCzezN4lKuobKSFUiRdw==
X-Received: by 2002:a17:906:e17:b0:986:f586:b97 with SMTP id l23-20020a1709060e1700b00986f5860b97mr12292168eji.59.1689611611158;
        Mon, 17 Jul 2023 09:33:31 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d8-20020a170906370800b009929ab17be0sm9218302ejc.162.2023.07.17.09.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 09:33:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/3] ARM: tegra: Remove reset-names for UART devices
Date:   Mon, 17 Jul 2023 18:33:28 +0200
Message-ID: <20230717163329.1033725-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717163329.1033725-1-thierry.reding@gmail.com>
References: <20230717163329.1033725-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The UART devices found on Tegra chips have a single reset connected to
them, so a reset-names property isn't needed. In fact, the device tree
bindings don't allow this property, so remove them to allow the nodes
to be properly validated.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 4 ----
 arch/arm/boot/dts/nvidia/tegra124.dtsi | 4 ----
 arch/arm/boot/dts/nvidia/tegra20.dtsi  | 5 -----
 arch/arm/boot/dts/nvidia/tegra30.dtsi  | 5 -----
 4 files changed, 18 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 09996acad639..86f14e2fd29f 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -315,7 +315,6 @@ uarta: serial@70006000 {
 		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_UARTA>;
 		resets = <&tegra_car 6>;
-		reset-names = "serial";
 		dmas = <&apbdma 8>, <&apbdma 8>;
 		dma-names = "rx", "tx";
 		status = "disabled";
@@ -328,7 +327,6 @@ uartb: serial@70006040 {
 		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_UARTB>;
 		resets = <&tegra_car 7>;
-		reset-names = "serial";
 		dmas = <&apbdma 9>, <&apbdma 9>;
 		dma-names = "rx", "tx";
 		status = "disabled";
@@ -341,7 +339,6 @@ uartc: serial@70006200 {
 		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_UARTC>;
 		resets = <&tegra_car 55>;
-		reset-names = "serial";
 		dmas = <&apbdma 10>, <&apbdma 10>;
 		dma-names = "rx", "tx";
 		status = "disabled";
@@ -354,7 +351,6 @@ uartd: serial@70006300 {
 		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_UARTD>;
 		resets = <&tegra_car 65>;
-		reset-names = "serial";
 		dmas = <&apbdma 19>, <&apbdma 19>;
 		dma-names = "rx", "tx";
 		status = "disabled";
diff --git a/arch/arm/boot/dts/nvidia/tegra124.dtsi b/arch/arm/boot/dts/nvidia/tegra124.dtsi
index 840b498611d3..035deaf17c6e 100644
--- a/arch/arm/boot/dts/nvidia/tegra124.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124.dtsi
@@ -380,7 +380,6 @@ uarta: serial@70006000 {
 		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_UARTA>;
 		resets = <&tegra_car 6>;
-		reset-names = "serial";
 		dmas = <&apbdma 8>, <&apbdma 8>;
 		dma-names = "rx", "tx";
 		status = "disabled";
@@ -393,7 +392,6 @@ uartb: serial@70006040 {
 		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_UARTB>;
 		resets = <&tegra_car 7>;
-		reset-names = "serial";
 		dmas = <&apbdma 9>, <&apbdma 9>;
 		dma-names = "rx", "tx";
 		status = "disabled";
@@ -406,7 +404,6 @@ uartc: serial@70006200 {
 		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_UARTC>;
 		resets = <&tegra_car 55>;
-		reset-names = "serial";
 		dmas = <&apbdma 10>, <&apbdma 10>;
 		dma-names = "rx", "tx";
 		status = "disabled";
@@ -419,7 +416,6 @@ uartd: serial@70006300 {
 		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_UARTD>;
 		resets = <&tegra_car 65>;
-		reset-names = "serial";
 		dmas = <&apbdma 19>, <&apbdma 19>;
 		dma-names = "rx", "tx";
 		status = "disabled";
diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index 4177d04265d8..8da75ccc4402 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -442,7 +442,6 @@ uarta: serial@70006000 {
 		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_UARTA>;
 		resets = <&tegra_car 6>;
-		reset-names = "serial";
 		dmas = <&apbdma 8>, <&apbdma 8>;
 		dma-names = "rx", "tx";
 		status = "disabled";
@@ -455,7 +454,6 @@ uartb: serial@70006040 {
 		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_UARTB>;
 		resets = <&tegra_car 7>;
-		reset-names = "serial";
 		dmas = <&apbdma 9>, <&apbdma 9>;
 		dma-names = "rx", "tx";
 		status = "disabled";
@@ -468,7 +466,6 @@ uartc: serial@70006200 {
 		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_UARTC>;
 		resets = <&tegra_car 55>;
-		reset-names = "serial";
 		dmas = <&apbdma 10>, <&apbdma 10>;
 		dma-names = "rx", "tx";
 		status = "disabled";
@@ -481,7 +478,6 @@ uartd: serial@70006300 {
 		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_UARTD>;
 		resets = <&tegra_car 65>;
-		reset-names = "serial";
 		dmas = <&apbdma 19>, <&apbdma 19>;
 		dma-names = "rx", "tx";
 		status = "disabled";
@@ -494,7 +490,6 @@ uarte: serial@70006400 {
 		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_UARTE>;
 		resets = <&tegra_car 66>;
-		reset-names = "serial";
 		dmas = <&apbdma 20>, <&apbdma 20>;
 		dma-names = "rx", "tx";
 		status = "disabled";
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 9cba67b54111..f866fa7b55a5 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -563,7 +563,6 @@ uarta: serial@70006000 {
 		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_UARTA>;
 		resets = <&tegra_car 6>;
-		reset-names = "serial";
 		dmas = <&apbdma 8>, <&apbdma 8>;
 		dma-names = "rx", "tx";
 		status = "disabled";
@@ -576,7 +575,6 @@ uartb: serial@70006040 {
 		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_UARTB>;
 		resets = <&tegra_car 7>;
-		reset-names = "serial";
 		dmas = <&apbdma 9>, <&apbdma 9>;
 		dma-names = "rx", "tx";
 		status = "disabled";
@@ -589,7 +587,6 @@ uartc: serial@70006200 {
 		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_UARTC>;
 		resets = <&tegra_car 55>;
-		reset-names = "serial";
 		dmas = <&apbdma 10>, <&apbdma 10>;
 		dma-names = "rx", "tx";
 		status = "disabled";
@@ -602,7 +599,6 @@ uartd: serial@70006300 {
 		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_UARTD>;
 		resets = <&tegra_car 65>;
-		reset-names = "serial";
 		dmas = <&apbdma 19>, <&apbdma 19>;
 		dma-names = "rx", "tx";
 		status = "disabled";
@@ -615,7 +611,6 @@ uarte: serial@70006400 {
 		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_UARTE>;
 		resets = <&tegra_car 66>;
-		reset-names = "serial";
 		dmas = <&apbdma 20>, <&apbdma 20>;
 		dma-names = "rx", "tx";
 		status = "disabled";
-- 
2.41.0

