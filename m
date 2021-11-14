Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3486BC433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 22:03:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DC2660FE8
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 22:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236412AbhKNWGG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Nov 2021 17:06:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236199AbhKNWFj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Nov 2021 17:05:39 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08981C061210;
        Sun, 14 Nov 2021 14:02:07 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id p16so38234766lfa.2;
        Sun, 14 Nov 2021 14:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i5GmjuUxzUkqZCfv/rZk95zAa0u8tm44fs6PZOYT+lQ=;
        b=GZzHzvCldtKY7LXkjOn5X1LPawjE5SGjwVb5Zvd5HakdNGR8V9JzyemIKG9H4dqn/c
         CvlYc4t201HTW2S7ggqLUnSDNSygYZGwQEDXIPl0J9AeB1rwc7vYPl2AV/0xA7o7tVn2
         cdBDKzHY2VghLzhfFX7dlte4z76eblont4cSkaSjmYzHS7akHkXehUXrqsCXeT9icgQn
         kb4sl+2oFaEUl+VdbK40pdKa0GPyccMkgYpTU+9+kPvaVx9bWgOU381Hn7YtjnIRW+Ud
         rmf1oiunQ95mWng+BGqBIU6VCwxvwY62JjaMWNeYbqGnYnR/AZwd35q1fX3NZIFkLdef
         7tsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i5GmjuUxzUkqZCfv/rZk95zAa0u8tm44fs6PZOYT+lQ=;
        b=kJ5jNHp0xCS9ciGBDsTzcPQvOgvdQGVd5RQZn45fmDuvuXxjxj1y13cChv40qoi3RR
         19RIU6CG+iS++r+m3irOHZxpZ2P8viQxMAeXqoMPljvvstNIxPRPmhudwfPLZ2DPVriR
         CrvE7jJbWX92est7s/EcrJVD96MHY4hZcNxnra8NFgZBO0MzijDnyqqC5hrOG4LX0RKU
         FsHkdSbCfM/qml+5t587L1LjxObdP5TXgILH1FuRLL1VoIX+pgW6wVxOWpX5d+WbIjHA
         6Ij4Lnk6MDuwrawi60dbhuHY0P4Sl49w9M4XdCPjc7A9NjElA0BKNemEXHHqEtZkQbOB
         A0gw==
X-Gm-Message-State: AOAM5305mvF1RxdZVLMx6jUSc+bCKOHU81PKzl4OIp62WDjkKgKpfszI
        fmAhoh+XtQ5ZW4xgVmRxdtY=
X-Google-Smtp-Source: ABdhPJwFRxjFHAZS0cJ3vcof53lHVm3Rw1TtDr7F3D7yMuK26XLGFVhi0wg/fsa6X70IOJ6XfVMVCg==
X-Received: by 2002:a05:6512:32c6:: with SMTP id f6mr15380126lfg.40.1636927325434;
        Sun, 14 Nov 2021 14:02:05 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id t5sm1353842lfd.80.2021.11.14.14.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:02:05 -0800 (PST)
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
Subject: [PATCH v1 11/14] ARM: tegra: Add device-tree for 1080p version of Nyan Big
Date:   Mon, 15 Nov 2021 01:01:16 +0300
Message-Id: <20211114220119.18909-12-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114220119.18909-1-digetx@gmail.com>
References: <20211114220119.18909-1-digetx@gmail.com>
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
 arch/arm/boot/dts/tegra124-nyan-big-fhd.dts | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra124-nyan-big-fhd.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8f93e9e65a7c..a8763a75b3b2 100644
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
index 000000000000..2d95b9e30136
--- /dev/null
+++ b/arch/arm/boot/dts/tegra124-nyan-big-fhd.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra124-nyan-big.dts"
+
+/ {
+	panel {
+		compatible = "auo,b133htn01";
+	};
+};
-- 
2.33.1

