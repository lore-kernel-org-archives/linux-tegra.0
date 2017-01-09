From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: core: Unset supplies when regulators are
 unregistered
Date: Mon, 9 Jan 2017 16:40:39 +0000
Message-ID: <20170109164039.4hsiqpvx2khriktw@sirena.org.uk>
References: <1483703678-19575-1-git-send-email-jonathanh@nvidia.com>
 <20170106182953.ayvailx5sxtiyzwe@sirena.org.uk>
 <084533f5-d611-59ac-7329-657b0523bdb3@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="axoskmh4e4cujbav"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <084533f5-d611-59ac-7329-657b0523bdb3-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--axoskmh4e4cujbav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2017 at 01:37:18PM +0000, Jon Hunter wrote:
> On 06/01/17 18:29, Mark Brown wrote:

> > Why is a parent device doing this?  This doesn't seem like safe or
> > helpful behaviour and with probe deferral we'd generally expect the
> > device to acquire resources before it starts making use of them.

> It is not really the parent that is doing this. The child regulator in
> this case is physically a separate regulator from the main PMIC device
> that is registering the supply regulators.

The parent of the regulator being unregistered.

> > We can't completely stop people doing this but we do make fairly strong
> > efforts to stop people pulling in use devices.

> Right, but before removing/unregistering a regulator today, we never
> check to see if it is the supply for any other regulator.

We're trying to not specifically look for that by making supplies look
like regular consumers which we were handling by holding a reference on
the module (far from bulletproof but hey).  Special casing them was way
too much of a source of bugs to be sustainable.

> > This seems like storing up trouble for the future, we'll end up with
> > live child devices with parents that weren't around or being refcounted
> > through some of the lifetime of the device which will doubtless come
> > back and bite us later.

> Yes I am not completely happy. Maybe we should wait for the parent
> device to be bound before allowing any of its's regulators to be added
> as supplies for other regulators? I gave the following a quick test and
> this seems to work too ...

Yeah, that thought occurred to me too. =20

> The above prevents anyone from using a regulator as a supply if the
> parent has not been bound yet. Therefore, if one of the parent's
> regulators fails to register, after some have already been successfully
> registered, there is no chance any of the successfully added regulators
> will have been already added as a supply to some other regulator in the
> system. Hope that's clear!

Can you cook it up into a proper patch please?  I *think* that should be
OK from a correctness point of view and it should be way more robust (as
well as simpler to implement).

> > Please don't mix different changes into one commit, as covered in
> > SubmittingPatches please send one patch per change.  This makes things
> > easier to=20

> Sorry, may be I worded this badly, however, it is a consequence of this
> particular change and otherwise it would not be needed.

Ah, OK.  That makes more sense - at a thousand foot view it wasn't
obvious.

--axoskmh4e4cujbav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhzvQcACgkQJNaLcl1U
h9D3Dgf/Um9VrdIP6NG5qfP23/T6hiqjvBN+kzL9CqfS1bUs5Gjsw7P+Lhj64xDk
GgSGCg6FQxrdA3HEaV0BosJ6mcCKpe8xDuuAPEZKCak8XHSTnPVJ5nOHOZ4v7ivQ
jmLdmV2M2+nApSVA4QsN+m2ARqAlfO0oo1VnxcU0/Qxo81QGIxlbC8ZQQ2VWZj+e
auW9cJr1x/Qjc8ofSlnMErhItWO8CnNx4ES84Bw4ZRHIRBq1kDhE7V3auroGwmg2
h0I8RoO6R+Hun/9BoWSbeAG67pYAwQ4c6CNcEqVJKR62b4PNAk/8CDv1KhhHVsJ2
Sgqsp/zQ+4Kg+Gz6P4oKkuJVhoewVw==
=Aw6j
-----END PGP SIGNATURE-----

--axoskmh4e4cujbav--
