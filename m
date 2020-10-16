Return-Path: <SRS0=VMTZ=DX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277E3C4363A
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 14:43:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE4E020874
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 14:43:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="YsJ1DtNP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409111AbgJPOn2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Oct 2020 10:43:28 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11060 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395275AbgJPOn0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 10:43:26 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f89b1610000>; Fri, 16 Oct 2020 07:42:41 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 14:43:24 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 14:43:19 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <p.zabel@pengutronix.de>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v4 00/15] Audio graph card updates and usage with Tegra210 audio
Date:   Fri, 16 Oct 2020 20:12:47 +0530
Message-ID: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602859361; bh=B4PkmNk75DMcC+D3L2aFsIvwxCAZ+5gpy/O+QzN4i9Q=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         Content-Type;
        b=YsJ1DtNPK/2F7JU9zp9f91tnJoGdtjK/uObmAoHJVCQ+/LNPIu0aEx7rAMQ9HE2+y
         fcA4YIrqp7VzcUZzhYNuCcT0LDnAzNZ67piYn91gnF/ZPYhi7aCCslYnkGIxeHSOo2
         9TwEiHlCe0fvav2erIB4I6tfmdKRnuCJ+f8QXX6U3jyoj2z7zdpjAGi+k58QwixPV0
         7Di7u7sb4ZNI0XTNwXOqGtknuTKfEgLVpdOv5VAzON/jDzTuUNfdFcV2masSsTLkA0
         2fvF24FtAiwWivtmHHpxQLdR1tA+3/xzqh9xMGZ4J5UkbOIbvfyd5AgxE/LK2ok1e9
         wzbd78xNtjMYQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Summary of changes:
 * Support multiple instances of a component. For example there can be
   multiple I2S devices which can use the same component driver.

 * Support open platforms with empty Codec endpoint. Customers can plug
   their own HW and can populate codec endpoint.

 * In a component model there can be many components which can be
   connected togethe. In such cases Identify no-pcm DPCM DAI links which
   can be used in BE<->BE connections.

 * Add Tegra audio graph driver which is based on generic audio graph
   driver and specific customizations are done in Tegra driver.

 * This pushes DT support for Tegra210 based platforms which uses
   audio-graph card and above enhancements.

The series is based on following references where DPCM usgae for Tegra
Audio and simple-card driver proposal were discussed.

 * https://lkml.org/lkml/2020/4/30/519 (DPCM for Tegra)
 * https://lkml.org/lkml/2020/6/27/4 (simple-card driver)

Changelog
=========

v3 -> v4
--------
 * Added new patches to convert graph.txt and audio-graph-card.txt
   to corresponding json-schema files. Later these references
   are used in Tegra audio graph schema.

 * AHUB component binding docs are updated to reflect the usage
   of ports/port/endpoint

 * More common stuff is moved into graph_parse_of() and this is
   used by both generic and Tegra audio graph.

 * DT binding for Tegra audio graph is updated to included "ports { }"

 * As per the suggestion 'void *data' member is dropped from
   'asoc_simple_priv' and instead container method is used to
   maintain required custom data internal to Tegra audio graph. 

v2 -> v3
--------
 * Dropped new compatible addition in generic graph driver
   after reviewing it with Morimoto-san. Instead added Tegra
   audio graph driver and new compatibles are added in the same.
 * Added new patches to expose new members for customization
   in audio graph driver.
 * Added new patch for Tegra audio graph driver and related
   documentation.
 * Minor change in below commit where mutex version of helper is used
   "ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM"
 * DT binding is updated to use the newly exposed compatibles
 * No changes in other patches

v1 -> v2
--------
 * Re-organized ports/endpoints description for ADMAIF and XBAR.
   Updated DT patches accordingly.
 * After above change, multiple Codec endpoint support is not
   required and hence dropped for now. This will be considered
   separately if at all required in future.
 * Re-ordered patches in the series.

Sameer Pujar (15):
  ASoC: soc-core: Fix component name_prefix parsing
  ASoC: soc-pcm: Get all BEs along DAPM path
  ASoC: audio-graph: Use of_node and DAI for DPCM DAI link names
  ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM
  ASoC: audio-graph: Support empty Codec endpoint
  ASoC: audio-graph: Expose new members for asoc_simple_priv
  ASoC: audio-graph: Expose helpers from audio graph
  Documentation: of: Convert graph bindings to json-schema
  ASoC: dt-bindings: audio-graph: Convert bindings to json-schema
  ASoC: dt-bindings: tegra: Add graph bindings
  ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card
  ASoC: tegra: Add audio graph based card driver
  arm64: defconfig: Enable Tegra audio graph card driver
  arm64: tegra: Audio graph header for Tegra210
  arm64: tegra: Audio graph sound card for Jetson Nano and TX1

 Documentation/devicetree/bindings/graph.txt        | 128 -----
 Documentation/devicetree/bindings/graph.yaml       | 170 +++++++
 .../devicetree/bindings/sound/audio-graph-card.txt | 337 -------------
 .../bindings/sound/audio-graph-card.yaml           | 548 +++++++++++++++++++++
 .../sound/nvidia,tegra-audio-graph-card.yaml       | 158 ++++++
 .../bindings/sound/nvidia,tegra186-dspk.yaml       |   7 +
 .../bindings/sound/nvidia,tegra210-admaif.yaml     |   7 +
 .../bindings/sound/nvidia,tegra210-ahub.yaml       |   7 +
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |   7 +
 .../bindings/sound/nvidia,tegra210-i2s.yaml        |   7 +
 .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 153 ++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 262 ++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 146 ++++++
 arch/arm64/configs/defconfig                       |   1 +
 include/sound/graph_card.h                         |  16 +
 include/sound/simple_card_utils.h                  |   3 +
 include/sound/soc.h                                |   1 +
 sound/soc/generic/audio-graph-card.c               | 175 ++++---
 sound/soc/soc-core.c                               |   3 +-
 sound/soc/soc-pcm.c                                |   3 +-
 sound/soc/tegra/Kconfig                            |   9 +
 sound/soc/tegra/Makefile                           |   2 +
 sound/soc/tegra/tegra_audio_graph_card.c           | 255 ++++++++++
 23 files changed, 1882 insertions(+), 523 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/graph.txt
 create mode 100644 Documentation/devicetree/bindings/graph.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card.txt
 create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
 create mode 100644 include/sound/graph_card.h
 create mode 100644 sound/soc/tegra/tegra_audio_graph_card.c

-- 
2.7.4

