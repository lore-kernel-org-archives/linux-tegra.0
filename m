Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3778BC433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 18:20:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F240C64E0B
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 18:20:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbhA2SUQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Jan 2021 13:20:16 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16135 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbhA2STY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 13:19:24 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601451800001>; Fri, 29 Jan 2021 10:18:40 -0800
Received: from DRHQMAIL105.nvidia.com (10.27.9.14) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:18:39 +0000
Received: from [10.25.100.162] (172.20.145.6) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:18:35 +0000
Subject: Re: [PATCH] ASoC: tegra: SND_SOC_TEGRA_AUDIO_GRAPH_CARD should depend
 on SND_SOC_TEGRA
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20210129125915.2652952-1-geert+renesas@glider.be>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <43fbd512-3689-21b7-8d74-3257cb65d520@nvidia.com>
Date:   Fri, 29 Jan 2021 23:48:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210129125915.2652952-1-geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL105.nvidia.com (10.27.9.14)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611944320; bh=RII+q9JAnVamdrcIkQvXr9aEi7U2AFuj/1dXm5fvuvM=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=XR7AIYlZFAA1hCaVNfeSw44OuVwUPB/Y9TK4MAhluHrQleKST6w+85ceU1jQOuCHl
         05jztXaH29EbgHbNwDkH84frbHXrjCrZ5ZCd9SHbDCmoFMh0lJ1JKMTZoeYnA4vzab
         bQwsR9Cf0OwE4wiiLREP+BbB3qLDDikwr5J4A9RxidUBpvx+ymr4AzcnyanuR77o9c
         F4/KLo/0S8Ok6Rz9FBY/Kg/urCJ8cGg5wHQybwJEv7VA9rBlw4Lpfg0UKGMV0lyOux
         NB0z7ecqU+HV/ity5EpnjObYwG5bS42bYxoLkv7F5ZW0G8KWf0KLiLuoYmQNtuvOtj
         jRoSlEUvA0oOA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 1/29/2021 6:29 PM, Geert Uytterhoeven wrote:
> External email: Use caution opening links or attachments
>
>
> Audio Graph Card based Tegra driver is only useful on NVIDIA Tegra SoCs.
> Hence add a dependency on SND_SOC_TEGRA, to prevent asking the user
> about this driver when configuring a kernel without Tegra sound support.
>
> Wrap all Tegra sound config options inside a big if/endif block, instead
> of just adding the dependency to the single config option that does not
> have it yet, to preventing similar future mistakes.
>
> Fixes: 202e2f7745437aa5 ("ASoC: tegra: Add audio graph based card driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   sound/soc/tegra/Kconfig | 33 +++++++++++++--------------------
>   1 file changed, 13 insertions(+), 20 deletions(-)
>

Acked-by: Sameer Pujar <spujar@nvidia.com>
