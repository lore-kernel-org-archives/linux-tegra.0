From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] tegra_wm9712: Fix a memory leaking bug in
 tegra_wm9712_driver_probe()
Date: Fri, 24 May 2019 09:33:13 +0100
Message-ID: <b2d43dfe-17e5-a975-435b-49f2aa2ad550@nvidia.com>
References: <20190524005014.GA2289@zhanggen-UX430UQ>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524005014.GA2289@zhanggen-UX430UQ>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Gen Zhang <blackgod016574@gmail.com>, lgirdwood@gmail.com, perex@perex.cz
Cc: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 24/05/2019 01:50, Gen Zhang wrote:
> In tegra_wm9712_driver_probe(), 'machine->codec' is allocated by
> platform_device_alloc(). When it is NULL, function returns ENOMEM.
> However, 'machine' is allocated by devm_kzalloc() before this site.
> Thus we should free 'machine' before function ends to prevent memory
> leaking.

Memory allocated by devm_xxx() is automatically freed on failure so this
is not correct.

> Further, we should free 'machine->util_data', 'machine->codec' and
> 'machine' before this function normally ends to prevent memory leaking.

This is also incorrect. Why would we free all resources after
successfully initialising the driver?

> Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
> ---
> diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c
> index 864a334..295c41d 100644
> --- a/sound/soc/tegra/tegra_wm9712.c
> +++ b/sound/soc/tegra/tegra_wm9712.c
> @@ -86,7 +86,8 @@ static int tegra_wm9712_driver_probe(struct platform_device *pdev)
>  	machine->codec = platform_device_alloc("wm9712-codec", -1);
>  	if (!machine->codec) {
>  		dev_err(&pdev->dev, "Can't allocate wm9712 platform device\n");
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto codec_free;
>  	}
>  
>  	ret = platform_device_add(machine->codec);
> @@ -127,6 +128,10 @@ static int tegra_wm9712_driver_probe(struct platform_device *pdev)
>  		goto asoc_utils_fini;
>  	}
>  
> +	tegra_asoc_utils_fini(&machine->util_data);
> +	platform_device_del(machine->codec);
> +	platform_device_put(machine->codec);
> +	devm_kfree(&pdev->dev, machine);
>  	return 0;

As stated above, this is incorrect.

Did you actually test this? I think you would find this would break the
driver.

Jon

-- 
nvpublic
