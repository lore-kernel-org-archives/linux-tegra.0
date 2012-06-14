From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v6 00/17] Add PWM framework and device tree support
Date: Thu, 14 Jun 2012 14:53:29 +0200
Message-ID: <20120614125329.GA7678@avionic-0098.mockup.avionic-design.de>
References: <1334070400-25013-1-git-send-email-thierry.reding@avionic-design.de>
 <1BAFE6F6C881BF42822005164F1491C33EA21A9F@DBDE01.ent.ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1BAFE6F6C881BF42822005164F1491C33EA21A9F-Er742YJ7I/eIQmiDNMet8wC/G2K4zDHf@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Hebbar, Gururaja" <gururaja.hebbar-l0cyMroinI0@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kurt Van Dijck <kurt>
List-Id: linux-tegra@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 14, 2012 at 12:47:13PM +0000, Hebbar, Gururaja wrote:
> On Tue, Apr 10, 2012 at 20:36:23, Thierry Reding wrote:
> > This patch series adds very rudimentary device-tree support for PWM
> > devices. With all of these patches applied (plus one board-specific
> > patch that is not included), I'm able to control the backlight on the
> > device I'm working on using the sysfs interface provided by the pwm-bl
> > driver and the backlight class.
> >=20
> > This series is based on Sascha Hauer's series of patches[0] to add a
> > generic PWM framework. The first patch in this series is taken from
> > Sascha's branch, while the second patch enables each PWM chip to provide
> > multiple PWM devices (the Blackfin and PXA drivers have been ported to
> > the framework for reference). Currently a global namespace is still
> > provided to keep backwards-compatibility with the legacy PWM API. In
> > order to achieve this, the number of global PWM devices is limited to
> > 1024. However, patch 2 introduces per-chip indexing of PWM devices in
> > the core and patch 4 adds an API to request a PWM device using a lookup
> > table registered by board setup code. They are supposed to eventually
> > replace pwm_request() and allow to get rid of the global namespace. The
> > device tree support code does not use the global namespace.
> >=20
> ..snip..
> ..snip..
>=20
> >=20
> > The whole series is based on the linux-next tree from 20120405. I think
> > I've addressed all of the concerns raised in the first five versions. I
> > have also pushed this version of the series to the PWM subsystem
> > repository[1].
> >=20
> > Thierry
> >=20
> > [0]: http://git.pengutronix.de/?p=3Dimx/linux-2.6.git;a=3Dshortlog;h=3D=
refs/heads/pwmlib
> > [1]: http://gitorious.org/linux-pwm/linux-pwm/trees/pwm-v6
> >=20
> > Sascha Hauer (4):
> >   pwm: Add PWM framework support
> >   ARM i.MX: Move i.MX pwm driver to pwm framework
> >   ARM Samsung: Move s3c pwm driver to pwm framework
> >   ARM vt8500: Move vt8500 pwm driver to pwm framework
> >=20
> > Shawn Guo (1):
> >   pwm: add pwm-mxs support
> >=20
> > Simon Que (1):
> >   ARM: tegra: Fix PWM clock programming
> >=20
> > Thierry Reding (11):
> >   pwm: Allow chips to support multiple PWMs
> >   pwm: Add debugfs interface
> >   pwm: Add table-based lookup for static mappings
> >   pwm: Add device tree support
> >   ARM: tegra: Provide clock for only one PWM controller
> >   pwm: Add NVIDIA Tegra SoC support
> >   pwm: tegra: Add device tree support
> >   pwm: Move Blackfin PWM driver to PWM framework
> >   pwm: Move PXA PWM driver to PWM framework
> >   pwm-backlight: Add rudimentary device tree support
> >   pwm: Take over maintainership of the PWM subsystem
> >=20
>=20
> I am planning to add PWM support in Linux for TI AM335x SOC.=20
> I am taking your new PWM framework as reference.
>=20
> I see a lot of ack's for the patches. I see that you are maintaining thes=
e patches in a separate repo.
> However, I couldn't find any of these=20
> patches in the mainline kernel (including recent 3.5-rc2).=20
> Do you have any plans for pushing this again to mainline kernel.=20

Yes, as a matter of fact I'm in the process of getting the series ready for
inclusion into linux-next. I expect them to go into 3.6.

Thierry

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/Z3skACgkQZ+BJyKLjJp/7YACgoc6oW+Nz/HnFwgMUlrVyL+34
DCcAn0FN91MkK+s53sgxSbuZxr+AHacP
=qQCE
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
