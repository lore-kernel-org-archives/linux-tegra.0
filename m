Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91809C4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 08:52:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F900206DC
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 08:52:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Q6JBHgBm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbgJBIwJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 04:52:09 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4981 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgJBIwJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 04:52:09 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f76ea050000>; Fri, 02 Oct 2020 01:51:17 -0700
Received: from [10.25.97.216] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 08:52:00 +0000
Subject: Re: [PATCH v3 10/13] ASoC: tegra: Add audio graph based card driver
To:     Dmitry Osipenko <digetx@gmail.com>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-11-git-send-email-spujar@nvidia.com>
 <98f01f9e-96f8-6867-1af3-475294e81a9d@gmail.com>
 <352b5f57-baa5-8905-4ac9-1281268270a8@gmail.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <c2cc4b56-8abb-22b0-13ea-42f1db6dc642@nvidia.com>
Date:   Fri, 2 Oct 2020 14:21:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <352b5f57-baa5-8905-4ac9-1281268270a8@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601628677; bh=MKlVcqKLPdDu8OBlYPBwuNP2isTdKIOp/ktFx21aA+U=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=Q6JBHgBmCmScUpfFBsiclVC+L3nHbZj7/FeXu1PPFwxGk4uA9yv+yt3bFjW/dGES1
         cJlgXeXUUNDMGphPJzP+7p9V3Auoa44c+FptQp6W7/63SpbIXcKtY0ZABN/FWkeXWe
         tQOqKQwPWlwqRWzsj3+IcaZvtItU62hWp6JsA8WEzSzaFPa9k6NJPnVcyj12LbkSl0
         3IRENlQzEtLu/zoumUrzNgxIwTuu95U2Ct50qqkzMh57U0AUK/kCRgYISaKNGFguxm
         upKJLJXhDd77WGhbc//ygaVpADM23m4Q9I62+C7xpFcx1ai7V3Tzcs1P+CS8oRlhsJ
         53FivqyFeer+g==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


>>> +/* Setup PLL clock as per the given sample rate */
>>> +static int tegra_audio_graph_update_pll(struct snd_pcm_substream *substream,
>>> +                                    struct snd_pcm_hw_params *params)
>>> +{
>>> +    struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>>> +    struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
>>> +    struct device *dev = rtd->card->dev;
>>> +    struct tegra_audio_graph_data *graph_data =
>>> +            (struct tegra_audio_graph_data *)priv->data;
>>> +    struct tegra_audio_chip_data *chip_data =
>>> +            (struct tegra_audio_chip_data *)of_device_get_match_data(dev);
>> void* doesn't need casting
>>
> There are several similar places in the code. Not a big deal, but this
> makes code less readable than it could be.

I will drop these in next revision.
