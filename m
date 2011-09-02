From: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Subject: Re: [PATCH V2 4/4] staging:iio:magnetometer:ak8975: Fix probe() error-handling
Date: Fri, 02 Sep 2011 09:52:17 +0100
Message-ID: <4E609941.6080402@cam.ac.uk>
References: <1314895964-15964-1-git-send-email-swarren@nvidia.com> <1314895964-15964-4-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1314895964-15964-4-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/01/11 17:52, Stephen Warren wrote:
> Fix ak8975_probe() to jump to the appropriate exit labels when an error
> occurs. With the previous code, some cleanup actions were being skipped
> for some error conditions.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
> ---
>  drivers/staging/iio/magnetometer/ak8975.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/staging/iio/magnetometer/ak8975.c b/drivers/staging/iio/magnetometer/ak8975.c
> index 0dfdf50..cc20e8d 100644
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
