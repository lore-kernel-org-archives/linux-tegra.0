Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57751C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243079AbhLIRiA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhLIRiA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:00 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E01C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:26 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id o13so10924484wrs.12
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i2id9bmj3chAPwWeXdIeXqMqYGFxKYJ2r4Lm3ehHs7k=;
        b=g6tZ9cPC1JkUOmkgD8RmzyDaEZGszWOtKoWGNmBy0Ozyffou25JCBYfvhbWIlrSY/6
         5nV/KCINeeohRqKHlGNzNERcqym6R/3CEiEujtdverC2nG4onJR/NyFwBmXj7xcAHIQK
         VNQ3byzDG4jxCCZBU54qWyFovB6vgfC8xue89uhdhuNmmSYO/rzkORpNF3GJEjEHvupi
         K3r1YM52yflJlXhW9hOHVfM4irvNTw8tnil4MPwPYVbhTkEuIr2tTrZk/hhwE16rweYz
         F9xBzTGz+eEV5JJyReYPH6S8hOVNqRa+vI4qd8m4rxADIqVifzODGiWKQuLvpWBQfqYe
         NT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i2id9bmj3chAPwWeXdIeXqMqYGFxKYJ2r4Lm3ehHs7k=;
        b=SCwwB9fbqCp0ZNGVF/raSQrW9uuyrhXMhgFyNknC55JNIJLbgg/XyWHtcPrmIk6x8a
         3y2NEZUGraLv0ioLRgVdj1GHQJTBNSENi39b3cnf2tsjqYpkz9PBXdSyNaHcjX+XM0m4
         Lsr558C6vFa594rsjB+DlD7oY3NhJxutb9FZAgAr+cJxYyOfM7eM8s7U3ndoDf6upn+X
         7MExQlp+PE/p1LqbAUkPpBF5VMPPoerh8143pEVllVyE3WVU7hrflWaTj+xR02j9HgRv
         bVMRnnaR1XdPo5XbzRUJ2qIi1r0o1Kn6NqXSD+fx69uxLJmlCKkQocSN2xT9JvOxJpNb
         pb7A==
X-Gm-Message-State: AOAM530oi3QrvuY0HfGbhH6tusU3xkJTusVDoiQGNNjzsizUqm/hz6Hk
        1/kYAEjnd8nkL1kT64EwD3Q=
X-Google-Smtp-Source: ABdhPJwblZoAdnQbrj+2k1wZDpXyEVs9N8iyL32DWDIYpUX0GEsfZ+qWC7r/5LiZbsA9r/lv7QGkPQ==
X-Received: by 2002:a5d:4d07:: with SMTP id z7mr8061075wrt.487.1639071264760;
        Thu, 09 Dec 2021 09:34:24 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id r83sm9646480wma.22.2021.12.09.09.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:23 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 09/25] ARM: tegra: Rename GPU node on Tegra124
Date:   Thu,  9 Dec 2021 18:33:40 +0100
Message-Id: <20211209173356.618460-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
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
2.34.1

