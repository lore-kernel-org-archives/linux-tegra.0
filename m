Return-Path: <SRS0=MPHS=D2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07160C433E7
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Oct 2020 04:31:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B366222240
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Oct 2020 04:31:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="rF7+S2/a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbgJSEbK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Oct 2020 00:31:10 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:15198 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726829AbgJSEbK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Oct 2020 00:31:10 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8d16600000>; Sun, 18 Oct 2020 21:30:24 -0700
Received: from [10.25.98.225] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 19 Oct
 2020 04:30:58 +0000
Subject: Re: [PATCH v4 09/15] ASoC: dt-bindings: audio-graph: Convert bindings
 to json-schema
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
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
 <1602859382-19505-10-git-send-email-spujar@nvidia.com>
 <87o8kz9blh.wl-kuninori.morimoto.gx@renesas.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <2c9abfd5-f7eb-0b8d-f45f-9f56f37881b5@nvidia.com>
Date:   Mon, 19 Oct 2020 10:00:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87o8kz9blh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603081824; bh=JlVHUDKLpcK1i8rBNnQBiUlJRXSUCLWhMPCqRDHsvmI=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=rF7+S2/aZqYZK1QazdBEO1FX30HJnmmW1idk6J3T9yuuBVdxr/O2FodsXSOZY0d8Q
         oDLeJosw9P2zcz7RL0J9S9imoz7FgiMPulBVhyvZGnBZpB99MJ1K3/vfGZ91m+JC27
         7qUIdZCU0CKNOuOYhKCBSxPx25QCpz5g9+B6x0b1urfVtOhzN0i9LuWP+Nevk0Llau
         BiHPIUCiltWH4p3WwOUP4KcawDHY4pZDusjMQCzHgE9TlN1b9Dwo5Lzw2YsR7xiqjV
         G8eKfgm9lOME0mIpy7u+TO9KAdhslZkGTz20qIV8fohNH2nc/TiHAMUNa0NkDmJPEC
         M1Zy97K3dr9WA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Morimoto-san,

>> Convert device tree bindings of audio graph card to YAML format. Also
>> expose some common definitions which can be used by similar graph based
>> audio sound cards.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> ---
> I'm posting this patch to Rob & DT ML.
> Not yet accepted, though..

Thanks for letting me know. I guess below is your patch,
http://patchwork.ozlabs.org/project/devicetree-bindings/patch/877dtlvsxk.wl-kuninori.morimoto.gx@renesas.com/
Do you have plans to resend this or send next revision?

I can drop my patch once yours is merged and refer the same for Tegra 
audio graph card.

Thanks,
Sameer.


