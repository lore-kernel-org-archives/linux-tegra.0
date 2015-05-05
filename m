From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 9/9] ARM: tegra: apalis t30: fix pin muxing and add HDA
 in device tree
Date: Tue, 5 May 2015 14:31:19 +0200
Message-ID: <20150505123117.GH30501@ulmo.nvidia.com>
References: <cover.1428700856.git.marcel.ziswiler@toradex.com>
 <94ae838321940e1a245c115009f6c48f0eceee76.1428700856.git.marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qM81t570OJUP5TU/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <94ae838321940e1a245c115009f6c48f0eceee76.1428700856.git.marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt@kerne>
List-Id: linux-tegra@vger.kernel.org


--qM81t570OJUP5TU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2015 at 11:36:04PM +0200, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
>=20
> Fix pin muxing, add digital audio aka HDA pin muxing and activate HDA
> driver.
> Fix pu vs. gpio_pu pin muxing.
> While at it also update comment about supported module hardware
> versions.
> While at it also add an emmc label to the SDHCI node just like on
> Colibri T30.
> While at it set the dr_mode of the primary USB EHCI instance to OTG as
> well.
>=20
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>

Same as for patch 8/9, please split these up into smaller patches that
do one thing each. And again, I'm not sure adding an emmc label just for
consistency here is worth it. If it's never used there's no need to have
it.

Thierry

--qM81t570OJUP5TU/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVSLgVAAoJEN0jrNd/PrOh6eMP+gJRrnzFNmgoCUMJndtR5GKI
XUR3Ng5hc4+9FQvNuxHCvEjCCNxrYKWFv8q0l4aYFl5OXEBVlJCm9ohyEH/DJe23
K7ctReVZh3H/vSNK6a360B1W0s03DT9DZ4FmWQ/bypmvgZueRKNF+ySZa+wUZcku
ZjxUxs9Ml06BYAltltVckzpsqOH2ii7u2t6LhDPGEuBZ0Yy0CMAP562VUhk6CwGU
FGW6LFxRSQv/LSvpg0ndM87LTCGCZBMR36hy6dvIvd7secYlGo+mzv1k0bJZAII4
jFZ9FkO1sf+A7d2zZKuq419NeLFkDyFc3M83EADZ/2Z8CeUoJgRPJLZVbw26M+Ia
2n5h5U0emw9o5Oi/me4+09Wr+pyBhUzS2AAq9jL8b7T4HQWFenn+QAJKUCkLDxLM
enSV9QlwjWXNWXZf+NSHgsFjnd/dNXXAoJpQtYqdqlCe4c1EqWNgLhfYgY19lk1A
6sTj5RoUZJTgTE4jvQG9yreff95szxUGKNoRRkLTIvKO1iDRHW0Ol5O3ITy1Xvu7
14OBrjvjv5voP0u6SaZjOyI2gotGSShbRZ+sLydSFw+PGkCnk2nqqNcTuK4JGGmI
PiIR8UGMybNiFJsBc5FHX1awbwTDtdntwmsFfMO+QlEEP0c87mnyvOd3ySgBQRa5
akKkWEO314oW+kCYc98I
=dOiM
-----END PGP SIGNATURE-----

--qM81t570OJUP5TU/--
