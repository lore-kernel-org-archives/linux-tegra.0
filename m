From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] gpu: drm: tegra: Adjust dsi phy timing
Date: Fri, 5 Dec 2014 23:17:49 +0100
Message-ID: <20141205221748.GA21777@mithrandir>
References: <1417570823-19977-1-git-send-email-davidu@nvidia.com>
 <CAOw6vbJmq1QtPPeWeE=mjgD1RjCeYGO=zdKR3vMn9AZaTOOc_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOw6vbJmq1QtPPeWeE=mjgD1RjCeYGO=zdKR3vMn9AZaTOOc_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 05, 2014 at 01:48:42PM -0800, Sean Paul wrote:
> On Tue, Dec 2, 2014 at 5:40 PM, David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>=20
> > Fix DSI PHY HS Trail setting on Tegra.
> > It is found that HS Trail is off -12% during compliance testing
> >
> >
> [this time from the correct email address]
>=20
> Our timing tests pass now.
>=20
> Tested-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Can describe what kinds of timing tests these are? I obviously lack the
kind of equipment for this, but I'd still like to know how you get these
results.

Thierry

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJUgi8MAAoJEN0jrNd/PrOh1eQQAJxAVen7i/pl/5MYPQjlQ6n/
fv5Asv73dxJ0IUUcJufzRwbEw6SwyGrt7cYqu/7a3EZ3Z2SaZ98cXTIZRPyzcSlG
NhPpBAGRK0GpimGIfR2l8xq8yZkBUa2Tq/6gfrMD9FoGjEZ+t7VH+g7S/uJOJfSl
dIQXLk2E+ZMJqfLORcMzDR7Wnoub9BmLDXULzAsHgO3mLKz7yKuZkdx4KELknvzT
uws8aOa1ikk6WX7EaTY88UovZnLogCbvEyGEV73GAG0ET5WdNk73eTYl+9nJCBdp
Zlk7yPItSyQM7crB5yUi5m4YrVq5BAnzuS1QKFhKF2SCP/hOr5xEDSrrdIBfpKOM
5P54gdprLhVSd3rXU8xzbkeYX4aJg6vUV2SpMj77GdE/R/J4wusyU5OfakvNJDH9
ZlrhTUYSkjoSrBzEBik2mRukFYzN2LMkvYRqrnMnWeLD8ttvTw/02+NfTIo1f0Kd
N2y5Om+A9TvaQacRQadmMh159Gxxf2taijzNbRDOegILrwyWgvcOFMcWf2QisvZu
rjCWIWCpXYj5AEn6iSEBFFkLxH+61H80rvxFBFTELxqRzVlQCuQkJL0aoeKh7ZGw
SJV88cuUJXRW/vJPM5ZLJHBQDri9eNB7ScJNogB/xoGmP1KaQRLSYuLHnafidQE/
dEDcXreaVeN/PjLaO0Hg
=RgFb
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
