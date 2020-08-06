Return-Path: <SRS0=WNzV=BQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E7AC433E0
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:06:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0861320786
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:06:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIR49fct"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730060AbgHFRGo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Aug 2020 13:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730039AbgHFRGM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 13:06:12 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C040AC0005BE
        for <linux-tegra@vger.kernel.org>; Thu,  6 Aug 2020 08:41:17 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id kq25so37856919ejb.3
        for <linux-tegra@vger.kernel.org>; Thu, 06 Aug 2020 08:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sQUBzqRn+ojYtqrJvGioQLo2eJbHTBHdMZpb/t+FuXk=;
        b=FIR49fctoQ/DnjLIibCA7thl/tMrSUIqCWAxIxYfxoxiB/6QupHhLHqd917iylQDrX
         x8y7ov7IIyJa2iBc3eeOpT87X98ReCAGewqsdOz6I/c2s1V5Npiv2zmw4eDbmQx4VcGO
         41TIifx7wBaoX4CJiXBdabcPqSQPjld36e1GsGj3pOqrhI/01bpEVISngfCAo93dsNhi
         N/u2S6Q/hXa3gm5toKWMdk/bFfFW4OhKrlIX3iZ28wI+rqgC2Vbz3SlZfGUflAr7WDO4
         Fydzun71kz2szfpBZ3Sgr5W4aw4Sx2dcM6TtOH8tVFtDedefPIiFStQPi6aBSGrThN3G
         WpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sQUBzqRn+ojYtqrJvGioQLo2eJbHTBHdMZpb/t+FuXk=;
        b=YM0OIzjxPF0u5QmJ5yHpXGxwUopT3TUT27PJbftzybvVrAAPKitUpncgpRZuRpEN8y
         YlndeYG6GNDbVy4XzuAAWzjomY1H7gc/QpcLIlZ7bAT9xeAavwWtOp8GCykGE5xA795K
         toX4aATFYmcYWIDNDK54uhz8kDvlB9uK9w4tIcUMen/eY6rco74Qt7pbEe7sRl7Xs343
         FB9b5HNhEE4XCo4qWDlSZKIBMbgRFkz0xG7CvuCX0S99PShTyklx4anli74l4Jx0x6ru
         ixJeIMr5O2tKz8WS7ZjQZl3rY5F0Zu4vahrRkK8x1I3EVLXoPqcoUaqP5eMpXbBy2OvI
         I6fw==
X-Gm-Message-State: AOAM532mvHxuYL5tNe/cFNJFJse7vz8yZej72R++v3hp7iP9NO1vZdqD
        1kg0hG9ccZW9HgVzIiLy9sU=
X-Google-Smtp-Source: ABdhPJyO21fAnsVlMWWY+aqLyrBvqxsl1wlQctMcmYTuiX3eWPdMpR2SbM5rNjl/kd5ikn/YvcoLzg==
X-Received: by 2002:a17:906:3c43:: with SMTP id i3mr5182318ejg.133.1596728475719;
        Thu, 06 Aug 2020 08:41:15 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id z10sm3943519eje.122.2020.08.06.08.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 08:41:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 2/4] arm64: tegra: Add VBUS supply for micro USB port on Jetson Nano
Date:   Thu,  6 Aug 2020 17:41:09 +0200
Message-Id: <20200806154111.3917284-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806154111.3917284-1-thierry.reding@gmail.com>
References: <20200806154111.3917284-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The VBUS supply for the micro USB port on Jetson Nano is derived from
the main system supply and always on. Describe in nevertheless to fix
warnings during boot.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 195a43e2356b..d34338b63c90 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -541,6 +541,8 @@ usb2-0 {
 				mode = "peripheral";
 				usb-role-switch;
 
+				vbus-supply = <&vdd_5v0_usb>;
+
 				connector {
 					compatible = "gpio-usb-b-connector",
 						     "usb-b-connector";
@@ -843,4 +845,14 @@ avdd_io_edp_1v05: regulator@7 {
 
 		vin-supply = <&avdd_1v05_pll>;
 	};
+
+	vdd_5v0_usb: regulator@8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VDD_5V_USB";
+		regulator-min-microvolt = <50000000>;
+		regulator-max-microvolt = <50000000>;
+
+		vin-supply = <&vdd_5v0_sys>;
+	};
 };
-- 
2.27.0

