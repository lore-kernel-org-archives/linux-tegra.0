Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301DEC433DB
	for <linux-tegra@archiver.kernel.org>; Sun, 17 Jan 2021 23:40:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E99162075B
	for <linux-tegra@archiver.kernel.org>; Sun, 17 Jan 2021 23:40:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730676AbhAQXkV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 17 Jan 2021 18:40:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729141AbhAQXkU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 17 Jan 2021 18:40:20 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F326BC061573;
        Sun, 17 Jan 2021 15:39:39 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id x23so16365836lji.7;
        Sun, 17 Jan 2021 15:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NngRK7zKNQEF+k0hgglhDJvcUtXRLFvpYKiRlc5M6rc=;
        b=pr4QwEDqGnedesfeXXPipZLlwCKrn6jQpn8s0M9nhIOoANbd0LkoDrZ1TENqBjv7DQ
         BqzJNy99yIusnGtFVQ83ovXwG4RaUOgfuyXTJfFqquIrdsms0VBOg25p7Ut4fqD1M+Nj
         NUcnOClla9QqliHtwsVnnekGNiPl19vJTBDiCeEh+okvdKD70lQY38mvcNYgbz+4MPso
         7Ny5vci36OYriOUiqDnbVS+zFOzZGnaV1CJcUTD4QNOH3bEfLSmNnVUzPYgjdMc4rXT7
         OtkBsZhzKah+jSo8C0/si4Vsf2dBUcQ1fRLOAdgj977IU7mfwS1K8rfsvp5a8V6HKoTd
         R+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NngRK7zKNQEF+k0hgglhDJvcUtXRLFvpYKiRlc5M6rc=;
        b=CMoWM2qdnoELWXXknk7t88lGa+atGrGTztDVdneTawIgl4zjt1rTJC0VnpDWcr6ODn
         rl/f/qviz7Blv51iZq8Mq6nWZ1XPKvgICdTB9wREE4U564r/SChhTlC4TCsfhJ2xSxGh
         m+yeXdnBT/mc/g5v2c26LSlCNdVhbuVZy0vI9uXBjmBTbAVF7Tb/RJL2s48HBwzo5Grh
         F4P8aZi5ihcJRXIqiie2l/9qiTOkCI6F/9fQK0iOONr4Le+upuARPuX5ExcALrzHR2Mv
         szMs9r5OTBEoPx6A/bw9oWCXrshpKS5JJYyFwuaa8fbCgVXJRGSz6fpWfYBVyAhG/Tha
         AQtA==
X-Gm-Message-State: AOAM532GG4N7YQuNunO0p+IizbWamY5hlUToX/rpztMPdeP0GGaSY9E4
        YzP2sOypmhwRhLY8kO3uqMG7pVEgK44=
X-Google-Smtp-Source: ABdhPJxGEV31xC98dlLp7kilDrh+7rKsEeO12+SULku6Sq8uVrJGDj4ACHuNWm0Cel+Su8Atu+R8lA==
X-Received: by 2002:a2e:b6d0:: with SMTP id m16mr9116160ljo.133.1610926778317;
        Sun, 17 Jan 2021 15:39:38 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id y24sm1522328ljm.125.2021.01.17.15.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jan 2021 15:39:37 -0800 (PST)
Subject: Re: [PATCH v1 2/5] ALSA: hda/tegra: Reset hardware
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-3-digetx@gmail.com> <YAG2K4CjtCdSs6P2@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e26bac65-7cde-439f-a353-3b960691096f@gmail.com>
Date:   Mon, 18 Jan 2021 02:39:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <YAG2K4CjtCdSs6P2@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.01.2021 18:35, Thierry Reding пишет:
> On Tue, Jan 12, 2021 at 03:58:31PM +0300, Dmitry Osipenko wrote:
>> Reset hardware in order to bring it into a predictable state.
>>
>> Tested-by: Peter Geis <pgwipeout@gmail.com>
>> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  sound/pci/hda/hda_tegra.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
>> index 4c799661c2f6..e406b7980f31 100644
>> --- a/sound/pci/hda/hda_tegra.c
>> +++ b/sound/pci/hda/hda_tegra.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/moduleparam.h>
>>  #include <linux/mutex.h>
>>  #include <linux/of_device.h>
>> +#include <linux/reset.h>
>>  #include <linux/slab.h>
>>  #include <linux/time.h>
>>  #include <linux/string.h>
>> @@ -70,6 +71,7 @@
>>  struct hda_tegra {
>>  	struct azx chip;
>>  	struct device *dev;
>> +	struct reset_control *reset;
>>  	struct clk_bulk_data clocks[3];
>>  	unsigned int nclocks;
>>  	void __iomem *regs;
>> @@ -167,6 +169,12 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
>>  	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
>>  	int rc;
>>  
>> +	if (!(chip && chip->running)) {
> 
> Isn't that check for !chip a bit redundant? If that pointer isn't valid,
> we're just going to go crash when dereferencing hda later on, so I think
> this can simply be:
> 
> 	if (!chip->running)
> 
> I guess you took this from the inverse check below, but I think we can
> also drop it from there, perhaps in a separate patch.
> 
>> +		rc = reset_control_assert(hda->reset);
>> +		if (rc)
>> +			return rc;
>> +	}
>> +
>>  	rc = clk_bulk_prepare_enable(hda->nclocks, hda->clocks);
>>  	if (rc != 0)
>>  		return rc;
>> @@ -176,6 +184,10 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
>>  		/* disable controller wake up event*/
>>  		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
>>  			   ~STATESTS_INT_MASK);
>> +	} else {
>> +		rc = reset_control_reset(hda->reset);
> 
> The "if (chip)" part definitely doesn't make sense after this anymore
> because now if chip == NULL, then we end up in here and dereference an
> invalid "hda" pointer.

Okay, I took a note for the v3.

> Also, why reset_control_reset() here? We'll reach this if we ran
> reset_control_assert() above, so this should just be
> reset_control_deassert() to undo that, right? I suppose it wouldn't hurt
> to put throw that standard usleep_range() in there as well that we use
> to wait between reset assert and deassert to make sure the clocks have
> stabilized and the reset has indeed propagated through the whole IP.

The reset_control_reset() does the delaying before the deassert, i.e. it
does assert -> udelay(1) -> deassert.

https://elixir.free-electrons.com/linux/v5.11-rc3/source/drivers/clk/tegra/clk.c#L133

The reset_control_reset() usage appears to be a bit more code-tidy
variant in comparison to delaying directly. But I don't mind to use
delay + reset_control_deassert() directly since it may not be obvious to
everyone what reset_control_reset() does.
I'll change it in v3.
