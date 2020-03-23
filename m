From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/7] clocksource: Add Tegra186 timers support
Date: Mon, 23 Mar 2020 14:38:35 +0100
Message-ID: <20200323133835.GH3883508@ulmo>
References: <20200320133452.3705040-1-thierry.reding@gmail.com>
 <20200320133452.3705040-3-thierry.reding@gmail.com>
 <df532fef-1533-9da7-d676-f4671746fde3@gmail.com>
 <20200320150406.GA3706404@ulmo>
 <5a559950-0497-b24f-6484-c2513375fe62@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3ecMC0kzqsE2ddMN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5a559950-0497-b24f-6484-c2513375fe62@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--3ecMC0kzqsE2ddMN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2020 at 06:23:35PM +0300, Dmitry Osipenko wrote:
> 20.03.2020 18:04, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Mar 20, 2020 at 05:39:01PM +0300, Dmitry Osipenko wrote:
> >> 20.03.2020 16:34, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> Currently this only supports a single watchdog, which uses a timer in
> >>> the background for countdown. Eventually the timers could be used for
> >>> various time-keeping tasks, but by default the architected timer will
> >>> already provide that functionality.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>  drivers/clocksource/Kconfig          |   8 +
> >>>  drivers/clocksource/Makefile         |   1 +
> >>>  drivers/clocksource/timer-tegra186.c | 377 +++++++++++++++++++++++++=
++
> >>>  3 files changed, 386 insertions(+)
> >>>  create mode 100644 drivers/clocksource/timer-tegra186.c
> >> Hello Thierry,
> >>
> >> Shouldn't this driver reside in drivers/watchdog/? Like it's done in a
> >> case of the T30+ driver.
> >=20
> > The hardware block that this binds to is primarily a time-keeping block
> > that just so happens to also implement a watchdog. Moving this to
> > drivers/watchdog would put us into an odd situation if we ever added
> > code to also implement the time-keeping bits for this hardware.
> >=20
> > I also think that the way this is done on Tegra30 was a bad choice. The
> > problem is that we now have two drivers (tegra_wdt.c and tegra-timer.c)
> > that both access the same region of memory. This seems to be relatively
> > safe to do on those chips because there's no overlap between the timer
> > and the watchdog interfaces, but on Tegra186 and later the watchdog is
> > actually using one of the timers, so we'd have to be extra careful how
> > to coordinate between the two. It seems much easier to do that by having
> > everything in the same driver and have that register multiple devices in
> > the system.
>=20
> Sounds like a watchdog on Tegra20, where one of the timer is shared with
> a watchdog function and there are no other free timers. Well, yes, it's
> not nice.
>=20
> But, will you really ever need an additional clocksource on T186?

I don't know. It's possible that they will become useful at some point.

Thierry

--3ecMC0kzqsE2ddMN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl54u9sACgkQ3SOs138+
s6HhmxAAlcQJPxMadaHu5SXzYWXICljQrwPSVzxl0B1ALvIUVRQNswXyEcmtWBQ2
jZ4hHyPoUuQoiFr5D5gfvYPigp39RNCxijn9kDL/QwzbLld270PZvpQIuosuhTrN
737BcaHkhzy+sdlqf7HQC/OWPd5qwMegVL1If2UwvoyB8ENeHngTuH9PQClVXwsf
IPeC1ewK5l0kJGnpwUNPURjCXT2vhbyG7fGWDFfkF7muqOWG8eVQLzZLfVTE47p8
Jq81lMF/u+Bwk/GVtMDQfS4SIH97wBbuSJYb/qRiD/mO3ojdaBq6N33GfeBlhs0v
zgFdQqFgh+hBQPf9S1kX7ViciQZAJDYxQ2pQw4Cq0MYxWur4g0Ke5UWWRWmWqmrp
ab0DbqmsaMopG2tlKkcuFUucET4szrP0wTS3X2wqNqYp96LBECD9bvnPvjJo1Dro
Yi9kB4GCGy+YQJSeMPnHPz7siZ+OIsMluEardSz65G37CHA/DbiZLi2v8NS4h37K
+qeOyILxXclDn54NpV13hIdvTBfDn/iysaVSBbWfNiy02UX+4a8jDe7tdkoHp4cg
ZinamyX87pzkAOJYO1UgpbdjjGK93pClLZn5JLacJW9/QUIiag2LoeImZIM9a/hX
YFThiI6Guo9EGewLfjuKu7sYdK5GL+LUtzHrZ6W0SfLLWSu60yA=
=wIxO
-----END PGP SIGNATURE-----

--3ecMC0kzqsE2ddMN--
