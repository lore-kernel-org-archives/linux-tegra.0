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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A282C433E0
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Feb 2021 13:23:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A317664E85
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Feb 2021 13:23:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbhBINXF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 9 Feb 2021 08:23:05 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11063 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231430AbhBINWu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 9 Feb 2021 08:22:50 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60228c810003>; Tue, 09 Feb 2021 05:22:09 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 13:22:08 +0000
Received: from [10.25.99.185] (172.20.145.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb 2021
 13:22:03 +0000
Subject: Re: [PATCH v2 1/9] ASoC: dt-bindings: rt5659: Update binding doc
To:     Rob Herring <robh@kernel.org>
CC:     <thierry.reding@gmail.com>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <kuninori.morimoto.gx@renesas.com>,
        <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <sharadg@nvidia.com>, Oder Chiou <oder_chiou@realtek.com>,
        Bard Liao <bardliao@realtek.com>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
 <1611944866-29373-2-git-send-email-spujar@nvidia.com>
 <20210205152933.GA3089668@robh.at.kernel.org>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <eb490eb1-d7e2-a188-8e62-496f9a1d99bc@nvidia.com>
Date:   Tue, 9 Feb 2021 18:51:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210205152933.GA3089668@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612876929; bh=vHTXlq3/gtV+QTcA6Zeb0sAsHB5xsFAtC24ncxfYeQY=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=XVI1tl9hO6JzBBnbEnGnFkYeLKat7/L3LORqrPI6mbMMI/+iHz1hp/RWrABU4Q8O6
         m3uISE1RrbWV0QQnY2oy0rnAtLCPI5s0+Ae6+J9++QdIm14OIjTUS10xo0LBYVsBiY
         ha9FZdVrUH8xeF2uJwhM0Pz2KBTsHmwAji2dPHARLWVlHNej0wLy6b7fCcO0wnBPn1
         G6gZXPmgDBA28Z1ADxuTSfLZlH26fDjOJixEK/JzJ1ChdcASBytvj/Xr4TyIlYunc1
         HNEy3+rsL0/quarz50CqZCYe5lvHpORPF0AaAeAgjhQmPyPmvdfv0Q1aWohjRi5cM3
         tHW1cd5P6rIRA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Rob,

On 2/5/2021 8:59 PM, Rob Herring wrote:
> External email: Use caution opening links or attachments
>
>
> On Fri, Jan 29, 2021 at 11:57:38PM +0530, Sameer Pujar wrote:
>> Update following in rt5659.txt binding doc
>>    - Add JD source for Intel HDA header: Commit 041e74b71491
>>      ("ASoC: rt5659: Add the support of Intel HDA Header")
>>      added driver support. Add missing info here.
>>
>>    - sound-name-prefix: Used to prefix component widgets/kcontrols
>>      with given prefix.
>>
>>    - ports: Helps to use the Codec with audio graph card
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
>> Cc: Oder Chiou <oder_chiou@realtek.com>
>> Cc: Bard Liao <bardliao@realtek.com>
>> ---
>>   Documentation/devicetree/bindings/sound/rt5659.txt | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/rt5659.txt b/Documentation/devicetree/bindings/sound/rt5659.txt
>> index 56788f5..c473df5 100644
>> --- a/Documentation/devicetree/bindings/sound/rt5659.txt
>> +++ b/Documentation/devicetree/bindings/sound/rt5659.txt
>> @@ -37,10 +37,21 @@ Optional properties:
>>   - realtek,jd-src
>>     0: No JD is used
>>     1: using JD3 as JD source
>> +  2: JD source for Intel HDA header
>>
>>   - realtek,ldo1-en-gpios : The GPIO that controls the CODEC's LDO1_EN pin.
>>   - realtek,reset-gpios : The GPIO that controls the CODEC's RESET pin.
>>
>> +- sound-name-prefix: Please refer to name-prefix.txt
>> +
>> +- ports: A Codec may have a single or multiple I2S interfaces. These
>> +  interfaces on Codec side can be described under 'ports' or 'port'.
>> +  When the SoC or host device is connected to multiple interfaces of
>> +  the Codec, the connectivity can be described using 'ports' property.
>> +  If a single interface is used, then 'port' can be used. The usage
>> +  depends on the platform or board design.
>> +  Please refer to Documentation/devicetree/bindings/graph.txt
> Please read what that file says now.

Sorry, I did not understand above comment. Can you please elaborate a 
bit more?

