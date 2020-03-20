From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/7] clocksource: Add Tegra186 timers support
Date: Fri, 20 Mar 2020 16:04:06 +0100
Message-ID: <20200320150406.GA3706404@ulmo>
References: <20200320133452.3705040-1-thierry.reding@gmail.com>
 <20200320133452.3705040-3-thierry.reding@gmail.com>
 <df532fef-1533-9da7-d676-f4671746fde3@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <df532fef-1533-9da7-d676-f4671746fde3@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2020 at 05:39:01PM +0300, Dmitry Osipenko wrote:
> 20.03.2020 16:34, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Currently this only supports a single watchdog, which uses a timer in
> > the background for countdown. Eventually the timers could be used for
> > various time-keeping tasks, but by default the architected timer will
> > already provide that functionality.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/clocksource/Kconfig          |   8 +
> >  drivers/clocksource/Makefile         |   1 +
> >  drivers/clocksource/timer-tegra186.c | 377 +++++++++++++++++++++++++++
> >  3 files changed, 386 insertions(+)
> >  create mode 100644 drivers/clocksource/timer-tegra186.c
> Hello Thierry,
>=20
> Shouldn't this driver reside in drivers/watchdog/? Like it's done in a
> case of the T30+ driver.

The hardware block that this binds to is primarily a time-keeping block
that just so happens to also implement a watchdog. Moving this to
drivers/watchdog would put us into an odd situation if we ever added
code to also implement the time-keeping bits for this hardware.

I also think that the way this is done on Tegra30 was a bad choice. The
problem is that we now have two drivers (tegra_wdt.c and tegra-timer.c)
that both access the same region of memory. This seems to be relatively
safe to do on those chips because there's no overlap between the timer
and the watchdog interfaces, but on Tegra186 and later the watchdog is
actually using one of the timers, so we'd have to be extra careful how
to coordinate between the two. It seems much easier to do that by having
everything in the same driver and have that register multiple devices in
the system.

> > +static int __maybe_unused tegra186_timer_suspend(struct device *dev)
> > +{
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused tegra186_timer_resume(struct device *dev)
> > +{
> > +	return 0;
> > +}
> > +
> > +static SIMPLE_DEV_PM_OPS(tegra186_timer_pm_ops, tegra186_timer_suspend,
> > +			 tegra186_timer_resume);
>=20
> Perhaps will be better to remove these OPS for now?

Yeah, I suppose I could remove those. Although... perhaps I should just
try and make this work properly.

Thierry

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5022MACgkQ3SOs138+
s6FsBQ//Ri1u6rKgOJuYjvW33oLfxl/pb6GVz9aRl6ejeEQtO8CN8QmHsXz5kvSa
YVjGMinw5iqwSHHvSL7gs1GM13V4xCe3MkJ/N4BIkeXstty6xEM3hHPhBjLGvQEp
oRxvQ8q+pOhRBwqM7qQqOGs+wBhsP2w62zguSbZPo/uQdf7rZ+7FaTc2qUDITtgh
gZaxzE7XOoDuRy2xCahMQgcJqmQk0X27cr62Zis1tSrIudx6UxUgnv5Pey1cvpCB
a7wUSeOab+tLy4AG2ujBkQjz8O8s1pYrcRwy+XamzyqLGU+bcpAgSXqk5E13uhjG
L8LT0yfFRoIRSW1pGjAHo+LdhxF3jBHThH66yfcn7epBscwygmAwYbOZKskVrwuL
updpuGcZ29v7nWxG8dVrz/gDKbmzMSAmS5E2XBCK+eNLnYSnW6eaLf9rcYcZgMG0
HErtuhhsRtUaaALt1sDtyy9rhtUACktCK5biH+xgjVU+o84/gM6bYK7mOD6ATMgb
Z2atcIMJZK1b+K1luk60X3Yno2XSuwHKUp9HQaQhXR0ABdsKV7iMSooa8jmuLXaC
9UTrVD9owoF0uz73HSb9Ch9rPGG7Nb/uB7A2sPWmf3S3SnPfDimSelkaSH9jKzH3
CKSUHhALPD38t+kV5IzdfeIfXLbvtM+JXE5Njw2GVQfUS0m7cK8=
=f02j
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
