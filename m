From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2] ASoC: tegra: use reset framework
Date: Wed, 27 Nov 2013 17:14:39 +0000
Message-ID: <20131127171439.GM14725@sirena.org.uk>
References: <1385496767-8307-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5kKFnMzJ1rlmqP2F"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385496767-8307-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--5kKFnMzJ1rlmqP2F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2013 at 01:12:47PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Tegra's clock driver now provides an implementation of the common
> reset API (include/linux/reset.h). Use this instead of the old Tegra-
> specific API; that will soon be removed.

Acked-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

--5kKFnMzJ1rlmqP2F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlih8AAoJELSic+t+oim9lkwP/2cZUbBRs1DwyIDCR0bpOCfs
9hrWGgqhkF4dnXTuojCGOuuYZXy9gwEsymPetjXUbizbf87JmPYn4e8k8LopmFhQ
asrEfUBqVMD/El6SOFyvsmo8mscWNi80W2mzypW+VGjiH7nMPkwCrOR9HFCnzMjY
PZ0td+mEBkgtxrdvU3oPCPzcurrcJLb8i/O0sHxo1wQHJGYDS6W5hOPINiGrdfWH
saq+Fc2wbic8k+d5l+ZBM9tcnUiI3Ls6Z5Cmc6x6lh6qek+9TltGjRrCdFfE0Jfb
XUVC4nxktFgVQ7Clfs6n+EYI9YHm/I1mA4e+iexG8Ebi2L9qh3gSvm2wSFMkI5j7
4KIsoZJBo3cGdSBy0ynxeXQc7qa7xdsy68hGYWLNKBt1b0LK0JRn1MNsN3J/XDYQ
P96sCw289VIO24TFM1BrMLWHF2Y1CeR1OqbIes0T89jr6OH4yqkyKAMgMNbIvMeq
0HGhbgJyL3iw5jKeJn0RNkmz9PxsWvz0aVzkfgD9lrBqep0Y4igtknDEIj9cGwy4
WaFFarj+6P7s7MZk10KuzC1vdzSeUCuDFbknyZCZ8eZNIbLlhkrPVCaCFm7JKPtR
YnE0V9khAMUdutQRGXsG1kr67EfCnzmhtXoZw+0L/XjtxzaWHnAv+PFlImPayPnL
htIYtznFXFpy60I59IHd
=vuZo
-----END PGP SIGNATURE-----

--5kKFnMzJ1rlmqP2F--
