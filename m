From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] reset: Don't WARN if trying to get a used reset control
Date: Wed, 20 Feb 2019 09:49:08 +0100
Message-ID: <20190220084908.GA21299@ulmo>
References: <1548849808.3939.7.camel@pengutronix.de>
 <20190201140025.GB12829@ulmo>
 <1549389941.3929.14.camel@pengutronix.de>
 <20190205221300.GA1372@mithrandir>
 <1549448885.3338.4.camel@pengutronix.de>
 <20190206113849.GA21676@ulmo>
 <1549464390.3338.8.camel@pengutronix.de>
 <20190206160023.GA23805@ulmo>
 <1549476724.3338.10.camel@pengutronix.de>
 <20190207082751.GA29438@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190207082751.GA29438@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2019 at 09:27:51AM +0100, Thierry Reding wrote:
> On Wed, Feb 06, 2019 at 07:12:04PM +0100, Philipp Zabel wrote:
> > On Wed, 2019-02-06 at 17:00 +0100, Thierry Reding wrote:
> [...]
> > > That way we operate on the same reset control, but we wouldn't need to
> > > iterate over all existing reset controls in order to determine whether
> > > we can acquire or not.
> >=20
> > How could we decide in reset_control_assert whether the provided rstc is
> > allowed to change the reset line if both rstc handles point to the same
> > struct reset_control?
>=20
> The idea was that acquire/release would basically act as lock/unlock for
> the reset control. So consumers would always have to call acquire()
> before assert()/deassert()/reset() and they would be allowed to continue
> only if acquire() returns success. Of course that's something you can
> only enforce during code review, but that's pretty much the same as with
> any type of locking.
>=20
> So basically the idea is that if a consumers acquire() call succeeds,
> the acquired flag gets set on the reset control and that consumer
> becomes the only user allowed to modify the reset control. Any other
> consumers would call acquire() and fail because the acquired is already
> true.
>=20
> But what you proposed works for me. We can always find constructive ways
> to optimize this later if we need or want to.
>=20
> Another possibility would be to keep an additional, separate list of the
> temporarily exclusive resets so that only that list would have to be
> iterated to find the ones that are relevant.
>=20
> > > >  			if (WARN_ON(!rstc->shared || !shared))
> > > >  				return ERR_PTR(-EBUSY);
> > >=20
> > > With the above I think we could just extend this list of conditions w=
ith
> > >=20
> > > 	|| acquired
> > >=20
> > > and things should work the same. Or perhaps I'm missing something.
> > >
> > > Other than that this really looks like a very nice solution.
> >=20
> > Well, apart from the API function names...
> > devm_reset_control_get_optional_exclusive_released(dev, "id");
> > would be a mouthful.
>=20
> Yeah, the combinations are somewhat awkward. However, I would expect the
> temporarily exclusive resets to be required in most cases, so that would
> at least make the name a little shorter.

Quick update: I finally had a bit of time to look at this and I've got
something that works. There were a couple of minor issues with the patch
and I had to extend support for acquire/release to reset arrays for this
particular use-case, but overall it seems to be working pretty well.

I'll clean up the patches that I have and then send out for review. It's
unfortunately going to be a bit of a mess staging these changes since
they are spread over three different subsystems and I think there can be
subtle failures between the PMC and SOR patches, so perhaps it'd be best
to apply those to one tree, or maybe even squash the changes into a
single commit to avoid any surprises.

Thierry

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxtFIEACgkQ3SOs138+
s6H9EA/9FxY10esYYvhZTftxJATt89nBbxmjmWuk4f82O6/vmoJCVHL+eaxh1cFf
4z3W56tmppyzjsnXEXVJUlk/HeYrSyeYEy6smkIbf1INHbLRab9gQJUOxTRV7sv4
2vKVFkcClfEO0fu8pB/SgRKlhVIWdQSqjkK9s+yCEHAbF8DoaynRVfXUc7UJboUc
kFJbYkNTYR4RLHl3eEUudApEWMzJZFyVtXixZrtVjrICoMlMcQz6QKDnaFjGmirf
EmKRzfjY0+gUai/YuvS7xkxywY2/VMPN9L5RGTBmEvyCOEQcZCu5DPWq34HwMwen
hoBIXtBAOHWB5mqrdx3VbgveZA0d3SVnQq44brUFCc2/OAyLGtxvTASZZMxXimkp
YT0GPddHWSnBwqOv1RlM1XrmlcZZ/uf03vq1QbTLZk8K+wpn0uBEpi9ofxNmCElb
fkbmVTcXcQVpEiC3qrhIcHvPHbIoduvXTrMUKf1HFDkuD8+3mnoWZ76RszUBH8Uz
DcIP8gOhBcapdFzBT+T5yBQOEzZqF9q45ShuCZWRbuMofu/pocmLLwhvmJ5R1yxq
K6GBOdWUmECps9x3PJ8cIEH1qlzFVe+TqQlu0L3NP88tK5vw8iKMyoEpDWpybFJ2
2sg+s46e3NGgdmvY6FG7rtOKm54N/zaZdVUhu7sIa0e1YVXkX/c=
=/U/s
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
