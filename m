From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 15/27] gpu: host1x: Add support for Tegra114
Date: Sat, 12 Oct 2013 13:24:43 +0200
Message-ID: <20131012112443.GC22284@mithrandir>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-16-git-send-email-treding@nvidia.com>
 <525877F3.9070004@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4ZLFUWh1odzi/v6L"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525877F3.9070004-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2013 at 04:13:07PM -0600, Stephen Warren wrote:
> On 10/07/2013 02:34 AM, Thierry Reding wrote:
> > Tegra114 uses a slightly updated version of host1x with an additional
> > syncpoint.
>=20
> >  drivers/gpu/host1x/hw/host1x02.c            |  42 +++++
> >  drivers/gpu/host1x/hw/host1x02.h            |  26 +++
> >  drivers/gpu/host1x/hw/hw_host1x02_channel.h | 121 ++++++++++++++
> >  drivers/gpu/host1x/hw/hw_host1x02_sync.h    | 243 ++++++++++++++++++++=
++++++++
> >  drivers/gpu/host1x/hw/hw_host1x02_uclass.h  | 175 ++++++++++++++++++++
>=20
> That seems like an awful lot of extra lines to support just one extra
> syncpoint. Are there other changes? If not, can the code be
> shared/parameterized somehow?

Yeah, I don't like very much how this is currently done. I mean about
half of this is actually duplicate code because of the static inline
functions used for register defines. As discussed elsewhere this was
originally meant to be used for coverage testing, but nobody's done
anything like that as far as I know. I'm also not convinced that these
would be very useful in coverage testing, but adding Terje on Cc and
unless he or anyone else has any (strong) objections I'll go and remove
the duplicate definitions and while at it see if I can come up with a
way to share more code/definitions between versions of host1x.

Do you see this as a blocker for 3.13 or can I do the cleanup after
that? As far as I know Tegra124 has a more heavily modified version of
host1x so implementing Tegra124 support might be a good opportunity to
clean this up anyway.

Thierry

--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSWTF7AAoJEN0jrNd/PrOhHNEP/3xWDkfE8LczaDGTktIYsSaM
w6dGmCdf9eC6u/ioWWuQ7nBDfDgDmOfyFqVUSVSyFGDO3aUgN9GOKnaiq0/0WlV6
UBIhzvQLaXTinqhUhoekVZmM+bBttVDCrkaDn4IPhMuIgW0sionNaHi8JgZMFcNl
qVG/PRxuFG8AxE1dtMWJmgKx/P27Qmnugkm6Bfvey0YFMHJkGeTMju7cquYxqU7W
5FjPKMNax+yog+MJEcXz+zwRoKw3dWVRzfQxA0uplUMD2RNOPr97JBtb3i5hjpRk
IFbSiLAe2X1MYg0veV996ck8UE0isGa++BEfr4qeD9bGI5/dZmKFLf49S8qqIUZs
M4l6co8dY/THM0JaIDf0YhQ5l30gWb0HlCZ8POF2kCEsBQ/4WfI/QmXbE2sh8x+l
38ZnSRI+6ePtJGeIxTS3/T3bsDuRQFRvbtgQHvSVWYW9uaTctNWDi1mBiwBAGIqG
/YyMvkdNVokrgfu2Uy2TAp4pmwm9HluMJ4sX8dSz+J3D4cIz6L5CutEGYSBtOJ5N
Lb2c1173BdlPgeJ6XatzcLv1POVPg3eBbyD0ejQ1InD5tBmPYqdS4u0Q2O9pUIvD
Vicga31GLoPQ7RZ42iG59NyU64AhaFBvSVrl/byvIlVsECIDkXmiO8PQtA1Pe9xD
1xzWlpIWNoTuvRroZ4Jf
=5LQT
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--
