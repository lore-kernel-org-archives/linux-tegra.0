From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] host1x: export host1x_syncpt_incr_max function
Date: Thu, 20 Feb 2014 17:20:09 +0100
Message-ID: <20140220162008.GA30172@ulmo.nvidia.com>
References: <1392850116-2086-1-git-send-email-cooloney@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392850116-2086-1-git-send-email-cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2014 at 02:48:36PM -0800, Bryan Wu wrote:
> From: Bryan Wu <pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Tegra V4L2 camera driver needs this function to do frame capture.
>=20
> Signed-off-by: Bryan Wu <pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/syncpt.c | 1 +
>  include/linux/host1x.h      | 1 +
>  2 files changed, 2 insertions(+)

Applied, thanks!

Thierry

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTBis4AAoJEN0jrNd/PrOhvwAP/je/hx8qZ5e73V8r5X5IvTyD
VJ7vQI/MivZfBRSIpcWyVjFfGqMhBTQ4FpuidkNrRaLKgF/2FagFH3Zg01YuQ/aB
lYH09rm/Sylgz9T47sooEYbkY43wj2hWn1SVKRqI5utKNE0E8HmhZ0Affs/MUuI/
PqB8RoonXjJmW0prU2EVEabDI3UAH3QJtsadDnQTcrFsERTrsB0SwTqU3lLMR1+h
hLoRKvgk/d4LuDKiYx4QR++yR3kdevMK0mKo3uWE2F+jLBdXtMy5c3BJmC/D2ieJ
gyjFnQJjQixvDsSbmA9OP9V64ANZNX2ygOlRP1ofFRumITB1FN6GEPlAiIa3vN1W
iwqBtvaedbLgand/vmEbltdg2VrzcrHzAFTnURNY86m6Z68bCufCuzCCBFhtTyJD
wLLCrTjjfOkLTaPnAovg5OymVQvdulr2rz8NfMwsPkdfsxY3DEZHZwRizTo4tC5f
C3ObYLVw5mFoKW7AYQlA5SBXRMfhyt6vReglP65vXOSO7d1xUV9jZDK/PnSQ4wEy
AMrTVo3tUKDKtw4isVcxSKJwQnCNJLTNrTUNZ9pOVq7kvbnthnRNGHxh7nlFQuL5
wSLKC8wFHl6YIk9POuEdcBVKqjquXXa6/9Wd6gx5kFA0b4lrVr5WKS990FxC1qbp
LEJS3qJ+d3DlUSRCcJ6H
=WmSl
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
