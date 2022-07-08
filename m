Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14F0CCA47B
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jul 2022 18:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239370AbiGHS4Z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jul 2022 14:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239341AbiGHS4Z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jul 2022 14:56:25 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE711EAFF
        for <linux-tegra@vger.kernel.org>; Fri,  8 Jul 2022 11:56:23 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id y8so22154850eda.3
        for <linux-tegra@vger.kernel.org>; Fri, 08 Jul 2022 11:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F8s2+p8LjANuZXcoKxnrIvQWiA6th9781IfxFA/tC/g=;
        b=QD+dZbUeLbXqgAsnQko0xtB2z4X3qyHVfjB2rkBBWfcXoOIsLhALIcIU8Dyxl6d3MT
         dqv/y9erkYiGrP2+84STTg5vslp+zmIa5iQccwzSK6QGHLbY0JOwQt6LcdeJsC2OomuF
         jAZXNbJj0MXt0WzOQ+7ztnzzlv2ikv4qvQzmmfuTFeFpZuIHy62+PmcNZOhGhxvnJZ4f
         HvBY3Sl3et7nO2aaiia6apdP4nsHpPFe3webTKMNK9gtOuNr01ni/FG484jUr39mHaE2
         IbfGWioCa/O+gOJWzVR3k3Z/wYhBw3VQUvWBb7SJc7aXay4NllQ/kVmRXtOr7rzMTIJB
         QZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F8s2+p8LjANuZXcoKxnrIvQWiA6th9781IfxFA/tC/g=;
        b=e8Zp66Noce5F1r3nWSQN6DXk5BrM18fkgisauM9jV8ISTAMwTzsnlw1Z6amQUdY985
         Ug9XREy7cHcfQgReF0OpnVRQ5Q+1E7mtFftK4FxMJOMUmcN6UzdQ/X4i4H1hlL/+Zeqk
         lAYffNxl7Yo53i2iRXZYyvzAOiWvrKdIZ3EQfAW93a9CDML4LuWZewJbrutzonL/BsxK
         bscWhk/2abHMSqyoyw8TJ+imlD6Jh17ySgZ13Y82Xc1c0NFTVWQLBsGysENFsjiNU4K/
         G1QsgzVLCNbe12O3VfdTakluGb9ut4nSx1QXemyf8S2LDPGOqIApZcS777GFGfD/z3pX
         ViSg==
X-Gm-Message-State: AJIora+NECO1/FaaR5d0Vpu/8wxv8lLoL2yXbN/++uwOcvDtycFNMucj
        G3XjhgS50MAcYrt95F4Et1I=
X-Google-Smtp-Source: AGRyM1s2C1zAQ4/umePlCoIIYiyymyCSyW3zKF8Vsu2dhQ/pfJtCyz2DYqOKFanb2vdm2xd6nIvlrA==
X-Received: by 2002:aa7:c9c9:0:b0:431:962f:f61e with SMTP id i9-20020aa7c9c9000000b00431962ff61emr6825454edt.189.1657306582513;
        Fri, 08 Jul 2022 11:56:22 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id jl18-20020a17090775d200b006fec8e8eff6sm20734896ejc.176.2022.07.08.11.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 11:56:21 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/7] arm64: tegra: Device tree changes for v5.20-rc1
Date:   Fri,  8 Jul 2022 20:56:07 +0200
Message-Id: <20220708185608.676474-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708185608.676474-1-thierry.reding@gmail.com>
References: <20220708185608.676474-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.20-arm64-dt

for you to fetch changes up to b415bb7c976f1d595ed752001c0938f702645dab:

  arm64: tegra: Fix SDMMC1 CD on P2888 (2022-07-08 18:00:13 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.20-rc1

This adds and enables various hardware on Tegra234 (host1x, VIC, GPCDMA)
as well as the Control BackBone related device tree nodes on Tegra194
and Tegra234.

Native timers are enabled on Tegra186, Tegra194 and Tegra234, which
allow keeping track of SoC-wide timestamps as well as hardware watchdog
functionality.

The audio subsystem is enhanced with the Output Processing Engine (OPE)
on Tegra210 and later.

Finally there are a handful of minor cleanups and fixes.

----------------------------------------------------------------
Akhil R (3):
      dt-bindings: Add headers for Tegra234 GPCDMA
      arm64: tegra: Add Tegra234 GPCDMA device tree node
      arm64: tegra: Update compatible for Tegra234 GPCDMA

Kartik (3):
      dt-bindings: timer: Add Tegra186 & Tegra234 Timer
      arm64: tegra: Enable native timers on Tegra186
      arm64: tegra: Enable native timers on Tegra234

Krzysztof Kozlowski (2):
      arm64: tegra: Adjust whitespace around '='
      arm64: tegra: Align gpio-keys node names with dtschema

Mikko Perttunen (4):
      dt-bindings: Add headers for Host1x and VIC on Tegra234
      arm64: tegra: Mark BPMP channels as no-memory-wc
      arm64: tegra: Add Host1x context stream IDs on Tegra186+
      arm64: tegra: Add Host1x and VIC on Tegra234

Sameer Pujar (2):
      arm64: tegra: Add OPE device on Tegra210 and later
      arm64: tegra: Enable OPE on various platforms

Sumit Gupta (5):
      dt-bindings: arm: tegra: Add NVIDIA Tegra194 CBB 1.0 binding
      dt-bindings: arm: tegra: Add NVIDIA Tegra194 AXI2APB binding
      dt-bindings: arm: tegra: Add NVIDIA Tegra234 CBB 2.0 binding
      arm64: tegra: Add node for CBB 1.0 on Tegra194
      arm64: tegra: Add node for CBB 2.0 on Tegra234

Tamás Szűcs (1):
      arm64: tegra: Fix SDMMC1 CD on P2888

Thierry Reding (6):
      dt-bindings: power: Add Tegra234 MGBE power domains
      dt-bindings: Add Tegra234 MGBE clocks and resets
      dt-bindings: memory: Add Tegra234 MGBE memory clients
      dt-bindings: tegra-ccplex-cluster: Remove status from required properties
      Merge branch 'for-5.20/dt-bindings' into for-5.20/arm64/dt
      arm64: tegra: Enable native timers on Tegra194

 .../arm/tegra/nvidia,tegra-ccplex-cluster.yaml     |   1 -
 .../arm/tegra/nvidia,tegra194-axi2apb.yaml         |  40 +++++
 .../bindings/arm/tegra/nvidia,tegra194-cbb.yaml    |  97 +++++++++++
 .../bindings/arm/tegra/nvidia,tegra234-cbb.yaml    |  74 +++++++++
 .../bindings/timer/nvidia,tegra186-timer.yaml      | 109 +++++++++++++
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |   4 +-
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  49 +++++-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |   6 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  37 ++++-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  47 +++++-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |  47 +++++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 113 ++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |  84 ++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   6 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  88 +++++++++-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  10 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  42 ++++-
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |  49 +++++-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 177 +++++++++++++++++++++
 include/dt-bindings/clock/tegra234-clock.h         | 105 ++++++++++++
 include/dt-bindings/memory/tegra234-mc.h           |  26 +++
 include/dt-bindings/power/tegra234-powergate.h     |   2 +
 include/dt-bindings/reset/tegra234-reset.h         |  10 ++
 25 files changed, 1196 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-axi2apb.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-cbb.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegra186-timer.yaml
