Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891B0C4707A
	for <linux-tegra@archiver.kernel.org>; Fri, 21 May 2021 18:43:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AA4861175
	for <linux-tegra@archiver.kernel.org>; Fri, 21 May 2021 18:43:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238912AbhEUSoq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 May 2021 14:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbhEUSoq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 May 2021 14:44:46 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC404C061574;
        Fri, 21 May 2021 11:43:21 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id r5so31086080lfr.5;
        Fri, 21 May 2021 11:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fuy4eXWPqUUba10mtYw0ydLr89ZV2AWylPLaoR+Jdl4=;
        b=DQa6aM0lePceIRpuhRStqIbL+0JixghBlOWL6jmxditypPGSFAVvbu27mIad8oVCF0
         jcEEToZJ1ntmf24pqZaqhwZQdb2qpi6Elm7gp9UBxDOM8MoYJJlXw+ANSRsD2jBKZhtx
         +2iNnQ1+JsxHImxts70WdWW5FAYQF3MK3/jR5wzN96uhnNQoe1ISZ0e3puYKlam2ps3V
         QmeUd0WcY/N8O1bWcoLnhzYNqPlNv4wUoHs406rh+b6ObEOONTwOcq1+b1sjCpoabXYr
         RemqN3HYXDkP+HM5UOzO0z4CqhWSTW7CKKVZYKmqxwHgg4U1nmg7hwQsggEGNN3WiiSJ
         e1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fuy4eXWPqUUba10mtYw0ydLr89ZV2AWylPLaoR+Jdl4=;
        b=gdqKuvDo2e9ua58rV/CyZp3h2Sg4HfFACH7KpBsExqQYXmD5Lf9oodCceq7Af5Ydt4
         ly0/lWvIqbR+gWN4I0v1rtbqYIQdrVhfWNgPW5kuULvU4ArkgzggpikWLpbUUfEKaXUx
         WIyx/azV2uKkyZhz8KKIfJnXORsLeLy1F1PyIBIj/oSwlJwACS55ZO6TWKYDkih9NqmB
         resC9FO2s8TCudCHFEOMRZ7WsNfDdOye7YdZ7qBZ0xq00EZVmrGZrOY7SySgHSJ+tVUh
         UWnC0+oEGaSYT6jO0ygaAIfI6iDICursj2WTtNOpi7MNYPfj5cXZouyRD/jaHQviMfiG
         xatA==
X-Gm-Message-State: AOAM530xjgU2K1FolQB6Cq97DKGhVwDsszwoH/O9orxWxP0IcVAtnlvm
        nsvoC2lRf21XkBclzBSw6EiZEzdqcgU=
X-Google-Smtp-Source: ABdhPJykY/D5oofYHxfJOnXrtAfrHO/SJq42rpPqSjtNPr7PXXaNRmaOHopXk0tiOH+2TZLNuWwWUw==
X-Received: by 2002:ac2:539b:: with SMTP id g27mr3123732lfh.534.1621622600111;
        Fri, 21 May 2021 11:43:20 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-100.dynamic.spd-mgts.ru. [109.252.193.100])
        by smtp.googlemail.com with ESMTPSA id s17sm767044ljo.117.2021.05.21.11.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 11:43:19 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] ASoC: tegra: Unify ASoC machine drivers
To:     Jaroslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210520175054.28308-1-digetx@gmail.com>
 <20210520175054.28308-3-digetx@gmail.com>
 <8e5d4442-00a4-460b-d37a-8962960dd7ff@perex.cz>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1752b39e-d693-50c0-55c9-dab18a2fd499@gmail.com>
Date:   Fri, 21 May 2021 21:43:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8e5d4442-00a4-460b-d37a-8962960dd7ff@perex.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

20.05.2021 22:02, Jaroslav Kysela пишет:
> Dne 20. 05. 21 v 19:50 Dmitry Osipenko napsal(a):
>> Squash all machine drivers into a single-universal one. This reduces
>> code duplication, eases addition of a new drivers and upgrades older
>> code to a modern Linux kernel APIs.
>>
> 
> 
>> +static struct snd_soc_card snd_soc_tegra_wm9712 = {
>> +	.dai_link = &tegra_wm9712_dai,
>> +	.num_links = 1,
>> +	.fully_routed = true,
>> +};
> Please, could you also initialize snd_soc_card->components? It may be useful
> to pass the codec identification to the user space like:
> 
> .components = "codec:wm9712"
> 
> The passed information should be consistent. You may look into the Intel ASoC
> drivers for the examples (card->components initialization). There are also
> hints about the number of connected microphones ("cfg-mic:2" - configuration
> with 2 microphones) or the codec purpose ("hs:rt711" - headset codec is RT711)
> etc.

Alright, I see why you're wanting this. It may allow us to have more
generic UCMs and group them together.
