Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C271CC001DE
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Jul 2023 09:41:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbjG1Jlj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Jul 2023 05:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233999AbjG1Jli (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Jul 2023 05:41:38 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4BEE4F
        for <linux-tegra@vger.kernel.org>; Fri, 28 Jul 2023 02:41:37 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99357737980so273397666b.2
        for <linux-tegra@vger.kernel.org>; Fri, 28 Jul 2023 02:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690537296; x=1691142096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Hg9uRA7ZWqARyiSAN0CUxk5gUO5+BhSuRdsdA7nhVQ=;
        b=UZy92RmN0e3+jx8nUFEodC8imGOg7lfqPeoG0hmAUsNF+aucVc1I8S9gB5s2nUCMzm
         +mR4afVPS9ym4bEkTz4eghXQKmXhp+Mqk9xV0jRZJdQPqVpHB563kLAf8wFf1L6ptejV
         mNsbR2lWpD2ANYGHonnSBRO9GY8dAH2M+5qG20fiT8Ws3rYAjYJmSSXFfaNNLinIpydl
         cjc2/pvR74E3w9lVnq2d2LPjrIugAsKM5V6ht3oCsVpjnv4r4X5+Rk7J4n5xOa0tUBh9
         0B3tc0t4WLWJcg5kne3X6Ck5Lguo6cMvQhYmHolnE5Yc9b6JFoRRat6vfD4RwZOQUBiT
         qQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690537296; x=1691142096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Hg9uRA7ZWqARyiSAN0CUxk5gUO5+BhSuRdsdA7nhVQ=;
        b=Wf/bXkY/rOzoezuwgkdUV3v4ibadDdcodYZ6gitIs6H1nvufmGNY0VgtToGZMighyP
         OIVywv+cJlqOOaw7l3b0zRtf3HzyiOx9M2ixNu83rK9cntO442qgQ8IV5XW3uzLm6+Dn
         I6QhFy3GMMWIX3/Hy0zSCiI18Fa7VSsGTX5awNTIjsnSAk7b7VC5zOY9Z+aGSQ602Eet
         WEU8VLshhI2g1+OckYCpFHODDpvD8OR7xr+8cGg6og8UYlmGS2AWjn3g8C+trQO5Z2kj
         qmK9BhEh3abJ45m70qNG7EpE5etFWZMuy61X7oy2kh3plg0t47imRmKHg1WWyzLj7Eml
         Zn5g==
X-Gm-Message-State: ABy/qLZGLbSZqsGp6NaH7jOV8s5E1eOblYMjS8GuSBTQNulI8Nm2D3vm
        PgIK4nb0aYFb/SdSPf/2qSo=
X-Google-Smtp-Source: APBJJlEH8f/baV6q50+6Wd3WlHPcRrYf4GTRbjv+G8XFtyDh9IU5L7K0aik3s/yu82C036S7r1gHtg==
X-Received: by 2002:a17:906:8a70:b0:982:1936:ad27 with SMTP id hy16-20020a1709068a7000b009821936ad27mr2018053ejc.11.1690537295814;
        Fri, 28 Jul 2023 02:41:35 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id j10-20020a170906830a00b00992a8a54f32sm1835004ejx.139.2023.07.28.02.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 02:41:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/4] arm64: tegra: Device tree changes for v6.6-rc1
Date:   Fri, 28 Jul 2023 11:41:28 +0200
Message-ID: <20230728094129.3587109-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728094129.3587109-1-thierry.reding@gmail.com>
References: <20230728094129.3587109-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.6-arm64-dt

for you to fetch changes up to d7fb6468ec9f18db52ef3c84eb44a9025021c830:

  arm64: tegra: Add blank lines for better readability (2023-07-27 16:48:25 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.6-rc1

The majority of this is fixes all over the place for DT schema
validation warnings. However, there are also cleanups for some things in
DT and audio support is added on IGX Orin. Jetson Orin NX and Nano also
gain a new thermal trip point to help keep the device cool at moderate
loads.

----------------------------------------------------------------
Artur Weber (1):
      arm64: tegra: Adapt to LP855X bindings changes

Diogo Ivo (1):
      arm64: tegra: Fix HSUART for Smaug

Gautham Srinivasan (3):
      arm64: tegra: Add UARTE device tree node on Tegra234
      arm64: tegra: Enable UARTA and UARTE for Orin Nano
      arm64: tegra: Add SPI device tree nodes for Tegra234

Jon Hunter (2):
      arm64: tegra: Add missing alias for NVIDIA IGX Orin
      arm64: tegra: Fix HSUART for Jetson AGX Orin

Krzysztof Kozlowski (1):
      arm64: tegra: Drop incorrect maxim,disable-etr on Smaug

Mohan Kumar (1):
      arm64: tegra: Add audio support for IGX Orin

Sameer Pujar (1):
      arm64: tegra: Update AHUB clock parent and rate

Sheetal (1):
      arm64: tegra: Update AHUB clock parent and rate on Tegra234

Shubhi Garg (1):
      arm64: tegra: Add PCIe and DP 3.3V supplies

Sumit Gupta (1):
      arm64: tegra: Update CPU OPP tables

Thierry Reding (9):
      arm64: tegra: Sort PCI nodes correctly on Orin
      arm64: tegra: Remove duplicate PCI nodes
      arm64: tegra: Add 35°C trip point for Jetson Orin NX/Nano
      arm64: tegra: Remove dmas and dma-names for debug UART
      arm64: tegra: smaug: Remove reg-shift for high-speed UART
      arm64: tegra: Remove current-speed for SBSA UART
      arm64: tegra: Add missing reset-names for Tegra HS UART
      arm64: tegra: Remove {clock,reset}-names from VIC powergate
      arm64: tegra: Add blank lines for better readability

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |    2 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |    3 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |    3 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |    2 +
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |    6 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi     |    2 +
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     |    2 +
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |    2 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |    5 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |    5 +-
 .../arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi |    1 +
 .../arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi |    1 +
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     | 1991 ++++++++++++++++++
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 2121 +-------------------
 .../arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi |   41 +
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts  |  178 +-
 .../arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi |   78 +
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |    8 +-
 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts  |   66 +-
 .../dts/nvidia/tegra234-p3768-0000+p3767-0005.dts  |    7 +-
 .../arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi |   27 +-
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts    |    2 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |  387 +++-
 23 files changed, 2705 insertions(+), 2235 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
