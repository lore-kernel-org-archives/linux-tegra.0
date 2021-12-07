Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A47AC433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Dec 2021 10:09:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234764AbhLGKNY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Dec 2021 05:13:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbhLGKNY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Dec 2021 05:13:24 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD3AC061574;
        Tue,  7 Dec 2021 02:09:54 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id u1so28280928wru.13;
        Tue, 07 Dec 2021 02:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QaYDbEoViQA9ye4Gz7EaSx+jnGCCH/t3CNT8weH2wZQ=;
        b=YBRfA51uAFXfFdZ9ftYZfGr+4URYsFxKnqx6qHmmOENwSwo2+dQZhjSNmvXGemRkHF
         FpUlfrNoEEzjfp1o6MXLEY5OErHVeT4MXBrEImybuNubaB5uxrSrTwSvciz7OKFBoHQZ
         DLmdav2w+rYS0ZRm7mjhktN2Tn5wNO9VIyK+K4Jt94mcagDi5lVPDS2n546rEtUWHgf+
         RNUWCxdeEocXUGFkO3LNcBsQiapag73USwc6WDyMnOOm/g51Vy4zazJdyLowSXlzeGnB
         vp1k2cx4iT/mQPfBcpJhUO3SaYRpIZcu8QJ0WJMydB8yFSvncpTkci5PyZnTHSrxX1zn
         lwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QaYDbEoViQA9ye4Gz7EaSx+jnGCCH/t3CNT8weH2wZQ=;
        b=WUUPmAlkgem2gcWNLuD2kvOI2jOljhTER09Z3mjU1sacUPJ0P+hPFmj/sjTLtX3Eb/
         I5rWErV31RYlNi3NCyuyFlZFbz/rTVex6OyrIjJ7d3QnSB8sSB5WEQRyh+iFrfvogPaq
         WBcgiMu5v6AfeZwPXBQ5CoYwYyx1Da4tS9lH+g+51s6Y44pWeKaLhy79l9ns2oYC08nf
         7bFrJ14kvZ93OiyF9j1zQhB34i/jCQBqVg7q9PRPPyHaVtrl2hlOl9jziKpCCu23MWfX
         sjrQNopzq0d8TdBZ38Na1LKd7xzKWyjBKpoJVShfMOqh69Uce4W9EFYMFgeu6NCVk8X/
         X+LQ==
X-Gm-Message-State: AOAM532F5zQb03tFN5l5sdeZ6i4E4KX+6OMtVnY/Gwzn9X1/IJhobRC5
        Qet67WVGcaSZ6aaiY1mQL6KfaVu1Y9O08Q==
X-Google-Smtp-Source: ABdhPJz5elBSCNuuVga4xsn/c0l/Qzh4r4nftzfLw/d4IIpojkTpf/HfB9kwmu1H9d37bnHewWy+Ig==
X-Received: by 2002:a5d:5244:: with SMTP id k4mr48402493wrc.77.1638871792989;
        Tue, 07 Dec 2021 02:09:52 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id d188sm2467478wmd.3.2021.12.07.02.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 02:09:52 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] ARM: tegra: Rename GPU node on Tegra124
Date:   Tue,  7 Dec 2021 11:09:47 +0100
Message-Id: <20211207100947.379143-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to be able to pass DT schema validation, change the GPU nodes'
unit-address to the standard notation. Previously this was using a "0,"
prefix that originated from a time when the top-level device tree node
contained #address-cells = <2>.

Note that this technically breaks backwards-compatibility with certain
older versions of the U-Boot bootloader because early versions used a
hard-coded DT path lookup to find the GPU node and perform some fixups
on it. However, this was changed to a compatible string based lookup in
April 2016, so it's reasonable to expect people to update U-Boot on the
systems that they want to use this updated kernel DTB with.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts   | 2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi        | 2 +-
 arch/arm/boot/dts/tegra124-venice2.dts      | 2 +-
 arch/arm/boot/dts/tegra124.dtsi             | 7 +------
 6 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 4ba4d5229fcf..f00ef4d08fd4 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -57,7 +57,7 @@ hdmi@54280000 {
 		};
 	};
 
-	gpu@0,57000000 {
+	gpu@57000000 {
 		/*
 		 * Node left disabled on purpose - the bootloader will enable
 		 * it after having set the VPR up
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 3760744cc1b0..e6d25813b416 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -56,7 +56,7 @@ hdmi@54280000 {
 		};
 	};
 
-	gpu@0,57000000 {
+	gpu@57000000 {
 		/*
 		 * Node left disabled on purpose - the bootloader will enable
 		 * it after having set the VPR up
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 95b97c1fa1fb..e056e737abdf 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -72,7 +72,7 @@ cec@70015000 {
 		status = "okay";
 	};
 
-	gpu@0,57000000 {
+	gpu@57000000 {
 		/*
 		 * Node left disabled on purpose - the bootloader will enable
 		 * it after having set the VPR up
diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index 1350a0b9a606..b2e7ede8017a 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -61,7 +61,7 @@ dpaux@545c0000 {
 		};
 	};
 
-	gpu@0,57000000 {
+	gpu@57000000 {
 		status = "okay";
 
 		vdd-supply = <&vdd_gpu>;
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 4698c6db6f76..0a9aaa7bf066 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -51,7 +51,7 @@ dpaux@545c0000 {
 		};
 	};
 
-	gpu@0,57000000 {
+	gpu@57000000 {
 		/*
 		 * Node left disabled on purpose - the bootloader will enable
 		 * it after having set the VPR up
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index f4ac0c327c2e..d0ec1a30ff54 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -223,12 +223,7 @@ gic: interrupt-controller@50041000 {
 		interrupt-parent = <&gic>;
 	};
 
-	/*
-	 * Please keep the following 0, notation in place as a former mainline
-	 * U-Boot version was looking for that particular notation in order to
-	 * perform required fix-ups on that GPU node.
-	 */
-	gpu@0,57000000 {
+	gpu@57000000 {
 		compatible = "nvidia,gk20a";
 		reg = <0x0 0x57000000 0x0 0x01000000>,
 		      <0x0 0x58000000 0x0 0x01000000>;
-- 
2.33.1

