Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B38C433FE
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Dec 2021 15:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238455AbhLGPLh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Dec 2021 10:11:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233627AbhLGPLg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Dec 2021 10:11:36 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A176C061746;
        Tue,  7 Dec 2021 07:08:06 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id o13so30056950wrs.12;
        Tue, 07 Dec 2021 07:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rt4kf+DWc0LcqIowjiwIJDIGCKtcXqUj5XnLkK/hFEU=;
        b=JDL26ioIZvPLtxewTzm4hGLcNPdH+oW/QkPqGQW6E8vkG0C6+yKOEQHjZtCQcCHywb
         QqI5gTxPj3ONxiyLLvxyn2l+0/vuOarI5AoEN4IAQMUM+2ZqA90fiBdXRc6U9KjB26UO
         G3QXwScEGtVO+0tWaSNYSDRW3P8tViD5CN3mCBIEeoNlF5QL18NrKvAEZ6EQQlr5qZXu
         3ARCrbLEWb0plE28eNzAeKoMI75YYJ2a8WRb+3grBa2LzkCD/LV1Wb39pVtihR9GLrAk
         JxfoQXqtUAFX1HH+53fcp83HmhCV4+nsKU/XyD5ePmhaXtwrx4dLuIPLKkrCzASYFouz
         S0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rt4kf+DWc0LcqIowjiwIJDIGCKtcXqUj5XnLkK/hFEU=;
        b=1i8ek8+j+DBJ4+KCBu0i5K6XeHffJvnznj4LH2Wbu6di721AIv4f3zDyPucLIbncSO
         7XgIfATUTKqA4d98zHHDaVD+xDGyLK+KAOUipppzKpAhkq2kSYKcQ3TaBVsB4XrKTq+T
         ziUM1iCKoitIDxwPsYLWgIv5Sc3+5Tk6jsmhultIAg/LMF8FQ+icnVzs49u7hLRc/a7K
         iGdIv15ErPptrh7xohCgPkuZuuHz9ps/rvP7J7+5kBU2cB1IZ0FPoMhDpFiiSG5qjHBt
         MATdULnos5sT7sf9wKK7L4axK5qknYzp0Y7fpX2JRRDnnbjo+ymfmvWpyIZ5puDKccxV
         ZTIQ==
X-Gm-Message-State: AOAM5333JOavn8dtZuUuTMrZARTbaALeO38X9oAHO+eFxgbeYUdhGF5y
        qRtLaFAzZVJfiUfIVYDzSng=
X-Google-Smtp-Source: ABdhPJyVkwOpkHsXqDRKJ9PutFBVtXFwjGE0HxJzlj1bgH0Y+0tuv358xxfn3HX3AOezngCyTCX/3w==
X-Received: by 2002:a5d:6d01:: with SMTP id e1mr52103076wrq.157.1638889684831;
        Tue, 07 Dec 2021 07:08:04 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id a198sm3196119wme.1.2021.12.07.07.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 07:08:04 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] arm64: tegra: Drop arm,armv8-pmuv3 compatible string
Date:   Tue,  7 Dec 2021 16:07:46 +0100
Message-Id: <20211207150746.444478-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211207150746.444478-1-thierry.reding@gmail.com>
References: <20211207150746.444478-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The arm,armv8-pmuv3 compatible string is meant to be used only for
software models and not silicon chips. Drop them and use silicon-
specific compatible strings instead.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 5f8132884be0..eb739ffbdfce 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1892,14 +1892,14 @@ L2_A57: l2-cache1 {
 	};
 
 	pmu_denver {
-		compatible = "nvidia,denver-pmu", "arm,armv8-pmuv3";
+		compatible = "nvidia,denver-pmu";
 		interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&denver_0 &denver_1>;
 	};
 
 	pmu_a57 {
-		compatible = "arm,cortex-a57-pmu", "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a57-pmu";
 		interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 8d29b7fdb044..a0025b1c425f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -2687,7 +2687,7 @@ l3c: l3-cache {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "nvidia,carmel-pmu";
 		interrupts = <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.33.1

