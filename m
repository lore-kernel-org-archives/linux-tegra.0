From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/6] ASoC: tegra: assume CONFIG_OF in
 tegra_asoc_utils_init
Date: Wed, 20 Feb 2013 17:25:49 +0000
Message-ID: <20130220172549.GR2726@opensource.wolfsonmicro.com>
References: <1360973255-344-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2z7AKWNQ4hR/M4ga"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1360973255-344-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--2z7AKWNQ4hR/M4ga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2013 at 05:07:30PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Tegra only supports, and always enables, device tree. Remove all runtime
> checks for DT support from the driver.

Applied all, thanks.

--2z7AKWNQ4hR/M4ga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRJQcUAAoJELSic+t+oim9MIAP/j0yCs2zp6OcEWSG8uNSKxQD
sWry22mw3qcMfNZjX7/jF7ajEWRilR9LrzO6DReern/Lwzsq5+NIBztKiV/61Sre
9vEHmwJyCUXRZisv7VR0T2OcM1MEN2JIum6Ej8T6GSve32yNY3kGm5xk258sYyZH
X9JhzD/pr3/IPQn+dk3EU7dxbhREgixOmGTJBW/erUWm1PE8jyOKc4vuqldzdfGn
QdpBGooXSyMWHNAmwrDC4/Tu6KvUzDKtaVOCWuTBni2OGZm7CpH9fueo7B06RIzL
lHJI6aRanVHJijQvBb1GlYAmu5ZhpMAdycEESDMQ1rmKlPT2RpHbIxEGQ+Ee/sQI
Hoxr23rS6aik4S9vF8cHb2wHEXjcpFJVtlohkM2fDwrIDKgBPUqg+BZuUNKUs9QL
LoqmJU8hFkW0D3Ugf1FfYUsXk8pkKxXS4L1PVtWUu9MRavPSSDRiBT/al38ywZFk
jITz2xqtIo/+U7+EAfxTbjMabsuEeUPenfXsyid2VhTBppzaSH/hVBV2HPvs3r6/
C+w4QDoFWAMVOfio7lDjoobD839WCijmnl2oM2FQNiNOM891OdmmnnFrnu7OV7er
/ZrP00RHEQRtUfT2K7CQXLHq8W9DpiBMi3FrSkgewJQVDs8JmL0X7xYDVDGBSGei
lojiTsWu1YZHDM3a8dpg
=3rD9
-----END PGP SIGNATURE-----

--2z7AKWNQ4hR/M4ga--
