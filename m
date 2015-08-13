From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] [ARM][TEGRA] Fix AHB base address on tegra20, tegra30
 and tegra114
Date: Thu, 13 Aug 2015 16:16:40 +0200
Message-ID: <20150813141639.GA26559@ulmo>
References: <1439042292-19912-1-git-send-email-kwizart@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1439042292-19912-1-git-send-email-kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 08, 2015 at 03:58:12PM +0200, Nicolas Chauvet wrote:
> Current base address is wrong by 0x04 bytes for AHB bus device as shown i=
n dmesg:
>  tegra-ahb 6000c004.ahb: incorrect AHB base address in DT data - enabling=
 workaround
>=20
> To correct old dtbs,  the commit ce7a10b0ff3db63 checks for the low bit
> of the base address and removes theses 0x04 bytes at runtime.
>=20
> This patch fix the original dts, so upstream version doesn't need
> the workaround of the base address.
>=20
> As both addresses are valid, this patch doesn't break compatibility
>=20
> Tested on tegra20-paz00 (aka ac100)
>=20
> Signed-off-by: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra114.dtsi | 4 ++--
>  arch/arm/boot/dts/tegra20.dtsi  | 4 ++--
>  arch/arm/boot/dts/tegra30.dtsi  | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

Thierry

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVzKbEAAoJEN0jrNd/PrOhebMP+wbSN959nULpU2edPt8uuPPg
wFaHbDF/57sLzk9jFumI/vYk4pv4+XGq5UDFcecEJhpazdgjyLDgYW0DducIsXZz
/MX0yTq5xVXsx7DYbw3aREy+/jjYjlNoUumbQlHwuk551/s82yPaCfU/JLUmz4hr
zf4TkN5t/BnsHtTOHKPz+x13rRn5nBvRu+UxnfpMp3132VffzSKbq3GErEh7sirQ
un3a1MZur1kQ1qWFBeFztdKFSQsw6t5ixq7Xp96SebzPaeqQPg/Wmt1NG8V6zD5B
uMGYYCU1ln/MwhR2FRBX0mAamj+r7fjMEFmpno+Fqnvx1ASX+kpjvJYQZ4DDoEo1
B6IozoPyhl1rAlk9OSk9syrw/PdFNOPs4+vS+jsjRrJEA8gzZhOA6ZdeAe1maT7u
pYu/pDKWE/aeVUjkT9H3kxjpozBdgU/FFYM7zDtzwYoawAb/NlnAt0TN0m1EswTI
Bdu6q403VXOJErZsgeX7EixIDzgrl3VtEKhuSuJxTV7IDaWXn8HSE+lTGY3e1+og
HQDuhsyi3xHZjK1ARYXBUvrjpiWHWPKK9d6QqYFVhfsxgtXygrizqWc+JgdrG/oV
xUDxoSIDc8vt5CyJoNqvSOfU8ASrN/th+YzGhHiV9oyY8LxEyZVYnAafEVswMDW0
EewgSr9O7LgobVwcWS+z
=2wK4
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
