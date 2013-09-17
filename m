From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] Input: gpio-keys - update to devm_* API
Date: Tue, 17 Sep 2013 13:19:39 +0200
Message-ID: <4083416.Q4nm27K4Qq@amdc1227>
References: <1379188343-18904-1-git-send-email-badarkhe.manish@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1379188343-18904-1-git-send-email-badarkhe.manish@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Manish Badarkhe <badarkhe.manish@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dmitry.torokhov@gmail.com
List-Id: linux-tegra@vger.kernel.org

Hi Manish,

Thanks for the patch. I have few comments inline, though.

On Sunday 15 of September 2013 01:22:23 Manish Badarkhe wrote:
> Update the code to use devm_* API so that driver core will manage
> resources.
> 
> Signed-off-by: Manish Badarkhe <badarkhe.manish@gmail.com>
> ---
> 
> :100644 100644 440ce32... b4db721... M	drivers/input/keyboard/gpio_keys.c
> 
>  drivers/input/keyboard/gpio_keys.c |   18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/input/keyboard/gpio_keys.c
> b/drivers/input/keyboard/gpio_keys.c index 440ce32..b4db721 100644
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -588,7 +588,7 @@ gpio_keys_get_devtree_pdata(struct device *dev)
>  		goto err_out;
>  	}
> 
> -	pdata = kzalloc(sizeof(*pdata) + nbuttons * (sizeof *button),
> +	pdata = devm_kzalloc(dev, sizeof(*pdata) + nbuttons *
> (sizeof(*button)), GFP_KERNEL);
>  	if (!pdata) {
>  		error = -ENOMEM;
> @@ -618,7 +618,7 @@ gpio_keys_get_devtree_pdata(struct device *dev)
>  				dev_err(dev,
>  					"Failed to get gpio flags, error: %d\n",
>  					error);
> -			goto err_free_pdata;
> +			goto err_out;

Since the only thing done after err_out label is returning the error, you 
can simply return the error here.

>  		}
> 
>  		button = &pdata->buttons[i++];
> @@ -630,7 +630,7 @@ gpio_keys_get_devtree_pdata(struct device *dev)
>  			dev_err(dev, "Button without keycode: 0x%x\n",
>  				button->gpio);
>  			error = -EINVAL;
> -			goto err_free_pdata;
> +			goto err_out;

Ditto.

>  		}
> 
>  		button->desc = of_get_property(pp, "label", NULL);
> @@ -647,13 +647,11 @@ gpio_keys_get_devtree_pdata(struct device *dev)
> 
>  	if (pdata->nbuttons == 0) {
>  		error = -EINVAL;
> -		goto err_free_pdata;
> +		goto err_out;

Ditto.

>  	}
> 
>  	return pdata;
> 
> -err_free_pdata:
> -	kfree(pdata);
>  err_out:
>  	return ERR_PTR(error);

Then the whole error path here can be dropped.

>  }
> @@ -699,10 +697,10 @@ static int gpio_keys_probe(struct platform_device
> *pdev) return PTR_ERR(pdata);
>  	}
> 
> -	ddata = kzalloc(sizeof(struct gpio_keys_drvdata) +
> +	ddata = devm_kzalloc(&pdev->dev, sizeof(struct gpio_keys_drvdata) +
>  			pdata->nbuttons * sizeof(struct gpio_button_data),
>  			GFP_KERNEL);
> -	input = input_allocate_device();
> +	input = devm_input_allocate_device(&pdev->dev);
>  	if (!ddata || !input) {
>  		dev_err(dev, "failed to allocate state\n");
>  		error = -ENOMEM;
> @@ -768,8 +766,6 @@ static int gpio_keys_probe(struct platform_device
> *pdev) gpio_remove_key(&ddata->data[i]);
> 
>   fail1:
> -	input_free_device(input);
> -	kfree(ddata);
>  	/* If we have no platform data, we allocated pdata dynamically. */
>  	if (!dev_get_platdata(&pdev->dev))
>  		kfree(pdata);

This is incorrect and unnecessary. Since pdata was allocated using devm_ 
helper it will be freed automatically. As a side note, if you want to 
explicitly free memory allocated using devm_ helpers, you need to do it 
using their devm_ free counterparts, not directly.

> @@ -796,8 +792,6 @@ static int gpio_keys_remove(struct platform_device
> *pdev) if (!dev_get_platdata(&pdev->dev))
>  		kfree(ddata->pdata);

Same here.

Best regards,
Tomasz
