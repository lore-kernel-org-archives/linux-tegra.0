Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84B6C43331
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 12:07:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86D0C22D2A
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 12:07:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391041AbhASMBR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 07:01:17 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4306 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387434AbhASJ3S (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 04:29:18 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6006a6450000>; Tue, 19 Jan 2021 01:28:37 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 09:28:36 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Jan 2021 09:28:31 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <kuninori.morimoto.gx@renesas.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [RESEND PATCH v6 0/6] Tegra210 audio graph card
Date:   Tue, 19 Jan 2021 14:58:10 +0530
Message-ID: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611048517; bh=JB+pbi8V5uiKMDgXgRh4ZQ3768t6OhoKieOBXUWBOiw=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         Content-Type;
        b=S8FRw5AefzdifBsOVHhhb4c4i1du72qUqgNaWLtoLreU0xPlw7WUkBqvcd/PtAFyv
         KEcii0T53PWJe7dpe3q1TXantmcYbKzeKv0HUIYIakecU6fHMHJB7F0g0McbIMsJDl
         Tm8eyATo+dC54WSCY/NN1ORbYx9CWPPXpWDsAitqbd0sHp3HrIhSrmp6rx3ODOHH4D
         3xs4NKW4NJiGMBBnXfNhTYeXTTGIfE0KCwHt/GQpXbskmd/fdaj5DcAjp5DEeZc5rO
         85TNR15jkyzm2gRfEPyM6SuiO6sMvOpGESWzqqCj11D72UDT8P/1vgdWxp4nkJzCkM
         YV73a5cu5uzjA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series adds audio graph based sound card support for Tegra210
platforms like Jetson-TX1 an Jetson-Nano. The following preparatory
audio graph enhancement series is already merged.
 * https://patchwork.kernel.org/project/alsa-devel/list/?series=375629&state=*

Following are the summary of changes:
 * Add graph/audio-graph based schemas or schema updates for Tegra210
   component and machine drivers.
 * Add Tegra audio graph machine driver.
 * Add required DT support for Jetson-TX1/Nano.

This work is based on earlier discussion of DPCM usage for Tegra
and simple card driver updates.
 * https://lkml.org/lkml/2020/4/30/519
 * https://lkml.org/lkml/2020/6/27/4


Original v6 series was sent about 6-7 weeks back. The dependency commit,
https://lore.kernel.org/alsa-devel/1610948585-16286-1-git-send-email-spujar@nvidia.com/
is now merged. Resending this now to appear in the top of the mail list.

Changelog
=========

v5 -> v6
--------
 * Added ports or port description in YAML docs for Tegra AHUB
   devices and graph card in patch 1/6 and 2/6. Reference of
   audio-graph-port.yaml is used for AHUB devices.
 * Dropped redundant NULL check return for of_device_get_match_data()
   in patch 3/6.
 * Added 'Reviewed-by' tag from Jon Hunter.
 * No changes in remaining patches.

v4 -> v5
--------
 * Audio graph related changes were sent in separate v5 series as
   mentioned above and are dropped from current series.
 * Graph and audio graph doc patches are dropped from this series
   and are sent separately as mentioned above.
 * Minor change with phandle label for TX1 and Nano platform DT files.
 * No changes in other patches.

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

Sameer Pujar (6):
  ASoC: dt-bindings: tegra: Add graph bindings
  ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card
  ASoC: tegra: Add audio graph based card driver
  arm64: defconfig: Enable Tegra audio graph card driver
  arm64: tegra: Audio graph header for Tegra210
  arm64: tegra: Audio graph sound card for Jetson Nano and TX1

 .../sound/nvidia,tegra-audio-graph-card.yaml       | 187 +++++++++++++++
 .../bindings/sound/nvidia,tegra186-dspk.yaml       |  18 +-
 .../bindings/sound/nvidia,tegra210-admaif.yaml     |  13 +-
 .../bindings/sound/nvidia,tegra210-ahub.yaml       |  13 +-
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |  18 +-
 .../bindings/sound/nvidia,tegra210-i2s.yaml        |  18 +-
 .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 153 ++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 262 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 146 ++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 sound/soc/tegra/Kconfig                            |   9 +
 sound/soc/tegra/Makefile                           |   2 +
 sound/soc/tegra/tegra_audio_graph_card.c           | 251 ++++++++++++++++++++
 13 files changed, 1085 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
 create mode 100644 sound/soc/tegra/tegra_audio_graph_card.c

-- 
2.7.4

