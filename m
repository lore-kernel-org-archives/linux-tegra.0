Return-Path: <SRS0=rHad=D3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDCCC433E7
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 06:03:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D58152237B
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 06:03:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="G9fw4FIs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391878AbgJTGDx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Oct 2020 02:03:53 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8334 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391875AbgJTGDx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Oct 2020 02:03:53 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8e7d6b0004>; Mon, 19 Oct 2020 23:02:19 -0700
Received: from [10.25.98.225] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 06:03:41 +0000
Subject: Re: [PATCH v4 10/15] ASoC: dt-bindings: tegra: Add graph bindings
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
 <1602859382-19505-11-git-send-email-spujar@nvidia.com>
 <20201019221105.GA3679866@bogus>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <741b6ffe-a2b3-c657-4113-d0c6316a4050@nvidia.com>
Date:   Tue, 20 Oct 2020 11:33:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019221105.GA3679866@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603173739; bh=BiUKj9cP/yQT8cx2ubZAZ1aX0UMw0lA+ciOeajWUPVg=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=G9fw4FIscUh231vtUhUS7Zp7vgk4ElJPav83qReqGsFuyzTZZlZUbVhVIHB4ZjBB3
         D7oh58seobnJ5UZc9JAiDlvubyovDaE5rduZg+/mDcCtfBJfWuoT6yFhBLrhg3A9zr
         gwvuOT8grfuhLxGGJfu+E3mQU8IzlRrEgZTdQqzpeGvwaaGpAiwXbNMiFhsuHj0QB0
         i7PjCaCnipn1tcwvzyfSp/zY6jPW+sSssT7nyXcC3gDQJQnSRuIKExQN2n7LWXMKf6
         01KCH/XO83RJYuXX2E7BhasM+sqUKFmOb8oGEYIn013Z7zRADUd8drHM6Rce9YL/gL
         EiBkdA4fKCOWw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


>> Add device tree binding properties of generic graph to ASoC component
>> devices. This allows to define audio ports out of these components or
>> DAIs and audio graph based sound card can be realised with this.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
>>   Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml  | 7 +++++++
>>   .../devicetree/bindings/sound/nvidia,tegra210-admaif.yaml          | 7 +++++++
>>   Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml  | 7 +++++++
>>   Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml  | 7 +++++++
>>   Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml   | 7 +++++++
>>   5 files changed, 35 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>> index ed2fb32..23875b1 100644
>> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>> @@ -55,6 +55,13 @@ properties:
>>         The name can be "DSPK1" or "DSPKx", where x depends on the maximum
>>         available instances on a Tegra SoC.
>>
>> +  ports:
>> +    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/ports
>> +

>> +patternProperties:
>> +  "^port(@[0-9a-f]+)?$":
>> +    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port
> You should have either 'ports' or a single 'port' (yes, the graph
> binding allowed multiple port nodes without 'ports', but that should be
> deprecated IMO)

OK, will drop this and just use 'port' here.
