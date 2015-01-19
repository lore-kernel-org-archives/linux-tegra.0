From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc: tegra: Add Tegra132 SoC to the DT list of Tegra SoCs
Date: Mon, 19 Jan 2015 14:24:55 +0100
Message-ID: <20150119132453.GG7312@ulmo.nvidia.com>
References: <alpine.DEB.2.02.1501161137351.9776@utopia.booyaka.com>
 <20150116150749.GA32155@leverpostej>
 <20150116170926.GA17763@ulmo.nvidia.com>
 <20150116173005.GH32155@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eMnpOGXCMazMAbfp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150116173005.GH32155@leverpostej>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--eMnpOGXCMazMAbfp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2015 at 05:30:05PM +0000, Mark Rutland wrote:
> On Fri, Jan 16, 2015 at 05:09:28PM +0000, Thierry Reding wrote:
> > On Fri, Jan 16, 2015 at 03:07:49PM +0000, Mark Rutland wrote:
> > > Hi Paul,
> > >=20
> > > /me opens a delicious can of Lumbricus terrestris
> > >=20
> > > My comments below aren't so much about this patch alone, but more abo=
ut
> > > the entire strategy with drivers/soc and the kind of code living ther=
e.
> > >=20
> > > On Fri, Jan 16, 2015 at 11:39:13AM +0000, Paul Walmsley wrote:
> > > >=20
> > > > Add "nvidia,tegra132" as a compatible string that denotes a Tegra S=
oC.
> > > >=20
> > > > Signed-off-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
> > > > Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> > > > Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > ---
> > > >  drivers/soc/tegra/common.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >=20
> > > > diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
> > > > index a71cb74..a952986 100644
> > > > --- a/drivers/soc/tegra/common.c
> > > > +++ b/drivers/soc/tegra/common.c
> > > > @@ -15,6 +15,7 @@ static const struct of_device_id tegra_machine_ma=
tch[] =3D {
> > > >  	{ .compatible =3D "nvidia,tegra30", },
> > > >  	{ .compatible =3D "nvidia,tegra114", },
> > > >  	{ .compatible =3D "nvidia,tegra124", },
> > > > +	{ .compatible =3D "nvidia,tegra132", },
> > > >  	{ }
> > > >  };
> > >=20
> > > I'm rather worried by this.
> > >=20
> > > The only user of this table is soc_is_tegra(), which seems to guard
> > > several probe paths in drivers which are DT driven. Given that, I don=
't
> > > see why this is necessary at all, because the presence of the
> > > appropriate nodes should be sufficient to handle the early return from
> > > an initcall.
> >=20
> > We need this to preserve backward-compatibility. There are some
> > instances where any device tree nodes that could be used to guard the
> > code execution were only added after the fact. So in order to keep
> > systems with an old DTB running we need to continue running with hard
> > coded physical addresses.
>=20
> Except that you don't need them for arm64 systems, becuase we don't yet
> have that legacy for arm64...
>=20
> > > More worryingly, if soc_is_tegra() returns true but the node isn't
> > > found, the drivers decide to do things. If tegra_pmc_early_init passes
> > > soc_is_tegra() (because we happened to match "nvidia,tegra132"), but
> > > doesn't find a DTB entry for the pmc, it then pokes an assumed
> > > hard-coded physical address.
> >=20
> > And that's (currently) safe. It at least makes sure that breakage (if
> > any) is restricted to Tegra boards. There are other occurrences where
> > drivers don't even bother checking for this at all and simply use an
> > initcall to unconditionally create a platform device which then goes
> > and tries to access physical addresses on *every* board in a multi-
> > platform kernel.
>=20
> So doing the wrong thing on a subset of boards is fine because it's not
> all boards?

It's not doing anything wrong. If the string is added to the above table
then the assumption is that it supports the (very few) cases where we've
needed physical addresses. For anything sufficiently recent we already
have all the nodes in the DTB, so there's no issue.

> Imagine I make a typo in a DT for a 64-bit system, and suddnely hit
> youre legacy code. Things happen to work, because I don't botehr reading
> the splat in dmesg for whatever reason.

That's a bit of a stretch. You'd have to typo the top-level compatible
string of some future board that happens not to have this IP anymore.
Catching those types of mistakes is what we have the review process for.

If you're concerned about the splat, we could probably turn it into a
WARN() to make it abundantly clear that you've done something wrong.

> Later we do some cleanup of the existing legacy, for whatever reason,
> and we get rid of this particular path for arm64.
>=20
> Suddenly my board won't boot, and to fix that we have to reintroduce
> legacy support code only because said legacy support was enabled where
> it should never have been in the first place. Another OS trying to
> target/use these DTBs has barely any chance of success.

We've had cases in the past where it was argued that clearly broken DTBs
didn't have to be considered for ABI stability. I'd argue that whatever
kind of typo you're referring to falls into this obviously wrong
category.

> > > Assuming things because of the _lack_ of a node has been a major pain
> > > point on 32-bit as DTBs advanced and code was changed, resulting in b=
oot
> > > breaking or DTB compatibility breaking over time as old and new kerne=
ls
> > > made conflicting assumptions.
> >=20
> > So what are you saying? We can't support 64-bit ARM because we need to
> > keep backwards-compatibility with old DTBs and weren't smart enough to
> > see this through all the way three years ago?
>=20
> No. I'm saying that the workarounds we have in place for legacy DTBs
> should be constrained to those cases where legacy DTBs actually exist.
> There is no reason for that legacy to carry across to 64-bit.

That's fair. Note, though, that we're bound to make mistakes on 64-bit
too, so it's wishful thinking that we'll live without legacy on 64-bit
forever. But that's of course not to say we should start out with
supporting legacy from the beginning.

> > > I don't want to see arm64 kernels making assumptions in that manner (=
nor
> > > would I like to see it in new code for 32-bit ARM); it always leads to
> > > boot breakage, and it's completely avoidable. The only thing we can k=
now
> > > is what is described in the DTB.
> >=20
> > I guess we could always make this conditional on 32-bit ARM. Or we could
> > decide that we don't care about DTB backwards-compatibility anymore. In
> > fact we're quite likely going to break it soon anyway because of Marc's
> > gic_arch_extn rework, so might as well start with a clean plate after
> > that...
>=20
> At the very least I think the soc_is_tegra stuff needs to be constrained
> to fallback paths that can only possibly run on 32-bit.

I think that's something we can do.

Thierry

--eMnpOGXCMazMAbfp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUvQWlAAoJEN0jrNd/PrOhccYP/iAqJvAl7BCPs02uDihLe8lW
MU0c18x1T1UaBOgcw2guoie0t7OV/ITUfobuMy51hL20FnqoMwG/FZk4Kxx0ndOz
Fc6d8PS2DQ9yjOjJHk8fCDWsdIvVymo81gqQY48dvtUPTlYVkaJbPcn6uS3fqu7M
kVOyfIA3rPX6co14JFxnyTF3sTMtrJzSEK+OjOCw6Blv1lTkZcaR3EpQiAJTW4CQ
NLNn7MRzxUAf+Xs2JhTCU8ZuOGrtSkvfqqfcWpKgJCWkrW5YLnhucf6cEuLeWcvJ
O2N+g2QNQR3OgtMVAUisxF70nnr1OLt1C4MEbptv4+pOgwO1mq4JRVYUPpk5yPD5
+6LU6+hR40NVY8Zh7PUCb/kuJkq1ZIZH0fDNe4BzmTQ3RIzBGNeLO1Tp1R3wkFj1
lxIvoZz+RRZBXsZjQNkLfc5xffA0yqC4sdrq9vmzof22R00OU8WH6yr4vT0A0rtp
fcoHO5/FlM69FIHas8NXIe4LZ8lhWa8EfdFXiF6g1EDy9Sgz8U3DMDbFd5o5cIXl
K1vOSeF/eNtl1Vq8oPcHk/Ox6WZNVplc5IgKAxlJeiteAKLN+gZ/NEObrIlJIoC9
rAAaHS9Tn0BgBHhD+m7CAlz158fnczmZgx32KtsqJ8uYuFdO7LrK/pi4Gr4zf+Qc
lItUPdfYW8sadt1/npdl
=eTNL
-----END PGP SIGNATURE-----

--eMnpOGXCMazMAbfp--
