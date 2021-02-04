Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9697C433DB
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 03:47:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 534F864F5D
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 03:47:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbhBDDqq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Feb 2021 22:46:46 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12454 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhBDDqq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Feb 2021 22:46:46 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601b6dfe0000>; Wed, 03 Feb 2021 19:46:06 -0800
Received: from [10.25.102.154] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 03:46:01 +0000
Subject: Re: [PATCH 1/2] ASoC: audio-graph: Export graph_remove() function
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>
References: <1612368575-25991-1-git-send-email-spujar@nvidia.com>
 <1612368575-25991-2-git-send-email-spujar@nvidia.com>
 <20210203161951.GG4880@sirena.org.uk>
 <64b65aaf-9971-e071-5d52-02286fe0cacc@nvidia.com>
 <20210203172415.GH4880@sirena.org.uk>
 <87y2g494b0.wl-kuninori.morimoto.gx@renesas.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <c090ef0b-3af8-4ff3-027d-d8c84019eca4@nvidia.com>
Date:   Thu, 4 Feb 2021 09:15:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87y2g494b0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612410366; bh=DwIn2j1vQcvA9mQebkfkn8fWS9nwtb6i848UUWLIsQc=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=IAQYv23ZZbiCxLRGuJWC1dUROtZHT2sm1b/i6fGFUEPvJSl1wQkgc5mWy6rx7GHDv
         xsBB2g5ZtEvYaQub+VCtXdIkm6hqsOymcBeHZnY8HVAkTqqfotN8VIoRkDAeN7awPT
         ENmWJ8Q1qqW5eIjQTXe8P67Ncf/xR6WqgcYhwUrqghlyGONc/qrClXxwCTtalc9XMs
         F/0LsnBF0OwwK9ZdvVj7Y1msr5U1M8qzcLloJkRtDbo2NBFQwF/4VKVxPQJKlAIsFa
         4knX5TfEU1Lj2Wa8j4s9I8o6AJo7w7x45orTAaUpOTe8C8XY+lSLTVVIjBOa/eihQw
         qY5vE2oI20Dbg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2/4/2021 4:03 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi
>
>>>>> +int graph_remove(struct platform_device *pdev);
>>>> I think this needs better namespacing if it's going to be exported.
>>> audio_graph_remove() can be a better choice?
>> Yeah, that looks reasonable.
> Nice naming I think.
> In such case,  update also graph_parse_of() is nice idea for me.
>
>          - int graph_parse_of(...)
>          + int audio_graph_parse_of()

OK, Will update following.

graph_remove()=C2=A0=C2=A0=C2=A0=C2=A0 --> audio_graph_remove()
graph_parse_of()=C2=A0=C2=A0 --> audio_graph_parse_of()
graph_card_probe() --> audio_graph_card_probe()


