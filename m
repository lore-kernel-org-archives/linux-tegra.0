From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] gpu: host1x: Ignore clients initialization failure
Date: Thu, 9 Aug 2018 12:45:41 +0200
Message-ID: <20180809104541.GC21639@ulmo>
References: <20180801150807.15926-1-digetx@gmail.com>
 <20180803105055.GC28546@ulmo>
 <4457259.6qKMIOUXSS@dimapc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4457259.6qKMIOUXSS@dimapc>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Kyle Evans <kvans32@gmail.com>, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 03, 2018 at 02:30:47PM +0300, Dmitry Osipenko wrote:
> On Friday, 3 August 2018 13:50:55 MSK Thierry Reding wrote:
> > On Wed, Aug 01, 2018 at 06:08:07PM +0300, Dmitry Osipenko wrote:
> > > From time to time new bugs are popping up, causing some host1x client=
 to
> > > fail its initialization. Currently a single clients initialization fa=
ilure
> > > causes whole host1x device registration to fail, as a result a single=
 DRM
> > > sub-device initialization failure makes whole DRM initialization to f=
ail.
> > > Let's ignore clients initialization failure, as a result display panel
> > > lights up even if some DRM clients (say GR2D or VIC) fail to initiali=
ze.
> > >=20
> > > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > > ---
> > >=20
> > >  drivers/gpu/host1x/bus.c | 18 +++++++-----------
> > >  1 file changed, 7 insertions(+), 11 deletions(-)
> >=20
> > This is actually done on purpose. I can't think of a case where we would
> > actively like to keep a half-broken DRM device operational. The errors
> > that you're talking about should only happen during development,
>=20
> [only in a perfect world]

gr2d and VIC are fairly deterministic. What are the errors you are
seeing that cause initialization failure? Note that it is possible for
these devices to malfunction even if initialization succeeds. A failure
to initialize can only happen if there's something wrong in the device
tree, firmware is missing (in case of VIC) or a regression was
introduced in some subsystem that causes a failure (maybe deferred probe
or something similar).

> > and the
> > device not showing up is a pretty good indicator that something is wrong
> > as opposed to everything booting normally and then getting some cryptic
> > error at runtime because one of the clients didn't initialize.
>=20
> If machine doesn't have a serial port and it doesn't have ssh server runn=
ing=20
> or network doesn't come up, you'll end up with a completely dysfunctional=
=20
> piece of hardware. Hence there is no chance for you to even check what is=
=20
> wrong. The argument about a cryptic error doesn't make much sense, you ha=
ve to=20
> improve your runtime as well (and you'll get a error message in the kerne=
ls=20
> log).

You make a good point here. I'm not aware of any devices we support in
the kernel that don't have a serial console, but that doesn't mean the
kernel could be used on an "unsupported" device  that doesn't have one.

> > From my perspective, all clients should always be operational in
> > whatever baseline version you use. If it isn't that's a bug that should
> > be fixed. Ideally those bugs should get fixed before making it into a
> > baseline version (mainline, linux-next, ...), so that this never impacts
> > even developers, unless they break it themselves, in which case refusing
> > to register the DRM device is a pretty good incentive to fix it.
>=20
> Sounds like you're assuming that only kernel developers are supposed to u=
se=20
> Tegra, though at least (for now) for upstream it is kinda true. Of course=
 that=20
> could be changed ;-)

That's not at all what I'm saying. What I am saying is that we should
make it difficult for developers to break the kernel in a way that would
put users into a position that is difficult to get themselves out of. If
we refuse to register the complete DRM device in case some subdevice
fails to initialize we increase the chances of developers noticing and
fixing it.

If all we do on failure is output an error message, it's very likely to
go unnoticed. Developers are likely to check specifically the
functionality that they're working on and ignore failures that they may
have caused in other parts of the code as a side-effect of their current
work.

Perhaps a good middle ground would be to turn initialization failures
into WARN_ON() to increase the chances of them getting notified and then
continue on a best effort basis in the hopes of having enough
initialized to get a message to users. Another alternative would be to
mark essential subdevices (such as the display controller) so that only
they will cause failure to register the whole DRM device.

Thierry

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltsG1MACgkQ3SOs138+
s6H/fRAAoJTQvB6jRwe0QK5JL38mYcoD2oYR9XUGug1CDJQelmWkn6+BaTx/nPrc
9DU0aRsrjU+pywIvhOAw3M3Q2npIiWxMRoNqNQUX29HmeOG+o/9R6en15J0kv4N2
1aqLlekQYBrHK0kWPs53SVXmRLXIBqRprzRN+aHMvR9SI+EyEf5cnCrn61MgLAHw
QTqh85FletD1taWiTe3R6ykfIjRJTX8ga1TLRO9acftc/8JnvcYO4F6wN2ct267q
aD9ZLJPshy2cTddV3Oo0xULOFiYspOEwcAp6x5lpLuBapkdcP6XjYhIJbmSE9aau
ceOvYSteNluRfXqxhOpnwCcYNBdldBckELpnS6UfX8WBfH+Hm4uxjcbhWkW+Vjc/
se60w5HMeZ9C/riBXmzEIyKCdS3WcCQTJFphnYaUgT91BefQJ+ZOXbQj1X3MzqQQ
Nq68PmLWS4tXjPqjw4sQdRQ/ikqzUepo2rQFkAv3Fq9w6Nwh92YcUMfKtFKljzl6
1wmGS9t19WFMzDUqm5LNucv24RmDgkGCe6hq9lOJtPJ+cW2tG/JaIQE83D0EX4tA
0DYhPlFMuXeA2F+DYbirF0pQGW+zYXH4CSFnaQRziGszo8L8G2By7Z181WM/gahO
JDfKwFGtke8TzxFoYcWVOoLRSbfkusSR57XqChwr3gnZlojEaPQ=
=giF+
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
