Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F58C433E6
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Jan 2021 06:31:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA3EE229C4
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Jan 2021 06:31:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbhAEGbX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Jan 2021 01:31:23 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16724 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbhAEGbW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Jan 2021 01:31:22 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5ff407920000>; Mon, 04 Jan 2021 22:30:42 -0800
Received: from [10.25.100.71] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Jan
 2021 06:30:35 +0000
Subject: Re: [PATCH 2/2] ALSA: hda/tegra: fix tegra-hda on tegra30 soc
To:     Peter Geis <pgwipeout@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Peter De Schrijver" <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Mohan Kumar <mkumard@nvidia.com>
CC:     <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Ion Agorria <ion@agorria.com>
References: <20201225012025.507803-1-pgwipeout@gmail.com>
 <20201225012025.507803-3-pgwipeout@gmail.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <0c3665b2-bac6-546a-bdd4-0ab7a90adf7c@nvidia.com>
Date:   Tue, 5 Jan 2021 12:00:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201225012025.507803-3-pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1609828242; bh=+TbvEK70pgMeNJJMJSEFAbEVqczYIlNcn1A6iMFsvnE=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=VRFUKKclHq/2JaUXtTHG2IvmplsF4cEUVv+dvwRSHRNg9oDsK0HASEjYbR6dysveJ
         hz5IEXn8h96NnUF4hw650hWsM4Npsn1Q4peEf6yOgPD5qf4KBoqdwEgr3HOkuJjq6y
         VCtU5PeVRothSPjDO0pAphq5l/bCRR9zQJN63G16mcpuvtnto5XS8ixo4mLJ+jwNpi
         TdOmEkn9RRteF8QEWVSIY+Zmc1Dc45G0uZGJZ1+fejUs+ll5D5OLqTmF1g2+wfsmA7
         H3nO6isudhca8rAGTYv6fJmmoLWKKideLZldwEPmvKcwps3+951MupvV78dc/hPtud
         Y2qtuKU+3NpnA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 12/25/2020 6:50 AM, Peter Geis wrote:
> External email: Use caution opening links or attachments
>
>
> Currently hda on tegra30 fails to open a stream with an input/output error.
> This is similar to the issue referenced in [1].
>
> For example:
> speaker-test -Dhw:0,3 -c 2
>
> speaker-test 1.2.2
>
> Playback device is hw:0,3
> Stream parameters are 48000Hz, S16_LE, 2 channels
> Using 16 octaves of pink noise
> Rate set to 48000Hz (requested 48000Hz)
> Buffer size range from 64 to 16384
> Period size range from 32 to 8192
> Using max buffer size 16384
> Periods = 4
> was set period_size = 4096
> was set buffer_size = 16384
>   0 - Front Left
> Write error: -5,Input/output error
> xrun_recovery failed: -5,Input/output error
> Transfer failed: Input/output error
>
> [1] states "Due to a legacy HW design problem", implying the issue applies to all previous tegra-hda devices.
> The tegra-hda device was introduced in tegra30 but only utilized in tegra124 until now.
> For this reason it is unknown when this issue first manifested.
>
> Applying the fix in [1] universally resolves this issue on tegra30.
> Tested on the Ouya game console and the tf201 tablet.
>
> [1] 60019d8c650d ("ALSA: hda/tegra: workaround playback failure on Tegra194")

This issue was never seen on Tegra210/Tegra186 and hence at that time it 
was thought to be specific to Tegra194. I never tested this on Tegra30 
since I don't have this device. I will clarify this with HW folks if 
workaround is safer for all chips.

>
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Ion Agorria <ion@agorria.com>
> ---
>   sound/pci/hda/hda_tegra.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
> index 70164d1428d4..f8d61e677a09 100644
> --- a/sound/pci/hda/hda_tegra.c
> +++ b/sound/pci/hda/hda_tegra.c
> @@ -388,8 +388,7 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
>           * in powers of 2, next available ratio is 16 which can be
>           * used as a limiting factor here.
>           */
> -       if (of_device_is_compatible(np, "nvidia,tegra194-hda"))
> -               chip->bus.core.sdo_limit = 16;
> +       chip->bus.core.sdo_limit = 16;

Future Tegra chips address this problem and hence cannot be enforced by 
default. May be we can have like below:

if (of_device_is_compatible(np, "nvidia,tegra30-hda"))
chip->bus.core.sdo_limit = 16;

>
>          /* codec detection */
>          if (!bus->codec_mask) {
> --
> 2.25.1
>

