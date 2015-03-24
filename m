From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 09/12] drm/tegra: Reset the SOR on probe
Date: Tue, 24 Mar 2015 11:24:49 +0100
Message-ID: <20150324102447.GA18115@ulmo.nvidia.com>
References: <1426672363-30667-1-git-send-email-tomeu.vizoso@collabora.com>
 <1426672363-30667-10-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426672363-30667-10-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2015 at 10:52:24AM +0100, Tomeu Vizoso wrote:
> As there isn't a way for the firmware on the Nyan chromebooks to hand
> over the display to the kernel.

Perhaps this should be more explicit. I'm assuming this somehow breaks
on Nyan for you because we try to reprogram the SOR from an already
initialized state and that doesn't actually work? Your current commit
message doesn't make this sound like a fix for an actual problem.

> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/sor.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 2afe478..e6caacc 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -1458,6 +1458,20 @@ static int tegra_sor_probe(struct platform_device =
*pdev)
> =20
>  	mutex_init(&sor->lock);
> =20
> +	err =3D reset_control_assert(sor->rst);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to assert SOR reset: %d\n", err);
> +		return err;
> +	}
> +
> +	msleep(20);
> +
> +	err =3D reset_control_deassert(sor->rst);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to deassert SOR reset: %d\n", err);
> +		return err;
> +	}

If you do this in ->probe() there's a potentially long time where the
screen will remain black. A better location for this is probably in the
tegra_sor_init() function. That puts it closer to where the output is
reinitialized and potentially reduces the time where no display is
available.

Also it is a more logical place for this code, since the clocks are also
enabled in tegra_sor_init(). Technically resets on Tegra are synchronous
and therefore the reset should happen across the clk_prepare_enable()
call of the primary module clock. So I'd expect something like this:

	err =3D reset_control_assert(sor->rst);
	...

	err =3D clk_prepare_enable(sor->clk);
	...

	/* sleep */

	err =3D reset_control_deassert(sor->rst);
	...

Where sleep can probably be significantly shorter than 20 ms. I think
the documentation says that 2 us are typically enough. That said, I'm
fine with leaving in 20 ms, it shouldn't matter much in the overall
boot-time.

Also, since this will need to be revisited once we have proper hand-over
=66rom firmware to kernel, do you mind adding a comment along these lines:

	/*
	 * XXX: Remove this reset once proper hand-over from firmware to
	 * kernel is possible.
	 */

?

Thanks,
Thierry

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVETtsAAoJEN0jrNd/PrOhHlIQAIMGqbpXtJR1XHiblTyARXkG
eU5AUKlKontqmAyivvkSK2/ntvW6RxVrHyRmITxhUbBjG8IPPzyB2SlQSjzhMUvo
8uuQ039ccNNX296GehyenljkuFX8L8M7SVholSoMa4uH7x8DrpktwgnppyTUSbXS
wWq9V+Gt3Y+l6/6754pvz2CGZPJYwvZpWMDWjoaV6ctsOxpicKzDWqfEwNdGdkea
Y5Rz5Y+lgagpFX9rAmhXnnKARuauRIsjT1ICXK+RW5/5hFbCc6fUODnD4LtOBbtJ
mbnuxtpexN875tg6WTpIGRtK3+NSWkCFs8By9Wu8QoWFfPhBV2yRq0SCim3dfcSa
jnR6SmPGrdlcADa7emgvnGbw2iuIe69EHmHqISUBLogLV2cQ8pH/224RlqAPRJib
oQT6tVYS+HuvFSYHRPvH30MEDBuD+YC/C8ubIe1TJuuiMprUi+K6hs+936pVlhKO
esvCG8Rt4Xo7cR7W6nAX0mujg25XmJ91JnVNN+k85LlBAN0oi051Fvxe317reoP7
c/DUIF1klxUkrfRCCWcNT7fwmvCmggaZC7RTo2id6VE9kkSF+q9sagU+DsK9GGkW
XIgigvz0BYs9zTJSoCu8cBqmFQu0oi+iS/Cr/F0KUqk55o11XiJ2WolKrFvJSjf7
gGFdcnHfcRgqzf62c4c+
=W2Ax
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
