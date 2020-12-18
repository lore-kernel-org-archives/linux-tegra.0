Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAD7C2BBD4
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Dec 2020 12:13:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 324A723A51
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Dec 2020 12:13:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727369AbgLRMMv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Dec 2020 07:12:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727292AbgLRMMu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Dec 2020 07:12:50 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B553C0611CD;
        Fri, 18 Dec 2020 04:11:38 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id a12so4847418lfl.6;
        Fri, 18 Dec 2020 04:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=22N71TOJJRsiKxj6+XQsBhRvzAjQjWt/Iu+dBnGRxH0=;
        b=J/UaP99asbmOYK0//7qxaEO7f550S5iDYoVmGrkWhA4ELYzw/E9dBWgyBAZutyy52S
         A2RJNaDUlx62bew8p8M+xUdQseky/P9KchU4xQaR18tBIlYM3uiIeEpqaoyZkDwoBl97
         dtKVjelhw3DGwr3Ei9cpPqsK/Zlgq0GJ7tD0hLV9O7JdvyqQTPuwFfDbZIkwvL1k6mDh
         8YD6XiCWplevZFURMb4jqGGwpwQ6HDkcFuk4tbrO8rvSkf3z6w4X7FrRHt0ksbG++7l9
         6hbPKwEcJcEDHNLyUedRNuJnISKT1nNZ9h+aZGc/HL0Y2iFI9qqLDgjkLB7y5ELHC56i
         Aa+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=22N71TOJJRsiKxj6+XQsBhRvzAjQjWt/Iu+dBnGRxH0=;
        b=CxH/lB5Aut8wPLdRbPTfP8sfcX9X7nVGyPqmRAB6iiDQULGbiZ4drTSCU/il5nEVyj
         +GrEEAcWVsorGr5sJ8LSavz5D+sckFyTgS+H5F90X62kBbC3smbpZmtCNeKXlrTXY/3K
         9Ax7p479w+g/O8FGWSNfjMmjU1iGjRHiW8ANhLGR9szd2Voe8zNRKqLu1Ya3vn6Rl9Zq
         rnG8l7HJr5q3MB/lgyXF2vokgTpEiKoWhd9P0+inkuiMzEYT+X0EEAhnjR6CmuVMSc7P
         0AU1LQ/Qv6Ny5pu65NPzTIX3gkIHhnZBCroZORNULAxhhpOv/q7iJBWjMCb4wahflGou
         ibMA==
X-Gm-Message-State: AOAM532WnwDrE5JIa5iIEkFcUbaxG9sV3FjOI2IkC+WCGAevDt5YtwFy
        T32drEy8UTAL54fSpW2D/To=
X-Google-Smtp-Source: ABdhPJxt1ewFhBfxe1e5QGJ1G/2gZw2CQubl6mT/Cj18NcCjxskQ17NKEL7BIOQXg9TXCchLjSg03w==
X-Received: by 2002:a2e:6a04:: with SMTP id f4mr1754791ljc.255.1608293497031;
        Fri, 18 Dec 2020 04:11:37 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id i9sm1036472ljn.18.2020.12.18.04.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 04:11:36 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>, Ion Agorria <ion@agorria.com>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 9/9] ARM: tegra_defconfig: Enable USB_CHIPIDEA_HOST and remove USB_EHCI_TEGRA
Date:   Fri, 18 Dec 2020 15:02:46 +0300
Message-Id: <20201218120246.7759-10-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218120246.7759-1-digetx@gmail.com>
References: <20201218120246.7759-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The ehci-tegra driver was superseded by the generic ChipIdea USB driver,
update the tegra's defconfig accordingly.

Acked-by: Thierry Reding <treding@nvidia.com>
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

