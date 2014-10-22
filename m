From: PERIER Romain <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/5] mfd: tps65910: Convert ti,system-power-controller
 DT property to poweroff-source
Date: Wed, 22 Oct 2014 17:25:07 +0200
Message-ID: <CABgxDoKus_D=ooCz3TqyXP9CTJUgbZVxQSsw4ZgBx1oYaTefbw@mail.gmail.com>
References: <1413991587-11110-1-git-send-email-romain.perier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413991587-11110-1-git-send-email-romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "pawel.moll" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, galak <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, swarren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "thierry.reding" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gnurou <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This is related to the following subject "[RFC v3 PATCH 1/5] of: Add
standard property for poweroff capability" and depends on the
corresponding patch.

2014-10-22 17:26 GMT+02:00 Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> No longer use custom property to define poweroff capability, use the standard
> DT property instead.
>
> Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/mfd/tps65910.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
> index 7612d89..b8dca8a 100644
> --- a/drivers/mfd/tps65910.c
> +++ b/drivers/mfd/tps65910.c
> @@ -423,8 +423,7 @@ static struct tps65910_board *tps65910_parse_dt(struct i2c_client *client,
>
>         board_info->irq = client->irq;
>         board_info->irq_base = -1;
> -       board_info->pm_off = of_property_read_bool(np,
> -                       "ti,system-power-controller");
> +       board_info->pm_off = of_system_has_poweroff_source(np);
>
>         return board_info;
>  }
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
