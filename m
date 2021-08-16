Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE94C4338F
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 18:02:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3295860F55
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 18:02:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhHPSCq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Aug 2021 14:02:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:39158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229710AbhHPSCp (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Aug 2021 14:02:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFC3160462;
        Mon, 16 Aug 2021 18:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629136934;
        bh=B2jyaNj79A42m28exuRget68ed7+1u8WgVhr2RwnPkY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=YozBxOdSA4wdQxQTcgrxfYHbJVGLAIgbuqAJW5BL25XSn5gcEXpkSTERuIKdJIv4w
         EdRxQ2e59ucRTjQqaY05rKXCb1t18D9/dTpg5TNNisvhs5ci9Q39hi4FhuFMdt/kR8
         CwLhCdaKRIZdkPC2oHPJ4lOzHT/NhIvtNXkOsHtFpoNHl+f5rCrOuHq8qW1v1Gc3QI
         yIAz8+EVKnuRXWeAdwNkjg/8+6kjeKdfD9O4+qBtkCZ5zFbXwOwFAnuUYB+Wae9y5l
         BV4B2Sw7PwvrkzsLSQYgHQAdAqplCWFHIJHPz6mwnl5mf+uhNYXv5AdjJ9QyCsF0NQ
         KQ7QQmXDLhfSw==
Date:   Mon, 16 Aug 2021 13:02:12 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Aakash Hemadri <aakashhemadri123@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jawoslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <bjorn@helgaas.com>
Subject: Re: [PATCH 1/2] ASoC: tegra30: ahub: Use of_device_get_match_data
Message-ID: <20210816180212.GA2933142@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Aug 15, 2021 at 01:42:18AM +0530, Aakash Hemadri wrote:
> Prefer `of_device_get_match_data` over `of_match_device`
> 
> Retrieve OF match data using `of_device_get_match_data`, this is cleaner
> and better expresses intent.
> 
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
> index b3e1df693381..0ac109b32329 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -518,7 +518,7 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
>  	void __iomem *regs_apbif, *regs_ahub;
>  	int ret = 0;
>  
> -	match = of_match_device(tegra30_ahub_of_match, &pdev->dev);
> +	match = of_device_get_match_data(&pdev->dev);

I think this is incorrect.

  const struct of_device_id *of_match_device(...)
  const void *of_device_get_match_data(...)

of_match_device() returns "struct of_device_id *", i.e., "match".

of_device_get_match_data() calls of_match_device() internally, then
returns "match->data".

>  	if (!match)
>  		return -EINVAL;
>  	soc_data = match->data;
> -- 
> 2.32.0
> 
