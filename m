Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFB2C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:26:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242923AbhLIR36 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242909AbhLIR3z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:55 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41BA1C0617A1
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:26:21 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id p18so4780975wmq.5
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kBEjgRxgfoRVXGZCM6MVItRDdpQixa9AaVYQQVghp+w=;
        b=guU+ZHoQ7Re5lG0VKZ8FrwhFceKaSwQfwJdyK5rtXe70+tAtRzKrz/eW+AFiDNaB5m
         jdNbHoTjBxPvunSqe8nXvLt6/aFDJ30UjnjjEra7wQZ+5om1r2nTD7WJDUTr2jPzccdc
         kiYnHSSESX1rNVrtHGxAcqFjPm06BuCXggUQNp/uz1IX5GnTIOth+az5ctx2IjfoNweK
         SgS8Cgl626TcvtJpEtFrzUiMTdkir0xj4SlePe16GHqY/v7ciEPk5dZ9LaElhhO6Lvh2
         373QRHaa28mHWgaWAxKmBR/nzDqfmVYPitk7CQVIh+hfOh0PhxVXzoZ+S+Y9sFFg5c0y
         bknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kBEjgRxgfoRVXGZCM6MVItRDdpQixa9AaVYQQVghp+w=;
        b=gjei7SG54fAzXxHZiCkqmaXM69PexX1/0TWMfoqG5PfItVX0egxyAHefBkWmB5yPf0
         JkC374n9OJ6mNl/GgaRLVoAuwGEk+Fq0JNmwu0iNJ81vlIccjY8GiTza8erD8zURl7vr
         snVWyQzjpU8D36BboiZs4Qz7z8iVskWlQxbzI9QI2FViFojVPJ6Y9/bfv2EIO1MCkS3t
         j8VBtlko/3cQSdvxrJ86DLRQwcyUkYqfvA3RBKrxFd1qkoGpCjb5MuHSRP/vDz4mxuCP
         5UzQyV7tlNCwU009Ls1xMqJpmqBhm5HDJXTHe06/C0K8tPH+fGBQ2CWnGvbCrMjgt/Jw
         gQHA==
X-Gm-Message-State: AOAM531zCQchR3cYgChVJKbbNawx0hM9oFDxbTyId2Qw/wvR5CbS/Ff5
        OMyGw6oNoU2hny4L5sjkOK7UlzhdLT5W+Q==
X-Google-Smtp-Source: ABdhPJyDJHC2Uz8fpEOHw0ckHaTxmKX6wpnu9cvd4EWGDp7snTRDzxhRAK/9UXBb2nZbRSyXS7XX1Q==
X-Received: by 2002:a1c:f609:: with SMTP id w9mr8772207wmc.99.1639070779860;
        Thu, 09 Dec 2021 09:26:19 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id w7sm279500wru.51.2021.12.09.09.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:26:19 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 28/30] arm64: tegra: Sort Tegra210 XUSB clocks correctly
Date:   Thu,  9 Dec 2021 18:25:01 +0100
Message-Id: <20211209172503.617716-29-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Make the order of the clocks and clock-names properties match the order
in the device tree bindings. This isn't strictly necessary from a point
of view of the operating system because matching will be done based on
the clock-names, but it makes it easier to validate the device trees
against the DT schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index a49a12fd84b1..aa768ea108fe 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1026,8 +1026,8 @@ usb@70090000 {
 			 <&tegra_car TEGRA210_CLK_XUSB_HOST_SRC>,
 			 <&tegra_car TEGRA210_CLK_XUSB_FALCON_SRC>,
 			 <&tegra_car TEGRA210_CLK_XUSB_SS>,
-			 <&tegra_car TEGRA210_CLK_XUSB_SS_SRC>,
 			 <&tegra_car TEGRA210_CLK_XUSB_SS_DIV2>,
+			 <&tegra_car TEGRA210_CLK_XUSB_SS_SRC>,
 			 <&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
 			 <&tegra_car TEGRA210_CLK_XUSB_FS_SRC>,
 			 <&tegra_car TEGRA210_CLK_PLL_U_480M>,
@@ -1035,7 +1035,7 @@ usb@70090000 {
 			 <&tegra_car TEGRA210_CLK_PLL_E>;
 		clock-names = "xusb_host", "xusb_host_src",
 			      "xusb_falcon_src", "xusb_ss",
-			      "xusb_ss_src", "xusb_ss_div2",
+			      "xusb_ss_div2", "xusb_ss_src",
 			      "xusb_hs_src", "xusb_fs_src",
 			      "pll_u_480m", "clk_m", "pll_e";
 		resets = <&tegra_car 89>, <&tegra_car 156>,
-- 
2.34.1

