From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] drm/tegra: Add VIC support
Date: Mon, 20 Jul 2015 12:17:15 +0200
Message-ID: <20150720101714.GY29614@ulmo>
References: <1437378869-10451-1-git-send-email-mperttunen@nvidia.com>
 <1437378869-10451-3-git-send-email-mperttunen@nvidia.com>
 <55ACB134.8010401@nvidia.com>
 <55ACB6A2.9030906@nvidia.com>
 <55ACC5B0.20703@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="apSYfA7d5AHMku3c"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55ACC5B0.20703-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--apSYfA7d5AHMku3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2015 at 10:56:00AM +0100, Jon Hunter wrote:
>=20
> On 20/07/15 09:51, Mikko Perttunen wrote:
> > On 07/20/2015 11:28 AM, Jon Hunter wrote:
> >> Hi Mikko,
> >=20
> > Hi!
> >=20
> >> ...
> >>> +static int vic_runtime_resume(struct device *dev)
> >>> +{
> >>> +	struct vic *vic =3D dev_get_drvdata(dev);
> >>> +	int err;
> >>> +
> >>> +	err =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_VIC,
> >>> +						vic->clk, vic->rst);
> >>
> >> I would like to deprecate use of the above function [1]. I have been
> >> trying to migrate driver to use a new API instead of the above.
> >=20
> > Yes, we will need to coordinate the API change here. I kept the old way
> > here to not depend on your series for now.
> >=20
> >>
> >>> +	if (err < 0)
> >>> +		dev_err(dev, "failed to power up device\n");
> >>> +
> >>> +	return err;
> >>> +}
> >>> +
> >>> ...
> >>> +
> >>> +	pm_runtime_enable(&pdev->dev);
> >>> +	if (!pm_runtime_enabled(&pdev->dev)) {
> >>> +		err =3D vic_runtime_resume(&pdev->dev);
> >>> +		if (err < 0)
> >>> +			goto unregister_client;
> >>> +	}
> >>
> >> I don't see why pm_runtime_enable() should ever fail to enable
> >> pm_runtime here. Hence, the if-statement appears to be redundant. If y=
ou
> >> are trying to determine whether rpm is supported for the power-domains
> >> then you should simply check to see if the DT node for the device has
> >> the "power-domains" property. See my series [1].
> >=20
> > The intention is that if runtime PM is not enabled, the power domain is
> > still brought up. On a cursory look, it seems like with your patch, this
> > should indeed work fine without this check if CONFIG_PM is enabled. Now,
> > that might always be enabled? If so, then everything would be fine; if
> > this lands after your series, we could even just make the power-domains
> > prop mandatory and not implement the legacy mode at all. If not, then
> > AFAIU we must still keep this path.
>=20
> Ok, I see you just wish to test it is enabled in the kernel config. Then
> yes that would make sense and the above is fine.

Do we really need to bother about this? If runtime PM isn't enabled we
don't care very much about power management anyway. So in my opinion if
a driver supports runtime PM it should support it all the way and not
pretend to. Having this mix of runtime PM vs. no runtime PM is beside
the point of using something like runtime PM in the first place.

So if this is about supporting legacy vs. runtime PM, then I think it
should be based on some more explicit check, like if (!dev->pm_domain),
but otherwise we should assume that pm_runtime_enable() succeeds.

Thierry

--apSYfA7d5AHMku3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVrMqqAAoJEN0jrNd/PrOhAiYP/jSbLt+3pfRZEgT/5OzoISns
bJJcrrScHj1tpUhUxMh1tn6RaC1uUu2vClpb/mc+Th4zN5XXrlj6IXA79aMsuktU
ecA0Y3haXI4tnX2nZrHsB5o8tSK/M3zQf5qMf2t1A8KQu6A64vnRVaUiaiwwQz0T
NtrC95rt+V+MfzWGWfpHJkGrmA8pfc9b84omn5WuJngYz8dqrk3zS5GCF+JAqk48
TWUBdaeuLZopNo7uFEwyZSKd+y8xi2HfSBJJL5DjxJ4zwYSU9e6RlunNgkE26cnD
1sT0OwX+oqWlYMsTGpq+VbLBngUWZJ3RG5lZbUq8aBYv0K7J612arXifSO4u2ir9
DmtiiMeRsY1TOvXNUnR5G2iCopaimE8yaym6a7/WJ6poj8wOqykcvKrpMeoYloCJ
W/SZk8+B7It8Wvz5Embdwd1Z0y7yi264khSSv9DI0QzkpSbxrJHrrnTSiLPv6r4w
tjySMkoXyPHbAiochqeDkzyx7jRUjRtdyCqqLKV2kvBjStpyNgDz5jqrV8IIVO9q
JkDhEU38TlXrmnp+ubomW+JqkylJ2dbbC4EtLn6CUMHHlGwczpp6hGwUtEGrfA2P
b/DSbfOd/Rvj1EKQZdi+1LHSRctbK3R3wgplYOOjYFfwU8WOqG/42U+B53WhIRZw
n8OU3wk16UyGVvoStHvA
=SDvh
-----END PGP SIGNATURE-----

--apSYfA7d5AHMku3c--
