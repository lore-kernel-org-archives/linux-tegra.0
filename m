From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V2] ASoC: tegra: fix I2S bit count mask
Date: Tue, 5 Mar 2013 10:42:59 +0800
Message-ID: <20130305024254.GA9391@opensource.wolfsonmicro.com>
References: <1362442220-28718-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1362442220-28718-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2013 at 05:10:20PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This register field is 11 bits wide, not 15 bits wide. Given the way
> this value is currently, used, this patch has no practical effect.
> However, it's still best if the value is correct.

Applied, thanks.

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRNVuUAAoJELSic+t+oim93CwP/3CHj8to8LDKE3LEiBimhym3
GDbjw2WE0qcU0b1/HNweMdLKGoJqp6rPb2QES6Eli5MFIMqHL6ffQGvqnIGCdc/C
hODua4UpTZR6EHPSdxIv7yrQX1FZ1aJrtDV3lt9Axl7DxNkIYmBANwYplT3O4uD5
LNjjizCSIi34lhoeinKTEqMwgueHR8ktxOBBH/08ugil96AVK7/0CeLQON5a3TaZ
scM7hGnqYjgaSxXPhSQO6ocGFw6aQ3WT/6qGm/4AltK6o66RnHARCZBPFgEUdcoU
UEwhnWqklBbIxbD3tcuamEO3ae9cv13Ju7XE7udIPenobzDXLyHZaXOWqrdiVv1W
GulqA1zDIQKJkhcr5+/p8suPiYHjLYVvFxG8MeabA9jw8CFq/DXuZuVmwGxB7OC+
xLYXJYUStIRFwq5raQBhZXlXa/gv9pKyB09GBEk2VMpxAd6lJqC28lZDvxDWohMn
FDSQcRq4KhlwtbUtFdcFyhWz/BCrPHLbkZBcO5hDAR48iXKQfdfRA3dWN4c9jLdm
G0ZYQhgw+Mc0PbSmXUsI08UVKknZnF/iBn0gFoypr+Wfp4e0m9UcAm38Zc1/Fpd/
ajja9I55gC3VxttsUFueEMo+30MedlwyxHsqC90CzhVBGW2IdW0EYA7e4Hysqu/8
oe/AtNXvlaPGKdPFXg7n
=7o0/
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
