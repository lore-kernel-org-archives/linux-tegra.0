From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 3/5] reset: Add acquire/release support for arrays
Date: Tue, 19 Mar 2019 17:43:37 +0100
Message-ID: <1553013817.6482.8.camel@pengutronix.de>
References: <20190221152557.8534-1-thierry.reding@gmail.com>
         <20190221152557.8534-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221152557.8534-3-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 2019-02-21 at 16:25 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add implementations that apply acquire and release operations to all
> reset controls part of a reset control array.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

> ---
>  drivers/reset/core.c  | 36 +++++++++++++++++++++++++++++++++++-
>  include/linux/reset.h |  6 ++++++
>  2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index f94da91c22af..81ea77cba123 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -245,6 +245,34 @@ static int reset_control_array_deassert(struct reset_control_array *resets)
>  	return ret;
>  }
>  
> +static int reset_control_array_acquire(struct reset_control_array *resets)
> +{
> +	unsigned int i;
> +	int err;
> +
> +	for (i = 0; i < resets->num_rstcs; i++) {
> +		err = reset_control_acquire(resets->rstc[i]);
> +		if (err < 0)
> +			goto release;
> +	}

This could be done under a single mutex lock by extracting a free
version of of reset_control_acquire. Just an idea though, not sure if
that would have any measurable benefit.

regards
Philipp
