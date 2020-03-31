From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/7] clocksource: Add Tegra186 timers support
Date: Tue, 31 Mar 2020 22:04:17 +0200
Message-ID: <20200331200417.GB2950334@ulmo>
References: <20200320133452.3705040-1-thierry.reding@gmail.com>
 <20200320133452.3705040-3-thierry.reding@gmail.com>
 <df532fef-1533-9da7-d676-f4671746fde3@gmail.com>
 <20200320150406.GA3706404@ulmo>
 <5a559950-0497-b24f-6484-c2513375fe62@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5a559950-0497-b24f-6484-c2513375fe62-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2020 at 06:23:35PM +0300, Dmitry Osipenko wrote:
> 20.03.2020 18:04, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Mar 20, 2020 at 05:39:01PM +0300, Dmitry Osipenko wrote:
> >> 20.03.2020 16:34, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>
> >>> Currently this only supports a single watchdog, which uses a timer in
> >>> the background for countdown. Eventually the timers could be used for
> >>> various time-keeping tasks, but by default the architected timer will
> >>> already provide that functionality.
> >>>
> >>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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

Actually there are a couple of interesting clocksources that this IP
block exposes. It contains both a microsecond clock that might come in
useful because it is used as a reference by some other blocks that work
with microsecond counters (some hardware sequencers have this). Another
one is the OSC, which is the system's main oscillator that most clocks
are derived from.

Perhaps the most useful source from a software point of view is the TSC.
It's a timestamp counter that can also be used as a reference for HW
timestamping of certain system events, which is something that we want
to upstream eventually. Having the TSC exposed as a clocksource can be
interesting because it allows us to correlate these hardware timestamps
with code path execution.

I've implemented the three clocksources above for v2, which makes this a
bit more of an actual clocksource driver that additionally provides a
watchdog.

Thierry

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6DokAACgkQ3SOs138+
s6FMIxAAoCYsWe+IY3ytIC/02QyzX5KnRb+IX1AY0MHh2kyj81Hob63jYaQ0HrtP
ymISbPdFdAX4y3eLAQlMnwJVHXuunQYFR2DbRcPwPKGPyZV+pqZvq4w48SZOZj1f
VermH6f4blRHRU1ZCFFJ+TK9DT68/pDwJIZ0jyraH+/25Agks8cvdvsARi68CASv
V5PYYFO26EgxEXRUJXJYUtRgBTvvOFyaFjb9VitzI0kyO9F9CFKUkAcH6rdaWxXX
3xabjHFoQ3Rzt2O3ySW8vdGgPU0Aermhi37yW3Wk8hsHWoLyReewyjPOe5vXt1cA
l488PX9IqRxWuX2IGu/8JQJZKBdy2P3N0Y/PubdYa3fHYtGmnKtLbTL1cxVgJOg7
SVJaJF0HPvBznlagVc3SOo6qSla7VBEmjocUiS661edkcMOuh9HzlzQNYiRNfsep
eITV/txmuwv4uaCq0BIDPtmUlMFbskSSPXOhM1k+Qac/36Ut8WzCPVwmdcgnDv/1
V2KdWemZx87cDNl6f2ZiVSZMxaQDPj3qef/Gx6xCvoFri1SkJ57TUBVXSqCgdONw
rbIHVc5Vwper63O4N+vDngUVhaTsoxhBnxmvzp06K8EG5QcB6SE1Qih3L5YFzyRo
V4LJgEpG/mweeOUe2HH0QvPZZR59508vU+xklRXRvicTDGk7Q40=
=mTk7
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
