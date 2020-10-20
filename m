Return-Path: <SRS0=rHad=D3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC97C433E7
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 06:16:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A397222C8
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 06:16:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Tl1oa9Fc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403775AbgJTGQk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Oct 2020 02:16:40 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10052 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403774AbgJTGQk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Oct 2020 02:16:40 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8e806b0000>; Mon, 19 Oct 2020 23:15:07 -0700
Received: from [10.25.98.225] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 06:16:27 +0000
Subject: Re: [PATCH v4 11/15] ASoC: dt-bindings: tegra: Add json-schema for
 Tegra audio graph card
To:     Rob Herring <robh@kernel.org>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <p.zabel@pengutronix.de>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
 <1602859382-19505-12-git-send-email-spujar@nvidia.com>
 <20201019221612.GA3690258@bogus>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <f6d098fa-cbc2-7563-a68c-5d00d71d128f@nvidia.com>
Date:   Tue, 20 Oct 2020 11:46:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019221612.GA3690258@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603174507; bh=JgtKQCdBHhWAi0Jahdr1f3uSUYWL0dxtVotsA8MMHMg=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=Tl1oa9FcQuGR29PHRl92SYgAMkqyMK8MYNkdkrOOd98+Z7K8GhczOMW5ZuFFd2sJD
         01ghxx9Me82onlUp7nh4sNKZ4sW1ROkAt7mxLN1wxYS3SJJg1xHlpGIcygDEM2uY3z
         AJLNg86cFbCSsQ8BCngjDaiYQMRIS0XD/eo3zsw8o+ocmz4VVOV/jCe89bQarLxvgX
         7PZVnihrMwPl2hdWBBWrBVyRcf2bLZiaeAVWJRCjR3t26mNmGDlI+RgwZ/2fct5zg2
         lKlkMw5xxi6EINEhBEfgtUXn9a7TpjRW1ImKMOSHNYMH+ZF77POzINwYtgCHAAI3u3
         fJ1iBa4Q/oqRw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


>> Add YAML schema for Tegra audio graph sound card DT bindings. It uses th=
e
>> same DT bindings provided by generic audio graph driver. Along with this
>> few standard clock DT bindings are added which are specifically required
>> for Tegra audio.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
>>   .../sound/nvidia,tegra-audio-graph-card.yaml       | 158 +++++++++++++=
++++++++
>>   1 file changed, 158 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegr=
a-audio-graph-card.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-=
graph-card.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audi=
o-graph-card.yaml
>> new file mode 100644
>> index 0000000..284d185
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-c=
ard.yaml
>> @@ -0,0 +1,158 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-graph-card.=
yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Audio Graph based Tegra sound card driver
>> +
>> +description: |
>> +  This is based on generic audio graph card driver along with additiona=
l
>> +  customizations for Tegra platforms. It uses the same bindings with
>> +  additional standard clock DT bindings required for Tegra.
>> +
>> +  See{LINUX}/Documentation/devicetree/bindings/sound/audio-graph-card.y=
aml
> You should be able to just $ref this at the top level.

I am seeing one problem while using $ref like below.
allOf:
 =C2=A0 - $ref: /schemas/sound/audio-graph-card.yaml

I see below while running doc validator.
"Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.exam=
ple.dt.yaml:=20
tegra_sound: compatible:0: 'audio-graph-card' was expected"

Is there a way to avoid this?

>
>> +
>> +maintainers:
>> +  - Jon Hunter <jonathanh@nvidia.com>
>> +  - Sameer Pujar <spujar@nvidia.com>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - nvidia,tegra210-audio-graph-card
>> +          - nvidia,tegra186-audio-graph-card
>> +

>> +  dais:
>> +    $ref: /schemas/sound/audio-graph-card.yaml#/properties/dais
>> +
>> +  label:
>> +    $ref: /schemas/sound/simple-card.yaml#/properties/label
>> +
>> +  pa-gpios:
>> +    $ref: /schemas/sound/audio-graph-card.yaml#/properties/pa-gpios
>> +
>> +  widgets:
>> +    $ref: /schemas/sound/simple-card.yaml#/definitions/widgets
>> +
>> +  routing:
>> +    $ref: /schemas/sound/simple-card.yaml#/definitions/routing
>> +
>> +  mclk-fs:
>> +    $ref: /schemas/sound/simple-card.yaml#/definitions/mclk-fs
>> +
>> +  prefix:
>> +    $ref: /schemas/sound/simple-card.yaml#/definitions/prefix
> And drop all of these.

Could not re-use because of above compatible problem. Also require some=20
additional properties for Tegra.

>> +
>> +  clocks:
>> +   minItems: 2
>> +
>> +  clock-names:
>> +   minItems: 2
> Don't need this.

This is required for Tegra audio graph card to update clock rates at=20
runtime.

>
>> +   items:
>> +     - const: pll_a
>> +     - const: plla_out0
>> +
>> +  assigned-clocks:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  assigned-clock-parents:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  assigned-clock-rates:
>> +    minItems: 1
>> +    maxItems: 3
>> +

It is required for initialisation of above clocks with specific rates.

>> +  ports:
>> +    $ref: /schemas/sound/audio-graph-card.yaml#/properties/ports
>> +
>> +patternProperties:
>> +  "^port(@[0-9a-f]+)?$":
>> +    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port
> And these can be dropped. Unless what each port is is Tegra specific.

May be I can drop this if I could just directly include=20
audio-graph-card.yaml and extend required properties for Tegra.
