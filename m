Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EE3C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:38:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B5AE6054F
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:38:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235217AbhKSOlt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 09:41:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbhKSOls (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 09:41:48 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA792C061574;
        Fri, 19 Nov 2021 06:38:46 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 133so8755111wme.0;
        Fri, 19 Nov 2021 06:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YpcMcFQPixvPDguNb8KvgCn82+FeyaLs6RtchRVFI0A=;
        b=HoZ2pfn55yoa4f/v1AqGMAP0dKILZYmst8qI65JvsB/HB8JTtheO3BTNzgsw8OfTKO
         QHyRiD4yYHWZElL5fcaVBFwgHyE0yvPB/Fw1XUfDV0KhiWLHHvYEFPA14rXDf8vn/VL0
         NMDP55ak+IEJEqMrxuEZVM54yRCRhA3Fe3R8MCzaGGPBNToeq8okq8l/KsBWUxO/PQFA
         saGlNfhX13q4mffv1S6p5OmEftGdPP5PPDa67ZLx9yKncGuj1kv+Megv4WA0fEOcuWP0
         /3oV9fjepOyoXqLn73iOrei/gz9UJFkQ2d9nWVrGBZVid4HapRvYZ4HLl0IZk8NI4Uwc
         z2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YpcMcFQPixvPDguNb8KvgCn82+FeyaLs6RtchRVFI0A=;
        b=MsyBI5jtIBIBovMQ1ora9/CjrLOyTxYJHAET/kly7z+ilO5eO3vBy+8C56QA7NI4qO
         rP1uM2NTIRaZA6INMEAbeDhdS0807yiD+uxU6BU1Q6zcbPMYP7c8RbMt2F7uDtIMfuMH
         qskH1sYO5CsABOBkWrSCRKb8ugqhNnI88LoSdHabeD4XK9V2kuFZHn0LeokjB//RpfED
         ChlCyaqT/5qKTYCCZE0yzamuCBNeMY86YGMBQXMMIfDCP1BEahahwAE7K3+Fk00XwrGZ
         yO9E2UzwfJwfCMfOanVXBMxNZm106pZr9V0l/KSoS1tL5KGPp6smuxLdRISGKbQQNmWS
         wWrQ==
X-Gm-Message-State: AOAM533Lf2nBPNfkSFZkln2Bme+fOlV9ESjze0iyPoW5rRemjvH6oyJ5
        wDvY4KtbfQ1ezouAC7OumeY=
X-Google-Smtp-Source: ABdhPJxKC/+Nb+XQfPl3Su1mJ2g1LtrLmZQ9o4FFhPctXSafAMj1w0HlxVl+GaJp1bMSUhBk5m914g==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr126910wmc.31.1637332725384;
        Fri, 19 Nov 2021 06:38:45 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id a141sm11732540wme.37.2021.11.19.06.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 06:38:44 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 00/16] dt-bindings: Convert Tegra DT bindings to json-schema
Date:   Fri, 19 Nov 2021 15:38:23 +0100
Message-Id: <20211119143839.1950739-1-thierry.reding@gmail.com>
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

Changes in v2:
- address various linting and validation warnings
- add patch for BPMP thermal bindings

Thierry

Thierry Reding (16):
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
  dt-bindings: thermal: tegra186-bpmp: Convert to json-schema
  dt-bindings: serial: tegra-tcu: Convert to json-schema
  dt-bindings: serial: Document Tegra234 TCU

 .../arm/tegra/nvidia,tegra186-pmc.txt         | 133 --------
 .../arm/tegra/nvidia,tegra186-pmc.yaml        | 199 ++++++++++++
 .../firmware/nvidia,tegra186-bpmp.txt         | 107 -------
 .../firmware/nvidia,tegra186-bpmp.yaml        | 186 +++++++++++
 .../bindings/fuse/nvidia,tegra20-fuse.txt     |  42 ---
 .../bindings/fuse/nvidia,tegra20-fuse.yaml    |  82 +++++
 .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt |  42 ---
 .../i2c/nvidia,tegra186-bpmp-i2c.yaml         |  42 +++
 .../bindings/mailbox/nvidia,tegra186-hsp.txt  |  72 -----
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml | 114 +++++++
 .../bindings/misc/nvidia,tegra186-misc.txt    |  14 -
 .../bindings/misc/nvidia,tegra186-misc.yaml   |  43 +++
 .../bindings/misc/nvidia,tegra20-apbmisc.txt  |  17 -
 .../bindings/misc/nvidia,tegra20-apbmisc.yaml |  51 +++
 .../bindings/mmc/nvidia,tegra20-sdhci.txt     | 143 ---------
 .../bindings/mmc/nvidia,tegra20-sdhci.yaml    | 300 ++++++++++++++++++
 .../bindings/rtc/nvidia,tegra20-rtc.txt       |  24 --
 .../bindings/rtc/nvidia,tegra20-rtc.yaml      |  61 ++++
 .../devicetree/bindings/serial/8250.yaml      |   3 +-
 .../bindings/serial/nvidia,tegra194-tcu.txt   |  35 --
 .../bindings/serial/nvidia,tegra194-tcu.yaml  |  61 ++++
 .../thermal/nvidia,tegra186-bpmp-thermal.txt  |  33 --
 .../thermal/nvidia,tegra186-bpmp-thermal.yaml |  42 +++
 23 files changed, 1183 insertions(+), 663 deletions(-)
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
 delete mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml

-- 
2.33.1

