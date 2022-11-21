Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C414C43217
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Nov 2022 17:14:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbiKURO1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Nov 2022 12:14:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbiKURNs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Nov 2022 12:13:48 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B41D0DF1
        for <linux-tegra@vger.kernel.org>; Mon, 21 Nov 2022 09:12:48 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id l11so17182968edb.4
        for <linux-tegra@vger.kernel.org>; Mon, 21 Nov 2022 09:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dD+nn3RcUVAXIgjkmKfwa+r2PxTnm0FpkC5Fz1p9PlQ=;
        b=EKAKUvd313xA40Vd4Lnjm1Omf6+O4la2dwU7/bRGmpuzsfV4iaFgyOd1hrdMCr/S4B
         imEFDVKKNNxraUt5f6OxZoW14TIUf+M0J5NFmPkdepaWSxQK3BKUjxbP7GOmw33yvDoI
         pI0i99nSQ5ho7PhItlEBpTUKK4Kt3InrGGRzUlKV2OXeM0yXxPQIdEGDJIN1rJ9zfKLL
         yDOHnOiaHvrpIzfUF1XyVI6ahbZt03mN86GlhZrUfN3D64XFoYoPxLwNNr+mxoCWONLe
         052baunEUUY56WWeetg7cQpFaOoukrdwPHIwh4uuYTOIfR7Qmy+fnmFsnhU3RQLtsDPf
         cnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dD+nn3RcUVAXIgjkmKfwa+r2PxTnm0FpkC5Fz1p9PlQ=;
        b=UyAnipbiB56xcZvudUL1kgxtagZr29C4mxE5r48XEETrBr8Ivs+sX/2kxHKH77WvP1
         lWvlC030/jhYLRRNMqEBCWhuwXsaNRlZBumrus3vKLOhjKKYCn/74vB72DKMWTKB4BEK
         q1HXb8qDuCpL8J6RqrGjzmLtmlKOscH1BG870HbHCPve8OlN2W4n9BT6j/KW2fA3/iw6
         ZXHLgo5ZfKPEXIX+OiyzU1LiXtEYmfnS0JERs7T3Xz36iHkSt+W8pR8LpgcoQeP2Fwyt
         NCK9m8WzHveLVW+zonkrCkyvImAZI1FK8yEVcqUnoK1QXp9oQX+3pOihdCY8PQU/qJq6
         Mkkw==
X-Gm-Message-State: ANoB5pmj7wlONsC1VBdgsDU4Tc9qHVqhkr1nNEjioTTg7XR3Op8wN2LG
        J/hxrVoneowzFHIyXCo5O5k=
X-Google-Smtp-Source: AA0mqf42i2eQOmFt+Gy7c5CkEuQu5yMKeKQlpAMO2TnU3vVzAPwYj2GnwiM9+8NN37FyV8P3t6E0RQ==
X-Received: by 2002:aa7:cc8d:0:b0:461:15f0:a574 with SMTP id p13-20020aa7cc8d000000b0046115f0a574mr17446256edt.187.1669050767045;
        Mon, 21 Nov 2022 09:12:47 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ee47-20020a056402292f00b00468f7bb4895sm5098579edb.43.2022.11.21.09.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 09:12:46 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 4/7] dt-bindings: Changes for v6.2-rc1
Date:   Mon, 21 Nov 2022 18:12:36 +0100
Message-Id: <20221121171239.2041835-4-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-dt-bindings-v2

for you to fetch changes up to 97351cd8bea8e284cf62b4b7f35fa12059b47d7f:

  dt-bindings: usb: tegra-xusb: Convert to json-schema (2022-11-21 13:27:30 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.2-rc1

New memory client IDs and IOMMU stream IDs, as well as new compatible
strings are introduced to support more hardware on Tegra234. Some device
tree bindings are converted to json-schema to allow formal validation.

----------------------------------------------------------------
Jon Hunter (1):
      dt-bindings: tegra: Update headers for Tegra234

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
