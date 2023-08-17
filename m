Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C04EC30627
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Aug 2023 14:14:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351775AbjHQOOY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Aug 2023 10:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351857AbjHQOOP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Aug 2023 10:14:15 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D082D76
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 07:14:13 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fe8c3b5ca0so12551002e87.1
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 07:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692281652; x=1692886452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+tHknOI7JaVWjfYOmDwv/0ZujBFnzelCArtdey6TrU=;
        b=KNnl5LKLT+Z0i0aqp/nfRxB0T7uKw+OqfMWnFZSoG8wnx6DTGMd2fllILz05oUdwGl
         FDIovmZcpY3Ey6Vqmsbk4DJzoIPs5ZRx9VzI9kDMCqsPbs26kuRTqVHyt0xtWuyi+mnT
         t4TwK8j5JdgjXGtahpe89s1ZoV0Tj5isLmK1Pu3kjzmGtPNJze8WKrq1rGka56YSRKhh
         PMbdMle0SSNey4z7NlS5HPSpUvaLQhQJWjQWJC30vyvPO1RscW+17jl2uarGdGJZb0Zx
         p69xYXiajnZWL9MBv+dJqU1ZF7+CvZapnhcwEclkvvcVYNIuMp0NDg6oJsAlYqhIug63
         LFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692281652; x=1692886452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+tHknOI7JaVWjfYOmDwv/0ZujBFnzelCArtdey6TrU=;
        b=j9MfPMfEz4NfvquRFWPtjcmzD6LzuYAkPfWf1o9xbDRIF2vNW8yY0fW4c51bYvdqMe
         fGrXcR7+qLTpFRcgP7AvdwaZ4Oq+suODmhnS5VWlKzY7JcxnPNUz/g/TzOf7KyQ6yaZZ
         k2B9+DjN5lHWLLs2gncAbNoy+gWrtQfuNTUHrhWlvZi13MP0ZI2+ZZfximjM8jHIWzmR
         EzB3+O1eUWwR9fu0Y7/kkbZxYlGsCBPZmmZxH3TElVJvPv+SDmmYz50S1rDROpcpT1WK
         6iFydggFW7DHndwCCbKQEZRzgNFCs87vUfYoepyAq9FHtkq35hNfGivetfe81WBK7Azj
         sPQQ==
X-Gm-Message-State: AOJu0Yx52bh+v8AFiKm8MUcjaV3ZfNXVYZAYv1zrggk5hal3UEKs3LD4
        waKUTSOBEWi23btzvdrUxnEE/YR279s=
X-Google-Smtp-Source: AGHT+IFbSiYz2DPLao11CwQ+7P9E2sUp/XGSvSwcMevl/SRXbo2umDztUVfTzLTMGIaXY+56w8gfwQ==
X-Received: by 2002:a05:6512:3e1a:b0:4fe:19ef:8794 with SMTP id i26-20020a0565123e1a00b004fe19ef8794mr5335908lfv.28.1692281651828;
        Thu, 17 Aug 2023 07:14:11 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l26-20020aa7c31a000000b005224d15d3dfsm9787264edq.87.2023.08.17.07.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:14:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] arm64: tegra: Various minor device tree fixes
Date:   Thu, 17 Aug 2023 16:14:02 +0200
Message-ID: <20230817141407.3678613-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This contains a number of minor fixes to various 64-bit Tegra device
tree files that are required for proper DT validation.

Thierry

Thierry Reding (5):
  arm64: tegra: Add missing current-speed for SBSA UART
  arm64: tegra: Remove duplicate nodes on Jetson Orin NX
  arm64: tegra: Use correct format for clocks property
  arm64: tegra: Add dmas and dma-names for Tegra234 UARTE
  arm64: tegra: Mark Tegra234 SPI as compatible with Tegra114

 .../nvidia/tegra234-p3737-0000+p3701-0000.dts |  1 +
 .../nvidia/tegra234-p3768-0000+p3767-0000.dts | 11 -----
 .../boot/dts/nvidia/tegra234-p3768-0000.dtsi  |  1 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 40 ++++++++++---------
 4 files changed, 23 insertions(+), 30 deletions(-)

-- 
2.41.0

