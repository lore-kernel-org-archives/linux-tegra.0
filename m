From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
Date: Fri, 8 Mar 2013 09:08:37 +0200
Message-ID: <20130308070836.GB21589@arwen.pp.htv.fi>
References: <1362671126-24571-1-git-send-email-balbi@ti.com>
 <5138FA7D.3040104@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5138FA7D.3040104-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2013 at 01:37:17PM -0700, Stephen Warren wrote:
> On 03/07/2013 08:45 AM, Felipe Balbi wrote:
> > this will make sure that we have sensible names
> > for all phy drivers. Current situation was already
> > quite bad with too generic names being used.
>=20
> Is phy-$name specific enough? There are other types of PHY such as
> Ethernet, etc. What about phy-usb-$name?

we will be creating a generic (kernel-wide) phy layer, so I guess that
matters very little. Specially since we don't want to be differentiating
PHYs by their subsystem and rather by the IP name (which means
phy-tegra, phy-samsung, phy-omap, are all 'wrong', but there were no
better names).

> Venu, please comment on what conflicts, if any, this will cause with the
> patches you'll be sending to clean up the Tegra USB/PHY drivers. Thanks.

BTW, let's stop with the whole dependency between PHY driver cleanup and
arch/arm/mach-tegra/, too many patches have gone upstream bypassing my
tree. What we should be doing is figuring out how to remove arch/
dependencies so that patches can go upstream and not cause conflicts.

cheers

--=20
balbi

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJROY50AAoJEIaOsuA1yqREnkEP/A+9oWop3XlI+lQnmKr8cHf1
SOaz6I7o7USfwpFJapVzb5ThxdxN+KYDn6k8oM5rXDAShwlVleMulAsVp6iKA9eR
q4caKwzd9wMwkjedFsu/FjHxgn5vCh/91ggLiZYTanU4FT0/h3W91n82U4OiUh9h
2mDPz+qy5wROSEz0Na0FQgM/FhhxkN5mCd9zK7Kmo3acqQbA7YsEj1MkkT4whEVu
9bvHRJ62qbLyNcgGWqgg/l8bvxMafplVkgLcbfdnOgnra9xNj+XQm/gRcPqze+YO
EycjavO1mpEvjExQF8xOlptfKg8Q7izvJSO7BJltx5fU/cvxpgiDxbRnryAByHhw
eb0C/5XsTin0xJAUZGZuIsFx8Hu7GxftNn4IIl5BDSoC7eQr+dCK4ajOXtm23lR4
Lla9FmTCLPEuFXJ8hm5iN1VfGqpe/pH5qPy9INYz5T30eRxVmgUhWeKpPSe9xWyk
vUw97t6lEF+n7uV3qJ6YCI6SByxYwvdtyFoXRvTHmgQUloEAqBkY/PRfUjYje+ab
fLZsLjEfFnCmIq5BsIF33+ppllQKVkY/NEb0YMVuot0RA2Ho2YgVgbrmT70Gm+5b
xVdxqgohPBqdiHtszS4uMGaOCq5Fq+kZOXhtuwz7gCx/eqNyRCKb2OBg3BBCRuuD
dL3neLp2bx55H9Zg/IxU
=qT0m
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
