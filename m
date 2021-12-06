Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BF2C433FE
	for <linux-tegra@archiver.kernel.org>; Mon,  6 Dec 2021 16:17:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243536AbhLFQUq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 6 Dec 2021 11:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386623AbhLFQTt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Dec 2021 11:19:49 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBD42C0698D7;
        Mon,  6 Dec 2021 08:16:15 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id j3so23621463wrp.1;
        Mon, 06 Dec 2021 08:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G4IgP12coSo9aXzjPMCM3BHkam8Wm+7jX+k6WXUwTiw=;
        b=QcsLQoCO3moyOY3FhkZMud2+a/lQm1uC/BO+BkAriWAYPjLKTZ2WlQ4crgviYCNKma
         CNiZbI4XKxMsjZrdpDD7sqi+0BBe5+eRwf+hEnn2mA6BNA49A1GbxjlKmme8dQRkB6J+
         baPKL9PgU2bmkpfjBjYOojku+ONeaNL0L4BREL+OF7GuPjvVh4hgcyAnVm5qa1O6TXqv
         gSiqwRogmA7BxbOA9WvUtYsg8NKdN0w4p4aRQj9qruX2INDC/kv+WwDZNyg8rwP0Vu8G
         Wd7N2+Xp62sia0W6OUz0id8+ZnAFTEEoSZO4aHkp+XqjgiApBemuIa/BQz2r3OotzjHz
         Dwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G4IgP12coSo9aXzjPMCM3BHkam8Wm+7jX+k6WXUwTiw=;
        b=nKjQ9f4CcjImj3lPYHdBKFIkgGjHgWvLzmjhIL0agvfEhP0HLbv09FY7J303jkawQB
         vEaP0V3BXzP0Xjd6bcNSjkJcyUywsc3mm/ThpaSaSbvCh268rC9/Qfn3hgqFGbvvlb7f
         VguXuPcuhklW0/d0lKLbxzYZ0AX6OriKUvv6dqo0yj8BF42FdKJLUhQs4US8f0T5/UTg
         MkCzZlwcXDPNPUbxvtjErP1qzS0ipXbcaGw/dRODpbdTSivNCDvmArdfjsC3xPd/DFyX
         a4RR5FFRdKs7nWez3DAnrl90czLGuOZipYVluvxqdMBajl3vf1N99Q6GOsMtkSbmMEtF
         AXuQ==
X-Gm-Message-State: AOAM533/SZaIr5QimqJ00m4+SOYzIDrM4Z3Rot0VigeoFnrJoFC3UrT4
        e+IPezxgM5sTAPH3YIEEauI=
X-Google-Smtp-Source: ABdhPJyXuUYUBC38wcjzok5yv1wAThTI3rh86W2E+wOJ+6vhvP78WkU837DYPJItvlZrqIEAwEUpYg==
X-Received: by 2002:a5d:4107:: with SMTP id l7mr44173491wrp.209.1638807374045;
        Mon, 06 Dec 2021 08:16:14 -0800 (PST)
Received: from localhost (pd9e51d39.dip0.t-ipconnect.de. [217.229.29.57])
        by smtp.gmail.com with ESMTPSA id g16sm13771138wmq.20.2021.12.06.08.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 08:16:13 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] ARM: tegra: Specify correct PMIC compatible on Tegra114 boards
Date:   Mon,  6 Dec 2021 17:16:10 +0100
Message-Id: <20211206161610.239559-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The PMIC found on Dalmore, TN7 and Roth is a TPS65913, so add the
specific compatible string in addition to the generic Palmas series
compatible string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts | 2 +-
 arch/arm/boot/dts/tegra114-roth.dts    | 2 +-
 arch/arm/boot/dts/tegra114-tn7.dts     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 7fd901f8d39a..82caefe5928c 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -894,7 +894,7 @@ ldo2 {
 		};
 
 		palmas: tps65913@58 {
-			compatible = "ti,palmas";
+			compatible = "ti,tps65913", "ti,palmas";
 			reg = <0x58>;
 			interrupts = <0 86 IRQ_TYPE_LEVEL_HIGH>;
 
diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
index 07960171fabe..71a2806c0f59 100644
--- a/arch/arm/boot/dts/tegra114-roth.dts
+++ b/arch/arm/boot/dts/tegra114-roth.dts
@@ -801,7 +801,7 @@ regulator@43 {
 		};
 
 		palmas: pmic@58 {
-			compatible = "ti,palmas";
+			compatible = "ti,tps65913", "ti,palmas";
 			reg = <0x58>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 
diff --git a/arch/arm/boot/dts/tegra114-tn7.dts b/arch/arm/boot/dts/tegra114-tn7.dts
index 745d234b105b..753130b1e37b 100644
--- a/arch/arm/boot/dts/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/tegra114-tn7.dts
@@ -62,7 +62,7 @@ i2c@7000d000 {
 		clock-frequency = <400000>;
 
 		palmas: pmic@58 {
-			compatible = "ti,palmas";
+			compatible = "ti,tps65913", "ti,palmas";
 			reg = <0x58>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 
-- 
2.33.1

