From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/6] ARM: tegra: Add efuse bindings
Date: Wed, 8 Jan 2014 14:39:52 +0100
Message-ID: <20140108133951.GD1592@ulmo.nvidia.com>
References: <1387891931-9854-1-git-send-email-pdeschrijver@nvidia.com>
 <1387891931-9854-4-git-send-email-pdeschrijver@nvidia.com>
 <52CB14D3.2060904@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52CB14D3.2060904-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2014 at 01:40:51PM -0700, Stephen Warren wrote:
> On 12/24/2013 06:32 AM, Peter De Schrijver wrote:
[...]
> > diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20=
=2Edtsi
>=20
> > +	efuse@7000F800 {
>=20
> "fuse" might be a better node name; "efuse" is presumably the name of
> the instance, not the type of object.

There's another occurrence I noticed recently where we haven't followed
that rule. The PMIC node on Venice2 for instance is called as3722.
Perhaps that should also be renamed.

Thierry

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSzVUnAAoJEN0jrNd/PrOh2IUP/0HmJ+zy8f/2KJjdWlr0482w
QNMB6eOD3oYxRgXyxjAtQTqb2RHASLLvSRdLKz8mz+/0ZP9is7ufOYJtin4VnDki
8N5mqGuRtkk/XDLWPdqWbJT42h3SrGq7yC3tvG11cnNuw/jrZGrmPyfWn3e/sUFw
jY24rUqPg6oI1XnVNn2BGsI0URellhGxHFtKrmYkmHIpBCUa1XrU5OoAsmXAwAl0
/OgshcxI3J6IQ2R0ClQydmlI83Lfz1D+BixyH4G3pxl5MKkg9I/josOkWZv5InRW
9IaS6KpEpoouAuoRDoA0XGXLt/c2pE583DiTs3cFUON7b2o5ECpiyK/D+LlipsrG
cgr6q39iZrQPP3iH1Dz35HrTBa3ZHktTGB7ZJrAoZ8G0dTbanvaeBlAgVj99YMnA
Zuvw4iAXlxxV4T6Vl9tkeAn2UXrPT5UQhN4bnH3VMQDlgHeHO5MNENUJCj2OpVuv
Wud7TICgJAGOICBF61jSWaUAUR4Az9kFA5Q5V0sCpwM3qrdQJQydLnoJ8/qhpWyG
9FRpSehrRyh6Ua/8/xvdJOMXt+CItXs3GozgYCpbT27XLhL62A9CKGcNq7HJDGjv
xCexfDB8HYGYiSAmEs3xAT99SxfpzqNHPWXbkl4lXOhJi4Y1nkycL9NFTaNPSxug
OigsMWOU/MGKAHXHF9xT
=l8Z3
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--
