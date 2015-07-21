From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [RFC 0/9] i2c: slave: improve i2c client address spaces and
 their DT support
Date: Tue, 21 Jul 2015 09:00:56 +0200
Message-ID: <20150721070056.GB1537@katana>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
 <55AD7279.5090203@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55AD7279.5090203-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2015 at 04:13:13PM -0600, Stephen Warren wrote:
> On 07/17/2015 08:08 AM, Wolfram Sang wrote:
> >As promised here is my RFC to improve address spaces for I2C. This shoul=
d give
> >i2c seperate address spaces for standard clients, 10 bit clients, and ou=
r own
> >slave clients. So, you can now have a 7 bit slave at 0x50 and a 10 bit s=
lave at
> >0x050. Or, you can have a slave driver listening at some address and at =
the
> >same time have a client driver talking to this address. Note that this i=
s only
> >the core support for that separation, I am still not sure if there is ha=
rdware
> >being able talking to its own slave address, but we will see.
> >
> >This RFC and while I did some quick tests, it is not thoroughly tested. =
But I
> >wanted to push it out before I leave the computer for the weekend. It st=
ill
> >shows what path I chose to solve the problem. So, comments on that and f=
urther
> >testing are more than welcome!
> >
> >BTW Andrey, I did not modify your patch and couldn't get the i2c-slave-e=
eprom driver
> >to work with my Jetson TK1. Does this work for you?
>=20
> This approach makes sense to me.

\o/

> I'd expect patch 2/9 "dt-bindings: add header for generic I2C flags in
> bindings" to document the flags (or at least mention their existence, and
> point at the new header file) in the core I2C bindings document.

Yes. I forgot to say that docs are missing. I wanted to get some
feedback first. This series is a good reason to finally start the core
I2C binding document.

> Please consider the series,
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> (ack rather than review since I didn't review patch 1, and mostly
> concentrated on reviewing the concepts of how slaves were represented rat=
her
> than the coding details).

Thanks, exactly that I was looking for this RFC. Will try to send out
proper patches this week.


--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVre4oAAoJEBQN5MwUoCm2XQMQAK4LDaETzfu+1rMg1CxexzNE
orT97BBLRGZViCOeMoK30QADd9A0Nfgh12GIrPKpVj1JXWdwiYt16ZYbL9lKyOTb
ZCihzcjg9LRVm1IensZuwQzVMESHwLZ8eDgFxZqL4e8RKR9jbyoLVA9xpIlnOvdv
Z+fZH/eIlcv2o402cS6mDxkkNE4a7T3ZdmeWjFI9dHX63s4TCtbY2VEtRafgXyuS
+2rAT5CJEi2f2Eh0Fz4+2xuaAECx4uto6cggM7GZ6LA9HCSUN3EKe52c9ncK20Qs
A54Ws8eXKY4Dr0KZnYNWcPhqWB5Lkge7QTWBaCp6ZUbUKg5BVkewfyovdxIH9dR7
LQq5VRERIJn7rziIt8xGSgAHWix740VDnRu/j2b0B3RPXGF11vXslXgdVZ3N7xki
IWHI5zO6X7Hta/xPP5C6tDhDAP7MPA+IuF0l9ym5JC4/pByAV09wK7yUVI+4MjI/
e2W+ohFJvLpdek4S/5gB544q8u06DRRNCWzU5gmZRpTxfSuGNnKNnSFQ6hlOrhK6
av5xBzDLOHoN9imt7GaFjdchYy2/5/ZX5dJb7r+V+xh5ssis2ZnU2wSXA7FOrNIq
rhjeeWQTd7BwYREex4UfAtIkKs8MeTOXfn1+CE4/Lp+yEvw6DTIFCAW+1aWXVE4F
ED2zkKl1P2vjGFtSnghW
=6VXE
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
