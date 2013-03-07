From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/1] clk: tegra: Fix periph_clk_to_bit macro
Date: Thu, 7 Mar 2013 08:02:48 +0100
Message-ID: <20130307070248.GA3451@avionic-0098.mockup.avionic-design.de>
References: <1362606444-19970-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1362606444-19970-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2013 at 01:47:24PM -0800, Andrew Chew wrote:
> The parameter name should be "gate", not "periph".  This worked, however,
> because it happens that everywhere periph_clk_to_bit is called, "gate" was
> in the local scope.
>=20
> Signed-off-by: Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-periph-gate.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-=
periph-gate.c
> index 6dd5332..d87e1ce 100644
> --- a/drivers/clk/tegra/clk-periph-gate.c
> +++ b/drivers/clk/tegra/clk-periph-gate.c
> @@ -41,7 +41,7 @@ static DEFINE_SPINLOCK(periph_ref_lock);
>  #define write_rst_clr(val, gate) \
>  	writel_relaxed(val, gate->clk_base + (gate->regs->rst_clr_reg))
> =20
> -#define periph_clk_to_bit(periph) (1 << (gate->clk_num % 32))
> +#define periph_clk_to_bit(gate) (1 << (gate->clk_num % 32))
> =20
>  /* Peripheral gate clock ops */
>  static int clk_periph_is_enabled(struct clk_hw *hw)

Reviewed-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRODuYAAoJEN0jrNd/PrOhxpQP/15ezbiE/MXYaup27lug6Szc
hFMv02kwg3ArhqNzvCBKkyIe/udOmX7ZyNitzFthcedU14AG+wN84DWxWP3xhSW5
mr2tvKE1c0oanIwWbeBpQ5C8cxRnP9sceSYQ7aHQ8yEdNHbOOlBrjp490iQhbDIm
YWHqHc1DIZ6vfglKSNlkSucv0EQ0tcyAYnpA0cW5aFlsg1MywJ9ntbVhl86AWlrd
dYeY2EvJoPiooYJ8CL28S/LiQp2mPiTtVzmX/A1wVtX5Tb0c5haqQtm4YIDecU9E
kyWXNw5eFj/AgX2sxoM1qQLAjL8HVqne9xerP6pQpxsypEHN/HBpQB1V0mMcNR7y
7nzRbpmQTKtk8Kjj9sZgDA5VLt8FVDr6yvrzdjmTRqcetim30TqkOM+6M8Jmwopv
mxpZ2THx47mx/Ho3GHru0aOdtPSaGZtFsGeBqxqc3Xd/BM5djlkgwHRljYzOpqxr
qqMmxAtSyVohJny05OT4dyv31H0DnbyoK/0mSDMRcJfUekrH3/QVuoSTx0ChK3tM
jDVy0B478mF5GAMrKduckylJPvFz6BKqckQMTanRcKgYJ9FuT6S8g5iYUPO/+VST
+kw7oq+2W6wx/+mtdws7ashSG0RrdLRYNMjq3Vj5X5/bBjw8ArCVjj3+mWeDropK
uAZ5UfLZgAc2Jn7oLoFe
=sVEE
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
