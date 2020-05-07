From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] soc/tegra: pmc: Enable PMIC wake event on Tegra194
Date: Thu, 7 May 2020 21:27:37 +0200
Message-ID: <20200507192737.GB2905961@ulmo>
References: <20200507101349.14118-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200507101349.14118-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2020 at 11:13:48AM +0100, Jon Hunter wrote:
> The PMIC wake event can be used to bring the system out of suspend based
> on certain events happening on the PMIC (such as an RTC alarm).
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/pmc.c | 1 +
>  1 file changed, 1 insertion(+)

Applied to for-5.8/soc, thanks.

Thierry

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl60YSkACgkQ3SOs138+
s6Fz1g//Q5iLIzPYo4fuJLRgZp7tCFNkrigukibQ22iSDLgmes6200DvfkFd4o9j
PeFSs4LsS+/cP7lc5jS7PyKBH2QfTvYqCPFSpb5aKS9YUhagGdNcFcTYnMIp+JCW
gngiBV36gBHKMortvFh6hhO1KPNKhltWEDwdUj04bRJ7n2q52ZBR1PUkvTPiVeZR
mIk4kW1HTk6Tl29rLZ003HhL7aluyGsQsQwk72S7/P4PxRTvCYcgDamBetymvHwF
CGI5MKXslq6oQ8+hOAr8h3uQKEzuGeufxWoIkUEr1h5OS2yyp4bcP3tdYzwQCzcP
ZE+a7Zw1vZOmpZ7h1lmhQP3M6rLLKrra26alHnFUnXzE4ELbmksxNh2UAcw7DyhO
INy2hwjUTGT08HtBDLUIaLGcZCRMFnVuOu2BNwUkR9UzO5/gqqpXgFb+eTLdHZUL
w07KEYtM67f074LIn3BsOF83NjOW4GA9yF90Jf36xd97LWWWkb3U2W1DEVV0EFHx
kQcYKUmA6R2j5otTwe7HgkBwPpnvlNYmhHwOYNplbE7YYn6XAOepqOfp/A/rkHhp
3KRUe5TKOC0Hc3yeV/sVv+JovgK+3LCVTNSreOSgOdWdrHxCUjhoNcim9vgg8ROV
n8+oDDXzXTpbWKctMSlSQuu48z2VKQUSOdio5pGisJgmQIttLOU=
=/INY
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
