From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] soc/tegra: pmc: Enable PMIC wake event on Tegra210
Date: Fri, 22 May 2020 14:58:36 +0200
Message-ID: <20200522125836.GI2163848@ulmo>
References: <20200520151318.15493-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CNK/L7dwKXQ4Ub8J"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200520151318.15493-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--CNK/L7dwKXQ4Ub8J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 04:13:17PM +0100, Jon Hunter wrote:
> The PMIC wake event can be used to bring the system out of suspend based
> on certain events happening on the PMIC (such as an RTC alarm).
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/pmc.c | 1 +
>  1 file changed, 1 insertion(+)

Both patches applied, thanks.

Thierry

--CNK/L7dwKXQ4Ub8J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7HzHwACgkQ3SOs138+
s6HXQw/8D/SZ3WfX5sBNTqkmRFehr6dWaN9H1d/VMEK1RtC2KKGf34thI8wwFsJo
pUT39671Mkhtzn/85uDXkrO/8Jpeh930Ki+GmZT8EeG8HLYtg1BpGjEqVtJps7dU
9cIkUCmbC+IZvM9/VKFD3xp8dWKFJWzwEhZtK5ICfqOe00Lo1JObrrFsoYMOAfyS
Zn22h1LlzxVCI4tCOMh5d1PUc2q2NiF0bQDxlBhm8PANO4FaCYhoyNXQlE+K/4Vo
5WFYn/9hlu5gPX/W/MBEKNGXsEeq72D8BjpX4dnZPgF63bCHiqJ8eUYeCfAq9wfQ
i7wI9tcL4smFHPKbNZ6oBWgg9HdHSzSQRrM0vMue0VGHfKvmQj8CbI/m5dOxBziN
FVlz77RoxwuKmBM7fhZnVHZc+T04ejiMi/IqzxbCsQfNmBPClAX2vK99Ic6cTv5N
yXjmZ/jbEx+S/wQj9SWMjeYlnej7OmhtTFOKlP8KFoig0yt8zGkPo48AnR+cs+4M
vrsmhqOEDvlZSYOsnMcnqG/7Jsby9NQ2GRzKZpnDBMLYYz69nXR+TxfA2lPaI9lB
bU/cSXw5l8ngo+JwfGBmJCKToZdhunFRQz6xg1d4IkPCPH1TcVBH79l6J3IZbNXZ
WzZGqWVudywJB1R07vgyM9hgbu9MHuRWaQfNsqZhy9HO5lX/jbE=
=5M1d
-----END PGP SIGNATURE-----

--CNK/L7dwKXQ4Ub8J--
