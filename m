From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 04/10] ARM: tegra: Add Tegra124 eDP support
Date: Fri, 20 Dec 2013 12:17:27 +0100
Message-ID: <20131220111726.GM27787@ulmo.nvidia.com>
References: <1387469182-14398-1-git-send-email-treding@nvidia.com>
 <1387469182-14398-5-git-send-email-treding@nvidia.com>
 <52B35B15.4090008@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FxlYARId5dseejUu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52B35B15.4090008-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--FxlYARId5dseejUu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2013 at 01:46:13PM -0700, Stephen Warren wrote:
> On 12/19/2013 09:06 AM, Thierry Reding wrote:
>=20
> > diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra1=
24.dtsi
>=20
> > +		sor@54540000 {
> > +			compatible =3D "nvidia,tegra124-sor";
>=20
> I don't see a binding document for that compatible value anywhere in
> next-20131219, nor in your drm/for-next branch. Still, the DT
> content/schema is essentially identical to many others that already
> exist, so I won't block applying the series because of that. Please do
> write a binding document though!
>=20
> > +		dpaux@545c0000 {
> > +			compatible =3D "nvidia,tegra124-dpaux";
>=20
> Same comment.

The binding documentation for those nodes is part of the eDP patch
that's still awaiting internal review, that's why it hasn't appeared yet
in linux-next or my drm/for-next branch. I'm hoping that will happen any
day now, though.

Thierry

--FxlYARId5dseejUu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJStCdGAAoJEN0jrNd/PrOhFNcP/RRHlly/VoR4pNm3ea7AvB2G
Ii6yqnJcJGAVGNf8LBSUbjHxubMIrdo7xwagydkkeXLy1BNBbJju0yI9WyjixDIV
5bq7lx3YwSpKfkm/x/F6svkGN7D2hrQfiXoJYbVa+Z/5K66d85Wwl3uL/hwcTLiN
QaOrNsDtWpuu11/vWhIo16p623n6arHve44ocKFryIlUldIu9w2YIqyEGvJfyDi1
kgfGaFOna9f+lM4E88SyUAf4nHOIiMEvDiPXUVpC3PZ4rjIosGiNvYTE6lS8Cfhl
kFfY0Vzzsw+ph3D3YJtXPd2Qgx2LY3CoGsnmffE2AnxSWg75wnqrCIdAauE6juAC
v6R7eWk0JEMNSgAShFo4eaQxIA04ftnEz1DA0/GcM2TAc5N2IQqy/wArclCoAlBJ
YLc9r5PIkKkxmYGvwX/gNujthqgXBnE0ikPEGwnqI4VL71xZEwTVNFLMjETUdWjx
+MM96XAZkrM8P/QJQtgcQ2R5LOHA/UtSAvg71YLvnPPx+SGmpMxDRcLOZeYPs1l1
iaLuKnnIniR94AEHRez+bBYUlIZ0xSq1cv/nZH9/GWa81PPDkcccaNkMPUd4Zy2z
uASBCFxM+r2jRVcw0TyugQF89s6Rk2uyza/d9czyXsBAqNcPSfTCtHOTgnDIoAPf
R7hdR5G+deYwxSQzESTf
=DXQm
-----END PGP SIGNATURE-----

--FxlYARId5dseejUu--
