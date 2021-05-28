Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988A6C2B9F7
	for <linux-tegra@archiver.kernel.org>; Fri, 28 May 2021 17:42:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70AB761108
	for <linux-tegra@archiver.kernel.org>; Fri, 28 May 2021 17:42:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbhE1Roa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 May 2021 13:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbhE1Roa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 May 2021 13:44:30 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541FAC061574;
        Fri, 28 May 2021 10:42:54 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id q1so6475662lfo.3;
        Fri, 28 May 2021 10:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KI4+CLc3LVUdeiCFpZRQ3yReYzhuigspJBb1+pZncVg=;
        b=oM14DXMeSFyqHfnSQZF6/HT5X7Rss3NnScX9QUatfLlN3bd0+VHUM0f/2bC9M1SxEY
         A9dncf9wTPOIjBmPdsyS7C4c25qC2V0gQ7fQ8dNrQATJnvtfOm7k+JnlrujnaxncbJfZ
         w5OV3aLAE1ikyxHCLZ7XLMgsOarJyoFfIsBhH3nn7m3InshlnPZ2tIB+Oycfg1PN5W+w
         77YCy5f2hY/wLwHqTqcwHcnLpUUzaIzRTwAgYd35vsCVlLT20wbH+/r4QCinfQqsxnNc
         IMaQ3cDTydPb6djFkuAuo07dKO4t4QdzbvZdx9X8Ez7XJqgK31aRm0WY4cQqexu41O78
         vtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KI4+CLc3LVUdeiCFpZRQ3yReYzhuigspJBb1+pZncVg=;
        b=O6ClZL38tPe1GfcZUoPPu70wpaRCCDF+UhK66B0Hu7aiYTGK7HQbVp4OjNHDZdNl2X
         S2SYUwxbqqgCSRB0LE6Tnqr73bRR4VfKMPQBSbL+/fCd/9AZvBDfFNCDPG21kLz3KMMw
         pM3DBeNXC0FGM3MeY5ADUnFCX4aCNdHudsp/YuaFgG8rzS4vmcr8U2272MmPJd1ABZV4
         CIc2SZWgGLROX8xuYa8RHWyYUjTzSvGPKb1UiSb1jxsDWn/g/YHm8TbWrgvkUAS40MB2
         HYludVjyAlu/DfDi+Ea9jsX9tsUXPuhGeqFIBTvNYyqsvkDK17edZWYxl2uXYgnn3OhD
         2pbg==
X-Gm-Message-State: AOAM532/0AF0z6Makt70tH0FjzLNLWTRzv7nifbG6Sb5Lyt0QljpoaRr
        CNfsIza5Aak2BJNaZ7WyuMGdPKSAlJo=
X-Google-Smtp-Source: ABdhPJxiEtzPDrR5ngSZmiruM65mcClPAqHZWszF1m2W/3v0KJZZPai1jBHELrIdAXfJzJrPHipbRg==
X-Received: by 2002:ac2:4255:: with SMTP id m21mr6891577lfl.633.1622223772542;
        Fri, 28 May 2021 10:42:52 -0700 (PDT)
Received: from [192.168.2.145] (46-138-12-55.dynamic.spd-mgts.ru. [46.138.12.55])
        by smtp.googlemail.com with ESMTPSA id n5sm521916lft.139.2021.05.28.10.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 May 2021 10:42:52 -0700 (PDT)
Subject: Re: [PATCH v5 2/3] ASoC: tegra: Unify ASoC machine drivers
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210528172833.21622-1-digetx@gmail.com>
 <20210528172833.21622-3-digetx@gmail.com>
Message-ID: <722581fd-a89b-7b69-f0c0-414d732a6c5c@gmail.com>
Date:   Fri, 28 May 2021 20:42:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210528172833.21622-3-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.05.2021 20:28, Dmitry Osipenko пишет:
> -static int tegra_wm9712_driver_probe(struct platform_device *pdev)
> -{
> -	struct device_node *np = pdev->dev.of_node;
> -	struct snd_soc_card *card = &snd_soc_tegra_wm9712;
> -	struct tegra_wm9712 *machine;
> -	int ret;
> -
> -	machine = devm_kzalloc(&pdev->dev, sizeof(struct tegra_wm9712),
> -			       GFP_KERNEL);
> -	if (!machine)
> -		return -ENOMEM;
> -
> -	card->dev = &pdev->dev;
> -	snd_soc_card_set_drvdata(card, machine);
> -
> -	machine->codec = platform_device_alloc("wm9712-codec", -1);
> -	if (!machine->codec) {
> -		dev_err(&pdev->dev, "Can't allocate wm9712 platform device\n");
> -		return -ENOMEM;
> -	}
> -
> -	ret = platform_device_add(machine->codec);
> -	if (ret)
> -		goto codec_put;
> -
> -	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
> -	if (ret)
> -		goto codec_unregister;
> -
> -	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
> -	if (ret)
> -		goto codec_unregister;
> -
> -	tegra_wm9712_dai.cpus->of_node = of_parse_phandle(np,
> -				       "nvidia,ac97-controller", 0);
> -	if (!tegra_wm9712_dai.cpus->of_node) {
> -		dev_err(&pdev->dev,
> -			"Property 'nvidia,ac97-controller' missing or invalid\n");
> -		ret = -EINVAL;
> -		goto codec_unregister;
> -	}
> -
> -	tegra_wm9712_dai.platforms->of_node = tegra_wm9712_dai.cpus->of_node;
> -
> -	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
> -	if (ret)
> -		goto codec_unregister;
> -
> -	ret = tegra_asoc_utils_set_ac97_rate(&machine->util_data);
> -	if (ret)
> -		goto codec_unregister;

I just noticed that this AC97 clk initialization is gone now for wm9712,
I'll fix it in v6.
