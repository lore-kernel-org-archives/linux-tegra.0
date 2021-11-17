Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1DFC433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Nov 2021 15:00:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77A4061B5E
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Nov 2021 15:00:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237830AbhKQPC7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 Nov 2021 10:02:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:34612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237776AbhKQPC7 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Nov 2021 10:02:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 305A461B29;
        Wed, 17 Nov 2021 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637161200;
        bh=Nj8svUNr2JXk6WJcNKA2SRbO/3PCnf8tggbypgBHxlc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EadyNSNWvAvtfkuXmCoEwdfQ7AYw24qgRypy6/2teI7JDLXsToAt9tBFGIWg4rr0c
         ZLm0dGaj2XC0M42NsMmyNPa+vQVchHtk7yN/YWVtG3cOof+tTP6r+GkAzXX9snvy4n
         pI42xvGi3yu33StA+p/9bpzh3ToUtf7ADs5BIEG463gL1yDLN5WwJqWn/2M3KeqbQ7
         uxtF8RO4gyedOPtN7nrcpwAIIfpyDOIl8DzRGgWo3nUI9VbYa0rzmNZlaLzNwWvKY5
         /UcpEeTj9j5JgBRpy6LV1iqz6Vm0NN4g7X510+xIHkhOUFd/g6yE/QtzZDoezmGq/v
         NLJ7nANTKzXhA==
Date:   Wed, 17 Nov 2021 07:59:55 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        ndesaulniers@google.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] soc/tegra: fuse: fix bitwice vs. logical warning
Message-ID: <YZUY69vfq/RrVWMw@archlinux-ax161>
References: <20211117142115.694316-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117142115.694316-1-anders.roxell@linaro.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Nov 17, 2021 at 03:21:15PM +0100, Anders Roxell wrote:
> When building with clang-13 the compiler warns about:
> 
> drivers/soc/tegra/fuse/speedo-tegra20.c:72:9: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
>                 reg = tegra_fuse_read_spare(i) |
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                ||
> 
> This should be a logical OR so change it to fix the warning.
> 
> Fixes: 7e939de1b2bb ("soc/tegra: fuse: Unify Tegra20 and Tegra30 drivers")
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

I sent the same patch a couple of weeks ago (but it was right before the
merge window so I am sure nobody was really paying attention):

https://lore.kernel.org/r/20211021214500.2388146-1-nathan@kernel.org/

I do not particularly care which one gets merged (although I think mine
explains the warning a little bit better).

I am not sure your fixes tag is right, I would expect it to be:

Fixes: 25cd5a391478 ("ARM: tegra: Add speedo-based process identification")

With that fixed:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/soc/tegra/fuse/speedo-tegra20.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/tegra/fuse/speedo-tegra20.c b/drivers/soc/tegra/fuse/speedo-tegra20.c
> index 2546bddbab93..4984246605ae 100644
> --- a/drivers/soc/tegra/fuse/speedo-tegra20.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra20.c
> @@ -69,7 +69,7 @@ void __init tegra20_init_speedo_data(struct tegra_sku_info *sku_info)
>  
>  	val = 0;
>  	for (i = CPU_SPEEDO_MSBIT; i >= CPU_SPEEDO_LSBIT; i--) {
> -		reg = tegra_fuse_read_spare(i) |
> +		reg = tegra_fuse_read_spare(i) ||
>  			tegra_fuse_read_spare(i + CPU_SPEEDO_REDUND_OFFS);
>  		val = (val << 1) | (reg & 0x1);
>  	}
> @@ -84,7 +84,7 @@ void __init tegra20_init_speedo_data(struct tegra_sku_info *sku_info)
>  
>  	val = 0;
>  	for (i = SOC_SPEEDO_MSBIT; i >= SOC_SPEEDO_LSBIT; i--) {
> -		reg = tegra_fuse_read_spare(i) |
> +		reg = tegra_fuse_read_spare(i) ||
>  			tegra_fuse_read_spare(i + SOC_SPEEDO_REDUND_OFFS);
>  		val = (val << 1) | (reg & 0x1);
>  	}
> -- 
> 2.33.0
> 
