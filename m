Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43ED9C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:30:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13ED523B01
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:30:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730300AbhAVUaE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 15:30:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730951AbhAVU2d (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 15:28:33 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2375C061A2A;
        Fri, 22 Jan 2021 12:25:13 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id p13so8006024ljg.2;
        Fri, 22 Jan 2021 12:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1TFMrxk5Y5fLNqfPH2xbYxuuOS1BGXZk2VnJngWDMz8=;
        b=hzSyci+eKM6pyZG49FekHP4eXQf4qwAIgTuLB7SgmakRtiYP13pZ5WG1RrGqracF62
         3fSXqlNByfhnBQ07JJSEFsoVTbhc8nKxPXlSZCIwAN4nvXsW8fa/Ju13rNqk2qhQ0RBN
         vO7BVXdkFVw/oUZ+JGS/2hrBJW1B3GJs87eZjFZWhsBV3ZouS7JssPjqO434Vc5R0VWx
         YFdmePuZ7rGieuzth8MbS4Ocvwq1SgRI4rcjijRGlpGUTUY4x7eKYKSEpadkaE1pxlL+
         v/njw8scrDwd8YXJ0UQ8tD9IB2ScvLonaQb97S6IpzLLQfNZkJJrLn2msJaT9NmNVgCl
         w4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1TFMrxk5Y5fLNqfPH2xbYxuuOS1BGXZk2VnJngWDMz8=;
        b=SOLUUiswr8UyLMjHC2iSoG1UOx023C0J5yGg4IR35+nFVuN449wd+hrPTa7RVU2Q8E
         zbyjWdxNHetld0hvpPco0Jk9A9LGrczGUcrRc8L3ZQS1NKdh15VvuJfAMmp0023gvwFC
         01v4La6ZxDj/2F1OgLv1sjPZUfZOnORTeEahC4m98qZNNbKz+wGsnhF2WlJbcrOFT00y
         OCQ5mRGCrXYjS8AwT/1rr6KIO6jOXXxjIS1/r2aKVi2PeReWF7Y7KRO1BWyFiV0KEsRc
         RoYkY0cpxnMPchc0ZGhJ/4bRUJ6lsGt81gS7jvm9xpENwiLdDoTDOqkB64TzNgWvgBxI
         r9Pw==
X-Gm-Message-State: AOAM5306HjNyrrP2k0OvuLPrOjkzRlFTkYOcDcM/aEhIooqoQluFCc3l
        IscKtpBDf0ge2CorufgraVI=
X-Google-Smtp-Source: ABdhPJwWA7/q42+Vf+Y6LuE0qMvTBmqfwXN/Qs5MFnCIyTcOlrBi9SB2uFT7INgMFfmUPwg9rRV9AA==
X-Received: by 2002:a2e:b00a:: with SMTP id y10mr935181ljk.92.1611347112372;
        Fri, 22 Jan 2021 12:25:12 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id q5sm996921lfr.172.2021.01.22.12.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:25:11 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/13] ARM: tegra: acer-a500: Enable core voltage scaling
Date:   Fri, 22 Jan 2021 23:24:50 +0300
Message-Id: <20210122202457.13326-7-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122202457.13326-1-digetx@gmail.com>
References: <20210122202457.13326-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Allow lower core voltages on Acer A500.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index d3b99535d755..719da992fdaf 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -575,7 +575,7 @@ sys_reg: sys {
 
 				vdd_core: sm0 {
 					regulator-name = "vdd_sm0,vdd_core";
-					regulator-min-microvolt = <1200000>;
+					regulator-min-microvolt = <950000>;
 					regulator-max-microvolt = <1300000>;
 					regulator-coupled-with = <&rtc_vdd &vdd_cpu>;
 					regulator-coupled-max-spread = <170000 550000>;
@@ -616,7 +616,7 @@ ldo1 {
 
 				rtc_vdd: ldo2 {
 					regulator-name = "vdd_ldo2,vdd_rtc";
-					regulator-min-microvolt = <1200000>;
+					regulator-min-microvolt = <950000>;
 					regulator-max-microvolt = <1300000>;
 					regulator-coupled-with = <&vdd_core &vdd_cpu>;
 					regulator-coupled-max-spread = <170000 550000>;
-- 
2.29.2

