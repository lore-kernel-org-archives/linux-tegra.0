From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: pmc: Use consistent naming for PM domains
Date: Tue, 8 Nov 2016 12:11:43 +0100
Message-ID: <20161108111143.GB2085@ulmo.ba.sec>
References: <20161108100807.5114-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161108100807.5114-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 11:08:07AM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The various error messages refer to the PM domains as "power domain",
> "genpd" and "PM domain". That's confusing, so convert all error messages
> to use the most prominent: "PM domain".
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/pmc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied.

Thierry

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIbLuAAoJEN0jrNd/PrOhqCEQAIckJDmec+BYlPo5CWmj60h/
0JtEmj51emy7+BHjpqzLKe6bv1ReawVhGT2f8sWMeuz6gGS/ZTwB6DecBf+jhLd1
umZ3v9m6KwxvWta9PKkwFXiO1NUTMA27p0Kb8zcusMcrfFlCsEmZMDcF5uT+K2cP
PG1ITNJxCSFRHSxCtB1AEqSoUMSsPQ27IpD2dE1snaMDge4rh+q7ygwH1gnMqxrM
50ujPMR0i4yEzb+X8BVFHsdDT2xaIcyIY0qVQ1S7B49KAhR2JQPjA3qQTd1gczxb
yozh+l4tqXEEPVj5sDuNZCMlx4jG07uEGz8FkEeWUsHQZviCazR5NgABpkg6xwej
W29Wvlj5PrziLCbWDFgzzDmZxwjDPeuEnZorqHqvjNwT9MZ/KkNrWnY6xApnPHP4
X+iNzzGhL+EOm8/ZhyFSXJPITGBWer2gwwk0kQTLGTS/PNnNQkn3EkcnSoruWo5Y
a7HdE65y9qrWZa1WkHvcLyFDFJj4Ph3kQu0oRdrW/gv7Pa+mGAaUk8Bpujga4DtE
CgAtiXh/LbQ62oZ2oZgxQt7kozpvyZu7kinGoieQFyLnjoQlNc4wefr3byWEjL5v
Nz6IyVSDP+/WoLS4F4m/yi3fsdcZBjrD1SJBiipZPcSYllHRiYuiauXaY8I3XsUK
ZrEaFrTlAZccc6bxb2cp
=Xk/o
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
