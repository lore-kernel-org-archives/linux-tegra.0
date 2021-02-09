Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9B0C433E9
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Feb 2021 13:19:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 144C564EE2
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Feb 2021 13:19:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbhBINTd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 9 Feb 2021 08:19:33 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14880 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbhBINTX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 9 Feb 2021 08:19:23 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60228baf0000>; Tue, 09 Feb 2021 05:18:39 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 13:18:39 +0000
Received: from [10.25.99.185] (172.20.145.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb 2021
 13:18:26 +0000
Subject: Re: [PATCH v2 3/9] ASoC: audio-graph-card: Add clocks property to
 endpoint node
To:     Rob Herring <robh@kernel.org>
CC:     <thierry.reding@gmail.com>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <kuninori.morimoto.gx@renesas.com>,
        <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <sharadg@nvidia.com>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
 <1611944866-29373-4-git-send-email-spujar@nvidia.com>
 <20210205152644.GA3083322@robh.at.kernel.org>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <e393eeca-b4ff-dbad-90c2-43e1015a377a@nvidia.com>
Date:   Tue, 9 Feb 2021 18:48:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210205152644.GA3083322@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612876719; bh=6iqBPTEMPvS4E/T3tPfS/QnKaNJKrLlwrSeoYYiQlak=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=mTSdB99K38rnuWp/7h+vk0U8tXYmT2S/QeN9dzGZ54ikZXcjipGPL02i7LQ732hZL
         APtKkYNnXWKpMfSlxh68StiV5gmPGDVHf3aHmqM9+ZyOv/SoEi2RaNB7YkDsTWRxES
         JDeUQW49zzhfMO5w/iwxX9MA7gXVoI/MvqpmFvijeNLgWHZrynyVfdVHB+sidgJr7M
         EJAVJyzOOZbV8pYnCAgTJMA4z/AqMD9lFsSKvz28m2fkxkQkNbO2ZGNUEZTIPo0xXT
         0ovAhvIi5/QVbKafkzjb9bQw/xzwKKkaw4otS7JzWZYcqWY6Aau6zzUaoWY9JnrQYX
         BBB6VPbuEsO7Q==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2/5/2021 8:56 PM, Rob Herring wrote:
> External email: Use caution opening links or attachments
>
>
> On Fri, Jan 29, 2021 at 11:57:40PM +0530, Sameer Pujar wrote:
>> Add optional 'clocks' property to audio port 'endpoint' node. One
>> such example is where SoC supplies a clock to external audio codec
>> component.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   Documentation/devicetree/bindings/sound/audio-graph-port.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
>> index 766e910..08ed8f5 100644
>> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
>> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
>> @@ -33,6 +33,9 @@ properties:
>>           properties:
>>             remote-endpoint:
>>               maxItems: 1
>> +          clocks:
>> +            maxItems: 1
>> +            description: Describes the clock used by audio component.
> NAK
>
> An endpoint is not a device. Clocks go with a device.

I made this change on similar lines with [0]. I am not sure if there are 
other examples of such usage.
If this is not recommended, I will try moving this to device node. Looks 
like it needs a driver fix in simple-card-utils.c


[0] 
https://elixir.bootlin.com/linux/v5.11-rc7/source/Documentation/devicetree/bindings/sound/simple-card.yaml#L
