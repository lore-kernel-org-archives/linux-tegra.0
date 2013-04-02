From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: tegra: Make gr2d and gr3d clocks children of
 pll_c
Date: Tue, 2 Apr 2013 08:50:59 +0300
Message-ID: <515A71C3.2050008@nvidia.com>
References: <1364502688-5135-1-git-send-email-thierry.reding@avionic-design.de> <1364502688-5135-2-git-send-email-thierry.reding@avionic-design.de> <51560BC4.8020400@wwwdotorg.org> <515A6C95.4060900@nvidia.com> <20130402054722.GA21277@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130402054722.GA21277-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02.04.2013 08:47, Thierry Reding wrote:
> On Tue, Apr 02, 2013 at 08:28:53AM +0300, Terje Bergstr=C3=B6m wrote:
>> In Tegra20, 300MHz is the max rate we drive 2D in. Later Tegras have=
 a
>> higher max clock, and in Tegra114 we drive it from a different PLL. =
But
>> for all of them 300MHz and PLLC should be a working configuration. I
>> haven't checked how we use PLLC in upstream, so I'm not 100% sure.
>=20
> At least on Tegra30 (CardHu) I can see that the clocks are also child=
ren
> of PLLC. I can add a similar hunk for Tegra30 to the patch. I have no

Yes, Tegra30 is similar to Tegra20 in this respect. Only max clock is
different, so similar hunk for Tegra30 would be a good idea.

> Tegra114 hardware available and none of the downstream kernel branche=
s I
> have seem to include Tegra114 support either so I can't check what's =
in
> use there, but if you say it should be fine I can include that in the
> patch as well.

I think it's better we add this when we have a patch that enables host1=
x
driver for Tegra114 and we have tested. Until then, I suggest we just
leave the Tegra114 part out.

Terje
