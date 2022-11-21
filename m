Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F5EC4332F
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Nov 2022 17:14:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbiKUROf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Nov 2022 12:14:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231390AbiKURN6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Nov 2022 12:13:58 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC268D2888
        for <linux-tegra@vger.kernel.org>; Mon, 21 Nov 2022 09:12:51 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id y24so12159071edi.10
        for <linux-tegra@vger.kernel.org>; Mon, 21 Nov 2022 09:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6dGAFAHsa9p5rBqdTstHSkqVhnceetyhIFDb9Pq0iI=;
        b=MUodzzIYUG+oJ+MwapKr2R3YfCfQrg1VdeVsyQ/V/WAiXZZFBDEsrzbnNzoCUcDWFE
         Q67JjLyyhLqI8XHNqnjTFMAy5tTOM4MLqYVG2cm45l+tXD7FApzq00Gr2uCNDolO6XH4
         WrxT8S71+buqJPUQJa8VrRjamIsFkUChZHnPiGk7H1CIpuwR2c1OVMUqn/+5xOrmzM0M
         Hpr0JQfgTSPTjkGyWbpbNVkd2wBzRlA4THPz4wyr/Yfr0YrsOVx043j+MH+nGoWrGj5z
         B5iUTFRC9plC44QzwmcDSoGLT64DIfO9EXZ1d7ttl7iKZ61TLlm8akvC8XbjfaNgmfrW
         z1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6dGAFAHsa9p5rBqdTstHSkqVhnceetyhIFDb9Pq0iI=;
        b=Of93b0ug2QambK8E6a/0CLB+7wG11L1itfGSGu7t5n22z6UxfRHDNu1es4k1/70iHM
         LnFzJ3BSKkwJLpIlfl4ZwPdCZC06qlTZV2R5fznJUMnCauhcCsWCg5MUS++CjAdjGK78
         wJgzXhsDu6RGA2qspjqGf8l4o66dDxsSr51lmskJua2u1Hh4K8ikMHoCkzvnDfiJfD/l
         HVwDg4c6xUqa+cRpvrxRpJdgEvHS7AKCBdPP1Z2483mvIpayLfKzo5jZpM2Wd56H+o1R
         /5lY8j3QGVdg5Ttx0jpkmj6ONNyXwKxLnVnYdYKiHKPEmXxT7zZtMKEoXFgy6b+B/1Rd
         5oog==
X-Gm-Message-State: ANoB5pnsttNQV2DPDd6Gnjt/qL8EcIFw1sv3grSGJHIicu/2AfAQlzS/
        2NnrLmDaHAFR/oioXssB4tk=
X-Google-Smtp-Source: AA0mqf62E7mDMYhB8iW+yawGTfz4x5HJ+AwPVoEjivfQA39R8o5YTr8IwjbdX3GuAexHtaUoraRP5w==
X-Received: by 2002:aa7:c587:0:b0:469:3d58:20a5 with SMTP id g7-20020aa7c587000000b004693d5820a5mr1802428edq.136.1669050769928;
        Mon, 21 Nov 2022 09:12:49 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090671c700b007aec1b39478sm5121213ejk.188.2022.11.21.09.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 09:12:49 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 7/7] arm64: tegra: Device tree changes for v6.2-rc1
Date:   Mon, 21 Nov 2022 18:12:39 +0100
Message-Id: <20221121171239.2041835-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121171239.2041835-1-thierry.reding@gmail.com>
References: <20221121171239.2041835-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-arm64-dt-v2

for you to fetch changes up to 1002a361127b6b42b8d1ef686a4c1fa68541d6f5:

  arm64: tegra: Remove unneeded clock-names for Tegra132 PWM (2022-11-21 13:30:16 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.2-rc1

This contains many new additions, primarily for Tegra234, as well as a
slew of cleanups for issues flagged by the DT validation tools.

----------------------------------------------------------------
Akhil R (1):
      arm64: tegra: Add dma-channel-mask in GPCDMA node

Dipen Patel (1):
      arm64: tegra: Enable GTE nodes

Fabio Estevam (1):
      arm64: tegra: Remove 'enable-active-low'

Jon Hunter (6):
      dt-bindings: tegra: Update headers for Tegra234
      arm64: tegra: Remove unused property for I2C
      arm64: tegra: Populate Tegra234 PWMs
      arm64: tegra: Add PWM fan for Jetson AGX Orin
      arm64: tegra: Add SBSA UART for Tegra234
      arm64: tegra: Update console for Jetson Xavier and Orin

Mikko Perttunen (3):
      dt-bindings: Add headers for NVDEC on Tegra234
      arm64: tegra: Fix ranges for host1x nodes
      arm64: tegra: Add NVDEC on Tegra234

Pierre Gondois (1):
      arm64: tegra: Update cache properties

Prathamesh Shete (1):
      arm64: tegra: Add Tegra234 SDMMC1 device tree node

Sandipan Patra (1):
      arm64: tegra: Enable PWM users on Jetson AGX Orin

Thierry Reding (15):
      Merge branch for-6.2/dt-bindings into for-6.2/arm64/dt
      arm64: tegra: Sort nodes by unit-address
      arm64: tegra: Add missing whitespace
      arm64: tegra: Remove clock-names from PWM nodes
      arm64: tegra: Separate AON pinmux from main pinmux on Tegra194
      arm64: tegra: Add missing compatible string to Ethernet USB device
      arm64: tegra: Restructure Tegra210 PMC pinmux nodes
      arm64: tegra: Use vbus-gpios property
      arm64: tegra: Use correct compatible string for Tegra194 HDA
      arm64: tegra: Use correct compatible string for Tegra234 HDA
      arm64: tegra: Remove reset-names for QSPI
      arm64: tegra: Fixup pinmux node names
      arm64: tegra: Remove unused reset-names for QSPI
      arm64: tegra: Fix up compatible string for SDMMC1 on Tegra234
      arm64: tegra: Remove unneeded clock-names for Tegra132 PWM

Vidya Sagar (3):
      arm64: tegra: Fix Prefetchable aperture ranges of Tegra234 PCIe controllers
      arm64: tegra: Add ECAM aperture info for all the PCIe controllers
      arm64: tegra: Fix non-prefetchable aperture of PCIe C3 controller

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   1 -
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  12 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   2 +-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |   4 +-
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  70 ++-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   5 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |   4 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  61 +-
 .../arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi |   8 +-
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |  21 +-
 .../arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi |  14 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 666 ++++++++++++++-------
 include/dt-bindings/clock/tegra234-clock.h         | 639 +++++++++++++++++++-
 include/dt-bindings/memory/tegra234-mc.h           | 440 +++++++++++++-
 include/dt-bindings/power/tegra234-powergate.h     |  15 +
 include/dt-bindings/reset/tegra234-reset.h         | 111 +++-
 18 files changed, 1751 insertions(+), 326 deletions(-)
