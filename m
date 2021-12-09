Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EF9C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:26:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242897AbhLIR3l (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242849AbhLIR3l (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:41 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89756C0617A2
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:26:07 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id p18so4780503wmq.5
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FmEinY/5uVNYNxyaDWgspKUD761Zc1fxSgpPY3U7fJ0=;
        b=f8X14SofaJszvmVzFDRNorfFSW8EXqQ33rMO0IzahPsJLwulkiUd7Vuw9LHQ3nABhT
         Fp0rM3gXyjimYC6YfhFgwWgtZG6QuFqXVqkxvQfRlxLqIiHdZz3ftrE/kMzGXcE37wxN
         UBVSIsXA4PihStMsZ4FoXCLXLslPCIJjReTOxW9Wugh2gVMAUF8rAOFUYS7l2bSj1s1e
         bvPSWXZHM0ak/XjISJ6MP8EL88nNtRYvCz07IGm4YO7g79UJHZdrXNhVub83U0OoLxg1
         NBaB2kmVB4oZKORPVS8iHs8vFekbHqRNA1yw/Rnh33zUkq5sSLlcoRgMwGMp1JuGMGrE
         U65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FmEinY/5uVNYNxyaDWgspKUD761Zc1fxSgpPY3U7fJ0=;
        b=eeE76rcotQfw76ofPKFvAqeE73WIuoU2Rewja4M4Edi8dCtwWMm7Q2xIBh+jphJ9L3
         pI2h6xRrJmF/Iwt8m9CAzA17UZHeZUt1XA6CyAy6wXbV4xcQ/P3dYDKEKZUEfc7rBsGP
         HQGM3XCqmXnxXXKzamrye7mayOwSo6robcV3zaNam4pN+WsG5jmdCVXTR6IqYrrdyMCF
         uz5xi7nZ2jgXpl2RPjqcTuagjUioOmBon9uGDmt5khe0kg8fEaPSpv3qHm72xOuzHD6W
         jGR3IJVOHC+Z7WLfi1njpZozJfI0PfvIKAo8rRm6jEXHMQF8XwkqQ8UHSx9Oemn6SyyW
         mYaQ==
X-Gm-Message-State: AOAM531ZkBMxliqeC3FEVWnp+HcmRSd+k2tCMLkA6OOBhdgyueybbNpK
        4aBFuHTDJ8NclqmwZZtj+9TLaRqhGpkXXQ==
X-Google-Smtp-Source: ABdhPJzwGfGNrKmaUyd3r4UUunTFHz42p3rF8V2nuXn+EQv3Q8BHY3WygiKPPGxcu09O3RUneBOdNQ==
X-Received: by 2002:a05:600c:1914:: with SMTP id j20mr9088201wmq.26.1639070766084;
        Thu, 09 Dec 2021 09:26:06 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id l21sm287278wrb.38.2021.12.09.09.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:26:05 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 24/30] arm64: tegra: jetson-tx1: Remove extra PLL power supplies for PCIe and XUSB
Date:   Thu,  9 Dec 2021 18:24:57 +0100
Message-Id: <20211209172503.617716-25-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The XUSB pad controller handles the various PLL power supplies, so
remove any references to them from the PCIe and XUSB controller device
tree nodes.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 3 ---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 5 -----
 2 files changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 2e17df6f20ad..328fbfec4ee8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -11,11 +11,8 @@ / {
 	pcie@1003000 {
 		status = "okay";
 
-		avdd-pll-uerefe-supply = <&avdd_1v05_pll>;
 		hvddio-pex-supply = <&vdd_1v8>;
 		dvddio-pex-supply = <&vdd_pex_1v05>;
-		dvdd-pex-pll-supply = <&vdd_pex_1v05>;
-		hvdd-pex-pll-e-supply = <&vdd_1v8>;
 		vddio-pex-ctl-supply = <&vdd_1v8>;
 
 		pci@1,0 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 21d7e653ea5b..4b43b89a9651 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1361,11 +1361,6 @@ usb@70090000 {
 		dvddio-pex-supply = <&vdd_pex_1v05>;
 		hvddio-pex-supply = <&vdd_1v8>;
 		avdd-usb-supply = <&vdd_3v3_sys>;
-		/* XXX what are these? */
-		avdd-pll-utmip-supply = <&vdd_1v8>;
-		avdd-pll-uerefe-supply = <&vdd_pex_1v05>;
-		dvdd-usb-ss-pll-supply = <&vdd_pex_1v05>;
-		hvdd-usb-ss-pll-e-supply = <&vdd_1v8>;
 
 		status = "okay";
 
-- 
2.34.1

