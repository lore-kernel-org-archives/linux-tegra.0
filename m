From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] reset: Don't WARN if trying to get a used reset control
Date: Mon, 28 Jan 2019 15:58:36 +0100
Message-ID: <20190128145836.GA31317@ulmo>
References: <20190125101554.5947-1-thierry.reding@gmail.com>
 <1548674808.6421.3.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548674808.6421.3.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2019 at 12:26:48PM +0100, Philipp Zabel wrote:
> Hi Thierry,
>=20
> On Fri, 2019-01-25 at 11:15 +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > When requesting a reset control for exclusive use that's already in use,
> > an -EBUSY error code is returned. Users can react accordingly when they
> > receive that error code, so there is no need to loudly complain.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/reset/core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> > index 9582efb70025..6b452f010b66 100644
> > --- a/drivers/reset/core.c
> > +++ b/drivers/reset/core.c
> > @@ -416,7 +416,7 @@ static struct reset_control *__reset_control_get_in=
ternal(
> > =20
> >  	list_for_each_entry(rstc, &rcdev->reset_control_head, list) {
> >  		if (rstc->id =3D=3D index) {
> > -			if (WARN_ON(!rstc->shared || !shared))
> > +			if (!rstc->shared || !shared)
> >  				return ERR_PTR(-EBUSY);
> > =20
> >  			kref_get(&rstc->refcnt);
>=20
> Are you actually running into this somewhere?

Yeah. I'm running into this on Tegra. Let me give you a brief overview
of how the resets work for better understanding. Most of the modules on
Tegra have dedicated resets, some may have multiple ones to reset a
subset of the hardware within a functional block. Typically the drivers
for these hardware modules will control the reset explicitly, usually to
make sure the hardware is in a known state at probe time. Some drivers
also do this as part of runtime suspend/resume.

Unfortunately we ran into issues when shared resets were introduced
because we also have generic power domains implemented on most platforms
and part of the programming sequence for power domains is to make sure a
hardware module that is part of the domain has its reset asserted. So on
one hand we need the reset for explicit control in the driver and on the
other hand we need the reset control in the power domain driver to make
sure the sequence requirements can be met.

This causes issues on chips such as Tegra210, where for example we need
to reset the SOR (which is an output used to driver HDMI) before setting
a mode to make sure we are in a proper state (the bootloader can have
initialized the SOR) to make sure the rather complicated sequence for
getting up the SOR can be completed.

The power domain for the SOR needs to control the reset for the SOR for
power sequencing reasons and at the same time, the SOR driver needs to
control the reset to get it into a proper state. In the past we were
able to make this work by requesting the reset control in the SOR driver
only if no power domain was attached to the SOR. This would avoid the
shared usage between power domain and SOR driver. We obviously can't
share the reset control because it wouldn't allow us to reset at the
right time.

On Tegra210 this works fine because the SOR power domain will be powered
off sometime during boot and in the process reset the SOR. This is
because all devices that are part of the domain are runtime power
managed and have a zero runtime PM refcount after ->probe(), so the PM
domain will be allowed to be turned off at that point. This is likely
only by accident, and break as well if the driver probe order changes
for some reason.

The problem is more accute on Tegra186 where the SOR is in a much larger
power domain that includes a bunch of other modules. Unfortunately, one
side-effect of that is that the power domain will not be turned off
during boot. I saw this happen when I added support for HDA support. The
HDA module is also part of the same power domain as SOR and HDA keeps a
runtime PM reference all the time. This is because it isn't runtime PM
managed at this point, but even if it was, there are so many modules in
the power domain that we can't guarantee that the power domain will at
some point be powered off and the SOR reset at the time.

Fortunately the power domains on Tegra186 (and later) are no longer
controlled by a Linux driver. Instead, there's now a firmware running on
a microcontroller (called boot and power management processor, or BPMP)
that Linux communicates with over an IPC mechanism. BPMP will internally
control the resets as appropriate, which means that we can exclusively
reset them again from Linux and explicitly reset the SOR when needed.

In order to support both Tegra210 and Tegra186 in the same driver, we no
longer just check whether a power domain was attached to the SOR, but we
just want to get the reset control and if we get -EBUSY we assume that
we run on Tegra210 and earlier and don't have to use the reset (since
the power domain will be able to reset the SOR). For later chips we get
access to the reset control because Linux doesn't know that BPMP also
has access to it.

So much for the "brief" overview... =3D)

Now, after writing the above, I'm not sure if this is really the best
approach. Technically we could run into the same problem on Tegra210
where we can't explicitly control the reset because Linux already has
it marked as exclusively used by the power domain provider.

But then, I don't know if there's an alternative to just crossing our
fingers and hoping that things will continue to work "by accident". For
some devices it may not matter because they are less picky about their
current state when you start programming them, but the SOR is very
sensitive and I've never been able to make it work properly without
involving the help of the reset at some point.

One alternative that could work for Tegra would be to somehow mark the
resets as being safe to use multiple times. In our use-cases we always
know that it is safe to reset the SOR because the power domains will be
on at the time that we want to control it, so there won't be any
conflicts. However, I suspect that that could set a precedent for other
drivers.

> My reason for adding these warnings was that these point to either a DT
> misconfiguration=C2=A0or a driver bug, and the verbose warning helps to
> quickly identify the actual issue. This is not an error condition that
> I would expect on a correctly configured system.

I generally agree with this approach, but given the above, I'm out of
ideas of how to properly achieve what we need on Tegra. Even this patch
seems like a bad idea in retrospect because we may very well run into a
similar issue on Tegra210 where we can't hide the fact that we're using
the reset from two places at the same time. I mean we could probably do
a really ugly hack and access the reset controller registers directly
=66rom the power domain provider, but that's really not something I want
to do. We already have to do something similar to work around a hardware
bug on Tegra210, but that's about as much as I can endure.

> I don't expect most drivers give a proper error message that contains
> the -EBUSY return value. Usually it's just along the lines of "failed to
> get reset control" without any further indication.

I understand your reluctance. And I'm certainly open to any new ideas
that I haven't tried yet. I haven't tried reintroducing some sort of
non-shared resets, but I've never seriously considered it because it
effectively undoes most of the shared reset stuff. If you think that
some form of this would be acceptable, I will be happy to come up with a
proposal. Or perhaps there's a really simple solution to this problem
and I simply can't see the wood for the trees anymore.

Thierry

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxPGJgACgkQ3SOs138+
s6G4cRAApGDC/mcOlHoAlKGIcJ3rXxZMKIIxrbOftR5z5JKfFsPuBSvrAap5hiC1
AEkTaYPH2gl5O3NfGF2Qk1LHWlVds0e5rfhvF4AjBWQ4Qec6+9hFNKAluoQf6Wy+
QwNpXrIQT7LYHO4SM7/KCCJOlXFH1Pus5FLEML5wJ2EqTnqLJiazr+HsHX3ha3zA
I6A4JXH5qx8JjQI0gVDrnFPIygoYbPFDhlnH929R6wTfn5E1iKnzFwOME3ByKODl
8kUHagsYI3SdWZ8QhnlxosK06wyZx4hQDljcO9bwIFPp5A6sFAwrpfTDRS1Ukua1
yshhK8ZfvfUHamuj3CGlo97xgMM+BKk73ZE/fICLZnsa19536S75xGZFfYN7QU9E
/yACyhX4oMBPOPRD/AVY/aMwXNeRcjFfn4bFpej33rfvIKwEWZg7JpHGZ2HEzlDJ
VTTDU041DqFUbH8DSCZq9mjL7e71iCmLQRTdgj4h7sjaNEQGGuo2SidOmxh64JNa
qVEDxh2antOGHniu93iRWoS/v2LjtJWLSymF6ZKXl07M+/3+LFb5B1MdRW2/G7TB
0lUs8HJ0z/BIRfNXOj0mI3x+0Qkt9c99VSaDMpFPlON21Gtv+cy7PKjIEUf3ynVk
7n0b87shc4AbpNm7RUwkaTPQrmyxTr+I15vROV3zMQfQjjzk94I=
=XJ19
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
