From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 15/27] gpu: host1x: Add support for Tegra114
Date: Tue, 15 Oct 2013 10:03:25 +0200
Message-ID: <20131015080324.GD7856@ulmo.nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-16-git-send-email-treding@nvidia.com>
 <525877F3.9070004@wwwdotorg.org>
 <20131012112443.GC22284@mithrandir>
 <525C32E5.2020406@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ylS2wUBXLOxYXZFQ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525C32E5.2020406-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ylS2wUBXLOxYXZFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2013 at 12:07:33PM -0600, Stephen Warren wrote:
> On 10/12/2013 05:24 AM, Thierry Reding wrote:
> > On Fri, Oct 11, 2013 at 04:13:07PM -0600, Stephen Warren wrote:
> >> On 10/07/2013 02:34 AM, Thierry Reding wrote:
> >>> Tegra114 uses a slightly updated version of host1x with an
> >>> additional syncpoint.
> >>=20
> >>> drivers/gpu/host1x/hw/host1x02.c            |  42 +++++=20
> >>> drivers/gpu/host1x/hw/host1x02.h            |  26 +++=20
> >>> drivers/gpu/host1x/hw/hw_host1x02_channel.h | 121
> >>> ++++++++++++++ drivers/gpu/host1x/hw/hw_host1x02_sync.h    |
> >>> 243 ++++++++++++++++++++++++++++=20
> >>> drivers/gpu/host1x/hw/hw_host1x02_uclass.h  | 175
> >>> ++++++++++++++++++++
> >>=20
> >> That seems like an awful lot of extra lines to support just one
> >> extra syncpoint. Are there other changes? If not, can the code
> >> be shared/parameterized somehow?
> >=20
> > Yeah, I don't like very much how this is currently done. I mean
> > about half of this is actually duplicate code because of the static
> > inline functions used for register defines. As discussed elsewhere
> > this was originally meant to be used for coverage testing, but
> > nobody's done anything like that as far as I know. I'm also not
> > convinced that these would be very useful in coverage testing, but
> > adding Terje on Cc and unless he or anyone else has any (strong)
> > objections I'll go and remove the duplicate definitions and while
> > at it see if I can come up with a way to share more
> > code/definitions between versions of host1x.
> >=20
> > Do you see this as a blocker for 3.13 or can I do the cleanup
> > after that? As far as I know Tegra124 has a more heavily modified
> > version of host1x so implementing Tegra124 support might be a good
> > opportunity to clean this up anyway.
>=20
> I guess I'm unsure re: whether it's a blocker. It's certainly not some
> kind of ABI issue, so it's not like it forces our hand later; we can
> easily refactor the code later. However, I'm slightly worried that if
> we do actually intend to do that, it'll be seen as code-churn. Still,
> I guess if the main DRM maintainers don't object to this, I'm OK with it.

Adding Dave. Dave, do you have any objections to cleaning this up after
3.13? I'd prefer not to have to do it this cycle because I'd like to
focus on what patches I currently have. The plan is to upstream support
for the next SoC (Tegra124) for 3.14 and I'd much rather do the cleanup
along with that work.

Does that sound reasonable?

Thierry

--ylS2wUBXLOxYXZFQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXPbMAAoJEN0jrNd/PrOh5jkQALkucKBtv/vyN9tzf5VzhLpy
u7DaMerVFA6DKzWTDSz75a4JIptmZxLt/8NDAbmrX82m6FAZLd0vrL/OF+SME/hb
Bu/QURPEsqlRtML3E/NxB4kQTHTsHC4PTQT/OuaAtxqxOpBLGEAaabezjrVpOa9g
8l7dnMZzWP6Fe/yR91oZE/DOo3/uHD3+lLEOWsg4bC269BMkeYEceZZHnyYeUcoS
lRHM8bm4XB49hjDsbZX5Yy7mpXxsjpB/xE0v/hIcCueUAl3TAqPQqnuvnYZB1t79
l0C/2QXAudBOUkykKdfhVGHxLyJTBQxXYVyyJIh7zf2I8rV5DtRs/droCUoi6Qo/
hqsAtXEfltOKa4/fndD+USR4T8bGH35hAncyJVYLmTaKE+8r5KrkShgCYsRRK1Qy
K/BV9Si7wt0Srb7AYvHQVaKnB+cM32cSuC9qlcZjxIia4lA0HcL8cyq2v7tyQTD5
HinxPoHN7KszOmVo5K6AXh1G9+G+mWzep59u7XfBTG3bh7PQFwEBBJM/msIeyozZ
uedWTuR0uUzQWAY8W//0PWNTNkbH5Cqa+CYJVy3XNggR3115spKR8RpBzguNR/eX
HEV2k+w6H87Y2b8HLwtmp9R7BThfief8IVNl9K3YHG4ja0Lygxa/r0EDY/Q77C5P
q3ORBjzZlBUaY3okRt+b
=oP6i
-----END PGP SIGNATURE-----

--ylS2wUBXLOxYXZFQ--
