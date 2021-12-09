Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11F5C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242892AbhLIR2z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:28:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242878AbhLIR2x (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:28:53 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF929C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:19 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id i5so10970188wrb.2
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ggiAP2ZX5X2LM7JWPYu3dtCeeeNVwHBEcMH0iW6rj/s=;
        b=B/Mwt8QH6kkqGwB7Z0mWvmiYfy6JNxJzYqoZHkEgx9RhC1liYxdWW7X6yQ6j2WicVT
         Iyibc1mjSb4vT9RD6UiQFEFuPqyhWpetsTmDvH3jdxyyPHRzgJdEERMKNoqUgQh1ElxI
         bhM4dZN1MR61Hjm6J20I0X7ErxjI/vnZiaD0SrCmnO4DdUs2JcVNiKIvif2D/5VEIwxX
         EBhOTqD6xieLbzsxdEQrcfAdLxltni76KwF3tSrAw7YyPbvTNaDENUktadGenqT/rA9y
         aAV1w8WUqLm2QI0AYsj8567EQ2gBi9Z0p91AUFgJtgBusuyxA1YM+VBi0BILhG3B1YE0
         YYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ggiAP2ZX5X2LM7JWPYu3dtCeeeNVwHBEcMH0iW6rj/s=;
        b=RGzqTo4bOjietvJBxwjNT9nQcEhuPRMEOHUmmAYLdDaWuniEXuHtHZPVF1T1t3VaA0
         UQ2I33pjs7MnLxlPKHx/kvpBH6zvLVQnzV/jvyB9tZ73YW1zEvwRcNIItgqPUNU00vHs
         mRgkkZr+fBCu8AdXh3v3tBSjZ7BqOiVKynkmGVcZprDj1ezxuV5yp0mR9GB3CJI+GaZT
         oHVmYWHvA3FLIb++SeuTl8Vw5H6pH6CwDgOVxba1NdYVxeVSWSJQfoNOrsHxIHyHjR/s
         Tt0XlKMITfv8wVXUMzdNhrBD7PK+ZXpXjo9ZGoKDivc57t3dwhYSWDG9vZ7ilmygzwjc
         PZyQ==
X-Gm-Message-State: AOAM530QqRf/5rYF0l6N2dAHCCMlmPNNorLAk5H4iSzRXBiyWjvNuy76
        05lM8P3eSFWKmaL2bxdQnSM=
X-Google-Smtp-Source: ABdhPJwKM9bYVyX54vzHAh3QIk74x2OXcBj5A1ABgPNzRG38Cd1wihi05U8cgSEmyaoSUkhzI2iUiA==
X-Received: by 2002:a05:6000:11c3:: with SMTP id i3mr7764971wrx.426.1639070718386;
        Thu, 09 Dec 2021 09:25:18 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id az4sm9624392wmb.20.2021.12.09.09.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:17 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 05/30] arm64: tegra: Remove unsupported properties on Norrin
Date:   Thu,  9 Dec 2021 18:24:38 +0100
Message-Id: <20211209172503.617716-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra PMC device tree bindings don't support the "#wake-cells" and
"nvidia,reset-gpio" properties, so remove them.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index f9604968c01f..f16acb4cabaa 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -885,14 +885,12 @@ MATRIX_KEY(0x07, 0x0b, KEY_UP)
 	pmc@7000e400 {
 		nvidia,invert-interrupt;
 		nvidia,suspend-mode = <0>;
-		#wake-cells = <3>;
 		nvidia,cpu-pwr-good-time = <500>;
 		nvidia,cpu-pwr-off-time = <300>;
 		nvidia,core-pwr-good-time = <641 3845>;
 		nvidia,core-pwr-off-time = <61036>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
-		nvidia,reset-gpio = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
 	};
 
 	usb@70090000 {
-- 
2.34.1

