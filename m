From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] reset: Don't WARN if trying to get a used reset control
Date: Mon, 28 Jan 2019 12:26:48 +0100
Message-ID: <1548674808.6421.3.camel@pengutronix.de>
References: <20190125101554.5947-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125101554.5947-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On Fri, 2019-01-25 at 11:15 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> When requesting a reset control for exclusive use that's already in use,
> an -EBUSY error code is returned. Users can react accordingly when they
> receive that error code, so there is no need to loudly complain.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/reset/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 9582efb70025..6b452f010b66 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -416,7 +416,7 @@ static struct reset_control *__reset_control_get_internal(
>  
>  	list_for_each_entry(rstc, &rcdev->reset_control_head, list) {
>  		if (rstc->id == index) {
> -			if (WARN_ON(!rstc->shared || !shared))
> +			if (!rstc->shared || !shared)
>  				return ERR_PTR(-EBUSY);
>  
>  			kref_get(&rstc->refcnt);

Are you actually running into this somewhere?

My reason for adding these warnings was that these point to either a DT
misconfiguration or a driver bug, and the verbose warning helps to
quickly identify the actual issue. This is not an error condition that
I would expect on a correctly configured system.

I don't expect most drivers give a proper error message that contains
the -EBUSY return value. Usually it's just along the lines of "failed to
get reset control" without any further indication.

regards
Philipp
