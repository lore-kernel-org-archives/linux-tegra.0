From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] reset: Don't WARN if trying to get a used reset control
Date: Tue, 5 Feb 2019 23:13:02 +0100
Message-ID: <20190205221300.GA1372@mithrandir>
References: <20190125101554.5947-1-thierry.reding@gmail.com>
 <1548674808.6421.3.camel@pengutronix.de>
 <20190128145836.GA31317@ulmo>
 <1548849808.3939.7.camel@pengutronix.de>
 <20190201140025.GB12829@ulmo>
 <1549389941.3929.14.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1549389941.3929.14.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2019 at 07:05:41PM +0100, Philipp Zabel wrote:
> Hi Thierry,
>=20
> On Fri, 2019-02-01 at 15:00 +0100, Thierry Reding wrote:
> [...]
> > It sounds pretty good and elegant actually. Let me try to restate to see
> > if I understand correctly:
> >=20
> > So basically what you're saying is that we would be changing the
> > definition of exclusive resets to make them exclusive in terms of usage
> > rather than rejecting to acquire them multiple times, right? So we would
> > reinstate the possibility to request exclusive resets from multiple
> > sources, but add an _acquire()/_release() protocol to make sure the
> > users don't get in each other's way.
>=20
> Yes.=C2=A0Though drivers currently expect that reset_control_get_exclusive
> returns 'acquired' reset lines, so that has to stay. This method should
> continue to fail if the same reset line is already acquired somewhere
> else.
>=20
> There could be a new request=C2=A0method (for lack of a better idea,
> for example: reset_control_get_exclusive_released) to request an
> initially released reset control. That method would not fail if the same
> reset line is already requested and acquired elsewhere.
>=20
> > I had initially thought that this would have to be some other type of
> > reset (something between exclusive and shared) to avoid suprising the
> > current users of exclusive resets. However, on second thought, I don't
> > think that would be necessary. Given the WARN_ON, all users of exclusive
> > resets should at this point be truly exclusive and would therefore
> > continue to work normally.
>=20
> I agree. But there must be no changes in behaviour for drivers that keep
> requesting exclusive resets and never all _acquire()/_release().
>=20
> > One problematic case that comes to mind is how currently exclusive reset
> > controls will know that reset_control_assert() is safe to use if they
> > don't use reset_control_acquire() first.
>=20
> Drivers that never call _acquire()/_release() must continue to work as
> they are, so exclusive reset controls have to be acquired by default.

I don't think they have to. See below.

> > Perhaps this is what you meant when you said:
> >
> > > That would also mean we'd have to add a way for the power domain driv=
ers
> > > to request the reset control in the "released/don't care" state
> > > initially.
>=20
> This is a consequence of the above. I thought that if
> reset_control_get_exclusive implicitly acquires the reset, there can't
> be two controls requested for the same reset line without another
> request method that returns its reset control in a 'released' state.
> For the power domain use case this does not seem to be necessary.
>=20
> > I don't think we actually need that for power domains, because they will
> > typically be enabled over the duration of a device's driver's probe
> > anyway. So I think this would work:
>=20
> Yes, since the driver that yields its reset line to the power domain
> driver dependsa on the power domain, by definition the power domain
> probes first and thus has the opportunity to request the reset control
> first and then immediately release it so that the other driver can be
> probed.
>=20
> > 	power domains:
> >=20
> > 		power_off()
> > 		{
> > 			reset_control_acquire();
> > 			reset_control_assert();
> > 		}
> >=20
> > 		power_on()
> > 		{
> > 			reset_control_deassert();
> > 			reset_control_release();
> > 		}
> >=20
> > 	SOR:
> >=20
> > 		runtime_suspend()
> > 		{
> > 			reset_control_assert();
> > 			reset_control_release();
> > 		}
> >=20
> > 		runtime_resume()
> > 		{
> > 			reset_control_acquire();
> > 			reset_control_deassert();
> > 		}
>=20
> If the reset line is kept asserted while the power domain is turned off,
> it could indeed stay acquired by the power domain.

That's at least the way that it works on Tegra. Not sure if that is
universally applicable, though it seems logical to me from a hardware
point of view. It may not be required to keep the reset asserted while
the power domain is turned off, but I'd be surprised if there was a
requirement that it be deasserted while the power domain is off.

> > Hm... actually this means that power domains would have to request the
> > reset controls and call reset_control_acquire() during probe. That way
> > when the domain is powered on it will release the reset and free it up
> > for the SOR driver to use.
>=20
> If you can guarantee that the power domain is powered up and releases
> the reset control before the SOR driver tries to request the reset line,
> that would work.

Well, that's the part that the acquire/release protocol would enforce.
If your device shares a reset control with a power domain, this should
work fine, provided that the device driver uses the reset only between
(or during) ->runtime_resume() and ->runtime_suspend().

> > This seems right because it also happens to work from a runtime PM
> > sequencing point of view.
> >=20
> > I think the problem for single-user exclusive reset controls could be
> > solved by making use of the reference counting that's already used by
> > shared resets. We should be able to go ahead and use the reference
> > counting in general, and the acquire()/release() dance would only have
> > to be enforced when the reference count is > 1.
>=20
> I'm not sure I understand what you mean by making use of the shared
> resets' refcounting. I suppose you could check the reset_control's
> refcnt to determine whether there are other users. Or did you want to
> repurpose deassert_count?

Yes, if we make the new acquire/release protocol only apply if the
reset control's refcnt is > 1, then I think we should be able to keep
exclusive resets working exactly the same way they are now. Since the
exclusive resets are guaranteed to have refcnt =3D=3D 1 right now, there
should be no need for them to be implicitly acquired at request time.
However, when you start using them from multiple users, the acquire/
release protocol would kick in and refuse to assert/deassert before
you've acquired them.

I think we should also be able to keep the WARN_ON(), albeit maybe in
different form. We could have one if the user tries to acquire a reset
control that's already acquired. And we could also have a warning if we
assert or deassert a reset control that hasn't been acquired *and* that
has refcnt > 1. With the above I think "acquired" really needs to mean
acquired && refcnt > 1, and then the current exclusive resets should
work out of the box.

I was wondering whether maybe we needed a way to track the current owner
of a reset control, so that we could be clever about when acquire needs
to fail or succeed (e.g. acquiring twice by the same owner would be
okay), but I think that's overkill. I think this should just be treated
like a lock and drivers need to make sure they properly balance acquire
and release calls.

Thierry

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxaCmUACgkQ3SOs138+
s6GBCg//VXukYtN1FxRs4A3oh7Uej0oOEqNeHhJUGqfGw0HADazaYXzOq3dXoR5g
6VQcYv51En407X3HCearoCHl16NYHxv4OXkU+yloh4Td3ON9Slqzn2d1YG94G4ov
3MUYaZTO9zqU/WJ/QkRE3TcKaSEfEhYr46ADsXQEYOn+JN0wpPc/MWGLXHwODoZR
PLk1FyfXwi+Oo1kdiEU6aitoAxtaMD+SF/mbAB3Pg1/3NwzAVgIxVTOP8vVxifS6
RP1rSrvXPsWje1WVskJNkho7i2ak1NUyXG1guNgLEVR/e3kG/3KO/bQIvAd9sHjP
WShSuX+et3j4AqClcaJ93StQxeWRHneeZk6CpOiHyrokKYIAdSU3CfHpmn6FoyPt
2EOqtNCF0hMV9Pr1BGezYkUHuDF5EVfy0uaAS6CJeWJkQDzLVEdK8x8el3vwuAKl
5lsIcx5e5WQxZGJ0TG9eqr9DVUo7zWzuxnmx63Tyn9OkBrKiy1dEy6LRt4kFC0V1
H09j2XVMMk1UvYpD4QTVRCw4xnGr/jZQTZ689YDyupUuhtqZTBh/w0doVqHmfGAt
YEsyfmtDuAN67Bbtpn28t3HFf6CmloeXm/Lz7eGhluRInwAGuK5ifIMbWnHDtQG2
QC2bq2a/OIxG9XUNIdt4hetVnXZQv5xu0+e52kktG9pM+wUcg1w=
=xhQB
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
