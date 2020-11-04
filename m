Return-Path: <SRS0=aGvU=EK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E715C388F7
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 14:13:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01A0C22280
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 14:13:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Acmem3jP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729883AbgKDONI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 Nov 2020 09:13:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729946AbgKDONH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Nov 2020 09:13:07 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFE7C061A4C
        for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2020 06:13:06 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id h6so27309316lfj.3
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2020 06:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wAifmXeGXkLKcRlStaqo6NnKv6GuZb6Fmqv0pUtS5oQ=;
        b=Acmem3jPGlWPnsON+ExUf4mmNxK1+Wj4bOxP5RIvRtSKAToYA4TLqU3hE4JAoWk8D8
         SitSE7PxGqq0mAme6dKLS9tONjilwf97j0xFx79/BtrogfXmohSMd4mkxYM2I1ZjL1Vp
         O4P+V4a7QuMu/hohq2d/Waiak4Vj5dNxjsgiGjUp/WRvD7f5od1MZ7O3MC83uN9MN5ut
         iEg1vYpvJgzIx/pGkNbksezVxNCUHTzWhyFOIePTzm32Hu/MyrXQS3jZB7vciBVDNn9+
         p8zUwqaaCVl0ZxsGH/xrQhILbD/IPowdAoJOtGH4pjIMMJL2wJqzFUxahxt9o0aGbb90
         5PLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wAifmXeGXkLKcRlStaqo6NnKv6GuZb6Fmqv0pUtS5oQ=;
        b=Ae09HaKFpYffsFz5j3DQ+nIgniZVviCgFMrmNuiOWdeAapwzLiH1hnjAgmljf/RXZ/
         d9xzfCVL+98COfD5tKfr6pNK0OIPOyMTaovqYlfKC+fgOtVndkkfD120apToZVguQPnI
         mdw8H3jzihJctBRA9/WN1F0kKsYKeqMctP3c/HVg8PnS2mXWkjmeV4FIaKDGuJ3th817
         Byg1804yT+kTDYadsn1ks8GMZN2ByfcqJH7BQQ9rKKdBVTKxerKOH569wt/KPSqc6el1
         c7CX/Kxk+vKrp2xjTSAsugbj/KMwktXj7PdghsCfqRGE6tR2YE1OQ16Pu+Pg+cojfGFh
         NYTg==
X-Gm-Message-State: AOAM533JH+plxYGRcKlggr3RNaht9iRP3IWmFFXfAdrW5hm6UDflSF7K
        6GjPmfE6hyaiSKBi1nF4uzs=
X-Google-Smtp-Source: ABdhPJzxF/W5piqEQi1x+5UZTiOEhHz6Sxq4REjSL/ufo4cKVvrh55mmiYMkK6wg/+lhNZ4RH5FEyA==
X-Received: by 2002:a19:5e52:: with SMTP id z18mr10452104lfi.345.1604499185042;
        Wed, 04 Nov 2020 06:13:05 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.gmail.com with ESMTPSA id z10sm411853lfi.76.2020.11.04.06.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 06:13:04 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v2 4/8] ARM: tegra: nexus7: Improve CPU passive-cooling threshold
Date:   Wed,  4 Nov 2020 17:12:47 +0300
Message-Id: <20201104141251.25834-5-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104141251.25834-1-digetx@gmail.com>
References: <20201104141251.25834-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The current CPU thermal limit is a bit inappropriate for Nexus 7 once
device is getting used on a daily bases. For example, currently it's may
be impossible to watch a hardware accelerated 720p video without hitting
a severe CPU throttling, which ruins user experience. This patch improves
the thermal throttling thresholds.

In my experience setting CPU thermal threshold to 57C provides the most
reasonable result, where device is a bit warm under constant load and
not getting overly hot, in the same time performance is okay. Let's bump
the passive-cooling threshold from 50C to 57C and also lower the thermal
hysteresis to 0.2C in order to make throttling more reactive.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 543c52cd8260..adc708bbfb62 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -1282,9 +1282,9 @@ cpu-thermal {
 
 			trips {
 				trip0: cpu-alert0 {
-					/* start throttling at 50C */
-					temperature = <50000>;
-					hysteresis = <3000>;
+					/* throttle at 57C until temperature drops to 56.8C */
+					temperature = <57000>;
+					hysteresis = <200>;
 					type = "passive";
 				};
 
-- 
2.27.0

