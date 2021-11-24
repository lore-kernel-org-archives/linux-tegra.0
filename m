Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAF7C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 21:01:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244189AbhKXVEs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 16:04:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344181AbhKXVET (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 16:04:19 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D94F0C061748;
        Wed, 24 Nov 2021 13:01:07 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id f18so10598484lfv.6;
        Wed, 24 Nov 2021 13:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GaDrIMpgT6ehw+oYiizpPLZzCqnLOIYK1wjey+O3h34=;
        b=IH2uLU1cwc+oyI2jb6J3xPHPSU92Jug+yn4zkDtFa3czJzqZbv9MlKAni49/+hkzby
         WZKC7dqgmqs7dyPCJP+uEHpuI2MBMYqCWfVfgnCbheSsF4SysfnI+Seova8NCoRbiQ2E
         q2i385ShdZi7/6QTKo6Y7OP4SG3FKvx746uo7Jj19A7h2gUpmbQ12AYwF62a18fwOiNl
         0U2BKIxTSjlGtlrkyF4DZ6AG279vyxcfsP4qjb1jxv/fZmrTLoBWd22IPRrw9pvSkumV
         GTW4fty23uauiJDvuog3i92t6jhH9I8v3ETrbIdwgATd0UXmT2hcQ/Y/OVas/WKTiqWG
         ILCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GaDrIMpgT6ehw+oYiizpPLZzCqnLOIYK1wjey+O3h34=;
        b=wVMujttpa5FzQicBNKm4QMFTfwQL/M0qcsQz3Apga0zEhakHMqEl0duZoYtuk3GUyj
         VNty2hZtTFY93D2TLi2zZorZNsynWiPxCAjglV9xq0ReoqIvzL61Q1EsUl2A7pRizPU/
         QpQRRfZbOgZq/NsViTQWMN0A8xhqPVKGdD3rO07saOAKVdCsfQ/dc+iC1OP2eDyFoEXQ
         6NjfWhpa7rzTAVd4niUT1NjQrTPlscybSwSK4KjVPWl0FeKkpHJKw4C5mpxIL0GSUufH
         /VDYMyQTUVHgPJV5URAKplHJxP/aIH9K21clY68AF2XGpA9ras9FrHjBn2LGHCNXSBPc
         GlMQ==
X-Gm-Message-State: AOAM532fmupNZs0lJCT6ZPoN5uAKY2y9IHfXuyUMfmAsIjSWttFDHzSq
        zwVS0kT57fF0ddqUUc/H5qw=
X-Google-Smtp-Source: ABdhPJw51e75Jx4Z3TBuBzOvDy2CcWgKTUXGoJ0JBXtgs+o2+3t+PmtTc00T9KyBAWjpHmhDQfbO9A==
X-Received: by 2002:a05:6512:2033:: with SMTP id s19mr18577107lfs.290.1637787666202;
        Wed, 24 Nov 2021 13:01:06 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id 18sm79939ljr.17.2021.11.24.13.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:01:05 -0800 (PST)
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
Subject: [PATCH v2 11/14] ARM: tegra: Add device-tree for 1080p version of Nyan Big
Date:   Wed, 24 Nov 2021 23:59:19 +0300
Message-Id: <20211124205922.11930-12-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124205922.11930-1-digetx@gmail.com>
References: <20211124205922.11930-1-digetx@gmail.com>
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

