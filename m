From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 11/15] arm64: dts: nvidia: fix PCI bus dtc warnings
Date: Tue, 13 Jun 2017 16:52:07 +0200
Message-ID: <20170613145207.GC20577@ulmo.fritz.box>
References: <20170322020313.24338-1-robh@kernel.org>
 <20170322020313.24338-11-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170322020313.24338-11-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2017 at 09:03:09PM -0500, Rob Herring wrote:
> dtc recently added PCI bus checks. Fix these warnings.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
> Sub-arch maintainers, please apply to your trees unless arm-soc wants=20
> to take the whole lot.
>=20
>  arch/arm64/boot/dts/nvidia/tegra132.dtsi           | 4 +++-
>  arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 4 +++-
>  3 files changed, 7 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlk//BcACgkQ3SOs138+
s6Fg3w/9HH09aP+l/1UlDe7fSfhZZNdWv2ZtqGI+k/XNzGbQ6qRqF70xY5bGy27H
AV4O/S1jZ9p/3A3/xnyKBdTReObslH665K2OinmNieeT67EnDVEBrPWQLzFgAlbL
4ewNQlzphhsO2SmuUTr05YcmehI8egi6MS28UQL4FLPLYq9xASjGZCtY6znP/VEW
wqRQ2PeC1jTsqEwjXdn5k8LtdiuzIVZEkVTGK7qS2N2QxTjhcm71+622SwODaGU8
zjyLCwjAwfEvbW6+AFDAxBXSpVNCtID7n5MQtMt/Teha55ubW3bnGxMYCghdYFjH
TwbLGxiEmCL+YEj56aRQuxjHzrnnkN7GsaLU5HYHPswfLdYxgPveYziwzgc1Bf70
JBst3vSuEGwOejGN2IhvUkEemh6CAyc7va4TRnVFojPrZYa9CNKeo0ACTev03qGA
pShAawj+UzwABIRRAnR38k/OMG1Li2QrFltDm7TpdjGzxCpJ0DLqtKFW2BKmRSsz
n8LolSIb4GdCLaqy9SiKPyn5rNqY3WZuZSJeP/vaEqy34nNqg4wodxkQXe1s/gNy
AuiXj5AVLuLXBPzecitr8V93uLVbrEnw0Uo6OLG6VRXBFfbGqfgPQrsidKE/NExb
YgjUcBLMeO5e7G4SQ0jQTqd7VCXdQho4N21IVDCFk7Y25OYHDWU=
=2dQW
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--
