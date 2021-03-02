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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6B9C4321A
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B088764E27
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377954AbhCCDbZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350250AbhCBMOh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 07:14:37 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F2FC061222;
        Tue,  2 Mar 2021 04:11:06 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id e7so30935462lft.2;
        Tue, 02 Mar 2021 04:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o+6Qr9g4GUhZQovcGPL0QQ9GPJLut7iCnnUkdOOvXTs=;
        b=aD/8+G0FqpgQh/VfevNajV3a2cmtjpq+6iPC14mRaCGUF3cWlwt5JXomFe1n5SXgqO
         0PiyvFaCbLzW4we2sersXd9sevCukJlWYZpCGy7aAS8JjvGPQKW++PkaD1uY0Y/3Vef5
         QA0w9Vse07bqSg4rPRy5wLDvx5ZHdbu2K1KGu8P5n596HLctbl27UkFDGDG9OFS9wGv8
         IQaG+BJJcmzWHatkIIgOBCMNIwTarqQiYT+eVqL/Qlc48TIOi2zbgyQWRZmSmx138m03
         vRjHRnpa6fYVEws7d1MzximC7RHYtWrUebVTaj0sn71WrRMipCjVIqL2+ZHMWTQTH+jN
         /l4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o+6Qr9g4GUhZQovcGPL0QQ9GPJLut7iCnnUkdOOvXTs=;
        b=Ivto1iwu3tlpEA2YmZeF8ZZKY7OWB14LLoJwyY9HOazxJ9EyzAtd01S34niwCLjRvs
         9FV8Fkhqy7yooRPwd+mtDK/d8aiz0YCrXIC/vsmyIudprihW8ew3t/JX4lnPcCb7M35/
         AR8fymNsJICQfHRscTMPjES0rT0Nv65l1HlQzRW/EifRimmpcBLCiWp1fTmqKLw39uGp
         2VDl7Xmbuq/l6cHqlc6vQuAOd047nNn2yQwReIwFXySaL9wiHTJVlX7xSW/FMjMZU2T2
         RXIlIKueeevX1UlSCj8ODEj/7zo5DcH83QomN1Pm20OWVjyh2xdEHNUs9xcKLKJUlXVT
         c4rQ==
X-Gm-Message-State: AOAM531qQI991hSOo0apiaZA5BSTuygKnKEubMAgJYgQBzd6R897Tao6
        aD66Y1W4TdutIB8Qxj9dOI4=
X-Google-Smtp-Source: ABdhPJxxxdNLtyCUcNFwUE4mcQsK/97DSfQAxL6zTIB4zznz6EfnH3wiF8oAZKkgqxVTV7oF1trgSg==
X-Received: by 2002:a05:6512:34c3:: with SMTP id w3mr5679605lfr.437.1614687064977;
        Tue, 02 Mar 2021 04:11:04 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id d21sm835097ljo.55.2021.03.02.04.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 04:11:04 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/14] ARM: tegra: acer-a500: Reduce thermal throttling hysteresis to 0.2C
Date:   Tue,  2 Mar 2021 15:09:56 +0300
Message-Id: <20210302121003.15058-8-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302121003.15058-1-digetx@gmail.com>
References: <20210302121003.15058-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The 2C hysteresis is a bit too high, although CPU never gets hot on A500.
Nevertheless, let's reduce thermal throttling hysteresis to 0.2C, which is
a much more reasonable value.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 8531abf329c6..64a303cc5395 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -1058,7 +1058,7 @@ trips {
 				trip0: cpu-alert0 {
 					/* start throttling at 50C */
 					temperature = <50000>;
-					hysteresis = <3000>;
+					hysteresis = <200>;
 					type = "passive";
 				};
 
-- 
2.29.2

