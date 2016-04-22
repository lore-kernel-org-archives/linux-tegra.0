From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clk: tegra210: Add SLCG override gate clocks
Date: Fri, 22 Apr 2016 13:12:45 +0200
Message-ID: <20160422111245.GA9047@ulmo.ba.sec>
References: <1457638685-31007-1-git-send-email-rklein@nvidia.com>
 <20160314160551.GA21898@ulmo.nvidia.com>
 <56E6E20C.6020807@nvidia.com>
 <56E7CA79.7060106@nvidia.com>
 <56F581BF.2070903@nvidia.com>
 <20160412152026.GE25160@ulmo.ba.sec>
 <570D335E.9020202@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <570D335E.9020202-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2016 at 06:41:50PM +0100, Jon Hunter wrote:
>=20
> On 12/04/16 16:20, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Fri, Mar 25, 2016 at 02:21:51PM -0400, Rhyland Klein wrote:
> >> On 3/15/2016 4:40 AM, Jon Hunter wrote:
> >>>
> >>> On 14/03/16 16:08, Rhyland Klein wrote:
> >>>> On 3/14/2016 12:05 PM, Thierry Reding wrote:
> >>>>>> Old Signed by an unknown key
> >>>>>
> >>>>> On Thu, Mar 10, 2016 at 02:38:05PM -0500, Rhyland Klein wrote:
> >>>>>> From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>>>>
> >>>>>> Add some SLCG (Second Level Clock Gating) override clocks to contr=
ol
> >>>>>> gating and un-gating their logics.
> >>>>>>
> >>>>>> Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>>>> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>>>> ---
> >>>>>>  drivers/clk/tegra/clk-id.h               | 16 ++++++
> >>>>>>  drivers/clk/tegra/clk-tegra210.c         | 91 +++++++++++++++++++=
+++++++++++++
> >>>>>>  include/dt-bindings/clock/tegra210-car.h | 32 +++++------
> >>>>>>  3 files changed, 123 insertions(+), 16 deletions(-)
> >>>>>
> >>>>> There's no rationale given here about why we need this. What will t=
hese
> >>>>> second level clock gates be used for? Why do we need these (seeming=
ly)
> >>>>> duplicate clock entries.
> >>>>>
> >>>>
> >>>> These are going to be used in the to-be posted patchset around
> >>>> powergating. As of now they are unused, which is why I hadn't added =
them
> >>>> previously. I just wanted to try to get this dependency in before the
> >>>> powergate series was posted.
> >>>
> >>> Yes we are using these on the Pixel C (aka. Smaug) and I suggested to
> >>> Rhyland that we upstream them. Eventually we will use them but only
> >>> after the core GenPD changes for Tegra are merged. From my perspectiv=
e I
> >>> was thinking it is better to reduce the changes between the chromeos
> >>> 3.18 kernel and mainline. However, if you wish to wait until we need
> >>> them I guess we can. Otherwise ...
> >>>
> >>> Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>
> >>> Cheers
> >>> Jon
> >>>
> >>
> >> Thierry do you think we should hold off on this until Jon's patches are
> >> ready or merge this sooner?
> >=20
> > Jon, I think it would make sense for you to pick this up into your tree
> > along with the rest of the patches that make use of them. Even if they
> > end up being applied to different trees I'd like to see all of the work
> > as a whole first.
>=20
> Ok. That is fine with me.

I've had a brief discussion about this with Peter and it seems like
these are only used to make sure that IP blocks don't hang during reset.
If that's so I'm inclined to request this code to be hidden within the
clock & reset driver to contain the knowledge to that driver where the
workaround can be applied without having to make every driver (or at
least the powergate driver) aware of this need.

Thierry

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXGgcqAAoJEN0jrNd/PrOhx8AQAIIlnQbEFZYjGY75A2nPDRnq
jBdj+Tes6umc45qU6KtQ3bR2bag9km18f+ZyG47K+XaqXFjlkXyjNj2ODmMqku54
iC4/hVl/rBJTaV9oWziQyfO5HtwxdRB+7u0JtouVkS0P27iyfKA0RbKuGqYsPq7r
4n45V2BRhVYaAM4kagOVeS6pTP7kyVw7LHt1P0njkgzV/QHGr8Vxhw2quJNUY6gK
suKHkw2NI59jKuT+ugeRwmHtJ4kmw2p84YKRhfY4zZEv2QtkBRcQqoADjwrfnN9s
YsGHmktutqnCsdWd/Q8sDM2DozH1YgOy8W/OA/WKSXYNk3lZyx2APeWCEw3zy2yz
JgVoNjW++KxBNF8iza9FkjDmYkXM6bunvyxuLRIQMUwbf5GoSGjaedgaRNBT+yMa
5ATczVJm+RdxwVQOIMHTI4H99all8XFeStM4yPU4QsYDPvb/2wWzT5C5dZH2AmQ8
8pkHRj4Tr03i8po9XEnoKy2PoGJFmHF1SMpTBTPBYpDN5nNiAQQJPGXCmUx9Yno3
RqKgrsGiIHnnCqsYzuewyw++ijjfStCVujeFpkgNgmhKokDpkmh4Fz6QftYs14s2
z/5Dc41HFl/FpkMPhZPwhp68vqhR8Hxglg61Bo45HIGdp4v6ltmYxfIvzeQ3eJQi
+kdT6hr/SXaTGJUKjqYl
=9tmM
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
