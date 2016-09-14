From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH] dmaengine: squash lines for immediate return
Date: Wed, 14 Sep 2016 19:07:34 +0530
Message-ID: <20160914133734.GI13920@localhost>
References: <1473708054-30989-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473708054-30989-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: dmaengine@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Peter Griffin <peter.griffin@linaro.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Dan Williams <dan.j.williams@intel.com>, Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, Tony Lindgren <tony@atomide.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 13, 2016 at 04:20:54AM +0900, Masahiro Yamada wrote:
> Remove unneeded variables and assignments.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/dma/cppi41.c          | 30 +++++-------------------------
>  drivers/dma/imx-sdma.c        | 15 ++++-----------
>  drivers/dma/ppc4xx/adma.c     | 15 ++++++---------
>  drivers/dma/tegra20-apb-dma.c |  4 +---

pls split per driver

>  static int cppi41_dma_alloc_chan_resources(struct dma_chan *chan)
> @@ -433,11 +429,7 @@ static u32 get_host_pd0(u32 length)
>  
>  static u32 get_host_pd1(struct cppi41_channel *c)
>  {
> -	u32 reg;
> -
> -	reg = 0;
> -
> -	return reg;
> +	return 0;
>  }

why to have this, can you fix the calling code...

>  
>  static u32 get_host_pd2(struct cppi41_channel *c)
> @@ -452,12 +444,8 @@ static u32 get_host_pd2(struct cppi41_channel *c)
>  
>  static u32 get_host_pd3(u32 length)
>  {
> -	u32 reg;
> -
>  	/* PD3 = packet size */
> -	reg = length;
> -
> -	return reg;
> +	return length;
>  }

so we are essentially returning back the arg, lets remove this as well
please

>  
>  static u32 get_host_pd6(u32 length)
> @@ -473,20 +461,12 @@ static u32 get_host_pd6(u32 length)
>  
>  static u32 get_host_pd4_or_7(u32 addr)
>  {
> -	u32 reg;
> -
> -	reg = addr;
> -
> -	return reg;
> +	return addr;
>  }

same here too

>  
>  static u32 get_host_pd5(void)
>  {
> -	u32 reg;
> -
> -	reg = 0;
> -
> -	return reg;
> +	return 0;
>  }

and this one too

-- 
~Vinod
