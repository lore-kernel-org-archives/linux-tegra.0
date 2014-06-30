From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/4] ARM: tegra: Move SoC drivers to drivers/soc/tegra
Date: Mon, 30 Jun 2014 21:21:22 +0200
Message-ID: <20140630192121.GA32594@mithrandir>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
 <53AEF81D.3080408@ti.com>
 <20140628204025.GA16415@ulmo>
 <7497427.LQy8pJts8f@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7497427.LQy8pJts8f@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2014 at 09:20:30AM +0200, Arnd Bergmann wrote:
> On Saturday 28 June 2014 22:40:26 Thierry Reding wrote:
> > > > pmc.c implements various routines to access the power management
> > > > controller, some of which is needed by suspend/resume, some of it is
> > > > needed by SMP. powergate.c implements a subset of the PMC that need=
s to
> > > > be exported to drivers to enable power partitions on the SoC. I'm n=
ot
> > > > aware of subsystems that deal with this kind of driver.
> > > >
> > > Please see above.
> >=20
> > Like I said, I don't see what business suspend/resume related code has
> > in drivers/power. What we're talking about here really is functionality
> > very specific to Tegra. Also some of that code needs to be run at very
> > early points in the boot process, so we can't reasonably turn it into a
> > proper driver anyway.
>=20
> I believe the powergate.c stuff can be changed into pm_domain code, but
> we don't have a good subsystem with generic DT bindings yet, so that
> may need some more groundwork first. drivers/power or a subdirectory
> of that may end up being the right place though.

So I ended up implementing the powergates as generic_pm_domain, but that
breaks existing drivers currently. The reason is that generic_pm_domains
are automatically turned off on suspend and turned back on on resume. On
Tegra if a partition is powered off then the whole module looses state
and would need to be completely reinitialized. None of the drivers
currently support that and I'm also not sure if it's really what we want
since it means for example redetecting links and reenumerating devices
on PCI, or probing display outputs in DRM. That's going to take a lot of
time and may not be appropriate for suspend-to-RAM.

Unfortunately I haven't found a way to force a domain to remain powered
during suspend/resume.

Thierry

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTsbiwAAoJEN0jrNd/PrOhLaEP/RXi3CzOqiM5BvPNenHvL+M/
RtWjuyUGCpwhTKLSr0KEVLI2R/pDxQCFJfn6amnsyOycsnay91TjhKGkn2wamPaT
TbGBWMVEiryTg6M1xevrCCC7eTeNfsXr0D5jK8YajGsYrz+9Nzq0FEmIzSWXnVB6
U3GXZuJBAIbtpT3ZWbMpyPCYV7Egog718Kjehv5Tt2MPtS/td7bBuHGM6OuOdI48
lz6jMsbEsS5j+X/NBeZdnTJRF7/Y2Nbc2sMhIJoziKFUG5Arujp7belX895QtNln
1sMX+qssOlUYNmQ2DQeNBx/lP1Qe+5lFd0HL3Z3TGCSOWhdemaVM3f8wKA7zF4AY
/L573kVw7RrwHOV0SX7sCdaqg+LJXDV4JhEfu6b4c7E4oBqCzEE/r2eUwWqoWX9s
Vt9Al3OWlF40xBTrUG5bfBsDuV7ODEQ42JUTxhuUUCClMCdOdGO2VN57hCIVPJro
nyiJAl+jtcDflWj+atOyaqy4SnFzBbomtvn048YUojPMhGocgFMcerMKMAGk63bf
WZqUA9njzm9VJOAHzzhE4ZLyB+uS34Jt9cm9FkP1dAhyp0fh1pAx46OyQgD6vfnI
NcXxweFsb1Espgao3nnDLVb2C+sa5YA+Pyj32V8mR8GKZ4eZyx/Gxbyg0HmhhSWy
Zkeh3mCkMn6xURHFYTQD
=fiOx
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
