Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B77C43219
	for <linux-tegra@archiver.kernel.org>; Sat, 19 Nov 2022 01:48:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233639AbiKSBsW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 20:48:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232430AbiKSBsF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 20:48:05 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA83813D5D
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 17:20:30 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ft34so16898575ejc.12
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 17:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPuTvYxir7Gpj3tCPH6nNq7pM1RmMpnVdBjIK6F1Lbo=;
        b=BYZcsu6AQD01eKt0XezztqxEoTICMByxIhl7ibyhb+J11atX2zp1U6HRnIPP5xdmpk
         MxwvygBdJRYlc9WpCJx073iyIdkcKUvfHDNvpl1WHCQsrqL/0bsbdG7KgWW0xv2IUsc8
         cg3pynjK/jKQK9gewGG5Kn5Xtkh0nA5Dl1gfg7uFcDIpCb69fLoI4T8FhOTQXTc4lC6I
         XbwLknjkn4oyi1VnwlWFe2A/Ei0aqAXJqoLnx+wAArH/LMrK9kI6l8RZSNp2NX0CcXl2
         3XebnUB4HgpThbNbEEhoi03dTvd37+hpcUZWzhL3psAmpWnJFKOI6jLsbOI6GFIU+6Pw
         P+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPuTvYxir7Gpj3tCPH6nNq7pM1RmMpnVdBjIK6F1Lbo=;
        b=3i/Emk77eRGwnEKqk73YwQ3IhpPVNbn/5cbzu039BWqpJbYujC+k8f+1XTL4RKog8c
         FAKlkY7uohIASH8SNSPP0qFfBx/sn+PuoSJzjmRlsbAiNaF4GpwZ1EjIMkW7e9UOubDj
         Th1IAh6PEcMbfYBJcXY8nB5kBWnuCg0ezWSJDD/8jdmUPOPiLs5mh35uwXNSkc63tmNi
         JH7MnEJdbaUayDuNx5KgKVrlrdSupaCQAYtfMMQWDkSudOgtWbr6G5X14JyYSzrWPEo8
         xPX2wTmBTSLjrO2UXHvaTyWpAi8lKRNkUBZBOp31zvbOUJGywzMqWdghec4yKIdvxSFl
         VI4g==
X-Gm-Message-State: ANoB5pkviLUQZpEXvxX2VGRDH/eleZZtkmCenM5kJZXAdh3q/KAeNHOv
        9lsi2CxcJBnt6wzJkZK0XRHl9tmXF7o=
X-Google-Smtp-Source: AA0mqf4frgqVJaiq5+fp5iHAK69LI0ODiO96wmNOIKDvq65RhMw7ZAU+cQYGUvSDoNjD4RFIGy1fzw==
X-Received: by 2002:a17:906:eb8e:b0:7b2:a2c3:2ff0 with SMTP id mh14-20020a170906eb8e00b007b2a2c32ff0mr7299192ejb.561.1668820829272;
        Fri, 18 Nov 2022 17:20:29 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i17-20020aa7c9d1000000b004638ba0ea96sm2373011edt.97.2022.11.18.17.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 17:20:28 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/8] dt-bindings: Changes for v6.2-rc1
Date:   Sat, 19 Nov 2022 02:20:21 +0100
Message-Id: <20221119012025.3968358-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119012025.3968358-1-thierry.reding@gmail.com>
References: <20221119012025.3968358-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-dt-bindings

for you to fetch changes up to 9c812445df0507aa30ddb511a777fc5dd981eb66:

  dt-bindings: usb: tegra-xusb: Convert to json-schema (2022-11-18 23:58:45 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.2-rc1

New memory client IDs and IOMMU stream IDs, as well as new compatible
strings are introduced to support more hardware on Tegra234. Some device
tree bindings are converted to json-schema to allow formal validation.

----------------------------------------------------------------
Jon Hunter (2):
      dt-bindings: tegra: Update headers for Tegra234
      dt-bindings: memory: Fix typos and definitions for Tegra

Mikko Perttunen (2):
      dt-bindings: Add headers for NVDEC on Tegra234
      dt-bindings: Add bindings for Tegra234 NVDEC

Sandipan Patra (1):
      dt-bindings: pwm: tegra: Document Tegra234 PWM

Thierry Reding (4):
      dt-bindings: pinctrl: tegra: Convert to json-schema
      dt-bindings: pinctrl: tegra194: Separate instances
      dt-bindings: pwm: tegra: Convert to json-schema
      dt-bindings: usb: tegra-xusb: Convert to json-schema

Vidya Sagar (1):
      dt-bindings: PCI: tegra234: Add ECAM support

 .../bindings/clock/nvidia,tegra124-dfll.txt        |   2 +-
 .../bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml | 156 +++++
 .../bindings/pci/nvidia,tegra194-pcie.yaml         |  34 +-
 .../devicetree/bindings/pci/snps,dw-pcie.yaml      |   2 +-
 .../pinctrl/nvidia,tegra-pinmux-common.yaml        | 178 ++++++
 .../bindings/pinctrl/nvidia,tegra114-pinmux.txt    | 131 -----
 .../bindings/pinctrl/nvidia,tegra114-pinmux.yaml   | 155 +++++
 .../bindings/pinctrl/nvidia,tegra124-pinmux.txt    | 153 -----
 .../bindings/pinctrl/nvidia,tegra124-pinmux.yaml   | 176 ++++++
 .../bindings/pinctrl/nvidia,tegra194-pinmux.txt    | 107 ----
 .../bindings/pinctrl/nvidia,tegra194-pinmux.yaml   | 284 +++++++++
 .../bindings/pinctrl/nvidia,tegra20-pinmux.txt     | 143 -----
 .../bindings/pinctrl/nvidia,tegra20-pinmux.yaml    | 112 ++++
 .../bindings/pinctrl/nvidia,tegra210-pinmux.txt    | 166 ------
 .../bindings/pinctrl/nvidia,tegra210-pinmux.yaml   | 142 +++++
 .../bindings/pinctrl/nvidia,tegra30-pinmux.txt     | 144 -----
 .../bindings/pinctrl/nvidia,tegra30-pinmux.yaml    | 176 ++++++
 .../devicetree/bindings/pwm/nvidia,tegra20-pwm.txt |  77 ---
 .../bindings/pwm/nvidia,tegra20-pwm.yaml           |  96 ++++
 .../bindings/usb/nvidia,tegra124-xusb.txt          | 132 -----
 .../bindings/usb/nvidia,tegra124-xusb.yaml         | 202 +++++++
 .../bindings/usb/nvidia,tegra186-xusb.yaml         | 173 ++++++
 .../bindings/usb/nvidia,tegra194-xusb.yaml         | 179 ++++++
 .../bindings/usb/nvidia,tegra210-xusb.yaml         | 199 +++++++
 include/dt-bindings/clock/tegra234-clock.h         | 639 ++++++++++++++++++++-
 include/dt-bindings/memory/tegra234-mc.h           | 440 +++++++++++++-
 include/dt-bindings/power/tegra234-powergate.h     |  15 +
 include/dt-bindings/reset/tegra234-reset.h         | 111 +++-
 28 files changed, 3437 insertions(+), 1087 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra-pinmux-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra194-xusb.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml
