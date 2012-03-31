From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 13/17] ASoC: tegra: set a sensible initial clock rate
Date: Sat, 31 Mar 2012 21:17:55 +0100
Message-ID: <20120331201754.GM5012@opensource.wolfsonmicro.com>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
 <1333148852-17806-14-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7vLGWvOrvbSM0Ba8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1333148852-17806-14-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--7vLGWvOrvbSM0Ba8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 05:07:28PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Initialize the audio clock tree appropriately for some reasonable rate.
> This makes sure the PLLs etc. are actually programmed to something
> reasonable when the audio driver is loaded.

> +	ret =3D tegra_asoc_utils_set_rate(data, 48000, 256 * 48000);

Applied, though 48kHz is a somewhat surprising choice for the default
CPU audio rate - the overwhelming majority of audio played winds up
being 44.1kHz.  Still, it's just going to get changed as required.

--7vLGWvOrvbSM0Ba8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPd2ZqAAoJEBus8iNuMP3ddh8P/3snbvu5N1LAf3rtsgliBQpB
J+v6BUk6MwDIXAkNsZutY86pWwdLhS7Ua8yZ1c41r9QTFozHDgRnUt27OtM8sHIo
z8J7ckxCnnDwIajvUzwWClnQdG+LfVR/a51lpjXt+ySWS6aiPxZLGoJdb+x6e0cf
d7rKXF9FJqhkiil/DvPIRXYHx1MTfZct6MuC01hNF7gAp58VEkl9zHmOCBYkrbrd
UoUeNs9E4vbJRBf7+lGp37oPT6HkdLwkxyePPv3vyYU6BAGpWFDwZzXQOYY08nbW
ERNG1aI1wNfMjvz/vzaizVDElQY+soZm0YoopqdBkgJAOr0Nt9sY0ezkZPcg53nh
bkZoI33wMzgMCGO1pKRHeWlIhpqjpBtJ+c9iRwKwp8oQxMnerfF3CJl3ok80XoMC
rX6DzYDFCp2CkNdDnZJSktZjI3RCnrK816gmLXou0ObNvKX57gNlICLFrslxHbul
PHsZQUP09/5ik5s3K0C467j3tKsZ4Yoyx4Q2mO7ie3tErJtw+9mRMPNliEKuMEQc
2v8y2z7h1lpsZTgqFxEdz5BfHGhoKoZ+qi9mO7k0DN6B8rr2OoEuKzksm02PdZli
Acsw2CXl9eKTzaOxhmt3JanFCuj1N7xu049Gqwxmi+U2pmpyeU+ulxDuwPjCvFnO
fIDU+nH9LbZ73niCX8bh
=cLn6
-----END PGP SIGNATURE-----

--7vLGWvOrvbSM0Ba8--
