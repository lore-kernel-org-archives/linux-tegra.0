Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F4AC4167D
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Nov 2021 14:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355518AbhK0Odw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 27 Nov 2021 09:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345510AbhK0Obt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Nov 2021 09:31:49 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4F8C06175B;
        Sat, 27 Nov 2021 06:26:44 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 207so24517489ljf.10;
        Sat, 27 Nov 2021 06:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GaDrIMpgT6ehw+oYiizpPLZzCqnLOIYK1wjey+O3h34=;
        b=TlfS+pTB5FWlJOQZSXNqrHOpbflqRyZH49vWz8/s208O5J5WnxhzSBJY1ozTaGc5aR
         qkM3rKPxOkgzlqqA/5YKgi1ZqNg5H0az93Fg/B1sHbKSxGWxLscaT6C5Uq32jSy9+Uqg
         LiSeS02/BxaDZxqUV+dSR6FM8f0HuqZRsLH5jjTn8B0eopue8DRupkAowZIyC2jxFc3e
         wmmw2r2RTwyDAEl1/2/AEnULYoRP0CCV3AgEZwM/WlotslWlgrK4+8TErsvAjlczUw+c
         86Irj8amyEHOGOy9hG+6xM2ICUDxYuDJLWdrvxp0UE5NNB/NVPssp4PjRAZOvdrURNTF
         szqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GaDrIMpgT6ehw+oYiizpPLZzCqnLOIYK1wjey+O3h34=;
        b=ZEN1KYFp1WZP6mqiHa01Pj0nYczSDKT4mCKWcGukdId2FttF0FB93ap35Q+Im3xotG
         Kd+e6RNqRivfJKY78pgnrOTqhTwnLj6PmOpad7bfELIK2TcW8dMBHsA+FhCPIAJq+IEX
         h607jRw5qvRn+WzsPUAwSRChnjovkDSoRyuwhdB+SplFefjL6Q5seITaTvsUqgwUBHXH
         csMfCzuJxoFrE7H+C6kzi9pm/wvUm5PfvnKzz8mA9Xh+HoFEi2klUaKx6mC0eE6ebouZ
         bvs/hPTTybGGRlwyLSKBE9/j2lNPqJd3ZlGjz0vY/s/Rv9+C9DDDk0cPxigCJACaN4ED
         hUwQ==
X-Gm-Message-State: AOAM5331C5SsYWk9trpkPvergmCBfxcWHtrjjINUTEp8kRp9zrNgxzP+
        4jvr5GHpULLgcx/6tCC68p1fnwbuLZ8=
X-Google-Smtp-Source: ABdhPJwhab9nhgB/E7xM31hyfTSX7Z17Qs4LxkzU0VAU9OEgGgqAqRGAx/5vyGWw2I69G+n2hscG4Q==
X-Received: by 2002:a2e:b0e3:: with SMTP id h3mr37314306ljl.276.1638023202344;
        Sat, 27 Nov 2021 06:26:42 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t22sm812382ljg.83.2021.11.27.06.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 06:26:42 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Anton Bambura <jenneron@protonmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Nikola Milosavljevic <mnidza@outlook.com>,
        Ion Agorria <ion@agorria.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Thomas Graichen <thomas.graichen@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/14] ARM: tegra: Add device-tree for 1080p version of Nyan Big
Date:   Sat, 27 Nov 2021 17:23:24 +0300
Message-Id: <20211127142327.17692-12-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211127142327.17692-1-digetx@gmail.com>
References: <20211127142327.17692-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add dedicated device-tree for 1080p version of Nyan Big in order to
describe display panel properly. FHD panel doesn't support modes other
than 1080p, hence it's wrong to use incompatible lower resolution panel
in device-tree.

Tested-by: Thomas Graichen <thomas.graichen@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/Makefile                  |  1 +
 arch/arm/boot/dts/tegra124-nyan-big-fhd.dts | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra124-nyan-big-fhd.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 26798673739c..561e0eae05a9 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1341,6 +1341,7 @@ dtb-$(CONFIG_ARCH_TEGRA_124_SOC) += \
 	tegra124-apalis-v1.2-eval.dtb \
 	tegra124-jetson-tk1.dtb \
 	tegra124-nyan-big.dtb \
+	tegra124-nyan-big-fhd.dtb \
 	tegra124-nyan-blaze.dtb \
 	tegra124-venice2.dtb
 dtb-$(CONFIG_ARCH_U8500) += \
diff --git a/arch/arm/boot/dts/tegra124-nyan-big-fhd.dts b/arch/arm/boot/dts/tegra124-nyan-big-fhd.dts
new file mode 100644
index 000000000000..d35fb79d2f51
--- /dev/null
+++ b/arch/arm/boot/dts/tegra124-nyan-big-fhd.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra124-nyan-big.dts"
+
+/ {
+	/* Version of Nyan Big with 1080p panel */
+	panel {
+		compatible = "auo,b133htn01";
+	};
+};
-- 
2.33.1

