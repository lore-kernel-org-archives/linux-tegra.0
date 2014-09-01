From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/5] ARM: tegra: Initialize interrupt controller from
 DT
Date: Mon, 1 Sep 2014 10:47:31 +0200
Message-ID: <20140901084729.GD24430@ulmo>
References: <1409239879-12376-1-git-send-email-thierry.reding@gmail.com>
 <20140829142408.GA31264@ulmo>
 <20140829150422.GA11035@ulmo>
 <3113165.EcqFA5vr07@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BI5RvnYi6R4T2M87"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3113165.EcqFA5vr07@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--BI5RvnYi6R4T2M87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2014 at 09:53:42PM +0200, Arnd Bergmann wrote:
> On Friday 29 August 2014 17:04:28 Thierry Reding wrote:
> >         static struct irq_chip *extn;
> >=20
> >         void gic_arch_register(const struct irqchip *chip)
> >         {
> >                 if (WARN(extn !=3D NULL))
> >                         return;
> >=20
> >                 gic_chip.flags |=3D chip->flags;
> >                 extn =3D chip;
> >         }
> >=20
> > Any preferences, or other ideas? Adding Thomas and Jason, perhaps they
> > can provide more input on how to solve this.
>=20
> I think the entire gic_arch_extn method is done in a rather odd way
> and we should try to come up with a replacement.
>=20
> These are the users at the moment:
>=20
> arch/arm/mach-exynos/pm.c:      gic_arch_extn.irq_set_wake =3D exynos_irq=
_set_wake;
> arch/arm/mach-imx/gpc.c:        gic_arch_extn.irq_mask =3D imx_gpc_irq_ma=
sk;
> arch/arm/mach-imx/gpc.c:        gic_arch_extn.irq_unmask =3D imx_gpc_irq_=
unmask;
> arch/arm/mach-imx/gpc.c:        gic_arch_extn.irq_set_wake =3D imx_gpc_ir=
q_set_wake;
> arch/arm/mach-omap2/omap-wakeupgen.c:   gic_arch_extn.irq_mask =3D wakeup=
gen_mask;
> arch/arm/mach-omap2/omap-wakeupgen.c:   gic_arch_extn.irq_unmask =3D wake=
upgen_unmask;
> arch/arm/mach-omap2/omap-wakeupgen.c:   gic_arch_extn.flags =3D IRQCHIP_M=
ASK_ON_SUSPEND | IRQCHIP_SKIP_SET_W
> arch/arm/mach-shmobile/intc-sh73a0.c:   gic_arch_extn.irq_set_wake =3D sh=
73a0_set_wake;
> arch/arm/mach-shmobile/setup-r8a7779.c: gic_arch_extn.irq_set_wake =3D r8=
a7779_set_wake;
> arch/arm/mach-tegra/irq.c:      gic_arch_extn.irq_ack =3D tegra_ack;
> arch/arm/mach-tegra/irq.c:      gic_arch_extn.irq_eoi =3D tegra_eoi;
> arch/arm/mach-tegra/irq.c:      gic_arch_extn.irq_mask =3D tegra_mask;
> arch/arm/mach-tegra/irq.c:      gic_arch_extn.irq_unmask =3D tegra_unmask;
> arch/arm/mach-tegra/irq.c:      gic_arch_extn.irq_retrigger =3D tegra_ret=
rigger;
> arch/arm/mach-tegra/irq.c:      gic_arch_extn.irq_set_wake =3D tegra_set_=
wake;
> arch/arm/mach-tegra/irq.c:      gic_arch_extn.flags =3D IRQCHIP_MASK_ON_S=
USPEND;
> arch/arm/mach-ux500/cpu.c:      gic_arch_extn.flags =3D IRQCHIP_SKIP_SET_=
WAKE | IRQCHIP_MASK_ON_SUSPEND;
> arch/arm/mach-zynq/common.c:    gic_arch_extn.flags =3D IRQCHIP_SKIP_SET_=
WAKE | IRQCHIP_MASK_ON_SUSPEND;
>=20
> I have to admit I don't really understand how these work, but what
> I'd expect to work better is a way to turn the gic code into more
> of a library that can be used by specialized drivers. In that
> case you would register a driver for the tegra gic using IRQCHIP_DECLARE
> and that driver would call a variation of gic_of_init() or gic_init_bases=
()
> with the extra stuff as arguments.
>=20
> We'd have to hack around the fact that all these platforms currently
> don't list a specialized compatible string, but at least for the future
> we should be able to do this without special hacks.

Besides the issue with the missing compatible values, the hardware
blocks that provide the additional functionality are separate from the
GIC. So they would have to look up the GIC node explicitly.

I suppose that might actually be to our advantage, since these blocks
will presumably have a specialized compatible string. So perhaps one
solution would be to make the drivers for these separate IP blocks look
up the GIC device tree node and call gic_of_init_ext() with a pointer to
the IRQ chip implementation of this platform-specific glue to replace
gic_arch_extn.

Thierry

--BI5RvnYi6R4T2M87
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUBDKhAAoJEN0jrNd/PrOh7scQAJZLh4VFIGTJ2PGGAhAJSPUb
PCVaG12SOeFfAKYWi8a57ji66sLNXJnQZ1Hfu3Fo3LqnN5Gt+u3m3G0K3HNMqpJp
4ejie6L6UjJ7/llMbk1AhPbcgwecWVV7yXbLmQxdr0vbyTUYYNm0/bMXskFbIzKX
wmHkSaO6JQjdyfnuD83a5IKsG1sUiAl6zEnB9DnrL41/MV+PyF2d60DewxMMFgJb
WbD11lSEkBgx7Vr4Xj8E2eUl5NT9D0AIzGllW4a0CBxLm2nchkjzHZEU+SrFylQz
uqb+Lmb5MCp2WsTpjneLCQ5jocD4tBn7q+AfJFHEmyCS58cdyBctLHbWembA3R/L
Ott7DMEdHxYuXwf3lPs4t6HcXbGFtZuGWbY+X+M4GAAo+qxCpYQbiQLqCYbTfYB/
URkkHYDEbkGGRxmiqGsY/TnilX+UCP2ZWpG7CEnhGiQ99o9s/I7lbuY2+einHrT9
lZhsg09+QOik52a1WiUPskDz4X1YkeVFHKpxZFSwzRbXDCKeYbP6rJinJbtXpvCJ
hYAzuDID0sG60OChHr95aPorxey8LGn3lWF9fYOgX/EN32zL8V+Ko/3YDox+/qA4
4VCk0X4evdjrdSfAWhDQF66CUMYzMg+tm/Jf6s8dqEBecnnUiIPOzfdjF6iZvKIz
Y+/cf+b3LJHTJqOZ8BrB
=UFjG
-----END PGP SIGNATURE-----

--BI5RvnYi6R4T2M87--
