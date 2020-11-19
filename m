Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBB8C6379D
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 09:10:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E0AA246B8
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 09:10:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="LCPMoJEa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgKSJKZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Nov 2020 04:10:25 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18082 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbgKSJKY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Nov 2020 04:10:24 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb636760002>; Thu, 19 Nov 2020 01:10:14 -0800
Received: from [10.25.102.126] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov
 2020 09:10:20 +0000
Subject: Re: [PATCH v5 1/6] ASoC: dt-bindings: tegra: Add graph bindings
To:     Rob Herring <robh@kernel.org>
CC:     <broonie@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <kuninori.morimoto.gx@renesas.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>
References: <1605119676-32273-1-git-send-email-spujar@nvidia.com>
 <1605119676-32273-2-git-send-email-spujar@nvidia.com>
 <20201112143855.GA3553055@bogus>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <bfac9d56-7cb5-6c75-6f1b-48f8ab43fa1c@nvidia.com>
Date:   Thu, 19 Nov 2020 14:40:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201112143855.GA3553055@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605777014; bh=utlwG7nu71X3qIUCNZ88e7I6oHNRaiQbemkseQHnGtM=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=LCPMoJEay/B07UbKTKJ7s0fDXmJl0skB1I4MjEijOeUVHpdnQXbgAi4stdGZJG2zR
         uMG8K5NwzXuBeIoZx6nMmfbp5vbNhsQuqxG7nLh04LLJFOb6e3yyDBVfZgXjrIjCu0
         Iq66N5LIyX4aFoj1GyvG65kMYL5wFiaBkWezf+c0+WK+X3cDralim8KETTze1X0//+
         yc1M1U9hxk8J3AeKj+/lmXp5pjIFKWy5Xq1cZeM1XREtZtRgjzXWW25VFQDhCPmzX1
         A3TqPg/kc0iGNGR1fjs5BefmJiXBnhmaWj0KxM6MWAUb98KvgVvZPdC7PKbmSzChU6
         bd9svJgRQNtQA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Rob,

>> Add device tree binding properties of generic graph to ASoC component
>> devices. This allows to define audio ports out of these components or
>> DAIs and audio graph based sound card can be realised with this.
> This is all dependent on graph.yaml being applied which hasn't happened
> yet. I guess I'll need to provide a branch as there's multiple
> subsystems needing it.
>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
>>   .../devicetree/bindings/sound/nvidia,tegra186-dspk.yaml     |  6 ++++++
>>   .../devicetree/bindings/sound/nvidia,tegra210-admaif.yaml   |  6 ++++++
>>   .../devicetree/bindings/sound/nvidia,tegra210-ahub.yaml     | 13 +++++++++++--
>>   .../devicetree/bindings/sound/nvidia,tegra210-dmic.yaml     |  6 ++++++
>>   .../devicetree/bindings/sound/nvidia,tegra210-i2s.yaml      |  6 ++++++
>>   5 files changed, 35 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>> index ed2fb32..3c9364d 100644
>> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>> @@ -55,6 +55,12 @@ properties:
>>         The name can be "DSPK1" or "DSPKx", where x depends on the maximum
>>         available instances on a Tegra SoC.

>>
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
> If you have 'ports', then that means you have multiple ports and you
> have to enumerate what each port is.
>
>> +
>> +  port:
>> +    $ref: /schemas/sound/audio-graph.yaml#/properties/port
> If you only have 1 port then, you can use 'port'.
>
>
> So listing both is an error.

Since "ASoC: graph card schema rework" series is merged now, referencing 
"audio-graph-port.yaml" should be sufficient here?

...
