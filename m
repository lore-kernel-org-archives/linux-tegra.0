From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add port FF to GPIO ID's
Date: Mon, 18 Nov 2013 16:05:22 +0100
Message-ID: <20131118150521.GI26046@ulmo.nvidia.com>
References: <1384780241-31639-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JIpyCmsTxyPLrmrM"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384780241-31639-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ashwini Ghuge <aghuge-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--JIpyCmsTxyPLrmrM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2013 at 06:40:41PM +0530, Laxman Dewangan wrote:
> From: Ashwini Ghuge <aghuge-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> NVIDIA Tegra124 supports has the new gpio port as GPIO_FF.
> Add the macro for this port name.
>=20
> Signed-off-by: Ashwini Ghuge <aghuge-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  include/dt-bindings/gpio/tegra-gpio.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

I've had the same patch in my local tree for a week, but was holding
back on sending it until the merge window closes. Anyway:

	Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

And I suppose I could add:

	Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

depending on who wants to take this patch. Traditionally I think
Stephen's taken them through the Tegra tree, since these files are
highly Tegra-specific.

Thierry

--JIpyCmsTxyPLrmrM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSiiyxAAoJEN0jrNd/PrOhV70P/1fS47YpErAt6HqmNVCQTZfK
OS1rFOQtSSatgboJC8tuMO7TczZQPBvk0EL6Em1/VWUk3W9Udw8e7V7BhElMueir
Wu5XBm2EKqmRxlJauztXyM7aw6yGC6NxnypbhKwD/96u3jc36M/w+vI1eHoGYFtg
SnmzujCCYnt1wnKpyi0q44svq8Xf9EWRj4y2d1BUf3ZyV8/fAsnjDiEcz4y1IazG
P7RPqhr0rXt3oHQiRMWXgX4cSdmxc4SZJtM/Idp8p6MQByT4gI6SkbYF90Qrnd2N
kIJtl1J8nN45dAR896KD+2TEs54zi9hEFtNyG5oDVmwcXL9iSsGDXx/mXLGGHvwU
veTo2GhBVco7iGhxD3JQEdDgbhixOTgKlSb3W4bRCgwPuq1uvy/0U61pleoHG896
3TgNdTiGHlMici2HHvGSzFEJuaCy08m9lylULhSacWkv8sfbCrwb25AmMazIoJpx
DB3Vj6XgJpEqZMTWvHF0RTB3Y6hloLx04uHxftya90znP06WyteE01yOgreXmm0y
3ssnd/Iu1LHoEYdSiCK+IDTu9RWtoo2u19nlusT3sM7wcc88moTACZSNk6vJtXgO
R/UeoHdyX3KIJOJS/YddtcFYLu0uKGXtEQZ6HtxhtHZrAyQSgixTIMjKLTcncbPI
xIHgpwMx5W4HNvHNnABi
=CzCy
-----END PGP SIGNATURE-----

--JIpyCmsTxyPLrmrM--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
