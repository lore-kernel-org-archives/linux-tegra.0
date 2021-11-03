Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE6AC433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Nov 2021 17:25:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DF676109F
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Nov 2021 17:25:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbhKCR2T (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Nov 2021 13:28:19 -0400
Received: from mail1.perex.cz ([77.48.224.245]:42478 "EHLO mail1.perex.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229621AbhKCR2T (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 3 Nov 2021 13:28:19 -0400
Received: from mail1.perex.cz (localhost [127.0.0.1])
        by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6B129A003F;
        Wed,  3 Nov 2021 18:25:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6B129A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
        t=1635960340; bh=h+O++BB8CRNoSYal2MkeOn2rjqYVgYHaMhHNCqPDJgU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=lzzN5B5OPCyBO45Hn4b9SHmvr9TQh7lw3mQOFP/V7l+xGWjKlEYosSVCmJCUHstVM
         zoXOiGFYCMXq+NV+M4VxuxVTvZkGhb1Nn/oyxeBiVj3ty5ChKS0YSLaXqqc+ZvcnAp
         Mkicr/JTWE4ixwRGLlj3lY6QN50RBkgJdpU4muuo=
Received: from [192.168.100.98] (unknown [192.168.100.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: perex)
        by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
        Wed,  3 Nov 2021 18:25:30 +0100 (CET)
Message-ID: <0e2d89ca-84e3-9427-5ce1-c0224d4db089@perex.cz>
Date:   Wed, 3 Nov 2021 18:25:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 01/10] ASoC: tegra: Fix kcontrol put callback in ADMAIF
Content-Language: en-US
To:     Takashi Iwai <tiwai@suse.de>, Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
 <1635947547-24391-2-git-send-email-spujar@nvidia.com>
 <s5ha6ilmiiv.wl-tiwai@suse.de>
From:   Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <s5ha6ilmiiv.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 03. 11. 21 15:16, Takashi Iwai wrote:
> On Wed, 03 Nov 2021 14:52:17 +0100,
> Sameer Pujar wrote:
>>
>> The kcontrol put callback is expected to return 1 when there is change
>> in HW or when the update is acknowledged by driver. This would ensure
>> that change notifications are sent to subscribed applications. Update
>> the ADMAIF driver accordingly
>>
>> Fixes: f74028e159bb ("ASoC: tegra: Add Tegra210 based ADMAIF driver")
>> Suggested-by: Jaroslav Kysela <perex@perex.cz>
>> Suggested-by: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
>>   sound/soc/tegra/tegra210_admaif.c | 23 ++++++++++++++++++-----
>>   1 file changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
>> index bcccdf3..dc71075 100644
>> --- a/sound/soc/tegra/tegra210_admaif.c
>> +++ b/sound/soc/tegra/tegra210_admaif.c
>> @@ -452,16 +452,29 @@ static int tegra_admaif_put_control(struct snd_kcontrol *kcontrol,
>>   	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
>>   	int value = ucontrol->value.integer.value[0];
>>   
>> -	if (strstr(kcontrol->id.name, "Playback Mono To Stereo"))
>> +	if (strstr(kcontrol->id.name, "Playback Mono To Stereo")) {
>> +		if (admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg] == value)
>> +			return 0;
>> +
>>   		admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg] = value;
>> -	else if (strstr(kcontrol->id.name, "Capture Mono To Stereo"))
>> +	} else if (strstr(kcontrol->id.name, "Capture Mono To Stereo")) {
>> +		if (admaif->mono_to_stereo[ADMAIF_RX_PATH][ec->reg] == value)
>> +			return 0;
>> +
>>   		admaif->mono_to_stereo[ADMAIF_RX_PATH][ec->reg] = value;
>> -	else if (strstr(kcontrol->id.name, "Playback Stereo To Mono"))
>> +	} else if (strstr(kcontrol->id.name, "Playback Stereo To Mono")) {
>> +		if (admaif->stereo_to_mono[ADMAIF_TX_PATH][ec->reg] == value)
>> +			return 0;
>> +
>>   		admaif->stereo_to_mono[ADMAIF_TX_PATH][ec->reg] = value;
>> -	else if (strstr(kcontrol->id.name, "Capture Stereo To Mono"))
>> +	} else if (strstr(kcontrol->id.name, "Capture Stereo To Mono")) {
>> +		if (admaif->stereo_to_mono[ADMAIF_RX_PATH][ec->reg] == value)
>> +			return 0;
>> +
>>   		admaif->stereo_to_mono[ADMAIF_RX_PATH][ec->reg] = value;
>> +	}
>>   
>> -	return 0;
>> +	return 1;
> 
> Hrm, that looks too redundant.  The similar checks are seen in the get
> part, so we may have a better helper function to reduce the string
> checks, something like below.

While proposing such cleanups, I would create separate get/put callbacks for 
all four ops instead using strstr(). The callbacks may put the common code to 
one function. It may reduce the code size (and the text segment size).

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
