From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] regmap: Support for caching in reg_raw_write()
Date: Fri, 10 Feb 2012 15:58:32 +0000
Message-ID: <20120210155831.GE6472@opensource.wolfsonmicro.com>
References: <1328873572-12603-1-git-send-email-ldewangan@nvidia.com>
 <4F350716.9050407@metafoo.de>
 <20120210121405.GD6472@opensource.wolfsonmicro.com>
 <4F350E8C.6030907@metafoo.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jTMWTj4UTAEmbWeb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F350E8C.6030907-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--jTMWTj4UTAEmbWeb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2012 at 01:33:16PM +0100, Lars-Peter Clausen wrote:

> regmap_write doesn't always go the raw_write path. Also with this approach

We can ignore the non-byte formats as a wart for this; they're cut out
of this area of the subsystem functionality and just get single register
write operatons with single register cache access.

> we end up formatting the value into the raw format, only to parse it again
> in the next step.

Yes, like I say there's room for optimisation.  For 8 bit values there
would be win from working out that we don't need to do anything at all,=20
though I doubt it's ever going to be performance critical.

> Furthermore I don't think it makes sense to cache raw values as the cache
> operates on a register level, not on a byte level.

The entire API operates on registers really.  The only reason
raw_write() takes a length is because it's what most of the users are
actually likely to have to hand, trying to write to less than a register
isn't particularly sensible.

--jTMWTj4UTAEmbWeb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPNT6hAAoJEBus8iNuMP3dwzAP/jjYUfmdwK6t8vT5IFM/44R1
A31gkR/fSIT2ShQxrQ2RyuIVPuGGAJIDMIA+R/syvzdwramZolImhmtH2969pZiv
1UuCRsptaOqiR+y45kGp1WzNadZ4uhkPnA10vr3L/GSuEnhr2YJ/h8KsV075dKCr
8W/UWB8+fwQ+5+qWATiHtao4/ikDtWuoLdgLzUvCH4LVGaQnUuxaOJaBIo7vRTq8
ay5JEZqXOtxCUkeIN+JA3+28R0jIl89hvkrmO4bDPFLhirowMKjJ6UY6pqPAANDQ
9K4ThyWuG7JL64gbt/lSX67hXKI+6cABcxkeP9bU7uQ5BVs2TWz7uzQdxORWTibh
kYj4Pzwgehpmw96jmp7GM6iLiDYe1UHgQTzPwmLdmgkvSfnPuMPw5i1IwjxtKMV6
TWwtf9wD3+0jxEWPV+QITzgq/WFZE8TfN2uwlRsBrhEKvLh1fhnyWl35TVKqGVuU
8PG6G4zRuRAQXsy4MeYUbkgP8dS1QUrMdzUfO4EmbUCx4FkIkPAMjZzTHArna382
YMsVHfhK2ytLYFH6TSTVSTV5jjmAvVGnNbyomYaW8kJ4mL7YHkiyfVqJ0I52Bwh2
GCY4f+Z1liir3w6NkXevjeYhGYDSCjO1O2TUaxEWCbIUOFGbWSWLOYRDCkkzgOOH
wQuIfakNRb0vu5bjUhi0
=g/X5
-----END PGP SIGNATURE-----

--jTMWTj4UTAEmbWeb--
