Return-Path: <SRS0=NmuO=DD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684CEC2D0A8
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 20:47:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B17020759
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 20:47:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQXfJ0JB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgIZUrU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Sep 2020 16:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbgIZUrU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Sep 2020 16:47:20 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC8BC0613CE;
        Sat, 26 Sep 2020 13:47:20 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mm21so1342954pjb.4;
        Sat, 26 Sep 2020 13:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=flpbUTh7mBOWgXDWpnvyG6c7LmGjsFBFhnUEgfVSV/k=;
        b=EQXfJ0JB0PC/pRAXXcwKvh6YBkIs2LiEhWFvvLinRQoI0tq58oWonc/+sXato3j9K8
         2rvISmxxixCpJYYaio9BarFNiEldQyyoaW2upoYSrFY2Ok1l2TNex+JuR1V/N5WXn/Tu
         F5owCcCMl0NwoGavDkewiLRMYI7rF1rmTxh4OkW8IbwC8L+ij1zrgauhkZtltOUM0ekC
         OW3nOjXHTfUaGkDKbvvgOkKJRv9Cq8P/7utzvQ8a9FO+br4HoM7Yr1SZ2YCLmeWES24Y
         a1VKRaCdLo3zJmHWXiSnL30YfB6UOqH8xrVveCtl8jk8cC6DLAsHsp2TyASXGXdhefCe
         jekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=flpbUTh7mBOWgXDWpnvyG6c7LmGjsFBFhnUEgfVSV/k=;
        b=qLpfwhi4nn3J3Ha21SEV9eQCfc3piHEX1H7iZrjNBJsx9vnx5zm4HHTM1VvsUMDPia
         uW0ZR8aQOYHXuPV8FUsrHitG4JPj8UHo5SLhw3jwPNjG797yY/aCwtiPlb6LYG4B2KaG
         UYzOrJvAJM026d26vL9nXq7XE6h7YMd+KBwoPboRi6tB7I+O5FSp0FPq28M3FUjyCroj
         o6KMh3o98pa/cJpUCofisLS/sxzum8LCoRIeJOmFjxKoGY3ryhHOyacs1otkBpOp3O7X
         IXwzseT2RYTVNr1zBisZ4Wi6C/j05+0fk6VLGJFXDP6Wg7uXJzbGQSaF2szMyL81DahR
         h5BQ==
X-Gm-Message-State: AOAM530HEJhDe6FDuWHyg19ke7xnCbYrVoAq7quctkmgtJhmDJYpJLaq
        zS0PeJzsB3ZvXwbd8l6fRv0=
X-Google-Smtp-Source: ABdhPJxg997HF2zPQOVeMqbZ9YSGytnZ/VLnkZo/q5GYFLjMaxx0J1AcRpMErsNZCXF7IhAFMZj1BA==
X-Received: by 2002:a17:90b:1741:: with SMTP id jf1mr3080921pjb.164.1601153239514;
        Sat, 26 Sep 2020 13:47:19 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id y197sm6396914pfc.220.2020.09.26.13.47.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 26 Sep 2020 13:47:19 -0700 (PDT)
Date:   Sat, 26 Sep 2020 13:42:22 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, jonathanh@nvidia.com
Subject: Re: [PATCH 3/5] iommu/tegra-smmu: Use iommu_fwspec in
 .probe_/.attach_device()
Message-ID: <20200926204221.GA4947@Asurada-Nvidia>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-4-nicoleotsuka@gmail.com>
 <ccb95c4e-64ba-bab9-1f75-0c6d287540b0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccb95c4e-64ba-bab9-1f75-0c6d287540b0@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

Thank you for the review and comments!

On Sat, Sep 26, 2020 at 05:48:17PM +0300, Dmitry Osipenko wrote:
> 26.09.2020 11:07, Nicolin Chen пишет:
> ...
> > +	/* NULL smmu pointer means that SMMU driver is not probed yet */
> > +	if (unlikely(!smmu))
> > +		return ERR_PTR(-EPROBE_DEFER);
> 
> Hello, Nicolin!
> 
> Please don't pollute code with likely/unlikely. This is not a
> performance-critical code.

Will drop it. Thanks.

> ...
> > -static struct platform_driver tegra_mc_driver = {
> > +struct platform_driver tegra_mc_driver = {
> >  	.driver = {
> >  		.name = "tegra-mc",
> >  		.of_match_table = tegra_mc_of_match,
> > diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
> > index 1238e35653d1..49a4cf64c4b9 100644
> > --- a/include/soc/tegra/mc.h
> > +++ b/include/soc/tegra/mc.h
> > @@ -184,4 +184,6 @@ struct tegra_mc {
> >  int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
> >  unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
> >  
> > +extern struct platform_driver tegra_mc_driver;
> 
> No global variables, please. See for the example:
> 
> https://elixir.bootlin.com/linux/v5.9-rc6/source/drivers/devfreq/tegra20-devfreq.c#L100

Will fix it. Thanks for the example.

> 
> The tegra_get_memory_controller() is now needed by multiple Tegra
> drivers, I think it should be good to have it added into the MC driver
> and then make it globally available for all drivers by making use of
> of_find_matching_node_and_match().
> 
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index e1db209fd2ea..ed1bd6d00aaf 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -43,6 +43,29 @@ static const struct of_device_id tegra_mc_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
> 
> +struct tegra_mc *tegra_get_memory_controller(void)
> +{
> +	struct platform_device *pdev;
> +	struct device_node *np;
> +	struct tegra_mc *mc;
> +
> +	np = of_find_matching_node_and_match(NULL, tegra_mc_of_match, NULL);
> +	if (!np)
> +		return ERR_PTR(-ENOENT);
> +
> +	pdev = of_find_device_by_node(np);
> +	of_node_put(np);
> +	if (!pdev)
> +		return ERR_PTR(-ENODEV);
> +
> +	mc = platform_get_drvdata(pdev);
> +	if (!mc)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	return mc;
> +}
> +EXPORT_SYMBOL_GPL(tegra_get_memory_controller);

Will try this one and integrate into my next version.

Thanks
Nic
