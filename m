From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/9] of/irq: Introduce of_irq_get()
Date: Mon, 23 Sep 2013 22:49:28 +0200
Message-ID: <20130923204928.GC5216@ulmo>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com>
 <1379320326-13241-5-git-send-email-treding@nvidia.com>
 <5237771F.1060908@gmail.com>
 <20130917132834.GC6757@ulmo>
 <CACRpkdYQxD_GAeym7D=npBfrmn88MRYOFh9i2V0xeByiEiWKGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYQxD_GAeym7D=npBfrmn88MRYOFh9i2V0xeByiEiWKGQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2013 at 09:18:52PM +0200, Linus Walleij wrote:
> On Tue, Sep 17, 2013 at 3:28 PM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Mon, Sep 16, 2013 at 04:24:47PM -0500, Rob Herring wrote:
>=20
> >> *_get typically also implies some reference counting which I don't
> >> believe this does. I don't think having 2 functions with completely
> >> different names doing the same thing with only a different calling
> >> convention is good either. So I would keep the old name and the names
> >> aligned.
> >
> > Okay, I'll make the new function __irq_of_parse_and_map().
>=20
> I don't know why i detest __prefixing so much but I think it's
> really nasty.
>=20
> Usually this is reserved for compiler- and linker related things,
> like __packed;  or __init.
>=20
> I would prefer irq_of_parse_and_map_strict() or something
> like that.

Following from the discussion on one of the other patches, perhaps this
could also be converted to return int (instead of unsigned int), convert
all callers to cope with negative or 0 (instead of only 0) as errors and
then modify it to actually start returning negative error codes once all
users have been updated. Eventually I think we should get rid of using 0
as an error indicator altogether, but as I already mentioned it might be
difficult to do because new users can always come along and use the then
deprecated 0 return on error.

I'm somewhat worried about the amount of work that this is turning into.

Thierry

--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSQKlYAAoJEN0jrNd/PrOhfigP/A9vkmaGmnFbDaEUHcQeQMgD
bYPSjvnwttsW3G077yqa1V7L80idYd0rzB/1TuG2mD3pREv28DKQFzHmQpY7wdSY
EiHorEkSLxZI1o0hkRnJLfFLDP4XUFT3qY7OyDU6o/c5TkPep1+CinDpSWSF0kpD
+pqMCbvJHDGtbxvQpxhB3RXWsH1u1ljHARSjg9mog0d44D0LAzcOp9v0ssGsHAMZ
q9or1XBRe5FplDA/kW5X2Gax1j44DVIYshENgNbW1g/r3KA1974bUBokSYT2qXOx
wFAFiAeQ4pJbt3CnKFUuYwmrBmdRyZ67KSD5XncaXloQdpOsT+g7E9JY4cCB19h4
CWHIuQj7FIrdgccXeUURF35wsSd62gZ0dYVJ+5DvjJMcuDxGmePKnjaEuVWi97U1
HdfBOwEoK79vwtQ5wJDnKmRlrdF7HP/8D6348zvkwlf8K2EQl1tiLvqGfxCUHn+Z
cIE3NAmWIGIa9WPZSRPSIKghJNOO0xKd85SnjdWAkJhrC39kkzU/m6/Q7WZ1uVb8
j1Og8wA7Drv0Z2P2LhG15ArIfVGuwkxXD2QdV13zJ74oEomeBfKo5rAeCWqJZELr
JnkynFIRH9WGn4Zw3oDsLQcaBbaB76tnhxdQ4MAjQ54tHSAU/vCxbt6C0Aoule/L
+Pw6sRgcgozufQxOoy4X
=GVED
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--
