Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D19C433DB
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 03:39:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9216764E33
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 03:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbhBDDjz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Feb 2021 22:39:55 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11188 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233449AbhBDDjy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Feb 2021 22:39:54 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601b6c620003>; Wed, 03 Feb 2021 19:39:14 -0800
Received: from [10.25.102.154] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 03:39:11 +0000
Subject: Re: [PATCH 1/2] ASoC: audio-graph: Export graph_remove() function
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC:     <broonie@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>
References: <1612368575-25991-1-git-send-email-spujar@nvidia.com>
 <1612368575-25991-2-git-send-email-spujar@nvidia.com>
 <87zh0k94eo.wl-kuninori.morimoto.gx@renesas.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <691678f3-d0da-2320-ef6f-82090b9d8f9d@nvidia.com>
Date:   Thu, 4 Feb 2021 09:09:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87zh0k94eo.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612409954; bh=3Lj3YB24wWeojwA714T0pgTPArxLvGfmTOgyy4fsztg=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=ov9XZCg0goglyOSfH20N2P+qSa+DoUpUvCaxtRnUo+CCqWYEQGi1yZiQ+Tb6L/ltk
         lNXpRqJdCjOVw3qxT5dWUfHWkO+C71ehTjj0QwLTRAgyLG816doZ5d87Cqqyq3Yxx9
         fanXnNdWV4f8XzJkh7Rwg4rNMojU50nySwW+dwee/gsYomNgmnM+betuWJLOUn9cjZ
         vkVaXMrfJvFoBLw9AVingzVOe7v3l46pYp8GH+/bFTxKuIFDym+OjU8EaF+TxtKzee
         dj098Zs0S3y7PKZSAWgST/DmKKc7dWUZ246QBbrKZbAsKKcUInVF2jyfgY3AYkEksa
         vg+B7Bgw4D6Og==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2/4/2021 4:01 AM, Kuninori Morimoto wrote:
>> Audio graph based sound card drivers can call graph_remove() function
>> for cleanups during driver removal. To facilitate this export above
>> mentioned function.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> (snip)
>> -static int graph_remove(struct platform_device *pdev)
>> +int graph_remove(struct platform_device *pdev)
>>   {
>>        struct snd_soc_card *card = platform_get_drvdata(pdev);
>>
>>        return asoc_simple_clean_reference(card);
>>   }
>> +EXPORT_SYMBOL_GPL(graph_remove);
> Not a big deal, but
> it is just calling asoc_simple_clean_reference() which is
> already global function.

Yes that is true, but idea was to put dependency on graph_remove() so 
that any additions/changes here in future will be automatically taken 
care for Tegra graph card.
