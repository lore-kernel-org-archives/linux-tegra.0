From: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Subject: Re: [PATCH 1/3] staging:iio:magnetometer:ak8975 use platform_data
 to pass the gpio number.
Date: Tue, 20 Sep 2011 10:06:37 +0100
Message-ID: <4E78579D.9090301@cam.ac.uk>
References: <1316469452-23575-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1316469452-23575-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/19/11 22:57, Stephen Warren wrote:
> From: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
> 
> Tegra doesn't have irq_to_gpio() any more, and ak8975 is included in
> tegra_defconfig. This causes a build failure. Instead, pass the GPIO name
> through platform data.
> 
> [swarren: Rewrote commit description when I squashed this with my patch
> to remove the irq_to_gpio() call]

As I've stated elsewhere, this is the wrong fix for this particular driver,
but it is the one with minimal impact and as such I'm happy for it
to go in as a stop gap until someone has time (and hardware) to clean
this driver up to make 'correct' use of interrupts.  Note it's not going
to leave staging until that is done or someone explains why it can't be!
> 
> Signed-off-by: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Second one has some trivial one line fuzz against what I think is
the current state of Greg's tree - I'll push these on in the series I'll be
sending to Greg later today.  Obviously fine if Greg has already merged
them and fixed it up!

Thanks,

Jonathan
> ---
>  drivers/staging/iio/magnetometer/ak8975.c |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/staging/iio/magnetometer/ak8975.c b/drivers/staging/iio/magnetometer/ak8975.c
> index a17fa9f..6d17ae5 100644
> --- a/drivers/staging/iio/magnetometer/ak8975.c
> +++ b/drivers/staging/iio/magnetometer/ak8975.c
> @@ -477,7 +477,10 @@ static int ak8975_probe(struct i2c_client *client,
>  	int err;
>  
>  	/* Grab and set up the supplied GPIO. */
> -	eoc_gpio = irq_to_gpio(client->irq);
> +	if (client->dev.platform_data == NULL)
> +		eoc_gpio = -1;
> +	else
> +		eoc_gpio = *(int *)(client->dev.platform_data);
>  
>  	/* We may not have a GPIO based IRQ to scan, that is fine, we will
>  	   poll if so */
