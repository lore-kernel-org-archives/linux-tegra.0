Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B5EC7EE29
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 19:36:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbjFITgm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 15:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbjFITgf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 15:36:35 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C152D44
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 12:36:34 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51496f57e59so3069317a12.2
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 12:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686339393; x=1688931393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fRwrzCjp88t418nAkVEpU9kS4OdGnnMmJzDqEeTRBY=;
        b=C3VYqj2iTBch94O7kQIm62iZ8Y9Yxt9J3+nD2sQOLh5ltPNEl0ThEscSZYWe13/b9l
         Lxt8saKifQQWvJf9J0v+C4do+CA5ZybEA1XlTJX6uRYtTo4vyGCH13RBbx8tl6bBAWBu
         /A/F6jZRJh3MzxFAoHi4OCYBHIkSpN+tOig+VxnLJkgQz61HC+aw/y2gSGzWVQ+mEbL7
         0C9C5K3dV32+kKJysB0xgzJiotRsvh+bCo7AbrgcA2+JBFJEGYJUVPFhGvQ1GY9i6LIT
         uGWjqq4YcXQhJdjqGdsoYP7vcSPGxBdsCAjsCBjdLqbncsuCCwk7SFFGdmbHH4Nm7+wO
         LHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686339393; x=1688931393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fRwrzCjp88t418nAkVEpU9kS4OdGnnMmJzDqEeTRBY=;
        b=V2Y6R+USFemKOFxZROfuNBgEzvgZeKuhPe5zo30MvasHmDm5NCQ3L4ium3OwfEt8+i
         Ebp/TISDd6IIHggimobptgd53q6K/Mp4D1/Ik4actrWrQILe2XirykDXmpEYbid/zlQ+
         7UHF6cETkgE8XjjV48NBvKB5Blr0vHwpFh3iYGGT9V6WNjQfx+ahABQRfosVTwpnkggr
         t0eUZHp4hikRQpI1iU30OsyRiULHd9JpaDAq/Rh3cr1RyYPCkdMKJtLQcsHqUMWo9a/M
         PMrSjDMZbPXqR837W5GUa+OgIhMjutfGWarx7cnXUBY2LT98WkFA+2zVv9f0KBVhdyLO
         jmwQ==
X-Gm-Message-State: AC+VfDxcmJloj0tNdAh+Y2RocdmYy+J6Tc1Qlb++4HamZEGt8R547Wip
        NE8EGzFkeLCh/JTFoPa0u10=
X-Google-Smtp-Source: ACHHUZ7UKbrsxsz++D3lw+J8Oo0aNvgCavYHLRyMTlv5TKpbD4FHS3AgCuHrOFUPp+Gm4TOFWsmIxg==
X-Received: by 2002:a17:907:8a12:b0:969:7739:2eb7 with SMTP id sc18-20020a1709078a1200b0096977392eb7mr2688891ejc.4.1686339392907;
        Fri, 09 Jun 2023 12:36:32 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id gv11-20020a170906f10b00b00947ed087a2csm1643638ejb.154.2023.06.09.12.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 12:36:32 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Device tree changes for v6.5-rc1
Date:   Fri,  9 Jun 2023 21:36:20 +0200
Message-Id: <20230609193620.2275240-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609193620.2275240-1-thierry.reding@gmail.com>
References: <20230609193620.2275240-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.5-arm64-dt

for you to fetch changes up to 6312e57b3250085b196d9630d2eeea6a583b97ef:

  arm64: tegra: Enable thermal support on Jetson Orin Nano (2023-06-09 17:44:26 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.5-rc1

This introduces support for the IGX Orin and Jetson Orin Nano devices
and enables various additional features on the Jetson AGX Orin and
Jetson Orin NX. This also enables some basic thermal support to prevent
the devices from overheating.

Support for the GPU on the Google Pixel C is enabled and various minor
issues are fixed and cleaned up.

----------------------------------------------------------------
Diogo Ivo (2):
      arm64: tegra: Add GPU power rail regulator on Smaug
      arm64: tegra: Enable GPU on Smaug

Jon Hunter (3):
      arm64: tegra: Fix PCIe regulator for Orin Jetson AGX
      arm64: tegra: Enable USB device for Jetson AGX Orin
      arm64: tegra: Update USB phy-name for Jetson Orin NX

Krzysztof Kozlowski (1):
      arm64: tegra: Add missing cache properties on Tegra210

Prathamesh Shete (1):
      arm64: tegra: Add Tegra234 pin controllers

Shubhi Garg (2):
      dt-bindings: tegra: Document compatible for IGX
      arm64: tegra: Add support for IGX Orin

Sumit Gupta (2):
      dt-bindings: tegra: Add ICC IDs for dummy memory clients
      arm64: tegra: Add CPU OPP tables and interconnects property

Thierry Reding (8):
      Merge branch 'for-6.5/dt-bindings' into for-6.5/arm64/dt
      arm64: tegra: Support Jetson Orin Nano Developer Kit
      arm64: tegra: Sort properties more logically
      arm64: tegra: Add a few blank lines for better readability
      arm64: tegra: Add Tegra234 thermal support
      arm64: tegra: Enable thermal support on Jetson AGX Orin
      arm64: tegra: Enable thermal support on Jetson Orin NX
      arm64: tegra: Enable thermal support on Jetson Orin Nano

 Documentation/devicetree/bindings/arm/tegra.yaml   |   5 +
 arch/arm64/boot/dts/nvidia/Makefile                |   4 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  23 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   1 +
 .../arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi |  24 +-
 .../arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi | 111 +++++++
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |  46 ++-
 .../arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi |   6 +
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts  | 154 ++++++++++
 .../arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi | 137 +++++++++
 .../arm64/boot/dts/nvidia/tegra234-p3767-0005.dtsi |  14 +
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |  60 +---
 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts  |  23 +-
 .../dts/nvidia/tegra234-p3768-0000+p3767-0005.dts  |  33 ++
 .../arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi |   3 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 341 +++++++++++++++++++++
 include/dt-bindings/memory/tegra234-mc.h           |   5 +
 .../dt-bindings/thermal/tegra234-bpmp-thermal.h    |  19 ++
 18 files changed, 937 insertions(+), 72 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3767-0005.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts
 create mode 100644 include/dt-bindings/thermal/tegra234-bpmp-thermal.h
