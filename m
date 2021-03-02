Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D52C28EBD
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26AE864E66
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377991AbhCCDb3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350253AbhCBMOh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 07:14:37 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDA0C0611C1;
        Tue,  2 Mar 2021 04:11:10 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id e7so30935712lft.2;
        Tue, 02 Mar 2021 04:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=//LXOze+13I5z/FYLaqJrmRyfxqFIxZ8QuJGcysQP04=;
        b=PBymluNP9Zh2xhcLL29I2vufCWp2WmkcBOw6zOaiV3T0wH5pAKjtqNMIofxV70gYTs
         uTFwEGnH+2Il4DM0zHaykyRNX+uU5+TTjYBIsBX/TxNb5sdd0vEvH9j3m2/1e8VPT386
         oKuatlG47+P5xLcqqZZTT/tAabKO8+FkGiSfSOeNsqUiklqWHWqveEZgUBu7OdO30OHa
         7FyjOYhv8f0XlrcF5jSzC/4elu9L4qHGFwEh47zH5vxL018j85xpRdMOl0fBumZ4IFZ3
         1m9ZW4mW6LcCwmT7SNXpPhHuSUy9YN2yDk7l2i6q1pmnHfHuiLtdqk7A3KL7KIzQNJHF
         P+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=//LXOze+13I5z/FYLaqJrmRyfxqFIxZ8QuJGcysQP04=;
        b=gUeqWVW5AvFAjtus2HJMDnffpO81MZG0V1H1wlO6XaTfFB9oQxPtaT9Y1Ke9PVtJnH
         ky4sUoIMYqa+D5/Ul/SaBFy6iAxFaGGUxvjrVLQ8EYL0uANth8TXDazQD0nDd0dAcH4y
         aRWOkipB4TOQQr/Ptf4/r30FrNLjmXzEYqvXuanSkmX331zo/7Sg+Jsuk5IlP78exA7F
         3Lf6GXZOM5OcSfBEiit3gU2nqrNZButdtpCkWUmT9Vc7IOjvYhHekxw4X0Ql10H/zOZv
         O6ZwsSE0Y8AU0FNduA9uTwtolI1WsHUHTkavYJYIVCdrkKLQyENnO/MuuhL0q0qAVByf
         Q2lA==
X-Gm-Message-State: AOAM533BJJ4Q8C9GOMUrNc2QZR3qRcA/TWq0h+Z3mKb9oktq4OQzWN5A
        sygZgduQdLgipvrBWpEefH8=
X-Google-Smtp-Source: ABdhPJwKWZQjR0ql5n7CtMw8VEPhL+WJ38WtRHAwpV7KihkNQQjzOAFy7N2NT82ZQiDz31FjyViRwA==
X-Received: by 2002:a05:6512:131c:: with SMTP id x28mr12147110lfu.387.1614687068649;
        Tue, 02 Mar 2021 04:11:08 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id d21sm835097ljo.55.2021.03.02.04.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 04:11:08 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/14] ARM: tegra: Specify memory suspend OPP in device-tree
Date:   Tue,  2 Mar 2021 15:10:02 +0300
Message-Id: <20210302121003.15058-14-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302121003.15058-1-digetx@gmail.com>
References: <20210302121003.15058-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Specify memory suspend OPP in a device-tree, just for consistency.
Now memory will always suspend on the same frequency.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi | 5 +++++
 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi  | 1 +
 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi  | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
index 49d9420a3289..781ac8601030 100644
--- a/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
@@ -128,24 +128,28 @@ opp@204000000,800 {
 			opp-microvolt = <800000 800000 1150000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0003>;
+			opp-suspend;
 		};
 
 		opp@204000000,950 {
 			opp-microvolt = <950000 950000 1150000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0008>;
+			opp-suspend;
 		};
 
 		opp@204000000,1050 {
 			opp-microvolt = <1050000 1050000 1150000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0010>;
+			opp-suspend;
 		};
 
 		opp@204000000,1110 {
 			opp-microvolt = <1110000 1110000 1150000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0004>;
+			opp-suspend;
 		};
 
 		opp@264000000,800 {
@@ -360,6 +364,7 @@ opp@204000000 {
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x001F>;
 			opp-peak-kBps = <3264000>;
+			opp-suspend;
 		};
 
 		opp@264000000 {
diff --git a/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
index b84afecea154..ef3ad2e5f270 100644
--- a/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
@@ -68,6 +68,7 @@ opp@216000000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <216000000>;
 			opp-supported-hw = <0x000F>;
+			opp-suspend;
 		};
 
 		opp@300000000 {
diff --git a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
index cbe84d25e726..2c9780319725 100644
--- a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
@@ -128,12 +128,14 @@ opp@204000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0007>;
+			opp-suspend;
 		};
 
 		opp@204000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0008>;
+			opp-suspend;
 		};
 
 		opp@333500000,1000 {
@@ -312,6 +314,7 @@ opp@204000000 {
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x000F>;
 			opp-peak-kBps = <1632000>;
+			opp-suspend;
 		};
 
 		opp@333500000 {
-- 
2.29.2

