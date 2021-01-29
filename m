Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B030C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 18:29:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E5C764E04
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 18:29:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232535AbhA2S3S (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Jan 2021 13:29:18 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14375 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbhA2S2h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 13:28:37 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601453a90000>; Fri, 29 Jan 2021 10:27:53 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:27:52 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 18:27:50 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <thierry.reding@gmail.com>, <broonie@kernel.org>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>
CC:     <kuninori.morimoto.gx@renesas.com>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <sharadg@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 0/9] Tegra186 and Tegra194 audio graph card
Date:   Fri, 29 Jan 2021 23:57:37 +0530
Message-ID: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611944873; bh=f4tK4+ew7zaDkDHNwy88ploHD6DplKjmbpxcrClEycw=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         Content-Type;
        b=bR9x5MXS7UvtD8+w4C0gNV+kikZdgW0dorzwJzboCJyZ16VuXFa2otoM4FgdIcu2N
         XPx5kFhF2JTh576h/+zLeXtgtxi4f3tt7Ui55bFHFKHkO0NLvrJbvJs8flEOd8VIwY
         WF3lG7itI6seSuiYSJZhbiysc8btxYYtLA90WsRhVcgdHSwR1r6JSGhSj2Pe6QNNqo
         bOVxshqsoC/gOFbIoDDURWepC6tWqx5SJ17EBiH/mrikpPixU7k3FSVn5WuGsyMSQB
         HZ+DOseikPaej3cBuavueP4At6QkUCuGaVOX+6gkMagy/uhU964RwuJ1PuTGEB4p9s
         /RMCn3NUNi9NA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series adds support for audio graph based solution on Tegra186 and
Tegra194. This enables audio paths for I2S, DMIC and DSPK modules.

Depending on the platform Jetson TX2 or Jetson AGX Xavier, required I/O
module instances are enabled. Since the latter board has on board audio
codec, DT support for the same is enabled and external audio playback and
capture can be used.

Changelog
=========

v1 --> v2:
----------
  - Dropped patch "ASoC: tegra: Select SND_SOC_RT5659" as per suggestion
    from Mark.
  - Add new patch "ASoC: rt5659: Add Kconfig prompt"
  - Add new patch "arm64: defconfig: Enable RT5659"
  - No changes in other patches from earlier series.


Sameer Pujar (9):
  ASoC: dt-bindings: rt5659: Update binding doc
  ASoC: dt-bindings: tegra: Add iommus property to Tegra graph card
  ASoC: audio-graph-card: Add clocks property to endpoint node
  ASoC: rt5659: Add Kconfig prompt
  arm64: defconfig: Enable RT5659
  arm64: tegra: Add RT5658 device entry
  Revert "arm64: tegra: Disable the ACONNECT for Jetson TX2"
  arm64: tegra: Audio graph sound card for Jetson TX2
  arm64: tegra: Audio graph sound card for Jetson AGX Xavier

 .../bindings/sound/audio-graph-port.yaml           |   3 +
 .../sound/nvidia,tegra-audio-graph-card.yaml       |   3 +
 Documentation/devicetree/bindings/sound/rt5659.txt |  11 +
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 609 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  22 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 468 ++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  20 +
 arch/arm64/configs/defconfig                       |   1 +
 sound/soc/codecs/Kconfig                           |   2 +-
 9 files changed, 1138 insertions(+), 1 deletion(-)

-- 
2.7.4

