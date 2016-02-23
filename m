From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] regulator: core: fix error path of
 regulator_ena_gpio_free
Date: Tue, 23 Feb 2016 15:18:59 +0000
Message-ID: <56CC7863.4080202@nvidia.com>
References: <56CC6979.3050305@nvidia.com>
 <1456238830-13733-1-git-send-email-krzysztof.adamski@tieto.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456238830-13733-1-git-send-email-krzysztof.adamski@tieto.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Adamski <krzysztof.adamski@tieto.com>, Mark Brown <broonie@kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 23/02/16 14:47, Krzysztof Adamski wrote:
> This problem was introduced by:
> commit daad134d6649 ("regulator: core: Request GPIO before creating
> sysfs entries")
> 
> The error path was not updated correctly and in case
> regulator_ena_gpio_free failed, device_unregister was called even though
> it was not registered yet.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@tieto.com>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>

Nit ... I think that order of the above should be reversed.

> ---
>  drivers/regulator/core.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 6ee9ba4..d1e7859 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -3919,7 +3919,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
>  		if (ret != 0) {
>  			rdev_err(rdev, "Failed to request enable GPIO%d: %d\n",
>  				 config->ena_gpio, ret);
> -			goto wash;
> +			goto clean;
>  		}
>  	}
>  
> @@ -3942,7 +3942,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
>  
>  	ret = set_machine_constraints(rdev, constraints);
>  	if (ret < 0)
> -		goto scrub;
> +		goto wash;
>  
>  	if (init_data && init_data->supply_regulator)
>  		rdev->supply_name = init_data->supply_regulator;
> @@ -3972,10 +3972,8 @@ out:
>  unset_supplies:
>  	unset_regulator_supplies(rdev);
>  
> -scrub:
> -	regulator_ena_gpio_free(rdev);
> -
>  wash:
> +	regulator_ena_gpio_free(rdev);
>  	device_unregister(&rdev->dev);
>  	/* device core frees rdev */
>  	rdev = ERR_PTR(ret);

What about the case where device_register() fails? I think you still
call clean and so you will leak the gpio?

Jon
