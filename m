From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/4] clk: tegra: Move mipi-cal initialization into
 clk-tegra1[12]4.c
Date: Wed, 8 Oct 2014 09:20:46 +0200
Message-ID: <20141008072045.GB4999@ulmo>
References: <1410360725-4286-1-git-send-email-seanpaul@chromium.org>
 <1410360725-4286-2-git-send-email-seanpaul@chromium.org>
 <541079A8.9080304@wwwdotorg.org>
 <20140918112621.GK26779@tbergstrom-lnx.Nvidia.com>
 <CAOw6vb+pyD9fk63rQHV5S3ar2hrWKb-HRf6ZP8odxbvz7FJ+Vw@mail.gmail.com>
 <20140919112802.GO26779@tbergstrom-lnx.Nvidia.com>
 <CAOw6vbLxNXSw3xfLZk4KKXGSJhbrHR9LEAPJ3hKHZMCN6WeV0w@mail.gmail.com>
 <CAOw6vbKozeDR+2KCTwhwRoNY7+k=FB96Vc7sHXKy4SFYMVEeHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOw6vbKozeDR+2KCTwhwRoNY7+k=FB96Vc7sHXKy4SFYMVEeHQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2014 at 01:07:29PM -0700, Sean Paul wrote:
> On Wed, Oct 1, 2014 at 11:38 AM, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > On Fri, Sep 19, 2014 at 7:28 AM, Peter De Schrijver
> > <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> >> On Thu, Sep 18, 2014 at 08:59:53PM +0200, Sean Paul wrote:
> >>> On Thu, Sep 18, 2014 at 7:26 AM, Peter De Schrijver
> >>> <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> >>> > On Wed, Sep 10, 2014 at 06:17:44PM +0200, Stephen Warren wrote:
> >>> >> On 09/10/2014 08:52 AM, Sean Paul wrote:
> >>> >> > This patch moves the mipi-cal gate registration down into the SoC
> >>> >> > specific files to reflect the different in parent between them.
> >>> >> >
> >>> >> > Without this change, MIPI calibration will fail on K1 devices if
> >>> >> > the 72MHz clock is off.
> >>> >>
> >>> >> This isn't a problem with this patch per se, but I notice that wha=
t's
> >>> >> removed from clk-tegra-periph.c is data in a table, whereas open-c=
oded
> >>> >> calls are added to clk-tegra*.c. It'd be nice if the open-coded ca=
lls in
> >>> >> clk-tegra*.c could be converted to a table (simply with SoC-specif=
ic
> >>> >> data) and processed by the same function. Peter, would that make s=
ense?
> >>> >
> >>> > Maybe yes. I will look into this. For this patch, it would make mor=
e sense
> >>> > to keep the entry in clk-tegra-periph.c as it can be used by both T=
egra124
> >>> > and Tegra132.
> >>> >
> >>>
> >>> How do you suggest we switch the parent based on 124 vs 132 if it
> >>> remains in clk-tegra-periph.c?
> >>>
> >>
> >> I would change the parent of mipi-cal in clk-tegra-periph.c to clk72mh=
z and
> >> use a different mechanism for Tegra114.
> >>
> >
> > Hi Peter,
> > Sorry for the delay, I'm just getting back to this now.
> >
> > I'm still unclear on how you propose we alter mipi-cal in tegra114.
> > AFAICT, we can't re-parent it since it's a gate clock. Can you please
> > be a little more specific (and forgive my ignorance wrt this driver,
> > it's still new to me)?
> >
>=20
> Ping. Can I get some advice on this?

I don't see a way how we can make this work with a table that wouldn't
involve adding a lot more code. Given that we need to separate the table
based on SoC generation we need to add code to both Tegra114 and
Tegra124 to register a table of generation-specific clocks.

We do something like that already for Tegra114 using the
tegra_periph_clk_list table, but initializing the clocks is done using
an open-coded loop. Perhaps one possibility would be to implement a
generic function that takes a table of tegra_periph_init_data structs
and a count. Then we can add per-generation clocks to such a table and
only need to modify the code once.

But again, this would be adding much more code than this patch does, so
perhaps we can address it when we start needing more generation-specific
clocks.

Thierry

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUNOXNAAoJEN0jrNd/PrOhgToP/3zGW8SaPL5i97hWVH+4lM97
VmAwY6ZiG00hNFGwcSNcvxs/CR7X2e6lpmtsVY5dHvCpMHu+ZeS4885i0TgNDNxH
i2JR7tuNisx6eJB5ZtC4yEWwCXgKORsmyt5KmW5XNrm/KiaG4b1gTJglcHFlZll5
cyZAzsBzdPjXN5V9YamkAz54IZUq9z0tsyLBU7+tONcnyTDYsNGajqqYBNmDfYXU
eL4n+eTjAyMUT7i1X0is3LZxJSKEQm91zcm46Vdbi5TZRefIe9BE6CbhW7lnnqAJ
wNV0wnUoGyL4Fr6thZlv9zSLtbzSKqUS8AwjD78IEGEnCqT1I/aFbJ31dFjg3mxk
gjcr1kVQkF4KRHmgkASaLS0jzToKg+MpdWb6rgvK/XfQhyg3qiuEud83TkFsZ8PL
Qpekf0UHBKYxs0i5nfeTxzTAYjM/7924VJbethREXls1kPCslB+wQ1/lpZncTqJT
E8tP6q6vvZLZ/9eIIYBKdOMfkUtZAZkqGnryOHwSsaj1GbxKFvW6k/6PyZjCdNU1
oHlpnWvoDERpPCyfMMMKTO2phXgTcpkGuHzMWz+6/VnI5m9YctF3d6+nh5rU2d65
KwnYPalZaLsmV88YsNTvhzR+CTm7/IqoSWfae3drypoWBX21aWumwAB0x8eiuMeT
JHTHLkmCZo0M4y8K0Fh3
=Dmxb
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
