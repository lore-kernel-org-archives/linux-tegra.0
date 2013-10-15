From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arch_timer: Do not register arch_sys_counter twice
Date: Tue, 15 Oct 2013 17:03:15 +0200
Message-ID: <20131015150314.GA10535@ulmo.nvidia.com>
References: <1381843911-31962-1-git-send-email-treding@nvidia.com>
 <20131015142313.GC850@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131015142313.GC850-MRww78TxoiP5vMa5CHWGZ34zcgK1vI+I0E9HWUfgJXw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2013 at 03:23:14PM +0100, Will Deacon wrote:
> On Tue, Oct 15, 2013 at 02:31:51PM +0100, Thierry Reding wrote:
> > Commit 65cd4f6 (arch_timer: Move to generic sched_clock framework) added
> > code to register the arch_sys_counter in arch_timer_register() but it is
> > already registered in arch_counter_register(). This results in the timer
> > being added to the clocksource list twice, therefore causing an infinite
> > loop in the list.
> >=20
> > Remove the duplicate registration and register the scheduler clock after
> > the original registration instead.
> >=20
> > This fixes a hang during boot on Tegra114 (Cortex-A15).
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > While I've only tested this on Tegra114, I suspect the same hang during
> > boot happens for all processors that use this clock source.
> >=20
> >  drivers/clocksource/arm_arch_timer.c | 12 +++---------
> >  1 file changed, 3 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource=
/arm_arch_timer.c
> > index f655036..95fb944 100644
> > --- a/drivers/clocksource/arm_arch_timer.c
> > +++ b/drivers/clocksource/arm_arch_timer.c
> > @@ -436,6 +436,9 @@ static void __init arch_counter_register(unsigned t=
ype)
> >  	cyclecounter.mult =3D clocksource_counter.mult;
> >  	cyclecounter.shift =3D clocksource_counter.shift;
> >  	timecounter_init(&timecounter, &cyclecounter, start_count);
> > +
> > +	/* 56 bits minimum, so we assume worst case rollover */
> > +	sched_clock_register(arch_timer_read_counter, 56, arch_timer_rate);
> >  }
> > =20
> >  static void arch_timer_stop(struct clock_event_device *clk)
> > @@ -515,15 +518,6 @@ static int __init arch_timer_register(void)
> >  		goto out;
> >  	}
> > =20
> > -	clocksource_register_hz(&clocksource_counter, arch_timer_rate);
> > -	cyclecounter.mult =3D clocksource_counter.mult;
> > -	cyclecounter.shift =3D clocksource_counter.shift;
> > -	timecounter_init(&timecounter, &cyclecounter,
> > -			 arch_counter_get_cntvct());
> > -
> > -	/* 56 bits minimum, so we assume worst case rollover */
> > -	sched_clock_register(arch_timer_read_counter, 56, arch_timer_rate);
> > -
> >  	if (arch_timer_use_virtual) {
> >  		ppi =3D arch_timer_ppi[VIRT_PPI];
> >  		err =3D request_percpu_irq(ppi, arch_timer_handler_virt,
>=20
> Excuse my ignorance, but I'm failing to apply either this patch or the one
> that Stephen Boyd proposed:
>=20
>   http://lists.infradead.org/pipermail/linux-arm-kernel/2013-October/2046=
65.html

Hehe, that patch is exactly the same as this one. =3D)

> The second hunk (deletions) doesn't apply at all, and if I just apply the
> first hunk then things won't compile. Which tree is this against?

This is on top of today's linux-next[0] and will probably apply to
yesterday's linux-next too. I think that perhaps the patch or the one
that Stephen proposed himself should be squashed with the original
because that caused the breakage in the first place. From what I gather
=66rom the mailing thread you linked to above it seems like John took an
earlier patch from Stephen and rebased it on top of something more
recent and that didn't work out as expected.

Ingo, any chance you could take this patch and squash it into the patch
mentioned above? Applying it as a separate fix will break bisectability
inbetween both patches.

Thierry

[0]: git://gitorious.org/thierryreding/linux-next.git

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXVkyAAoJEN0jrNd/PrOhMNEP/3ZsFa3BBod0I0oTAfZPXMJs
NMNNMb6WtJ/OsOBOpA72iDSCMYfebJuEC8EosV/T2RjEsgiAmAl+bxWRljXP8mbR
JyxPkONj8lecdIVYrcgEJUVvmwk01dogFjSKjeMHNjJiOg0HgzL3pAJBThqjIO+3
tu68EITtv/nM4Sepo9BQTbaDy88rKxBFlMoP/yz0xtRYjqov061i2bgc9raO/i2k
CXGyagGssONazr4HVGD/RrtMsBVzW6hQUAbHNkisBK5d/GO5n9EqROItR7Xqf1zY
4QGe2S6PGtuwqc1qQ6y4DGyUX+dBE4ONvDslPbUDwMwWeZd0Xcba/wVCbNrCKZP8
anl7uG1RRXqYeRlj45kUPKjNWCqrrqj6fVO44gBz+pPiBTM9q89WtU/Vg7dPEr7f
DPWx1VdZ9IUCB+dCr1BPEOLUub59TyubpoO1Oy3bkAjG7UmtoGclM9R4M3RreqV7
sCj1doa0g1AUR46YwXfe8G5fhDVj3cwDZBhAdQoLu41xcPW6wL3bEZlYeI0VJFHQ
a/utXWgKH76sG4LHxwyybonYZD49yzHKrJb7xwH0pn5nZQkExtLTuMDXTN5U+LVp
xfwCh0TPDxNQVzQs86iYjutzA51nj+VmevM/SuxHauNjbEz7OxZuzi8sjQdxlNsA
TO+slEXbkSDQrEiQLaWy
=Ci6u
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
