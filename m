Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20C2C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 22:06:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343962AbhKXWJm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 17:09:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244968AbhKXWJm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 17:09:42 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD28C061574;
        Wed, 24 Nov 2021 14:06:31 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id d11so8359484ljg.8;
        Wed, 24 Nov 2021 14:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2tZCZ8hYBjx1z5k7GS9qihmESy7aILKKvmRrarvGMnI=;
        b=XryKTXvFV87q72rf3hm3QdHNu7FS+1jkHbklorly1VtO9TQb77XtjiIeeZpGZD/4AJ
         1BhEc+J9mTr+wc4z4qJydjFKXv7eC8SEVKYu9cOvdvwBuwo+C7VPZArXlMddJ0Io3t41
         OtAavAUsNMpbWqZUuHEs0CVyXLVCiF2v7jfCrR3dLLIELJ7c1rkZtYMRulElbb6N7Sk+
         D81mULUm5w5vxxgipObNvWeAQmVhlVaGZpPeHSpmUrrQf7yFLjaV7l3V0VYGalJva5SD
         g3BSL2oZMkvhK65cmcCKuvPHQexL1sQbY9Ui5amyHrm4md7HNqvulXcXJpIdapBQhxC0
         fg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2tZCZ8hYBjx1z5k7GS9qihmESy7aILKKvmRrarvGMnI=;
        b=Uf/LEKdOAZyU4ZfCr3k+bNiFFypeFVqd4BhbaMKfNv9qgKaF+rGhlUrKD4HEl/Tv7A
         zyeZ08H2CmCzUCGA38RPBuMjml54BsUM0zFHeEFmjDjRUufsrXj7ZwC9HHuwu2YEzx8F
         AKF47KCF8HOhWhmnzrOJjyO6jxAay6P4XCBHpAOcZN3kl3+zhFBVI/TArFb7KOJmoRKw
         4bjsrncq3f68BSWNX4k4POJjIC+1c/j9NCxE1pEmd/MufkUGxUEwhZQJGXFgh72SW3DV
         o2Ua8A/Sla5i5sBv2k9OKyp8v/JCEkzxYbaIkjHYUdbUukzpWZNrLAL0iJ02HdNINTLX
         nWVQ==
X-Gm-Message-State: AOAM532Jj1hkBTXRTJ3gDQyWIFOimmSc89InCX/S8BRHz7r0uHLBdxQE
        gdI1LLDuEsAE58fF9HDwOH0=
X-Google-Smtp-Source: ABdhPJxN5Z/cMHtigSK2VlRsjGDJK8VknY+zJ8jUCWKgcxOZAbifzK5En0RtTvmWKAf5DfEP86zX8g==
X-Received: by 2002:a05:651c:158b:: with SMTP id h11mr19639328ljq.137.1637791590041;
        Wed, 24 Nov 2021 14:06:30 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:06:29 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v1 00/20] Support HDMI audio on NVIDIA Tegra20
Date:   Thu, 25 Nov 2021 01:00:37 +0300
Message-Id: <20211124220057.15763-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series revives Tegra20 S/PDIF driver which was upstreamed long time
ago, but never was used. It also turns Tegra DRM HDMI driver into HDMI
audio CODEC provider. Finally, HDMI audio is enabled in device-trees.
For now the audio is enable only for Acer A500 tablet and Toshiba AC100
netbook because they're already supported by upstream, later on ASUS TF101
tablet will join them.

I based S/PDIF patches on Arnd's Bergmann patch from a separate series [1]
that removes obsolete slave_id. This eases merging of the patches by
removing the merge conflict.

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?submitter=80402

Arnd Bergmann (1):
  ASoC: tegra20-spdif: stop setting slave_id

Dmitry Osipenko (19):
  ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
  ASoC: dt-bindings: tegra20-i2s: Convert to schema
  ASoC: dt-bindings: tegra20-i2s: Document new nvidia,fixed-parent-rate
    property
  dt-bindings: host1x: Document optional HDMI sound-dai-cells
  ASoC: tegra20: spdif: Support device-tree
  ASoC: tegra20: spdif: Set FIFO trigger level
  ASoC: tegra20: spdif: Improve driver's code
  ASoC: tegra20: spdif: Use more resource-managed helpers
  ASoC: tegra20: spdif: Reset hardware
  ASoC: tegra20: spdif: Support system suspend
  ASoC: tegra20: spdif: Filter out unsupported rates
  ASoC: tegra20: i2s: Filter out unsupported rates
  drm/tegra: hdmi: Unwind tegra_hdmi_init() errors
  drm/tegra: hdmi: Register audio CODEC on Tegra20
  ARM: tegra_defconfig: Enable S/PDIF driver
  ARM: tegra: Add S/PDIF node to Tegra20 device-tree
  ARM: tegra: Add HDMI audio graph to Tegra20 device-tree
  ARM: tegra: acer-a500: Enable S/PDIF and HDMI audio
  ARM: tegra: paz00: Enable S/PDIF and HDMI audio

 .../display/tegra/nvidia,tegra20-host1x.txt   |   1 +
 .../bindings/sound/nvidia,tegra20-i2s.txt     |  30 ---
 .../bindings/sound/nvidia,tegra20-i2s.yaml    |  78 +++++++
 .../bindings/sound/nvidia,tegra20-spdif.yaml  |  88 ++++++++
 .../boot/dts/tegra20-acer-a500-picasso.dts    |   8 +
 arch/arm/boot/dts/tegra20-paz00.dts           |   8 +
 arch/arm/boot/dts/tegra20.dtsi                |  40 +++-
 arch/arm/configs/tegra_defconfig              |   1 +
 drivers/gpu/drm/tegra/Kconfig                 |   3 +
 drivers/gpu/drm/tegra/hdmi.c                  | 168 +++++++++++++--
 sound/soc/tegra/tegra20_i2s.c                 |  49 +++++
 sound/soc/tegra/tegra20_spdif.c               | 195 +++++++++++++-----
 sound/soc/tegra/tegra20_spdif.h               |   1 +
 sound/soc/tegra/tegra_pcm.c                   |   6 +
 sound/soc/tegra/tegra_pcm.h                   |   1 +
 15 files changed, 575 insertions(+), 102 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml

-- 
2.33.1

