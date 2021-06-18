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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC698C48BDF
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 14:07:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8D2F6044F
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 14:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234220AbhFROJU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Jun 2021 10:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhFROJU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 10:09:20 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03AACC061574;
        Fri, 18 Jun 2021 07:07:10 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id m21so16872254lfg.13;
        Fri, 18 Jun 2021 07:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/quGoc38c0p0H8/J6lRb7JsKFmpNqxFSoJWjBr7SmOk=;
        b=ikMGpc/P3dIvtrCXQjqZgQvp/vsiCq4YWydduybjNDcgyQ/v9awwdDXyvTsSq6FXGk
         QOQstqHaG6R1cz5XDEE1NJtaUfLfPtMe4I6pqWYB7/Jga7FnaRnNbqmfKIAZ5UmfTljp
         Gh+D5+4jn/iwyAZxvnIWU5IHQX+XswPPL/+9pvGZ554Yc5ovfGys+xdnyREj2uKU2v/6
         urken14llhUP7AcBSQpTa/lGPCZIJqEjgZ1VYkIN2cZHsizWJR5BkPOTkSNJtj8ZvlH1
         HcxdDLDytJA1TJNE/zpkPjHN+OYAEct5UYtcX2w622wdfsGm3ldQf39hrLtXt9XKOALM
         /4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/quGoc38c0p0H8/J6lRb7JsKFmpNqxFSoJWjBr7SmOk=;
        b=Pkxzar1qIWOu0eMQyvtsqAWVgy/mBi05ghn7kxq4TQ1Ti4z/pytfO3Nv+JsN8MmH2u
         gQI24O41kAqqOjYttqUq+tM75lbT7qJWRxoskkM5FLEwqMztSb3PHO2fM/VDPOkns4Es
         FHpeAZ82R0igZ1yDLAr5ziQt9KNz28uFUbCEgvpSqtr9T3pHEM0ogEm1d6JI7UOfzEcJ
         uVR9DYGzOarUugk5d8jUBlaEvK6TWSnHlI7vd7frVlWppBYfhZLKuqQxFZr4vPy93OQn
         zMoHMNc0LqVSgnUR4/RE/trqQyJTyByXEARXjNsyx8VDGIE40XyWzbexxcgaaBbNlV+z
         RN0Q==
X-Gm-Message-State: AOAM530uKATLKUs1gHnKEY6EhcRG9qzcomjgi6cZk+VZalOOWRo6995k
        a2VVeNcxA9TFMUmiH9VmXBxmVbazyxA=
X-Google-Smtp-Source: ABdhPJxVGE2BlZznSkbT7y1/6eEthlVx5uFIqu3gEggxDqgStqSnHNrPmHtE1voW/bVOntR35eiWxw==
X-Received: by 2002:ac2:4219:: with SMTP id y25mr3320437lfh.400.1624025227243;
        Fri, 18 Jun 2021 07:07:07 -0700 (PDT)
Received: from [192.168.2.145] (94-29-29-31.dynamic.spd-mgts.ru. [94.29.29.31])
        by smtp.googlemail.com with ESMTPSA id d15sm922354lfl.199.2021.06.18.07.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jun 2021 07:07:06 -0700 (PDT)
Subject: Re: [PATCH] ASoC: tegra: Fix a NULL vs IS_ERR() check
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ion Agorria <ion@agorria.com>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <YMyjOKFsPe9SietU@mwanda>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <be3feac7-e829-ab96-a866-1d9c58aa8dcd@gmail.com>
Date:   Fri, 18 Jun 2021 17:07:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMyjOKFsPe9SietU@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

18.06.2021 16:44, Dan Carpenter пишет:
> The tegra_machine_parse_phandle() function doesn't return NULL, it returns
> error pointers.
> 
> Fixes: cc8f70f56039 ("ASoC: tegra: Unify ASoC machine drivers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/soc/tegra/tegra_asoc_machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
> index a53aec361a77..735909310a26 100644
> --- a/sound/soc/tegra/tegra_asoc_machine.c
> +++ b/sound/soc/tegra/tegra_asoc_machine.c
> @@ -409,7 +409,7 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
>  		return PTR_ERR(np_codec);
>  
>  	np_i2s = tegra_machine_parse_phandle(dev, "nvidia,i2s-controller");
> -	if (!np_i2s)
> +	if (IS_ERR(np_i2s))
>  		return PTR_ERR(np_i2s);
>  
>  	card->dai_link->cpus->of_node = np_i2s;
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
