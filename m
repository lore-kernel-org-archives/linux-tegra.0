Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEB4C432BE
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13EE460EEA
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233403AbhHBVVC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 17:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233253AbhHBVUz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 17:20:55 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83931C061760;
        Mon,  2 Aug 2021 14:20:45 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z2so36253425lft.1;
        Mon, 02 Aug 2021 14:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=StG+IKbcIZwECEdYhEBSqXu9eQrqr6uGhG0A53vuzqg=;
        b=V9EXrP69VVf2/x3zymaRMCFobVwL3aq1/ttMA8zdqib5BtaTkinFjEW3GE3y6brupx
         XGGWYuFhhUBUlwDDNpN9Svx29HvtYE/k6hCgJG57uZ3avxg9Zc3C3UPchX1MlQqTUYfv
         4ZVg/ZjydoB94XcTmuBo8om6tGxG99d1ltTaqUqqtrj8nC0DbCpG+xq6/XvKRCm/7WfK
         OwI/5ztP3Wq2HCuT27OmhxYWAjbr1E1OAVnnVuGRqy/Fakp/uTCcXw8mQ/xLzH+0Y5mO
         DlppM0BJLIDig7RxW/Fgb+TGs6+udP4eZq0RX1AlXh62oxJ88SJfn3AFoVrIz3ioHqXE
         P2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=StG+IKbcIZwECEdYhEBSqXu9eQrqr6uGhG0A53vuzqg=;
        b=ULOXAu1viDGF+m8snWMorfUk3LVT4sVp+Khr+BLPmJT7wyoGK+PkjFi5RnfLuiKS3q
         qxxtqtZRvngCuQYEsHioWVE67SEWTt0fq6G58HV5boqmztHVVm7C7juzn+PYCtCz5nw9
         9laJiziOXl1si4xplJMuWyW5oMOOMa8A25V8df8NMu34dJRbJkOHFq38MPhLx3u/lHP9
         mP6Obo0CR94srOpdiv+GapfMhcFZEMvQ5bUnl5MLyzHsJz9VvsTLm/y1H+aunUV0gOwS
         193uU49rmghdena5aSYO79GImisoT+uDYauTsSP+qjmbygKbM+e9iuHx8n5Kr7e0yV/G
         pLtw==
X-Gm-Message-State: AOAM5320iSrVRZikZqGOFthtLDqEe9atzsTFsQfjdx+QklSmqwDs87UI
        skAyrT0og9OpeegglzlSQ5o=
X-Google-Smtp-Source: ABdhPJwVsQek7f4I+bxcOb2VDkgCWplFv5JektS7apxN4HVk1iMYtg9VosWglfcjKrYFLMNuA+UXVg==
X-Received: by 2002:a05:6512:320b:: with SMTP id d11mr13924378lfe.502.1627939243964;
        Mon, 02 Aug 2021 14:20:43 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id p14sm764942lfa.117.2021.08.02.14.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 14:20:43 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 13/15] ARM: tegra: acer-a500: Use verbose variant of atmel,wakeup-method value
Date:   Tue,  3 Aug 2021 00:19:45 +0300
Message-Id: <20210802211947.19715-14-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802211947.19715-1-digetx@gmail.com>
References: <20210802211947.19715-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The verbose variant of the atmel,wakeup-method value was lost when patch
that added the property was merged because it conflicted with other patch,
re-add it for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 7f20ea506803..87fef4cb630f 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
+#include <dt-bindings/input/atmel-maxtouch.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/thermal/thermal.h>
@@ -454,7 +455,7 @@ touchscreen@4c {
 			vdda-supply = <&vdd_3v3_sys>;
 			vdd-supply  = <&vdd_3v3_sys>;
 
-			atmel,wakeup-method = <1>;
+			atmel,wakeup-method = <ATMEL_MXT_WAKEUP_I2C_SCL>;
 		};
 
 		gyroscope@68 {
-- 
2.32.0

