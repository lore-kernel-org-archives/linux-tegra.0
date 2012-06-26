From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dt: tegra: seaboard: add regulators
Date: Tue, 26 Jun 2012 09:52:28 +0100
Message-ID: <20120626085228.GG30406@opensource.wolfsonmicro.com>
References: <1340406842-27135-1-git-send-email-swarren@wwwdotorg.org>
 <4FE80413.6070001@nvidia.com>
 <4FE87FE3.1080608@wwwdotorg.org>
 <4FE882A5.3080504@nvidia.com>
 <20120625222646.GB30406@opensource.wolfsonmicro.com>
 <4FE8EFC4.3090509@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sClP8c1IaQxyux9v"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FE8EFC4.3090509-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--sClP8c1IaQxyux9v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 25, 2012 at 05:09:56PM -0600, Stephen Warren wrote:

> Just making sure I parsed that right. I think what you're saying is
> that the device itself should represent its input pins, e.g.:
>=20
> tps6586x {
>     vin-ldo01-supply =3D <&some_regulator>;

Yes, that's what I'd expect here.

> ... rather than each regulator specifying its parent, which might
> result in some duplication, since in this case both ldo0/1 are
> supplied from the same input pin:

Plus you then get back to the problem of users having to figure out
where to put the references which makes everything harder to use.

--sClP8c1IaQxyux9v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP6XhFAAoJEBus8iNuMP3dpvAP/iCm5eCQPbzCMaGCZ5dTLlQC
2nDfd55mom7Lj9fv1ZHz+UkdS/WoEsRtim4HwevAisxcv8+cCIhRR0VTC1eQ0Wrk
5lER/F4nVYJcQV9RFakAuqXIuIrwwnhYQMXnY3xDJcqG+U7vtFrP2aM0yGBjRcEz
AnWBDvgkOA0GKf1QVM/SgMJANOeEukS/CPxM9pJDB/TBiXGmETwFCZ/ujnGiELG4
ZOsO/44o7b0Bt6aax20xWkAFMqQ5U12zRuePugYCbLloP2XRtYO7fRfpaLLokoLM
7JUE/05quCwuDIZb3gUjbOvOq0LQbcGFxYFvmTdIxwzi6D1m61v4LL9M2ECsVftG
9Uj4paK1/4Qg9H2Piw/mYLQJu31IF7IYKGUvX6qc/IBXzLKY/HX9ukD7D9e7vl3F
vdljYPQnTVp8TvpVvGd6IjIID6FpuUcZ8c8dpujTWrDIaK+qnwTCI2Ajpe+I8A4o
Ld6ZhZM3P6gJi5CDsAHjsZ4CjW0rk2c8RUkooQ3Rd5U3VTccmxNeSGZZTuLNRDCp
v7SjU9inwXsLKErlLxm5zf10oX2wHJibxunoWBKIjXtn/CyIlen3mK882sKgZpXw
WwrabZZDEiURN3yZyXqCcsnbUVLN+cjIRpaXoCSHMmV6FFf5I9VP/8PhDvb4NfU/
3xHikEhHIMLkMhIswAHv
=7tSQ
-----END PGP SIGNATURE-----

--sClP8c1IaQxyux9v--
