From: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Subject: Re: [PATCH 2/3] staging:iio:magnetometer:ak8975: Don't assume 0 is
 an invalid GPIO
Date: Thu, 01 Sep 2011 10:06:06 +0100
Message-ID: <4E5F4AFE.5020800@cam.ac.uk>
References: <1314819657-828-1-git-send-email-swarren@nvidia.com> <1314819657-828-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1314819657-828-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/31/11 20:40, Stephen Warren wrote:
> gpio_is_valid() is the defined mechanism to determine whether a GPIO is
> valid. Use this instead of assuming that 0 is an invalid GPIO.
> 
Greg, depending on merge order you will get some fuzz between this and something
in my tree.

> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
> ---
>  drivers/staging/iio/magnetometer/ak8975.c |   11 +++++------
>  1 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/iio/magnetometer/ak8975.c b/drivers/staging/iio/magnetometer/ak8975.c
> index bd40e32..79ed183 100644
> --- a/drivers/staging/iio/magnetometer/ak8975.c
> +++ b/drivers/staging/iio/magnetometer/ak8975.c
> @@ -373,7 +373,7 @@ static int ak8975_read_axis(struct iio_dev *indio_dev, int index, int *val)
>  	}
>  
>  	/* Wait for the conversion to complete. */
> -	if (data->eoc_gpio)
> +	if (gpio_is_valid(data->eoc_gpio))
>  		ret = wait_conversion_complete_gpio(data);
>  	else
>  		ret = wait_conversion_complete_polled(data);
> @@ -481,7 +481,7 @@ static int ak8975_probe(struct i2c_client *client,
>  
>  	/* We may not have a GPIO based IRQ to scan, that is fine, we will
>  	   poll if so */
> -	if (eoc_gpio > 0) {
> +	if (gpio_is_valid(eoc_gpio)) {
>  		err = gpio_request(eoc_gpio, "ak_8975");
>  		if (err < 0) {
>  			dev_err(&client->dev,
> @@ -497,8 +497,7 @@ static int ak8975_probe(struct i2c_client *client,
>  						eoc_gpio, err);
>  			goto exit_gpio;
>  		}
> -	} else
> -		eoc_gpio = 0;	/* No GPIO available */
> +	}
>  
>  	/* Register with IIO */
>  	indio_dev = iio_allocate_device(sizeof(*data));
> @@ -534,7 +533,7 @@ static int ak8975_probe(struct i2c_client *client,
>  exit_free_iio:
>  	iio_free_device(indio_dev);
>  exit_gpio:
> -	if (eoc_gpio)
> +	if (gpio_is_valid(eoc_gpio))
>  		gpio_free(eoc_gpio);
>  exit:
>  	return err;
> @@ -549,7 +548,7 @@ static int ak8975_remove(struct i2c_client *client)
>  	iio_device_unregister(indio_dev);
>  	iio_free_device(indio_dev);
>  
> -	if (eoc_gpio)
> +	if (gpio_is_valid(eoc_gpio))
>  		gpio_free(eoc_gpio);
>  
>  	return 0;
