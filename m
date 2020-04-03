From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/7] clocksource: Add Tegra186 timers support
Date: Fri, 3 Apr 2020 22:13:09 +0200
Message-ID: <20200403201309.GA282587@ulmo>
References: <20200331221914.2966407-1-thierry.reding@gmail.com>
 <20200331221914.2966407-3-thierry.reding@gmail.com>
 <de97ce0c-3fa3-9f13-2b0e-f4369f94e113@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <de97ce0c-3fa3-9f13-2b0e-f4369f94e113-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2020 at 07:14:33PM +0300, Dmitry Osipenko wrote:
> 01.04.2020 01:19, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +static void tmr_writel(struct tegra186_tmr *tmr, u32 value, unsigned i=
nt offset)
> > +{
> > +	writel(value, tmr->regs + offset);
>=20
> relaxed?
>=20
> > +}
> > +
> > +static void wdt_writel(struct tegra186_wdt *wdt, u32 value, unsigned i=
nt offset)
> > +{
> > +	writel(value, wdt->regs + offset);
>=20
> relaxed?
>=20
> > +}
> > +
> > +static u32 wdt_readl(struct tegra186_wdt *wdt, unsigned int offset)
> > +{
> > +	return readl(wdt->regs + offset);
>=20
> relaxed?

Done.

>=20
> > +}
>=20
> ...
> > +static irqreturn_t tegra186_timer_irq(int irq, void *data)
> > +{
> > +	struct tegra186_timer *tegra =3D data;
> > +
> > +	if (tegra->wdt) {
>=20
> Why this check is needed? Please see more below in regards to
> devm_request_irq().

We don't need it. However, I've changed all of these instances to
watchdog_active() calls instead to make sure we only ping the WDT
when we need to.

>=20
> > +		tegra186_wdt_disable(tegra->wdt);
> > +		tegra186_wdt_enable(tegra->wdt);
> > +	}
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static int tegra186_timer_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	struct tegra186_timer *tegra;
> > +	int err;
> > +
> > +	tegra =3D devm_kzalloc(dev, sizeof(*tegra), GFP_KERNEL);
> > +	if (!tegra)
> > +		return -ENOMEM;
> > +
> > +	tegra->soc =3D of_device_get_match_data(dev);
> > +	dev_set_drvdata(dev, tegra);
> > +	tegra->dev =3D dev;
> > +
> > +	tegra->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(tegra->regs))
> > +		return PTR_ERR(tegra->regs);
> > +
> > +	err =3D platform_get_irq(pdev, 0);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to get interrupt #0: %d\n", err);
>=20
> Duplicated error message isn't needed for platform_get_irq().

Dropped.

> > +		return err;
> > +	}
> > +
> > +	tegra->irq =3D err;
> > +
> > +	err =3D devm_request_irq(dev, tegra->irq, tegra186_timer_irq,
> > +			       IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
>=20
> Why IRQF_ONESHOT?
>=20
> And IRQF_TRIGGER_HIGH?.. the interrupt-level should come from the
> device-tree.

Yeah, I don't know how I came up with these. Probably copied them from
somewhere else. I've dropped both of these since they aren't needed.

> > +			       "tegra186-timer", tegra);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to request IRQ#%u: %d\n", tegra->irq, err);
> > +		return err;
> > +	}
>=20
> Interrupt should be requested at the end of tegra186_timer_probe(),
> otherwise probe order isn't correct, leading to a potential race conditio=
ns.

I don't think there's an actual issue here because the watchdog that is
initialized below is disabled by default and won't be enabled until the
userspace explicitly asks it to. Since the watchdog is the only one to
currently generate an interrupt, this should be fine.

That said, you're right and it's safer to initialize the interrupt as
late as possible, so I've moved this to the end of the function.

>=20
> > +	/* create a watchdog using a preconfigured timer */
> > +	tegra->wdt =3D tegra186_wdt_create(tegra, 0);
> > +	if (IS_ERR(tegra->wdt)) {
> > +		err =3D PTR_ERR(tegra->wdt);
> > +		dev_err(dev, "failed to create WDT: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	err =3D tegra186_timer_tsc_init(tegra);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to register TSC counter: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	err =3D tegra186_timer_osc_init(tegra);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to register OSC counter: %d\n", err);
> > +		goto unregister_tsc;
> > +	}
> > +
> > +	err =3D tegra186_timer_usec_init(tegra);
> > +	if (err < 0) {
> > +		dev_err(dev, "failed to register USEC counter: %d\n", err);
> > +		goto unregister_osc;
> > +	}
> > +
> > +	return 0;
> > +

And added an unregister_usec: label here to clean up the USEC
clocksource if we fail to request the IRQ.

> > +unregister_osc:
> > +	clocksource_unregister(&tegra->osc);
> > +unregister_tsc:
> > +	clocksource_unregister(&tegra->tsc);
>=20
> Looks like there is an opportunity for devm_clocksource_register_hz().

Yeah, I guess I could follow up with a patch to do that. I suspect that
there's no such implementation because very few drivers actually end up
unregistering their clocksources. A quick grep shows that only about
one fifth of the users unregister the clocksource.

If Daniel and Thomas think this is a good idea I can look at adding that
and converting some of the users.

> > +	return err;
> > +}
> > +
> > +static int tegra186_timer_remove(struct platform_device *pdev)
> > +{
> > +	struct tegra186_timer *tegra =3D platform_get_drvdata(pdev);
> > +
> > +	clocksource_unregister(&tegra->usec);
> > +	clocksource_unregister(&tegra->osc);
> > +	clocksource_unregister(&tegra->tsc);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused tegra186_timer_suspend(struct device *dev)
> > +{
> > +	struct tegra186_timer *tegra =3D dev_get_drvdata(dev);
> > +
> > +	if (tegra->wdt)
> > +		tegra186_wdt_disable(tegra->wdt);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused tegra186_timer_resume(struct device *dev)
> > +{
> > +	struct tegra186_timer *tegra =3D dev_get_drvdata(dev);
> > +
> > +	if (tegra->wdt)
>=20
> Could tegra->wdt ever be NULL?

No, it can't. But as above, I've used watchdog_active() here to make
sure we only enable the watchdog when we should.

Thierry

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6HmNIACgkQ3SOs138+
s6GYMxAAufE2qXxJ1UQEFKwK3GL9IcMyAbAM+cYitG7CepVBBK3aC1dMy3SoElMn
Gy4EnhtnB1DV1idPEWUOmPfW7tdBKRAyzSz4h1r07SZKjvYEKQCK3Qr4z3VTnEPl
dMEfToMQ9ThWXLsvTq/JzigDRsPOvTyHoN39XEvLBAPKhPBpM7GJGuPvnej/agDw
KUT1GVgE+UJP0c7XKnqd4yGfUze4m3NxbmSo4I6Y6ybItAx76iz3mhjYdvp4rNX1
gRR+PANpoJUXvT34/fgVFMxDUWlk9lKR/I1lUP2IMJhOG1F0Gl03L7rga4Oi7Xev
1/VrUhkXJeH5WR7PNzUZnyyzFk0ag7BrJHboEXz56v0hQF3LzlJUV/CnbAeUugh/
hyDTyQdLyH5qDYWhzdnRbQqJSgGUdHd2g5+xacVBpSlGEhk/Lx78BCHwfr51oPTk
MtwQTBea7VVCNNN8zVSL+kj1IcJlFby2RiLWlQCqLx/6wgcd6vyg7McxBmpaOLYg
Rp8UdygVsqCzmAKoh7teKdfmFew8nkyVryOJkqc+LCJLpx/arp21ezmDaDXWie+3
KC8m5ZwnQhcHFCJbXMepztalMPLP42Fx1UD1/acHYlvSJrGp7H1Y+kGf7TbGQo6c
KOKI8we2kVZSR507kewMx6CRX+8rdOKpHZFMId6uw2QEP6KJP2c=
=rLH6
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
