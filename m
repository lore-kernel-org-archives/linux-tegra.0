From: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Subject: Re: [PATCH 3/3] staging:iio:magnetometer:ak8975: Fix probe() error-handling
Date: Thu, 01 Sep 2011 10:08:58 +0100
Message-ID: <4E5F4BAA.9040404@cam.ac.uk>
References: <1314819657-828-1-git-send-email-swarren@nvidia.com> <1314819657-828-3-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1314819657-828-3-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/31/11 20:40, Stephen Warren wrote:
> Fix ak8975_probe() to jump to the appropriate exit labels when an error
> occurs. With the previous code, some cleanup actions were being skipped
> for some error conditions.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>

Thanks for these Stephen.  There's one other driver in tree that uses irq_to_gpio
(I hadn't registered it was going away till you sent these.)

> ---
>  drivers/staging/iio/magnetometer/ak8975.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/staging/iio/magnetometer/ak8975.c b/drivers/staging/iio/magnetometer/ak8975.c
> index 79ed183..d92b3d0 100644
> --- a/drivers/staging/iio/magnetometer/ak8975.c
> +++ b/drivers/staging/iio/magnetometer/ak8975.c
> @@ -510,7 +510,7 @@ static int ak8975_probe(struct i2c_client *client,
>  	err = ak8975_setup(client);
>  	if (err < 0) {
>  		dev_err(&client->dev, "AK8975 initialization fails\n");
> -		goto exit_gpio;
> +		goto exit_free_iio;
>  	}
>  
>  	i2c_set_clientdata(client, indio_dev);
