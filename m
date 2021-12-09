Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C72C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:26:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242908AbhLIR36 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242923AbhLIR35 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:57 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB83C061A72
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:26:23 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id u17so10974016wrt.3
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h0h66338u5hSxqQTPm/OSloK0s/WKr6FBpTI53AOt90=;
        b=Kfq/iLJFifc6+N7cac+YoXGag5MCo8ryyg/Lz+4gTHMK2jGGi6M6/X3s3bpmnCnMM1
         NUcxtmEmn1vfTjtJISEec5ZaTMjowte07U0xUiGMTIQnoNmaWUB6QbW/+JNQmz2DaK1k
         lXJIQArX2CIYTGou9PfBihUHSyFEYkLpdp+B/4e4dWhynFC8ZOdupf6J3/aziZGGMBrT
         6UJ8fYJJVXHcKo5C7Cxr3kAhcyD149O8xcZcr2qdw8m55X3fuMfggDxZqQxtlRD5LLvd
         q7yjm3fQqu0w7GDlovbRKHDwdvlkVy8RVu4OURAW19aCdpmV0efw0r1e9xaJXvQxNlAz
         c8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h0h66338u5hSxqQTPm/OSloK0s/WKr6FBpTI53AOt90=;
        b=biH3+gsgTNlM1SKG4BobM0BDagSzntMCvhznewZguObHlIqxqTcF23PIVwf9UBOyVO
         L7WXIMl3StK4wseaxo/L6Mz3Lr9eVred4O5i8XX92olyVVbJNUW5XCnFmjU8N+Fc0+hl
         VW1IoRUN5K/btsXDJ5ObgJ+d1mtQgz+0OHnvg+/KVoHzvElVHAfQJowUHZ6P9Mr/lKJ8
         OYF1etQKX7MZwsKq5dWmrMUXdcEjPlSDmHK5Wr4P3ThFJza1KpQfhCZIF1h/ZBlPY0pi
         vXw3aK2vJ/ciuYxiMVl5xxPwerjRuTl5Zm6ES8ZS9muwZQb5cp7Dsdz9M8x7Q1qEVBwL
         iOMA==
X-Gm-Message-State: AOAM533Tt0TOstRNf8hR4JZ2oSlHCYDC4ZJVqepEJvj3BP5ukpXUpb3W
        AVOfqDophCylUtV9WfwNejw=
X-Google-Smtp-Source: ABdhPJxpuQ0KpgReTM+uGi/YIBxAA4V4vJ6zvbTuOWc2mby/zla56MJgODQkCjuz7dxlgwcdW+fyeA==
X-Received: by 2002:a05:6000:15c6:: with SMTP id y6mr8070376wry.422.1639070782294;
        Thu, 09 Dec 2021 09:26:22 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id z5sm11837844wmp.26.2021.12.09.09.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:26:21 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 29/30] arm64: tegra: Remove unused only-1-8-v properties
Date:   Thu,  9 Dec 2021 18:25:02 +0100
Message-Id: <20211209172503.617716-30-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The only-1-8-v property is not support by an DT schema, so drop it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi | 1 -
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts     | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
index d3c936822186..d95a542c0bca 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
@@ -11,7 +11,6 @@ mmc@3460000 {
 			status = "okay";
 			bus-width = <8>;
 			non-removable;
-			only-1-8-v;
 		};
 
 		rtc@c2a0000 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts b/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
index b5d9a5526272..5804acfc428a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
@@ -26,7 +26,6 @@ mmc@3460000 {
 			status = "okay";
 			bus-width = <8>;
 			non-removable;
-			only-1-8-v;
 		};
 
 		rtc@c2a0000 {
-- 
2.34.1

