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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7E6C11F67
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 02:51:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA87B61374
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 02:51:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237744AbhGNCyg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Jul 2021 22:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237706AbhGNCyd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jul 2021 22:54:33 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55133C061786;
        Tue, 13 Jul 2021 19:51:39 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id i5so949806lfe.2;
        Tue, 13 Jul 2021 19:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wx8pDvbbu5dTXlPECC46V6TUte+9Hhh+Y0wI3IGyQc0=;
        b=OSKHzfjYjQ/MFjOyxO2B6NTtjl9a1KDpfX4qqEPKyDIBDQ+O1XPDYmw+3zv6wG7Il4
         PBG8L5WpEXhSVlISrumZB1FKUHca9EK7wPFZ7S4XjZ+1Z7hkkXKX8RfXZQa7iWw4ZAqp
         7UZvuDBAdswJAoLapXvDkwpSPJNf8uIDq8t/EZNqh1xhThqZXOQvZeGLjxW07KcKGVQb
         LthOBij1grVMHnlZmLSA4XhHjWVo3tq+0WYl5SlP3Ek7dZkYrsWNMmovleMcCBmh96g8
         TF8oBEN4hwXWd+beSirKU8iDLQ9KAPDMRFatImHJsFNdI8xQeI8EkD3EI4mdQ9V1G5ZQ
         yYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wx8pDvbbu5dTXlPECC46V6TUte+9Hhh+Y0wI3IGyQc0=;
        b=CbBZWgCazYRBfRpVh98OwCHwNzoabg4FAm0RMbzCWOYo5cuI/Lt14a1Zg+WyvZqgAV
         UaDzsua0fWLNR8H2OJcFMsOFE1R4yXDRNvOczSG6vPd6g5H97+WvCJfSg97Mh6u5rgL0
         3JzmtcPcVBlsdXU/MoUbhFJl9lSsv8uzRzntlBy4HrgZs6LJ7pnPA3z6/pdEuxFyvgbp
         F3Rx3JXhE+GlJ8sBxs0yAZGB3d3usbrzfm9eJSbSFVnUFZrVXm2CAjtvDYikVKCj6SxS
         O4n8vt9tTsFjbFCztKk/ihfdT7UdpFktGS7jybK0PJVMKMDBv9gZ6FUW7F7l8DQJFpR5
         ZI+A==
X-Gm-Message-State: AOAM531jzc9nQRzfu2Phte6e+ts4Ax7iOdSK/eDcx8JnEuMM5lARQmLw
        rvfwbm4xzFh6sZXTn8mlfkE=
X-Google-Smtp-Source: ABdhPJzRz4AHbJ/kQiPqB0+up5v0YxlHJmYwAsCiyo9hmi/IHmSy4pVD/0SV3XFRHvBiF1IwlnehKw==
X-Received: by 2002:a05:6512:3091:: with SMTP id z17mr5973059lfd.395.1626231097764;
        Tue, 13 Jul 2021 19:51:37 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id a10sm50281lfb.93.2021.07.13.19.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:51:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 7/7] ARM: multi_v7_defconfig: Enable CONFIG_TEGRA30_TSENSOR
Date:   Wed, 14 Jul 2021 05:51:27 +0300
Message-Id: <20210714025127.2411-8-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210714025127.2411-1-digetx@gmail.com>
References: <20210714025127.2411-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable NVIDIA Tegra30 SoC thermal sensor driver in multi_v7_defconfig.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 65d1fede3825..739417c2acf8 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -525,6 +525,7 @@ CONFIG_BRCMSTB_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m
 CONFIG_ST_THERMAL_MEMMAP=y
 CONFIG_TEGRA_SOCTHERM=m
+CONFIG_TEGRA30_TSENSOR=m
 CONFIG_UNIPHIER_THERMAL=y
 CONFIG_DA9063_WATCHDOG=m
 CONFIG_XILINX_WATCHDOG=y
-- 
2.32.0

