Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF2FC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:05:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96F3861027
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:05:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhKLMIR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:08:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbhKLMIQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:08:16 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BCB1C061766;
        Fri, 12 Nov 2021 04:05:26 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id t30so15064236wra.10;
        Fri, 12 Nov 2021 04:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4oX/2QNcm6vP04lk72q8RR46yx1hbxi9MjClk/2mbTc=;
        b=ov4s8oS7Ld5dA5aaig08WLCYUkhZ7+nMBHBdmGtXT1T8UB7hdODfsg2RgJhwGre94f
         323A0q6E6K2KfZeehqiz0j+oX16FTXUlj2wXBlra8TmQ93UVU1+DVq6KqzXIuHwNzQYQ
         whoiL8g/AD/1NhmzzdDlJ2G5P3QNasKaM41kOy+GeqLqRiogZtfpVEaK+ijqa1CqCvrg
         ZFzFlZRkgi4UBg/HBS9/3eioCRwjm8gmCg0OYxp6LvlaCqaIZ57A4sh+DBNQEVf80vZ/
         9mW+71qGJqs2rhEZJkF+LNQ/0mNz/XThwye/v4I7PF9311AdS4DwJWcx5hye+3+WfLmA
         aTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4oX/2QNcm6vP04lk72q8RR46yx1hbxi9MjClk/2mbTc=;
        b=sfv34/Dlmjq2rhLAZsLiPCl2vJYQtE+VA2foLz7H8qKsA4ul8POWHfzXIINCqDQdhZ
         ne7k55/O3fgDWkZyrsF3mmISniyoEYM0Fs+GXqX30ZQ4a8qBjxS0pI+lATCwpcfTIkRI
         dqcjiQbKtbTFQfL8rPNPX7ItBZiVm9n8W/9JPRzxIlUhgZNy6ocL0MYwtCxiyY+MzzjE
         kyLUTQWZJtYn2ACWO+Pz39abuJqDuwK4KFYURWkwPFlMY026ijedRDMJJVPNyQaI2XD/
         qAcC02c60xpJ/km3osv2hreSV1YPeq1eZGsDWzZV8VINGLsF4bF1wm86bkwoVx2kmuuC
         AjuQ==
X-Gm-Message-State: AOAM530ATwHPAVpeM2+N6743lG5UHXJMmQ2sZYDkHDxUJ0KS0n2o5cMR
        8Ttbq1cZfNrWIKCYklr2tdU=
X-Google-Smtp-Source: ABdhPJxB/nY/2no9khPJHwjex24STYXnpAgwGHIqvgeS7zwZXblq6WFOxehAeBpgWGrvYbFBN6ltUw==
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr17497087wrp.100.1636718724798;
        Fri, 12 Nov 2021 04:05:24 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id p12sm6817251wrr.10.2021.11.12.04.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:05:24 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 00/15] dt-bindings: Convert Tegra DT bindings to json-schema
Date:   Fri, 12 Nov 2021 13:05:03 +0100
Message-Id: <20211112120518.3679793-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this set of patches converts some Tegra-specific DT bindings to
json-schema and, where appropriate, adds Tegra234 compatible strings.
The goal is to prepare existing schemas to allow validation of the
existing Tegra234 device tree files.

I've got a follow-up series that adds more Tegra234 support and will
extend/convert bindings along the way to keep things validatable.

Rob, since all of these are Tegra-specific and given that I have some
follow-up work based on these, I think it'd be best if I picked these
up into the Tegra tree once you're happy with them.

Thierry

Thierry Reding (15):
  dt-bindings: misc: Convert Tegra MISC to json-schema
  dt-bindings: mmc: tegra: Convert to json-schema
  dt-bindings: mailbox: tegra: Convert to json-schema
  dt-bindings: mailbox: tegra: Document Tegra234 HSP
  dt-bindings: rtc: tegra: Convert to json-schema
  dt-bindings: rtc: tegra: Document Tegra234 RTC
  dt-bindings: fuse: tegra: Convert to json-schema
  dt-bindings: fuse: tegra: Document Tegra234 FUSE
  dt-bindings: mmc: tegra: Document Tegra234 SDHCI
  dt-bindings: serial: 8250: Document Tegra234 UART
  dt-bindings: tegra: pmc: Convert to json-schema
  dt-bindings: firmware: tegra: Convert to json-schema
  dt-bindings: i2c: tegra-bpmp: Convert to json-schema
  dt-bindings: serial: tegra-tcu: Convert to json-schema
  dt-bindings: serial: Document Tegra234 TCU

 .../arm/tegra/nvidia,tegra186-pmc.txt         | 133 --------
 .../arm/tegra/nvidia,tegra186-pmc.yaml        | 199 ++++++++++++
 .../firmware/nvidia,tegra186-bpmp.txt         | 107 -------
 .../firmware/nvidia,tegra186-bpmp.yaml        | 161 ++++++++++
 .../bindings/fuse/nvidia,tegra20-fuse.txt     |  42 ---
 .../bindings/fuse/nvidia,tegra20-fuse.yaml    |  80 +++++
 .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt |  42 ---
 .../i2c/nvidia,tegra186-bpmp-i2c.yaml         |  40 +++
 .../bindings/mailbox/nvidia,tegra186-hsp.txt  |  72 -----
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml | 112 +++++++
 .../bindings/misc/nvidia,tegra186-misc.txt    |  14 -
 .../bindings/misc/nvidia,tegra186-misc.yaml   |  43 +++
 .../bindings/misc/nvidia,tegra20-apbmisc.txt  |  17 -
 .../bindings/misc/nvidia,tegra20-apbmisc.yaml |  51 +++
 .../bindings/mmc/nvidia,tegra20-sdhci.txt     | 143 ---------
 .../bindings/mmc/nvidia,tegra20-sdhci.yaml    | 300 ++++++++++++++++++
 .../bindings/rtc/nvidia,tegra20-rtc.txt       |  24 --
 .../bindings/rtc/nvidia,tegra20-rtc.yaml      |  55 ++++
 .../devicetree/bindings/serial/8250.yaml      |   3 +-
 .../bindings/serial/nvidia,tegra194-tcu.txt   |  35 --
 .../bindings/serial/nvidia,tegra194-tcu.yaml  |  61 ++++
 21 files changed, 1104 insertions(+), 630 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
 delete mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
 create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
 delete mode 100644 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
 create mode 100644 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
 delete mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt
 create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml
 delete mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
 create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.txt
 create mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml

-- 
2.33.1

