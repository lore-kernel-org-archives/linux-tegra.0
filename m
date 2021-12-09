Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA314C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:35:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243096AbhLIRim (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhLIRii (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:38 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B91AFC061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:35:04 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id p27-20020a05600c1d9b00b0033bf8532855so4694160wms.3
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FC7M7/ABqFcRz49NZ1gJ3XIXfsn+OaV7YPJ2bmCcHO0=;
        b=hvOUFQhMdp7Y/zIwlmG396PXYZ7ampmO4xNYRfb6SGHXSTGiMB+e4RdiE8uSAefUNL
         Fc2Lkbn/J9h5za4Kc+5g3lTavZsB47ZeviBirBaO8NiHlPxstyNV07i8VWk3YlQRBQWy
         VvU3w2rar8p4bsnBZGu7mkSUMTRjyTYljscNa0DnEyrOZT2rC+ZVgyi928/huz5kTyzY
         5SdgMgpRb3hnVyZr5rTbIl9Zr/CVhvr/cvWO2LawRWHv2ECoBypgjJ86FunN8MzO5Z8y
         mFTNBxjUtZj1xJmeM5cn1nmrpi7unpG5j95AkGxMwONxv/SUn3uFmqzpSRaiRf+wAUnk
         7vSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FC7M7/ABqFcRz49NZ1gJ3XIXfsn+OaV7YPJ2bmCcHO0=;
        b=hJ4FOO9oz4wYP/sBnAQ+EAaFJ88MeWmr17GmUQQTWkRDwMOinsln1EiHayoDfsy9lg
         fzN2QzTj+ZvWX3HAZXQEKKjPsY3Tde0TdJddwFbp2ntzKaC8JXvPTasma5FaVnt0cl92
         GhFHwbPhwZwc11DUPnyno8Pe6LUV7PSK3AzmYtoqrxatNiEwwq1jWfnIyN/dALf5jqPa
         wxhm3Y0c+0wjXCQeNfDU9iByABaqQdqVStoA1ZFwjYSjxrOaIUYUOIukSsSayhISaGKn
         uFUqswkLDD4eLBkk3tlSCOsznoEg25MiTou3+0ykZBWKjrmXjO92VS/uGOqP7UHRU8/j
         TA0Q==
X-Gm-Message-State: AOAM531QabysJjpw5lSy/mRxhO+XMkvcuccOz0RkYvt6Nw77lTqGjvSs
        Bhd7WTaj1WDcQ968hWjUFJI=
X-Google-Smtp-Source: ABdhPJxC1ktFfPuGUzOeMqRSxaRHpIqAa/tOne3faWQ7WYs23MoqwuPUCRm8SHSp+pvkBjuTDmEesw==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr9007668wmc.89.1639071303295;
        Thu, 09 Dec 2021 09:35:03 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id bg34sm9991725wmb.47.2021.12.09.09.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:35:01 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 23/25] ARM: tegra: Remove stray #reset-cells property
Date:   Thu,  9 Dec 2021 18:33:54 +0100
Message-Id: <20211209173356.618460-24-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Ouya board specifies the #reset-cells property for the GPIO
controller. Since the GPIO controller doesn't provide reset controls
this is not needed, so they can be dropped.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra30-ouya.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
index 4259871b76c9..fd64aadc472a 100644
--- a/arch/arm/boot/dts/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/tegra30-ouya.dts
@@ -70,7 +70,6 @@ hdmi@54280000 {
 
 	gpio: gpio@6000d000 {
 		gpio-ranges = <&pinmux 0 0 248>;
-		#reset-cells = <1>;
 	};
 
 	pinmux@70000868 {
-- 
2.34.1

