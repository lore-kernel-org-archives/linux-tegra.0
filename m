Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6A4C4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 09:00:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66BAE206DC
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 09:00:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="sMvGl79x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbgJBJAP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 05:00:15 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:7449 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgJBJAO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 05:00:14 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f76ec120000>; Fri, 02 Oct 2020 02:00:02 -0700
Received: from [10.25.97.216] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 09:00:03 +0000
Subject: Re: [PATCH v3 07/13] ASoC: audio-graph: Update driver as per new
 exposed members
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        <mkumard@nvidia.com>, <viswanathl@nvidia.com>,
        <rlokhande@nvidia.com>, <dramesh@nvidia.com>,
        <atalambedu@nvidia.com>, <nwartikar@nvidia.com>,
        <swarren@nvidia.com>, <nicoleotsuka@gmail.com>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-8-git-send-email-spujar@nvidia.com>
 <877ds9l7xu.wl-kuninori.morimoto.gx@renesas.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <4e5954f0-992b-5923-ce3c-6ae5d562b2e5@nvidia.com>
Date:   Fri, 2 Oct 2020 14:30:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <877ds9l7xu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601629202; bh=oWAlMGZr7e/KMA1zYhU+ALOo7mjETqn4ZiGIG9j4vKw=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=sMvGl79xmGrCX6i92jcB+lTugkyqx8O8vcI0cm7UGuEcphPJVvOVPkKNl2GGVfcGH
         MDRGg4rZIVaEwS6bjPSOm40zS0d/FKepo7xkk/ZmqtjcNp1bgsX2tJaGnpgeVRzGGd
         Y9T+Q1jXhz2NvDN28Qo14paBrjAYY29Oxb9Jr29qfqYhsbTlYc7yX7KC23e1jODG04
         1TkMPPfe0PyZ/4nNPJHpWVvN1KSQKjIlGp1yyeDU5n6Grd+mWBLh+tFDADHt6lZkWD
         BZ5z0pD9MM12lzv6za7kuBgL+qHZGcS3ewsFSoKtySwe7ShYkvu6CdNZ0kH1kdRAAR
         EbXz2FBrex0fw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


>> As per the members exposed earlier in the series, audio graph driver
>> is updated to make use of these. Functionally there is no change
>> in behavior if these are not populated. So following changes are made
>> as part of this.
>>
>>   - Update 'dai_link->ops' for DPCM links if a custom 'snd_soc_ops'
>>     is defined by the vendor driver.
>>
>>   - Consider 'force_dpcm' flag status when deciding if a DAI link
>>     needs to be treated as DPCM or not. In doing so the logic is
>>     moved to a separate inline function for a better readability.
>>
>>   - Populate 'dpcm_selectable' flag which is then used to detect
>>     DPCM DAI links.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> ---
> Can we merge [06/13] and [07/13] patches ?

Yes can be merged.
