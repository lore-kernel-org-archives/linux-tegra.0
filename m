Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139A6C4167B
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Dec 2020 04:53:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEE3221734
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Dec 2020 04:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgLGEx1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 6 Dec 2020 23:53:27 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18726 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgLGEx0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 6 Dec 2020 23:53:26 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fcdb51e0000>; Sun, 06 Dec 2020 20:52:46 -0800
Received: from [10.25.96.159] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Dec
 2020 04:52:42 +0000
Subject: Re: [PATCH v6 0/6] Tegra210 audio graph card
To:     Mark Brown <broonie@kernel.org>, <thierry.reding@gmail.com>,
        <robh+dt@kernel.org>
CC:     <sharadg@nvidia.com>, <jonathanh@nvidia.com>,
        <kuninori.morimoto.gx@renesas.com>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
 <160683107678.35139.14772386553150233276.b4-ty@kernel.org>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <a3541d83-1f2e-c60f-05f8-4fdd8c8f4175@nvidia.com>
Date:   Mon, 7 Dec 2020 10:22:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <160683107678.35139.14772386553150233276.b4-ty@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607316766; bh=a4fExwYSCzW8iKIEs03t5hkl0PLY9U5HKC1J+84tRhM=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=cjwm6O4NAxb/W+maQk/2sGdGDRj4MpwGSnFYip4dmHyIRdfKxdqAw/xMxz3lPIaB6
         tLB0lnQiIr1cMTQDDHiKSwnYghiJpu2OKoCa2kVanUMKZyN0/24hDqGPzHflFuxKgx
         2wFJ1gRnNmxbTgKwa0/yorMDiZDK/p7CkowMZnGcrSGWwghPt4RnLehYoTER3mSq8H
         pDWqZRHCQWgR9JlB0dOlCKGwii311NIadAqnWIIiOLzBqx3aqb4lVXEZ6QHuO6BOq9
         aKZGq/3HYqVneBKvj62EYkUQ21rVhcspyam7+DeemDjwNLZnNXeCpncclxMTSh+KxS
         9CIlMFhlLXK5w==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Mark,

>> This series adds audio graph based sound card support for Tegra210
>> platforms like Jetson-TX1 an Jetson-Nano. The following preparatory
>> audio graph enhancement series is already merged.
>>   * https://patchwork.kernel.org/project/alsa-devel/list/?series=375629&state=*
>>
>> Following are the summary of changes:
>>   * Add graph/audio-graph based schemas or schema updates for Tegra210
>>     component and machine drivers.
>>   * Add Tegra audio graph machine driver.
>>   * Add required DT support for Jetson-TX1/Nano.
>>
>> [...]
> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>
> Thanks!
>
> [1/3] ASoC: dt-bindings: tegra: Add graph bindings
>        (no commit info)
> [2/3] ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card
>        (no commit info)
> [3/3] ASoC: tegra: Add audio graph based card driver
>        (no commit info)

I don't see above patches in linux-next yet. Should I wait some more 
time for this to appear?


Thanks,
Sameer.
