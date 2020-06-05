From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: Re: [PATCH v3 5/7] iio: adc: exynos: Use input_device_enabled()
Date: Fri, 5 Jun 2020 21:49:48 +0200
Message-ID: <20200605194948.GC9553@qmqm.qmqm.pl>
References: <20200604072853.GP89269@dtor-ws>
 <20200605173335.13753-1-andrzej.p@collabora.com>
 <20200605173335.13753-6-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200605173335.13753-6-andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-input-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 05, 2020 at 07:33:33PM +0200, Andrzej Pietrasiewicz wrote:
> A new helper is available, so use it. Inspecting 'users' member of
> input_dev requires taking device's mutex.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  drivers/iio/adc/exynos_adc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
> index 22131a677445..294715bafe25 100644
> --- a/drivers/iio/adc/exynos_adc.c
> +++ b/drivers/iio/adc/exynos_adc.c
> @@ -630,10 +630,13 @@ static irqreturn_t exynos_ts_isr(int irq, void *dev_id)
>  	struct exynos_adc *info = dev_id;
>  	struct iio_dev *dev = dev_get_drvdata(info->dev);
>  	u32 x, y;
> -	bool pressed;
> +	bool pressed, cont;
>  	int ret;
>  
> -	while (info->input->users) {
> +	mutex_lock(&info->input->mutex);
> +	cont = input_device_enabled(info->input);
> +	mutex_unlock(&info->input->mutex);
> +	while (cont) {
>  		ret = exynos_read_s3c64xx_ts(dev, &x, &y);
>  		if (ret == -ETIMEDOUT)
>  			break;
> @@ -651,6 +654,10 @@ static irqreturn_t exynos_ts_isr(int irq, void *dev_id)
>  		input_sync(info->input);
>  
>  		usleep_range(1000, 1100);
> +
> +		mutex_lock(&info->input->mutex);
> +		cont = input_device_enabled(info->input);
> +		mutex_unlock(&info->input->mutex);
>  	}

The mutex doesn't really protect anything here, but I would nevertheless
suggest this sequence instead:

lock()
while (test) {
	unlock()
	...
	lock()
}
unlock()

Best Regards,
Micha³ Miros³aw
