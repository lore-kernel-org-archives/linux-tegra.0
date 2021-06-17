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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5C1C2B9F4
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 12:36:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B5B160E08
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 12:36:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhFQMi1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Jun 2021 08:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhFQMi0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Jun 2021 08:38:26 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C46C061574;
        Thu, 17 Jun 2021 05:36:18 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id s22so8776980ljg.5;
        Thu, 17 Jun 2021 05:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dr4crDlnrBMTf+FSUe5umXcnVKoUvla4lRMeoioKKOU=;
        b=OFGIo3Ua/gjCqj/ghDAl4jmcBP/nE8v8cvQCfgcRkWK6GHbU4syvujBNNEKcU+9Oai
         MVXbv1fdJkLWvmpEqeg4rTuouaL7o/YmHTotr8ahEev4ccQz8XE1EDulq+G/Xy2iohUp
         rdbEoEVhFtmCA1kSYW9Ox+o5RJINRwuId1FRRCmO9IdWwJBFstZdBnHcmR3FMMDEtzdz
         wQPl+HO9s1aeA0bjDfUvpQIC/LZd/5DFdqJxHmp0eWlF2aTNVUmGPrpePnj9zUhzvr9Z
         mtUUcId1q1/CuK+BJdPP74z/g6JeTL/+JWnsnTyt4cKkaGPD5CcGJYQ0owcjJBu/WOL2
         UBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dr4crDlnrBMTf+FSUe5umXcnVKoUvla4lRMeoioKKOU=;
        b=C6us9fCNg0eOdQDHtbLJdrtUUQTfturWwXHzbmfjZBt3vgHZmBMTT06lyJfz28C5Ct
         DPBADg7P4c+Kzq/cWUOhIPRWl2Vq4CnRmUaPK3mPAM6ixUYxt9ANuXaMa0sk2XVsiCnE
         9+0hZQnJ1urJ01WBtExn9lKt9Dsq+vwN0+2I7B6W0brJ7f39Ohv925qmsnQTzcfB4HFT
         JMP0gBVP5VTVFV6CkKOfIXa6+hQf0agkeZz2h2tCSVKLYq5MrlOCiKNAWegRFLJYk/Yk
         37o56d1D1mUYq0sNqTXKQuQQbUjkcrT6Rtf88R+T01wROy2u/GfOqyrMnIX/YMueCejS
         Bb9A==
X-Gm-Message-State: AOAM531u6tSeYEq66gBsiUSO30HrV5EPHOxZW0FRhjGBzpGFk9AGZyF/
        1rQ6FVlKirYP3IWkQz21o7faMlM4QKs=
X-Google-Smtp-Source: ABdhPJygGzpNzVkUby3o7T5q1Od8zv9KgKqVOCbAGLsqc63ocZSC9wWlHIqEovEf6kwvhrOOSN+ryQ==
X-Received: by 2002:a2e:86c3:: with SMTP id n3mr4323873ljj.449.1623933376631;
        Thu, 17 Jun 2021 05:36:16 -0700 (PDT)
Received: from [192.168.2.145] (94-29-29-31.dynamic.spd-mgts.ru. [94.29.29.31])
        by smtp.googlemail.com with ESMTPSA id g2sm564896lfu.173.2021.06.17.05.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 05:36:16 -0700 (PDT)
Subject: Re: [PATCH -next] ASoC: tegra: Add missing of_node_put() in
 tegra_machine_parse_phandle()
To:     Zou Wei <zou_wei@huawei.com>, lgirdwood@gmail.com,
        broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
References: <1623929447-4335-1-git-send-email-zou_wei@huawei.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d1183fa4-2f13-d44e-20df-f8c6c847e3bd@gmail.com>
Date:   Thu, 17 Jun 2021 15:36:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1623929447-4335-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.06.2021 14:30, Zou Wei пишет:
> The function is missing a of_node_put on node, fix this by adding the call
> before returning.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  sound/soc/tegra/tegra_asoc_machine.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
> index 397f326..cba55ca 100644
> --- a/sound/soc/tegra/tegra_asoc_machine.c
> +++ b/sound/soc/tegra/tegra_asoc_machine.c
> @@ -336,9 +336,12 @@ tegra_machine_parse_phandle(struct device *dev, const char *name)
>  	}
>  
>  	err = devm_add_action_or_reset(dev, tegra_machine_node_release, np);
> -	if (err)
> +	if (err) {
> +		of_node_put(np);
>  		return ERR_PTR(err);
> +	}
>  
> +	of_node_put(np);
>  	return np;
>  }
>  
> 

You haven't tried to check what this auto-generated patch does, haven't
you? I assume it's auto-generated because it's a nonsense.
