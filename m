From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/7] clocksource: Add Tegra186 timers support
Date: Tue, 31 Mar 2020 21:58:39 +0200
Message-ID: <20200331195839.GA2950334@ulmo>
References: <20200320133452.3705040-1-thierry.reding@gmail.com>
 <20200320133452.3705040-3-thierry.reding@gmail.com>
 <48b2099c-dd83-d4dc-aab4-8c6f68a215cf@gmail.com>
 <da2a0501-664a-c5d0-7b13-174e5347eaf7@gmail.com>
 <20200323134221.GI3883508@ulmo>
 <b3859b98-02a3-d197-735c-2c9a9fbe597c@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b3859b98-02a3-d197-735c-2c9a9fbe597c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2020 at 04:45:57PM +0300, Dmitry Osipenko wrote:
> 23.03.2020 16:42, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Mar 20, 2020 at 06:38:32PM +0300, Dmitry Osipenko wrote:
> >> 20.03.2020 18:11, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> 20.03.2020 16:34, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>>
> >>>> Currently this only supports a single watchdog, which uses a timer in
> >>>> the background for countdown. Eventually the timers could be used for
> >>>> various time-keeping tasks, but by default the architected timer will
> >>>> already provide that functionality.
> >>>>
> >>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>> ---
> >>>
> >>> ...
> >>>> +config TEGRA186_TIMER
> >>>> +	bool "NVIDIA Tegra186 timer driver"
> >>>
> >>> tristate?
> >>>
> >>>> +	depends on ARCH_TEGRA || COMPILE_TEST
> >>>
> >>> depends on WATCHDOG && WATCHDOG_CORE?
> >>
> >> Actually `select WATCHDOG_CORE` for the WATCHDOG_CORE.
> >=20
> > WATCHDOG_CORE is user-visible, so it's not safe to select it. Any reason
> > depends on WATCHDOG && WATCHDOG_CORE wouldn't work? I guess a dependency
> > on WATCHDOG_CORE would be enough because that itself already depends on
> > WATCHDOG.
>=20
> It looks to that should be much better if you could factor out all the
> watchdog functionality into the drivers/watchdog, like it's done in a
> case of MC / SMMU drivers for example.

For MC/SMMU this was done for historical reasons. Both drivers already
existed in the respective subdirectories, so it seemed best to keep them
there in order to avoid churn.

This being a completely new driver I don't think the same argument can
be made. There are plenty of drivers that register interfaces for
multiple subsystems (e.g. there are a couple of watchdog drivers in the
RTC and hwmon subsystems).

Daniel, Thomas, do you have any objections to merging watchdog support
via this driver, or would you have me split that off into a separate
driver. I could potentially do that using a shared regmap, but it seems
a bit of a stretch for something this simple.

Thierry

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6DoOwACgkQ3SOs138+
s6G5pg/8D1jG9NxLILYfObR9KHJBvL1p27eq0x6zFEgQ8dAgKAElH8BijZcAA3Wz
ce4T22d1hTejR1rgRUVSB874iq087zuKLDZxCyb1GxWjBFsElWdDIc1gApNDTOjK
RekWsJP5RrEwjEU5al18UsUXRPwCw5c8A+R8md4LKoowPKOYiX3UWOvFFFKLtkU2
DmT1TDbnErgiMZaiQT8Bon+kiRcoX9e15CWwP62GVIW3ZnJ57H2OyJNs8xcCfAmg
O3OGa4zfibmcWmQKgvYEoR2GYBpMn5EXTZNi3ldacRt9MByV9hacm4GQRlWcMzQa
umA3knZiTpaNFUKBCyTLJeTw7d8Qs0rkcX9cDZZQMAzN4y8EbVnLkbsTK7FudKR7
kma3ByCG9VYIf7TOqMBBBTyhqX+6bR4jSgizzCNg3PjWgcq9ZsmeM0FiEPSuRKTy
W/kFXMKInEfZaQAIOI/QiZmZy4Gwu904kCuvxaLJkOpNpc/JmOzwurfTc+1psDNZ
BhiC2D+gN9r4SKBlkf6aPjaEUuORoswEUoQ6WOClsrqB0PujhzTfNEIt0GS3oPVr
XdjYUlX0EHFJLVUtTyZm6YB6TM3J93fNqIJLgu/Zusyy9oZieL61wiQYh3Jn/5SX
63JrNxBszqDA22k3aaUaSYXMyTz+HgCyC2iP0cCPDuNQpRAYVeU=
=tG6K
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
