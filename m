Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07160C04FF3
	for <linux-tegra@archiver.kernel.org>; Mon, 24 May 2021 10:54:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA67A610FA
	for <linux-tegra@archiver.kernel.org>; Mon, 24 May 2021 10:54:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbhEXK4E (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 May 2021 06:56:04 -0400
Received: from mail1.perex.cz ([77.48.224.245]:52866 "EHLO mail1.perex.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232519AbhEXK4B (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 May 2021 06:56:01 -0400
Received: from mail1.perex.cz (localhost [127.0.0.1])
        by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 93114A003F;
        Mon, 24 May 2021 12:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 93114A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
        t=1621853671; bh=cLNvuoul83KyUdFW60FXLyxsV7KFLxBZUxeIWdodof8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=4zH5TWP1PGgEIwDXvGUHTVMCkD/ZtXeP3VaLTB2mhslzfSqUJIwSa8u46FtHSl9/m
         HHfIMA0IvYDfs1Xx7q0pVr9xkq6hdl8tS8KWXfBPd0SHIhTDmjhAorBtOFLiooSa/Q
         VJuQSj3o1W6VnT8X5EVzoeoNemuUpUatwo0SfLkU=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: perex)
        by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
        Mon, 24 May 2021 12:54:20 +0200 (CEST)
Subject: Re: [PATCH v3 4/4] ASoC: tegra: Specify components string for Nexus 7
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210523234437.25077-1-digetx@gmail.com>
 <20210523234437.25077-5-digetx@gmail.com>
From:   Jaroslav Kysela <perex@perex.cz>
Message-ID: <ec2098e0-7918-8488-cf7c-a07e5aa6908c@perex.cz>
Date:   Mon, 24 May 2021 12:54:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210523234437.25077-5-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Dne 24. 05. 21 v 1:44 Dmitry Osipenko napsal(a):
> Specify components string for Nexus 7 using the Intel BayTrail components
> format. This may allow us to create a more generic UCM for RT5640 codec.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra_asoc_machine.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
> index a81f2ebfc00c..87e0a47040a5 100644
> --- a/sound/soc/tegra/tegra_asoc_machine.c
> +++ b/sound/soc/tegra/tegra_asoc_machine.c
> @@ -671,6 +671,24 @@ static const struct tegra_asoc_data tegra_rt5640_data = {
>  	.add_hp_jack = true,
>  };
>  
> +/*
> + * Speaker: Connected to SPO L/R P/N pins, stereo.
> + * Internal Microphone: Digital, connected to DMIC1_DAT IN2P/N pins.
> + * Headphones: Connected to HPOL/R pins.
> + * Headset Microphone: Unconnected.
> + *
> + * IF2_DAC/ADC are unpopulated.
> + */
> +static const struct tegra_asoc_data tegra_rt5640_grouper_data = {
> +	.components = "codec:rt5640 cfg-spk:2 cfg-mic:dmic1 aif:1",

Perhaps, it may be better to handle this string via the DT config (create new
function like snd_soc_of_parse_card_name()).

The "codec:rt5640" should be set in the driver (it's fixed), but the
"cfg-spk:2 cfg-mic:dmic1 aif:1" part is suitable for the DT config.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
