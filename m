From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] regulator: core: Don't use regulators as supplies
 until the parent is bound
Date: Wed, 11 Jan 2017 17:30:35 +0000
Message-ID: <a14455c8-f3a0-985d-cc65-16c4d91dfa07@nvidia.com>
References: <1484154898-4342-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484154898-4342-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 11/01/17 17:14, Jon Hunter wrote:
> When regulators are successfully registered, we check to see if the
> regulator is a supply for any other registered regulator and if so
> add the new regulator as the supply for the existing regulator(s).
> 
> Some devices, such as Power Management ICs, may register a series of
> regulators when probed and there are cases where one of the regulators
> may fail to register and defer the probing of the parent device. In this
> case any successfully registered regulators would be unregistered so
> that they can be re-registered at some time later when the probe is
> attempted again. However, if one of the regulators that was registered
> was added as a supply to another registered regulator (that did not
> belong to the same parent device), then this supply regulator was
> unregister again because the parent device is probe deferred, then a
> regulator could be holding an invalid reference to a supply regulator
> that has been unregistered. This will lead to a system crash if that
> regulator is then used.
> 
> Although it would be possible to check when unregistering a regulator
> if any other regulator in the system is using it as a supply, it still
> may not be possible to remove it as a supply if this other regulator is
> in use. Therefore, fix this by preventing any regulator from adding
> another regulator as a supply if the parent device for the supply
> regulator has not been bound and if the parent device for the supply
> and the regulator are different. This will allow a parent device that is
> registering regulators to be probe deferred and ensure that none of the
> regulators it has registered are used as supplies for any other
> regulator from another device.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> 
> Changes since V1:
> - Updated patch per Mark's input to only prevent resolving the supply
>   if the supply's parent is different from the regulator's and the
>   supply's parent device is not bound.
> - Added comment.
> 
>  drivers/regulator/core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 04baac9a165b..00466a82c3ad 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -1553,6 +1553,19 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
>  		}
>  	}
>  
> +	/*
> +	 * If the supply's parent device is not the same as the
> +	 * regulator's parent device, then ensure the parent device
> +	 * is bound before we resolve the supply, in case the parent
> +	 * device get probe deferred and unregisters the supply.
> +         */

Ugh ... looks like I screwed up the formatting here. Also ...

s/get/gets

Resending ...

Jon

-- 
nvpublic
