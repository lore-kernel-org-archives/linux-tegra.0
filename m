Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88426C4332F
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236262AbhLIR3I (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242877AbhLIR3G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:06 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A778C061B38
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:32 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id i5so10971144wrb.2
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AhDEjMctY7GtlKZfNF5JSWA+ovioh6zSyR/7n1Spgjw=;
        b=ZiqHt46GorAw7R2928r19+8f3VnmWs+rJRs1e4bHAufiwlorowjivPEaCuxBNCNKrd
         xuAkN5+PDf+C4y/xpJjreWAydONMDO7Q5QGAKS7/+uokL80wX5uv7NpTbOY/562VzidI
         SWwMer5Am8El4QI607iI/fE7TxUlm+F8HbO0AMXzw+XutyKb8QqFdwXNJpDZit7Bx+wm
         bd/JZWVY2Yw436cVI3XIpZs/u927zJ2EYFAkwoTHVGY86kq+Yocg9L2wtrlfvhD9zIDc
         c7WHy/JkOCQuWRnN/0WsbDl6aWNGBw5rAUj0cXW9YR/Gr+bxb9SXTTGlIFeJXKLu7d0B
         pD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AhDEjMctY7GtlKZfNF5JSWA+ovioh6zSyR/7n1Spgjw=;
        b=ZLqCBbajYPs05KlcFqNZk6IkC0Dl8+kmNvd5LXwXNry7q+ZacaSF/X/bS70lidrqsD
         O/V3o9QxYaXD4cn0CNvXuNCKmna25tHY6/wfuAOo0skHaXSesyRYWRBMyuhkC1NxiYQT
         2p2BDOg4r4/8xLJE6jdYvg/qCEgli/eu2eRa/AuWihtnTpErZUj0S9VVQ5td142IyjFE
         LvnWJCBdCZ1NtG2gnDdMEaMf/H/LxEcmEJ7YttqzYBZZs6cfrcqODyKN3OkFxW3tp4m7
         Htdvy6jtAXe5QEpKdRIgWOkM81p2GHw3IDlzcrPOk0wzEiD9BhWZk6mDli40E39WY+j7
         CRVA==
X-Gm-Message-State: AOAM5315qwsUVOsz15LXxnDOIpL3sWLWMA782C+SpR67hAfa/p0yB7Tm
        747yP+gKsWA4bYNj7j2TZoo=
X-Google-Smtp-Source: ABdhPJzJ2KzxnXFloDGIrp8LKWY9BfudzTDmjLZBexsq/O9fQxHAdgHqcCSC/myjCcusp3tJVWOzcQ==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr7963995wrz.286.1639070730879;
        Thu, 09 Dec 2021 09:25:30 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id u23sm326672wru.21.2021.12.09.09.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:30 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 10/30] arm64: tegra: Sort Tegra132 XUSB clocks correctly
Date:   Thu,  9 Dec 2021 18:24:43 +0100
Message-Id: <20211209172503.617716-11-thierry.reding@gmail.com>
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
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 16673d3bf6f9..e41671fcd7e3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -674,8 +674,8 @@ usb@70090000 {
 			 <&tegra_car TEGRA124_CLK_XUSB_HOST_SRC>,
 			 <&tegra_car TEGRA124_CLK_XUSB_FALCON_SRC>,
 			 <&tegra_car TEGRA124_CLK_XUSB_SS>,
-			 <&tegra_car TEGRA124_CLK_XUSB_SS_SRC>,
 			 <&tegra_car TEGRA124_CLK_XUSB_SS_DIV2>,
+			 <&tegra_car TEGRA124_CLK_XUSB_SS_SRC>,
 			 <&tegra_car TEGRA124_CLK_XUSB_HS_SRC>,
 			 <&tegra_car TEGRA124_CLK_XUSB_FS_SRC>,
 			 <&tegra_car TEGRA124_CLK_PLL_U_480M>,
@@ -683,7 +683,7 @@ usb@70090000 {
 			 <&tegra_car TEGRA124_CLK_PLL_E>;
 		clock-names = "xusb_host", "xusb_host_src",
 			      "xusb_falcon_src", "xusb_ss",
-			      "xusb_ss_src", "xusb_ss_div2",
+			      "xusb_ss_div2", "xusb_ss_src",
 			      "xusb_hs_src", "xusb_fs_src",
 			      "pll_u_480m", "clk_m", "pll_e";
 		resets = <&tegra_car 89>, <&tegra_car 156>,
-- 
2.34.1

