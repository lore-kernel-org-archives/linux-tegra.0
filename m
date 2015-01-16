From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc: tegra: Add Tegra132 SoC to the DT list of Tegra SoCs
Date: Fri, 16 Jan 2015 18:09:28 +0100
Message-ID: <20150116170926.GA17763@ulmo.nvidia.com>
References: <alpine.DEB.2.02.1501161137351.9776@utopia.booyaka.com>
 <20150116150749.GA32155@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150116150749.GA32155@leverpostej>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2015 at 03:07:49PM +0000, Mark Rutland wrote:
> Hi Paul,
>=20
> /me opens a delicious can of Lumbricus terrestris
>=20
> My comments below aren't so much about this patch alone, but more about
> the entire strategy with drivers/soc and the kind of code living there.
>=20
> On Fri, Jan 16, 2015 at 11:39:13AM +0000, Paul Walmsley wrote:
> >=20
> > Add "nvidia,tegra132" as a compatible string that denotes a Tegra SoC.
> >=20
> > Signed-off-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
> > Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> > Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/soc/tegra/common.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
> > index a71cb74..a952986 100644
> > --- a/drivers/soc/tegra/common.c
> > +++ b/drivers/soc/tegra/common.c
> > @@ -15,6 +15,7 @@ static const struct of_device_id tegra_machine_match[=
] =3D {
> >  	{ .compatible =3D "nvidia,tegra30", },
> >  	{ .compatible =3D "nvidia,tegra114", },
> >  	{ .compatible =3D "nvidia,tegra124", },
> > +	{ .compatible =3D "nvidia,tegra132", },
> >  	{ }
> >  };
>=20
> I'm rather worried by this.
>=20
> The only user of this table is soc_is_tegra(), which seems to guard
> several probe paths in drivers which are DT driven. Given that, I don't
> see why this is necessary at all, because the presence of the
> appropriate nodes should be sufficient to handle the early return from
> an initcall.

We need this to preserve backward-compatibility. There are some
instances where any device tree nodes that could be used to guard the
code execution were only added after the fact. So in order to keep
systems with an old DTB running we need to continue running with hard
coded physical addresses.

> More worryingly, if soc_is_tegra() returns true but the node isn't
> found, the drivers decide to do things. If tegra_pmc_early_init passes
> soc_is_tegra() (because we happened to match "nvidia,tegra132"), but
> doesn't find a DTB entry for the pmc, it then pokes an assumed
> hard-coded physical address.

And that's (currently) safe. It at least makes sure that breakage (if
any) is restricted to Tegra boards. There are other occurrences where
drivers don't even bother checking for this at all and simply use an
initcall to unconditionally create a platform device which then goes
and tries to access physical addresses on *every* board in a multi-
platform kernel.

> Assuming things because of the _lack_ of a node has been a major pain
> point on 32-bit as DTBs advanced and code was changed, resulting in boot
> breaking or DTB compatibility breaking over time as old and new kernels
> made conflicting assumptions.

So what are you saying? We can't support 64-bit ARM because we need to
keep backwards-compatibility with old DTBs and weren't smart enough to
see this through all the way three years ago?

> I don't want to see arm64 kernels making assumptions in that manner (nor
> would I like to see it in new code for 32-bit ARM); it always leads to
> boot breakage, and it's completely avoidable. The only thing we can know
> is what is described in the DTB.

I guess we could always make this conditional on 32-bit ARM. Or we could
decide that we don't care about DTB backwards-compatibility anymore. In
fact we're quite likely going to break it soon anyway because of Marc's
gic_arch_extn rework, so might as well start with a clean plate after
that...

> So NAK to this addition while soc_is_tegra is in use in that way, and
> NAK to any DTS patches adding any of the strings that would cause
> soc_is_tegra to return true on arm64.
>=20
> There's also the worrying pattern of initcalls that look for particular
> compatible strings -- why can't these use the existing DT probing
> infrastructure rather than rolling their own? It would be nice to not
> accumulate initcalls that only make sense on one platform.

You make it sound like the "existing DT probing infrastructure" is in
any way different from initcalls. Furthermore it's typically associated
with a specific subsystem or class of devices, so adding custom OF init
tables for a driver that's used on a single platform doesn't strike me
as something that people would be willing to merge.

Thierry

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUuUXGAAoJEN0jrNd/PrOhV6sP/3Wemy02nkH9g/q3Hd2hh1Ca
q5Ls6f/d8+vzgSF9fRJszPty5T7fQkDCjCdXPgwGu8ab/DvNOwA2Qd8Ca8OeTRLU
xEsZq+7c/zw8LvfH024Rhl8oBIaaqijqPnZQDaPzMD6VEFABFNcktwBeJI1lhhGN
z2ggm8b/3cPDW2RAaXZ0rKzcZEbWGx9ghGL/5FjkY8YLePBVB5+3dvo/0bkcG/yc
/zC+FwWLeHo4FN/g+aET4STcL1XI8bERd9BvT/SPrTgmNNCMyTyhcNL6ROsJTAii
fcGKObZc8u7C5bs69FOUQPCgo7+iubsG6F8/pUIilThBszmv8YaD1QOU0QfUhjKM
OSuKVibMZVckPJgreUUuYExxvp50ZtXVs5MxgmSMlBK8gaMUKMhTvc3sOwYy6DFA
cr5UNBnXzCRJC4tsu2yTdvLgZ42EMRB0oV6u3yq85dXNfJ8YOwuTGNsnVybcvtjC
Fw+FOIkAAikO3M9xJ+87fz5XwBwRg/ilWa0gyNBgNJGxiNRHiIDI/77UQKX9GGLh
ZtuEIcLe2/fX6/mf6tFqeWtz+5Dh7qSES9FCBI6Dt3lWv6CcjD9trreNpLlEkqMC
DyfPUG3I0C67aVXxLCp7p8V6ZC/zBgcD+yrzTW8eV+PhdQHjdFW37MNKpGaLtcwB
+0acAZw97HsQL4u6+YEG
=ZI7H
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
