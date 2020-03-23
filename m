From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/7] clocksource: Add Tegra186 timers support
Date: Mon, 23 Mar 2020 14:42:21 +0100
Message-ID: <20200323134221.GI3883508@ulmo>
References: <20200320133452.3705040-1-thierry.reding@gmail.com>
 <20200320133452.3705040-3-thierry.reding@gmail.com>
 <48b2099c-dd83-d4dc-aab4-8c6f68a215cf@gmail.com>
 <da2a0501-664a-c5d0-7b13-174e5347eaf7@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BWWlCdgt6QLN7tv3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <da2a0501-664a-c5d0-7b13-174e5347eaf7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--BWWlCdgt6QLN7tv3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2020 at 06:38:32PM +0300, Dmitry Osipenko wrote:
> 20.03.2020 18:11, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 20.03.2020 16:34, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> Currently this only supports a single watchdog, which uses a timer in
> >> the background for countdown. Eventually the timers could be used for
> >> various time-keeping tasks, but by default the architected timer will
> >> already provide that functionality.
> >>
> >> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >=20
> > ...
> >> +config TEGRA186_TIMER
> >> +	bool "NVIDIA Tegra186 timer driver"
> >=20
> > tristate?
> >=20
> >> +	depends on ARCH_TEGRA || COMPILE_TEST
> >=20
> > depends on WATCHDOG && WATCHDOG_CORE?
>=20
> Actually `select WATCHDOG_CORE` for the WATCHDOG_CORE.

WATCHDOG_CORE is user-visible, so it's not safe to select it. Any reason
depends on WATCHDOG && WATCHDOG_CORE wouldn't work? I guess a dependency
on WATCHDOG_CORE would be enough because that itself already depends on
WATCHDOG.

Thierry

--BWWlCdgt6QLN7tv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl54vLwACgkQ3SOs138+
s6Hm6w/7B3Ghz0ANr2BofgzITgnu5EWzIVG8pCMCtGBR/7mX8IPwLWoO4VG/6ku2
Q23YgLA2+IGMRsLJ83Ln7T5ErjdPZ/r903q4d3DMp6EdKRdaqU45dDrbYyf7Zi/4
sU2xati6QaZxxUEOtQbg+8B+2y1lLSqo5f90dIZu8P/6Jf1oAyvgSyzvWXf77936
6595a5kOSRGfl5/X+0cZ8am6o+zr6Pf3MdZ6+znzSG4PRqGh8UrccEg7oQvmsuib
ZOk5Ka5ZZQ7I8fw6vGIAoGaBKY2wnr/SnWGQNCaqf+PW2wrtMiHLeqhrPtk92IDK
pSQvAuxHHAuO2S/gPC+BAVBkrm2MuGuMzdYg+4HRxrjsb7nKwiei7sCGx3uCirEh
JLLAfG+wV4XpwuswLW5ZWM+IwIvI2JmrUYn1lFyFwfqf5G82zh236fdhNsZI4iK0
jYrGdGLAnHg0B8BJIUC5VAWvpnibsslVMcAYMuS/q98mfbul7uRFK7teqnXsj7mw
i2nc1CLzPmaJPLNxpmCQOeNReiCmOM4jvhMY+qY0bjw8jx3RWLT1g8P4tsO5shXT
17YjuI0aJ5G5iBXcsjHEi8SVVWximHxgYCQpk5kILgwOchRn+58h7YF9b6rBVdU/
K5wOe5gXnVKaD6lyI2AjbPtWp/Dhk89nY2DnO4q+tdopRhze+S0=
=AZjC
-----END PGP SIGNATURE-----

--BWWlCdgt6QLN7tv3--
