Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88ABC636BD
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Jan 2023 16:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234970AbjA0Qh0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Jan 2023 11:37:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234971AbjA0Qh0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 11:37:26 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E466A53
        for <linux-tegra@vger.kernel.org>; Fri, 27 Jan 2023 08:37:23 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id m12so5230822edq.5
        for <linux-tegra@vger.kernel.org>; Fri, 27 Jan 2023 08:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qslg5XG8mE+piCZm0kfzf1q3jxWT8RdGIOugoI0ncw=;
        b=lvdfNB4yM7Kplu5m48DXESFlhmMLCOc/2Qz01MDeVn8aczXb1Ov7fro9GAG+xez5Z3
         cLBshrHaVlyt1tUm5wWKDKc0TfeCc7Iqy47SBiRsFS7X3K7WxRLwSONOwPgEfGYbppNB
         R5GI/M8S9V/DO2PYFEnTsuf6/m7NoHx5KKYPLl5JH38FqU8CRmqLNoRLerZ1IK0VXZX3
         TtypQtrAi+6szDqykDsbxUqXCt41jdVF+tgkzBeVqUguPgkFVGO9J4klfdReO6nfrSvP
         axYu03cZ//IJhgsXaKULM627jctIaDAaBAJ7Ud62BQH0s3rtFBgpgNCI7VqJPM0aIWzN
         qYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qslg5XG8mE+piCZm0kfzf1q3jxWT8RdGIOugoI0ncw=;
        b=40igPGoXDmEXv4HpEtPbEtNpIGPq2Dd/oopIXzRVxUbzo6hKPNeVlszNe2d1rcxZ8E
         Ig8jjwQrGEd5EJ45UaBgddywQjQn2vG3sr3wxb4fug+YJrSCiwJ2wvDIPHWnaDbNj5Mo
         SHsc+6oAMFlKM1E5tTb8oqfXOZWihPAon3QpC7RnyJr1dIcq9lGmmIBqVZwCv4WHLcVo
         ohvZigd/ARnavPd7jhnbMQNQHFN68MNTmwTSQMyXTD31ZOU1CVtx92G5XtXyc3OlzWfM
         zsnG/L+Tzw4cooOsxFdKnlDMjWvZX5iJpT2JqG36kvUGLur2ravHb1+FjhpCRmX+qmdu
         ZTRQ==
X-Gm-Message-State: AO0yUKUXiAEI6+MexwL0kzTGktFmntJ/lS2Uwr8Mw0e++lhv0m78OKRR
        TSabjunkMxRTXutow/gQVy0=
X-Google-Smtp-Source: AK7set8OSXFFJtZkqitX+KkkfAYs0f3mNZlMlTAWoqc1e9KtysDoig5HUJG7US4JaeR88x62m3nehg==
X-Received: by 2002:a05:6402:1a5c:b0:4a0:8ea1:cce with SMTP id bf28-20020a0564021a5c00b004a08ea10ccemr13895721edb.25.1674837442296;
        Fri, 27 Jan 2023 08:37:22 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bd16-20020a056402207000b004a1166a631dsm1956837edb.94.2023.01.27.08.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 08:37:21 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/3] arm64: tegra: Device tree changes for v6.3-rc1
Date:   Fri, 27 Jan 2023 17:37:19 +0100
Message-Id: <20230127163719.460954-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127163719.460954-1-thierry.reding@gmail.com>
References: <20230127163719.460954-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.3-arm64-dt

for you to fetch changes up to 682e1c498ae793ad90587171c93c1f7ec87aa208:

  arm64: tegra: Drop I2C iommus and dma-coherent properties (2023-01-27 17:08:58 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.3-rc1

There are two big changes in this: one is to bump the #address-cells and
the #size-cells properties to 2 so that bus address translations work
correctly and another to sort nodes according to a scheme that we've
been trying to follow, but where some inconsistencies have accumulated
over the years.

As for the rest, this adds mostly new things on Tegra234, such as USB
host and device support and identification EEPROMs found on Jetson AGX
Orin.

Some cleanups are also included, such as the removal of unneeded
properties or duplicated nodes.

----------------------------------------------------------------
Jon Hunter (4):
      arm64: tegra: Populate address/size cells for Tegra234 I2C
      arm64: tegra: Populate Jetson AGX Orin EEPROMs
      arm64: tegra: Add dma-coherent property for Tegra194 XUDC
      arm64: tegra: Populate the XUDC node for Tegra234

Mikko Perttunen (1):
      arm64: tegra: Mark host1x as dma-coherent on Tegra194/234

Thierry Reding (6):
      arm64: tegra: Fix typo in gpio-ranges property
      arm64: tegra: Fix duplicate regulator on Jetson TX1
      arm64: tegra: Sort includes
      arm64: tegra: Bump #address-cells and #size-cells
      arm64: tegra: Sort nodes by unit-address, then alphabetically
      arm64: tegra: Drop I2C iommus and dma-coherent properties

Wayne Chang (1):
      arm64: tegra: Enable XUSB host function on Jetson AGX Orin

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |   16 +-
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |  232 +-
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 2548 ++++++++++----------
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |   86 +-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  | 1176 ++++-----
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  486 ++--
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   36 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 2324 +++++++++---------
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 2445 +++++++++----------
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |   36 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 1623 +++++++------
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |   66 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |  278 +--
 arch/arm64/boot/dts/nvidia/tegra210-p2595.dtsi     |    3 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |    5 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     |   86 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  384 +--
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |   66 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  310 +--
 .../arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi |  130 +-
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 1943 ++++++++-------
 .../arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi |   24 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 2097 ++++++++--------
 23 files changed, 8367 insertions(+), 8033 deletions(-)
