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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADD0C433C1
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Mar 2021 15:20:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3A7661965
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Mar 2021 15:20:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbhCTPTd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 20 Mar 2021 11:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbhCTPTd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 20 Mar 2021 11:19:33 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4975C061574;
        Sat, 20 Mar 2021 08:19:32 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id z8so15541979ljm.12;
        Sat, 20 Mar 2021 08:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JgAOs5NJiBzLzOw6K7ViZofCJP2VNAXeFfUuuWC+yjo=;
        b=FJA2mCAqsvG0PTcZmxpC4dMLCLFeW+5dZ6P4IdhjqGNegsZT/eXylQukluWKkPNFmW
         3kxH/3jNFSrn73diMzxWbiPeTQ0fsa5JVH0gSwZD9yDjIFBO+pxRnytXJkGDIxGhjIHT
         v8hldbsYuEkz0Q2kR/yUCLoAr/QmheCSJS5we3tbHocpsxqSDCGlObir50n47054vPze
         Fr2VmhIehDmYVx/wVzyV9atnzkKTl9CDecaB9ZlBruWq9PKs6GKpzhad1r/a6IJOAO1p
         LNfR5RgfbDgeLEPZHm9OZWzA1h7Xh9lorpCBqpez9T7QP4QMdlwcXEO71LwhworJzPJv
         R7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JgAOs5NJiBzLzOw6K7ViZofCJP2VNAXeFfUuuWC+yjo=;
        b=kIxd6bznvOpTgRtYhhw1l37z+CibR7W7O5bLRSc2+PVi0pV3v0eetX9LRRKfNfL1Fv
         uR6H7+r0IyAEWgbUQa4s38+vE400ny3V9khO+1Sqr8Ys3OR7oTwTZrsAfMf2cl7r65kQ
         CZRb679Ut84Lvsj9BGpgygY+5WbQkkolkFxa9mUOVTtVaMysUH9h65QClCi8ApwgdWO3
         Wa/l165EiqVGx3amtFKbXVf4xNM0paTWB2qUqBdAxT+YeAPwu4XirbUOspAKJRn4oiux
         axEm5+outnN21p2G6d0VyxjPW6fXRbg9zfiOa6g5acXWJuO1ZWwmLOdlFewUzERVfGCY
         QWKQ==
X-Gm-Message-State: AOAM531leIfQ3gRbckhvUjT3EgPFbYQQbheQ1ukZedgq0cucQX7x7uUW
        AY0GR5n7eYDfExhB6KjLNRY=
X-Google-Smtp-Source: ABdhPJwJwKczHf7a8qHqvASusL+WQYIgEMXG3VrAZ+oNhdP6HwUw/NfEnVBx6dNL4Pib1cCJwgUcsg==
X-Received: by 2002:a2e:6e1a:: with SMTP id j26mr4044038ljc.171.1616253569011;
        Sat, 20 Mar 2021 08:19:29 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f8sm1162447ljn.1.2021.03.20.08.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 08:19:28 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ARM: multi_v7_defconfig: Stop using deprecated USB_EHCI_TEGRA
Date:   Sat, 20 Mar 2021 18:19:14 +0300
Message-Id: <20210320151915.7566-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The USB_EHCI_TEGRA option is deprecated now and replaced by
USB_CHIPIDEA_TEGRA. Replace USB_EHCI_TEGRA with USB_CHIPIDEA_TEGRA
in multi_v7_defconfig.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 3823da605430..d3242264514e 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -791,7 +791,6 @@ CONFIG_USB_XHCI_MVEBU=y
 CONFIG_USB_XHCI_TEGRA=m
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_STI=y
-CONFIG_USB_EHCI_TEGRA=y
 CONFIG_USB_EHCI_EXYNOS=m
 CONFIG_USB_EHCI_MV=m
 CONFIG_USB_OHCI_HCD=y
@@ -817,6 +816,7 @@ CONFIG_USB_DWC2=y
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_UDC=y
 CONFIG_USB_CHIPIDEA_HOST=y
+CONFIG_USB_CHIPIDEA_TEGRA=y
 CONFIG_USB_ISP1760=y
 CONFIG_USB_HSIC_USB3503=y
 CONFIG_AB8500_USB=y
-- 
2.30.2

