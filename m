Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56732C2B9F8
	for <linux-tegra@archiver.kernel.org>; Tue, 25 May 2021 16:24:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DF156141C
	for <linux-tegra@archiver.kernel.org>; Tue, 25 May 2021 16:24:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232927AbhEYQ0M (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 May 2021 12:26:12 -0400
Received: from mail1.perex.cz ([77.48.224.245]:40856 "EHLO mail1.perex.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232200AbhEYQ0L (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 May 2021 12:26:11 -0400
Received: from mail1.perex.cz (localhost [127.0.0.1])
        by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id AB630A0042;
        Tue, 25 May 2021 18:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz AB630A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
        t=1621959879; bh=5vd1CosdGZ1x0kCQ03wCTU9ikNz4E8e+MwaijpSD2AU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=U+4Cziiuz2bRm/D2OIanNWyLaonXS/fppqUXq/nDrPNOJy+PZh76rC/R5gxCZ6Qam
         cgc3U5f8cLGD+9p4nkvPlVp0lOHsA6wkNQDNmv7M2AN21eMz/x449mQOO/rRoPf4mJ
         ySKj4Db3H8iQM1q8nvXWqvB0czYnpIkrUlIBKI5w=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: perex)
        by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
        Tue, 25 May 2021 18:24:28 +0200 (CEST)
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
 <ec2098e0-7918-8488-cf7c-a07e5aa6908c@perex.cz>
 <99ef3d77-c626-c632-bbd2-92eb15acad20@gmail.com>
From:   Jaroslav Kysela <perex@perex.cz>
Message-ID: <bc99da2b-1eb2-8f73-9e92-184cf172ef6f@perex.cz>
Date:   Tue, 25 May 2021 18:24:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <99ef3d77-c626-c632-bbd2-92eb15acad20@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24. 05. 21 16:00, Dmitry Osipenko wrote:
> 24.05.2021 13:54, Jaroslav Kysela пишет:
>> Dne 24. 05. 21 v 1:44 Dmitry Osipenko napsal(a):
>>> Specify components string for Nexus 7 using the Intel BayTrail components
>>> format. This may allow us to create a more generic UCM for RT5640 codec.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  sound/soc/tegra/tegra_asoc_machine.c | 19 +++++++++++++++++++
>>>  1 file changed, 19 insertions(+)
>>>
>>> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
>>> index a81f2ebfc00c..87e0a47040a5 100644
>>> --- a/sound/soc/tegra/tegra_asoc_machine.c
>>> +++ b/sound/soc/tegra/tegra_asoc_machine.c
>>> @@ -671,6 +671,24 @@ static const struct tegra_asoc_data tegra_rt5640_data = {
>>>  	.add_hp_jack = true,
>>>  };
>>>  
>>> +/*
>>> + * Speaker: Connected to SPO L/R P/N pins, stereo.
>>> + * Internal Microphone: Digital, connected to DMIC1_DAT IN2P/N pins.
>>> + * Headphones: Connected to HPOL/R pins.
>>> + * Headset Microphone: Unconnected.
>>> + *
>>> + * IF2_DAC/ADC are unpopulated.
>>> + */
>>> +static const struct tegra_asoc_data tegra_rt5640_grouper_data = {
>>> +	.components = "codec:rt5640 cfg-spk:2 cfg-mic:dmic1 aif:1",
>>
>> Perhaps, it may be better to handle this string via the DT config (create new
>> function like snd_soc_of_parse_card_name()).
>>
>> The "codec:rt5640" should be set in the driver (it's fixed), but the
>> "cfg-spk:2 cfg-mic:dmic1 aif:1" part is suitable for the DT config.
> 
> Not sure that this is possible. The DT is an ABI, while components
> string has no specification. Any changes to the components string will
> require DT update.
> 
> I think it's much more feasible to have a database of components within
> kernel driver, like Intel sound driver does it for ACPI devices.

There is no other possibility for ACPI. And while the components string is
part of the ALSA ABI, it should not be changed in an incompatible way. Only
new information should be added. The DT solution seems more flexible to me.
For example the stereo/mono speaker or the AIF number can be set without the
driver modification for rt5640.

					Jaroslav


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
