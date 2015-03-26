From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Reset the SOR during initialization
Date: Thu, 26 Mar 2015 12:24:25 +0300
Message-ID: <5513D049.4080700@gmail.com>
References: <20150324102447.GA18115@ulmo.nvidia.com> <1427273979-394-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427273979-394-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?VGVyamUgQmVyZ3N0?= =?UTF-8?B?csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

25.03.2015 11:59, Tomeu Vizoso =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> As there isn't a way for the firmware on the Nyan chromebooks to hand
> over the display to the kernel, and the kernel isn't redoing the whol=
e
> configuration at present.
>
> With this patch, the SOR is brought to a known state and we get corre=
ct
> display on every boot.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>
> ---
>
> v7:	* Move the reset to the host1x_client_ops.init callback as
> 	suggested by Thierry
> 	* Reduced the time during which the reset line is asserted from
> 	20ms to 2ms
> ---
>   drivers/gpu/drm/tegra/sor.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.=
c
> index 2afe478..027a25d22 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -1354,12 +1354,30 @@ static int tegra_sor_init(struct host1x_clien=
t *client)
>   		}
>   	}
>
> +	/*
> +	 * XXX: Remove this reset once proper hand-over from firmware to
> +	 * kernel is possible.
> +	 */
> +	err =3D reset_control_assert(sor->rst);
> +	if (err < 0) {
> +		dev_err(sor->dev, "failed to assert SOR reset: %d\n", err);
> +		return err;
> +	}
> +
>   	err =3D clk_prepare_enable(sor->clk);
>   	if (err < 0) {
>   		dev_err(sor->dev, "failed to enable clock: %d\n", err);
>   		return err;
>   	}
>
> +	msleep(2);
> +
> +	err =3D reset_control_deassert(sor->rst);
> +	if (err < 0) {
> +		dev_err(sor->dev, "failed to deassert SOR reset: %d\n", err);
> +		return err;
> +	}
> +
>   	err =3D clk_prepare_enable(sor->clk_safe);
>   	if (err < 0)
>   		return err;
>

According to kernel doc, you should use usleep_range() instead of mslee=
p().

https://www.kernel.org/doc/Documentation/timers/timers-howto.txt

--=20
Dmitry
