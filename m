From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: tegra: Make gr2d and gr3d clocks children of
 pll_c
Date: Tue, 2 Apr 2013 07:47:22 +0200
Message-ID: <20130402054722.GA21277@avionic-0098.mockup.avionic-design.de>
References: <1364502688-5135-1-git-send-email-thierry.reding@avionic-design.de>
 <1364502688-5135-2-git-send-email-thierry.reding@avionic-design.de>
 <51560BC4.8020400@wwwdotorg.org>
 <515A6C95.4060900@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <515A6C95.4060900-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2013 at 08:28:53AM +0300, Terje Bergstr=C3=B6m wrote:
> On 29.03.2013 23:46, Stephen Warren wrote:
> > On 03/28/2013 02:31 PM, Thierry Reding wrote:
> >> By default these clocks are children of pll_m, but in downstream kerne=
ls
> >> they are reparented to pll_c. While at it, decrease their frequencies =
to
> >> 300 MHz because the defaults aren't in the specified range.
> >>
> >> gr2d can reportedly run at much higher frequencies, but 300 MHz works
> >> and is a more conservative default.
> >=20
> > Questions on this patch:
> >=20
> > Do we need to do the same thing for Tegra30 and/or Tegra114?
> >=20
> > Is 300MHz the right value?
> >=20
> > I'm hoping that Peter, Prashant, and/or Terje can provide guidance here.
>=20
> We need a patch for all SoC's.

I think we also need that for all host1x children as well. But I think
we can tackle those at the same time as driver support is added. Right
now only 2D and 3D have some form of user code.

> 2D can fail subtly with the too high clocks, even though most of the
> time it seems to be doing just fine.
>=20
> In Tegra20, 300MHz is the max rate we drive 2D in. Later Tegras have a
> higher max clock, and in Tegra114 we drive it from a different PLL. But
> for all of them 300MHz and PLLC should be a working configuration. I
> haven't checked how we use PLLC in upstream, so I'm not 100% sure.

At least on Tegra30 (CardHu) I can see that the clocks are also children
of PLLC. I can add a similar hunk for Tegra30 to the patch. I have no
Tegra114 hardware available and none of the downstream kernel branches I
have seem to include Tegra114 support either so I can't check what's in
use there, but if you say it should be fine I can include that in the
patch as well.

Thierry

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRWnDqAAoJEN0jrNd/PrOh1YYP/RyHPvxiIXSFy5mlMGcHFHX9
6Fs4d8yAKG0CIkU06BmJ6KElN3HB4NtZ5SQEn7aD6M/6ppVi1Y6q3rGcXV0AiPKM
Ljg2A0zAHSktn0W3sCAQn5kY2wvSz14YBv9G/xgFWfiO+sPWSwtvsw4LLmYT8zdl
ltbpha2gcnvnh0fadqsDzHS7yOqGuyq9Uh9KrHRlwElZ07QN1hsFCNraQJOxIgPA
NUy+2j+45+tK96zgWvSstE6kcNhCBtVSjr0Tr9AdcfNzLAaYqadOs1ikhlsATLPN
HgfMJjCpj5cTV2WqBg1LAvb2Mxhn8MBMZGjWJNC2kLYk9AcoHUAT8+lZXpODqnnP
9AglBVIxisTPMowPpgUckSZE6VPo4iZxsu5+NUG8RyLtWryrywYsGCtq1chwfA/p
bmL2JbRpWrFgCS25807bzs9knSZ9vV0tLU5CKqXawV9fto7YiTdO7TZ30xmVZCTV
gybL4ft0PSj7AWvji10M/1vVCLygpVevvch5VAwcOJitkSQNHSly++ZxmkMcNAlR
2E2AXhQGHZIL7STuN+Y2mshtIdzswsNDs6Dpi7wR55++6tHWVuZKPluTOE4S9QnX
yNj/eZxN/eYB61tRYNXhhg7IHH/f/bFBOGriqTX00amKRMXBRRgCyB68UYuu5NDs
2bF2/zsHcTBicUgWAjBS
=3LKM
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
