Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121E4C32771
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Sep 2022 05:43:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbiIZFn5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Sep 2022 01:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiIZFn4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Sep 2022 01:43:56 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BDA26AE6
        for <linux-tegra@vger.kernel.org>; Sun, 25 Sep 2022 22:43:56 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id p1-20020a17090a2d8100b0020040a3f75eso5649152pjd.4
        for <linux-tegra@vger.kernel.org>; Sun, 25 Sep 2022 22:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Ri7TwNCRikYOFJCOJ2U33t5fpVfVJydiUpCZraJpkmE=;
        b=nZOMbgrw/Tj2GrKBSZU9OXZ7ofMPVwyWZFHStMWjyAg0sOY/53mcyIbWQsoenhZ3aL
         zOyRYtGRtcRmomRYbQO4PvAuHrwcvhQ5kRCKC4qV0/3meB245Puq4ymuOrCqKPFm12cr
         +iLTGxQcydwAvwVOa8w3TTBbbMjTa6xR6wfWW7WRaCcRE7yr2pz5B6Oh7sQ6h7r6N2uo
         DwYsz2/Px5cgVMTZwrLxaBa04aQWTP3PEUujGSTwpEQbKGKjH4AlelvzWbWau4Bv84me
         YUXbNi83InC4PUKi+xdPc1O9gy2VkD+7wf9aGShuv25KAIbipnxgj9Mr670+8opI1OdU
         Kn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Ri7TwNCRikYOFJCOJ2U33t5fpVfVJydiUpCZraJpkmE=;
        b=38zzcgvLPYmiNsPu7quZ5YnJ2PyaR1qW1tIQ/00F1+e2eQHCKaJrVB/nb2JJHwu673
         aJVq0qGyCZWpirjNMejOso0/If2ZozPGGY1e2IG1CAxPahcY7dQxUVQW7KGdaGZ4i6GJ
         ZX2I46XQ7QO8g54+02VKQTkeE7rqA6RZVjHCvp5FfVZxWRP7KjwsZR5rl9rxmBMf1ATg
         IVMmQWtv0x4GbNThI8RyNhJSaWvvrsBzOEG1Jn8XZgLWDFFNgyN2cIwCUrN8yKp1hykN
         +XTE51Tnc+rzY5bf27pHhQS/QdzJJrv3mm2wH2tPcWMYeKvRd+wjynJeotkKT470qx32
         XhKw==
X-Gm-Message-State: ACrzQf12YnQBYBLx9mK4yrQWvuXUsDv+1Z12sSFsvVAiv92dzfNL+fEu
        0RAPduCgoA0nSsEhxsufv657Zw==
X-Google-Smtp-Source: AMsMyM6UfKe0WU4gMJYzRgEshfKbG5wD06UYly8j7f9+J8oDBhQI0cX8CePZ2iFdXNKtTDS2EM+T/Q==
X-Received: by 2002:a17:90b:180e:b0:202:a0c3:6da with SMTP id lw14-20020a17090b180e00b00202a0c306damr22352248pjb.94.1664171035592;
        Sun, 25 Sep 2022 22:43:55 -0700 (PDT)
Received: from localhost ([122.172.85.153])
        by smtp.gmail.com with ESMTPSA id i3-20020a170902c94300b00176acd80f69sm10249899pla.102.2022.09.25.22.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:43:54 -0700 (PDT)
Date:   Mon, 26 Sep 2022 11:13:52 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        sumitg@nvidia.com
Subject: Re: [PATCH -next] cpufreq: tegra194: change tegra239_cpufreq_soc to
 static
Message-ID: <20220926054352.lnmffxyaer4j3vt7@vireshk-i7>
References: <20220923145016.109173-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923145016.109173-1-yangyingliang@huawei.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 23-09-22, 22:50, Yang Yingliang wrote:
> tegra239_cpufreq_soc is only used in tegra194-cpufreq.c now, change it
> to static.
> 
> Fixes: 676886010707 ("cpufreq: tegra194: Add support for Tegra239")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/cpufreq/tegra194-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
> index cfc1b225f811..c2004cae3f02 100644
> --- a/drivers/cpufreq/tegra194-cpufreq.c
> +++ b/drivers/cpufreq/tegra194-cpufreq.c
> @@ -161,7 +161,7 @@ static const struct tegra_cpufreq_soc tegra234_cpufreq_soc = {
>  	.num_clusters = 3,
>  };
>  
> -const struct tegra_cpufreq_soc tegra239_cpufreq_soc = {
> +static const struct tegra_cpufreq_soc tegra239_cpufreq_soc = {
>  	.ops = &tegra234_cpufreq_ops,
>  	.actmon_cntr_base = 0x4000,
>  	.maxcpus_per_cluster = 8,

Applied. Thanks.

-- 
viresh
