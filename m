Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBC5C61DB3
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Jan 2023 16:37:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233726AbjA0QhY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Jan 2023 11:37:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234970AbjA0QhY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 11:37:24 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF57B31E3F
        for <linux-tegra@vger.kernel.org>; Fri, 27 Jan 2023 08:37:22 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id v13so5202745eda.11
        for <linux-tegra@vger.kernel.org>; Fri, 27 Jan 2023 08:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCCAhjEj/wQuIkscpSC6P99O36fA8Kgf9ACNlg6MuGA=;
        b=EMTBGGv7Q3hRuONlL9HHrk7EGXajxLq9bs1/PoyYUUPw2UQdyvSGS54NtpQKojDmOF
         0uhQIBY4cNlymGuDVYADEA3i5QJ4VvidIQXLaT7kjyrjUPfMndPi5K7BHIRWOHOphNPH
         ES8zKIO1jLbWjnlUxAoSskDbNNKbIDxnG9WaaJXDcPm1GC1jYiSi4JcJ6SqbSqMdhAtH
         jSRHgGX4Qd495MVMA931JkcyyT1fo0Ijtxdb/JVXeaSzaUxzHid8/a3/TJuJ2T6uQbmi
         kTlhBWYxkDRNBNiynqbzArOQadshZ9daOlCf7BRvcXR0ae4bKdN4/QbitAjsJHunRVlp
         f6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCCAhjEj/wQuIkscpSC6P99O36fA8Kgf9ACNlg6MuGA=;
        b=5KqFjrBmj2YzFR0NZ/G0oYkzo7g29heD2jMm+LCZXgB68j8OyM4h8vYh6df66kYqnp
         rpvJCSozBCBkSX32rxlC/KfxJK64rrVOq1qhfz/Bic72g5GbepekXRvmCMDowz2bG4On
         5Gi42GHQicHF/rJz3pm3mz6Xhy83U8ZVz/JxmViCrp3ArX1xh0TmuuKrj9mXSgIZ9xeQ
         xK6GFrO8k+EcILrXsLjb2iJR/L2J3T0mGi4sXcs3REfJ4j1/cUPzITO+VbCR25VLt3Yx
         9rWz9Iel9KT56ufDUB2InFbVOSTfjHL10weGA0JiBdc7FEBTBqf8KXNzVHRMDLHfDacE
         O+sg==
X-Gm-Message-State: AFqh2ko9xGzq38FgksueCBiABqoovT7E9EzITZlWxw5UeQqjIXba3Tgc
        F/Gh1JJsV1IdYNPaKQk0kSk=
X-Google-Smtp-Source: AMrXdXtboPe9IUAV41X1srXQPhtpVBNYEiYSQenBQ61SkhgYTcUkgmhn2cWHgcFgSkug0W6cejREMQ==
X-Received: by 2002:a05:6402:174d:b0:494:eb9:54c4 with SMTP id v13-20020a056402174d00b004940eb954c4mr36951020edx.19.1674837441457;
        Fri, 27 Jan 2023 08:37:21 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id y8-20020a056402134800b004610899742asm2549100edw.13.2023.01.27.08.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 08:37:21 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/3] ARM: tegra: Device tree changes for v6.3-rc1
Date:   Fri, 27 Jan 2023 17:37:18 +0100
Message-Id: <20230127163719.460954-2-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.3-arm-dt

for you to fetch changes up to d1e34a8abfd6c5ac196f278ac2c5633e3e35ee22:

  ARM: tegra: Sort nodes by unit-address, then alphabetically (2023-01-23 12:07:15 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.3-rc1

Just a single patch to properly sort nodes and make the DTS files easier
to read.

----------------------------------------------------------------
Thierry Reding (1):
      ARM: tegra: Sort nodes by unit-address, then alphabetically

 arch/arm/boot/dts/tegra114-asus-tf701t.dts         | 240 +++---
 arch/arm/boot/dts/tegra114-dalmore.dts             |  26 +-
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi         |  14 +-
 arch/arm/boot/dts/tegra124-apalis-eval.dts         |  20 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts    |  20 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi        |  60 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi             |  60 +-
 arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi     |  15 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |   8 +-
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi       |  27 +-
 arch/arm/boot/dts/tegra124-nyan-big.dts            |  22 +-
 arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi     |  19 +-
 arch/arm/boot/dts/tegra124-nyan-blaze.dts          |  14 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi               |  71 +-
 arch/arm/boot/dts/tegra124.dtsi                    |  20 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    | 877 +++++++++++----------
 arch/arm/boot/dts/tegra20-asus-tf101.dts           | 114 +--
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts      |  38 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts         |  12 +-
 arch/arm/boot/dts/tegra20-colibri.dtsi             |  60 +-
 arch/arm/boot/dts/tegra20-medcom-wide.dts          |   8 +-
 arch/arm/boot/dts/tegra20-paz00.dts                | 130 +--
 arch/arm/boot/dts/tegra20-seaboard.dts             |  72 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi            |  58 +-
 arch/arm/boot/dts/tegra20-trimslice.dts            |  20 +-
 arch/arm/boot/dts/tegra20-ventana.dts              |  58 +-
 arch/arm/boot/dts/tegra20.dtsi                     |  70 +-
 arch/arm/boot/dts/tegra30-apalis-eval.dts          |  20 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts     |  20 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi         |  20 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi              |  20 +-
 arch/arm/boot/dts/tegra30-asus-lvds-display.dtsi   |   2 +
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    |  82 +-
 .../tegra30-asus-nexus7-grouper-maxim-pmic.dtsi    |  14 +-
 ...tegra30-asus-nexus7-grouper-memory-timings.dtsi |  20 +-
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi |  28 +-
 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi |  32 +-
 arch/arm/boot/dts/tegra30-asus-tf201.dts           |  34 +-
 arch/arm/boot/dts/tegra30-asus-tf300t.dts          |  24 +-
 arch/arm/boot/dts/tegra30-asus-tf300tg.dts         |  20 +-
 arch/arm/boot/dts/tegra30-asus-tf700t.dts          |  52 +-
 .../boot/dts/tegra30-asus-transformer-common.dtsi  |  54 +-
 arch/arm/boot/dts/tegra30-beaver.dts               |  44 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |  54 +-
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts      |   2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi             |  30 +-
 arch/arm/boot/dts/tegra30-ouya.dts                 | 207 +++--
 arch/arm/boot/dts/tegra30-pegatron-chagall.dts     | 130 +--
 arch/arm/boot/dts/tegra30.dtsi                     |  88 +--
 49 files changed, 1580 insertions(+), 1570 deletions(-)
