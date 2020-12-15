Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABCDC2BBCD
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 20:30:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9708D22573
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 20:30:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbgLOUXk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Dec 2020 15:23:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbgLOUXM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Dec 2020 15:23:12 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D54C0611CF;
        Tue, 15 Dec 2020 12:21:54 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id m25so42701790lfc.11;
        Tue, 15 Dec 2020 12:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NiGZvLOgQKcEvFh0a0FUmNFhvqrnqyE23ruUDRJZB2I=;
        b=QjcxInygzQDn5Q2Y6w1yyIP9hqWYhCCfGUb1W83mJ/+Q9j1XajUymEW5oudaawQQx3
         sFiuMMVA2EbvB09FJeDuu2094e4N2OwgcjopoSObtRdOJ5ux0ozEcJsS1xCaz23axWoX
         LrDC/gEMFSxKR4vhI9C82VJvtM5t/YZrOGcHgjtmCdjwbjk62KXeAdFeQRVih9Xf5HtS
         ArCSyOwSoVyujV3IvFShs7Ac/8bEQCQH1bZhT//7nCp0KiHfBtcsVwIyzWciFkjhIqWE
         VizNSwRqUzgzH0Lh+JTUmaz3BV0ez2Dtc9KgzHQjnhTb5rOiTv01EKnOGd3U9Uj4+bpE
         sffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NiGZvLOgQKcEvFh0a0FUmNFhvqrnqyE23ruUDRJZB2I=;
        b=I5QvqleGQRmCgjC1BAnT1KSybQUw3qVk/NfpvtZGkhrjVIn/XcpaIOAZXcq4oSm9Wj
         pqUunPI5vZ6XipfOXBaJy3Gnl5orJYjyN9HKbXWxiRUHssQ0JWLri1IyzkUSrpCOKPpr
         JolvIFwDC+gZbv6Mqo5ibOdWnp3eJwlObYneDgDbUQgKzRhZ9MvppHDWunSa5CuBRkXV
         4tQac3Uw+kYoYeQ8DSAVE8sXTdJiFH05GvwVh+NH8vLRQcSg/RgMTC3WVm7d+TI2HJ51
         okxNSX47QyAwFMXnMXDNwLVum3Px/4FzaXKJ55yX2GJ9H0pytAkYvbvtGrfQP4RltWNu
         b2FA==
X-Gm-Message-State: AOAM533IXrtQ1kkyUhL5T8qkmZi/gXevluN6o5oNw27xcD2Lr8Qzl220
        FaY4yqZE4CCRyRG3sm6CmWM=
X-Google-Smtp-Source: ABdhPJzkaum52qZSSRrn3kFMmBxupTarz67eo18LBFI2iCUwfw9etjBbHdWJgNUEg8mbU5ApFg35/Q==
X-Received: by 2002:a19:a0c:: with SMTP id 12mr11822065lfk.436.1608063712582;
        Tue, 15 Dec 2020 12:21:52 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f3sm2873711ljp.114.2020.12.15.12.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 12:21:52 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 8/8] ARM: tegra_defconfig: Enable USB_CHIPIDEA and remove USB_EHCI_TEGRA
Date:   Tue, 15 Dec 2020 23:21:13 +0300
Message-Id: <20201215202113.30394-9-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215202113.30394-1-digetx@gmail.com>
References: <20201215202113.30394-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The ehci-tegra driver was superseded by the generic ChipIdea USB driver,
update the tegra's defconfig accordingly.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 74739a52a8ad..ae0709265493 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -237,12 +237,13 @@ CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_TEGRA=y
 CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_TEGRA=y
 CONFIG_USB_ACM=y
 CONFIG_USB_WDM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_UDC=y
+CONFIG_USB_CHIPIDEA_HOST=y
+CONFIG_USB_CHIPIDEA_TEGRA=y
 CONFIG_USB_GADGET=y
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=16
-- 
2.29.2

