From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH] regulator: Fix deadlock during regulator registration
Date: Wed, 30 Mar 2016 19:25:49 -0400
Message-ID: <56FC607D.3020108@osg.samsung.com>
References: <1459354153-6352-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459354153-6352-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Jon,

On 03/30/2016 12:09 PM, Jon Hunter wrote:
> Commit 5e3ca2b349b1 ("regulator: Try to resolve regulators supplies on
> registration") added a call to regulator_resolve_supply() within
> regulator_register() where the regulator_list_mutex is held. This causes
> the following deadlock to occur on the Tegra114 Dalmore board when the
> palmas PMIC is registered because regulator_register_resolve_supply()
> calls regulator_dev_lookup() which may try to acquire the
> regulator_list_mutex again.
>

Sorry for missing that. I didn't notice because on my machine the regulators
are looked up using OF and in that case the regulator_list_mutex isn't grabbed.

I believe your patch is correct, I have just one trivial comment below:

>  
> @@ -4016,15 +4015,16 @@ scrub:
>  	regulator_ena_gpio_free(rdev);
>  	device_unregister(&rdev->dev);
>  	/* device core frees rdev */
> -	rdev = ERR_PTR(ret);
>  	goto out;
>  
>  wash:
>  	regulator_ena_gpio_free(rdev);
>  clean:
>  	kfree(rdev);
> -	rdev = ERR_PTR(ret);

You are doing some cleanup of the clean and scrub error paths by removing
rdev and returning ERR_PTR(ret) directly. I believe that should be in a
separate patch since is not related to the fix.

> -	goto out;
> +out:
> +	mutex_unlock(&regulator_list_mutex);
> +	kfree(config);
> +	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(regulator_register);
>  
> 

If you split the cleanup and address Mark's comments, feel free to add:

Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
