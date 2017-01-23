From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: paz00: fix __initdata placement
Date: Mon, 23 Jan 2017 17:24:28 +0100
Message-ID: <20170123162428.GB2043@ulmo.ba.sec>
References: <20170123074347.GA29804@dtor-ws>
 <4072003.S1IBmddlP7@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4072003.S1IBmddlP7@fb07-iapwap2>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2017 at 11:04:22AM +0100, Marc Dietrich wrote:
> Hello Dmitry,
>=20
> Am Sonntag, 22. Januar 2017, 23:43:47 CET schrieb Dmitry Torokhov:
> > To have expected effect the __initdata attribute should go after variab=
le
> > name and before initializer.`
> >=20
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  arch/arm/mach-tegra/board-paz00.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/mach-tegra/board-paz00.c
> > b/arch/arm/mach-tegra/board-paz00.c index 7478f6fb3664..ea6bff404161 10=
0644
> > --- a/arch/arm/mach-tegra/board-paz00.c
> > +++ b/arch/arm/mach-tegra/board-paz00.c
> > @@ -23,7 +23,7 @@
> >=20
> >  #include "board.h"
> >=20
> > -static struct property_entry __initdata wifi_rfkill_prop[] =3D {
> > +static struct property_entry wifi_rfkill_prop[] __initdata =3D {
> >  	PROPERTY_ENTRY_STRING("name", "wifi_rfkill"),
> >  	PROPERTY_ENTRY_STRING("type", "wlan"),
> >  	{ },
>=20
> you are right according to the documentation, but objdump -s always shows=
 that=20
> it gets put into the .rodata section. So this patch has no effect, becaus=
e=20
> result is always same (and wrong). It's also possible that I'm doing some=
thing=20
> wrong :-) Btw, there are hundreds of such __initdata misplacement in the=
=20
> kernel.

Hmm... I get this:

	$ objdump -t build/tegra20/arch/arm/mach-tegra/board-paz00.o

	build/tegra20/arch/arm/mach-tegra/board-paz00.o:     file format
	elf32-little

	SYMBOL TABLE:
	00000000 l    df *ABS*  00000000 board-paz00.c
	00000000 l    d  .text  00000000 .text
	00000000 l    d  .data  00000000 .data
	00000000 l    d  .bss   00000000 .bss
	00000000 l    d  .init.text     00000000 .init.text
	00000000 l       .init.text     00000000 $a
	00000000 l       .data  00000000 .LANCHOR1
	00000000 l       .init.data     00000000 .LANCHOR0
	00000000 l    d  .ARM.extab.init.text   00000000 .ARM.extab.init.text
	00000000 l    d  .ARM.exidx.init.text   00000000 .ARM.exidx.init.text
	00000000 l       .ARM.exidx.init.text   00000000 $d
	00000000 l       .data  00000000 $d
	00000000 l     O .data  000001c8 wifi_rfkill_device
	000001c8 l     O .data  00000048 wifi_gpio_lookup
	00000000 l    d  .rodata.str1.4 00000000 .rodata.str1.4
	00000000 l       .rodata.str1.4 00000000 $d
	00000000 l    d  .init.data     00000000 .init.data
	00000000 l       .init.data     00000000 $d
	00000000 l     O .init.data     00000048 wifi_rfkill_prop
	00000000 l    d  .debug_frame   00000000 .debug_frame
	00000010 l       .debug_frame   00000000 $d
	00000000 l    d  .debug_info    00000000 .debug_info
	00000000 l    d  .debug_abbrev  00000000 .debug_abbrev
	00000000 l    d  .debug_aranges 00000000 .debug_aranges
	00000000 l    d  .debug_ranges  00000000 .debug_ranges
	00000000 l    d  .debug_line    00000000 .debug_line
	00000000 l    d  .debug_str     00000000 .debug_str
	00000000 l    d  .note.GNU-stack        00000000 .note.GNU-stack
	00000000 l    d  .comment       00000000 .comment
	00000000 l    d  .ARM.attributes        00000000 .ARM.attributes
	00000000 g     F .init.text     00000030 tegra_paz00_wifikill_init
	00000000         *UND*  00000000 platform_device_add_properties
	00000000         *UND*  00000000 gpiod_add_lookup_table
	00000000         *UND*  00000000 platform_device_register
	00000000         *UND*  00000000 __aeabi_unwind_cpp_pr0

So it correctly ends up in .init.data for me. And it does so with or
without the patch. GCCs documentation doesn't seem to say where exactly
these attributes need to be put, though the examples given all have the
attribute right before the =3D.

Oh... interestingly checkpatch does seem to have a check for this now,
and it does recommend that __initdata be placed after wifi_rfkill_prop,
so I'm going to apply this.

Thierry

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliGLjoACgkQ3SOs138+
s6EGkxAAtauUln/bOnAtWXBUcwGLB5NbJpDUFXYIgIhmubrmhjnRNKXs7g3UBFYS
BIyD61XIzrkoZ9U51y+6E+Rc7b+6qxojzWbVzcKtBqulNhQZo2lzCmZ0SMI95JSV
IJX/mXVLBEnN4hxnz2C12c6FVfjqfx9ELGR7iIElW5HUy2Dj0hJNIlK+GdLZ0+o6
aA3MmbL/sSpGBk5ifkI+5N9PP7nRmqDif3NmETdcbuPuguF8mkMzSTBMWK10s/wS
lIfXej1X3jp1KkhYuZr1l9NBVUqHC8ifeFjhIM22VNBv8b06beftwlOh54DKbf6l
FRf0+NP0Fct1Uz4fmon2OQYqr/38bQNV26XahDGePLjNQqAa/gwB6BGYyQQJU+bV
EfYt1OQ7YQibkICXraJUR15zGm8Xi/SVVq6P/ltvWKkQH0l1MXA3Nr9FSBTsA9oL
RK9czxQC+lYPr+9fXBTo07PDzG6OEmtt8yO2l4FHAb5m02HC8rd4i4IFjeeab3FP
LA9kG3uiv7hyVcr1fetJM6f8760PMvj/QxB+ZdtM3E8ys2AutCSY1OMG8hNgDt8f
kvh/aNrO6HcXGVgj+DGW0qzHAPSIz6Avi2W3t9v0IFq/z/W4mzKlgVQzXS21ey5J
CsQWdRDnFONobOUgJQs01NDTaAOeF5VLNO8/3QGJDMB9WH/MIPo=
=R7P1
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
