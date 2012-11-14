From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra20 host1x support
Date: Wed, 14 Nov 2012 11:12:57 -0700
Message-ID: <50A3DF29.1070806@wwwdotorg.org>
References: <1352467202-27903-1-git-send-email-thierry.reding@avionic-design.de> <1352467202-27903-2-git-send-email-thierry.reding@avionic-design.de> <50A357D3.9080002@nvidia.com> <20121114084931.GA31837@avionic-0098.mockup.avionic-design.de> <50A3712E.7000104@nvidia.com> <20121114105406.GA31455@avionic-0098.mockup.avionic-design.de> <50A3C485.7080704@wwwdotorg.org> <50A3CAA3.2060908@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50A3CAA3.2060908-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/14/2012 09:45 AM, Terje Bergstr=C3=B6m wrote:
> On 14.11.2012 18:19, Stephen Warren wrote:
>> I'd rather initialize it explicitly. If setting it to 216MHz works
>> fine as Terje indicated, we may as well just do that.
>=20
> I'd prefer explicit setting, too.
>=20
>> I suspect the issue with the original code:
>>
>>> { "host1x",     "pll_c",        144000000,      false },
>>
>> ... is that perhaps the requested 144MHz can't be generated from
>> pll_c's 600MHz rate, since there's a simple U7.1 divider there (you
>> could get 120, 133.333, 150), so the clock ends up being programmed =
to
>> some incorrect value. In the pll_p/216MHz case, pll_p is programmed =
to
>> generate 216MHz anyway, so requesting the same rate for host1x yield=
s
>> a divider of 1 exactly which works fine.
>=20
> I could try the values you proposed tomorrow when I get back to offic=
e.
> I believe we've always kept host1x under non-fractional dividers, so =
I'd
> like to try 150MHz on Ventana and 150MHz and 300MHz on Cardhu.
>=20
> 600MHz sounds pretty high for PLLC on Tegra20. For Tegra30 it would b=
e
> understandable. In internal kernel I believe we have lower rate for
> Tegra20 PLLC. Do we have anything running from PLLC in Tegra20 upstre=
am
> kernel?

Yes, sclk/... appear to derive from it:

> 	{ "pll_c",	"clk_m",	600000000,	true },
> 	{ "pll_c_out1",	"pll_c",	120000000,	true },
> 	{ "sclk",	"pll_c_out1",	120000000,	true },
> 	{ "hclk",	"sclk",		120000000,	true },
> 	{ "pclk",	"hclk",		60000000,	true },

Git archaeology shows that the following commits are relevant, the firs=
t
and last one in particular:

> commit 9abafa021e223f04d6589ee2b977bbaf2e1f1367
> Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Date:   Thu Apr 12 14:13:05 2012 -0600
>=20
>     ARM: tegra: change pll_p_out4's rate to 24MHz
>    =20
>     pll_p_out4 is used on all/most Tegra boards to drive the cdev2 ou=
tput pin
>     to provide a reference clock to a ULPI USB PHY. This reference cl=
ock must
>     run at 24MHz, and the cdev2 output has no additional dividers.
>    =20
>     Remove board-paz00.c's now-duplicate initialization of this clock=
=2E
>    =20
>     Reported-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
>     Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> commit 7ff4db0967bd7d617c77dc5a66c0d95166277817
> Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Date:   Fri Apr 20 16:58:18 2012 -0600
>=20
>     ARM: tegra: fix pclk rate
>    =20
>     Commit 40f9cf0 "ARM: tegra: reparent sclk to pll_c_out1" changed =
the
>     rate of hclk. Since pclk is derived from that, and only has integ=
er
>     dividers, the pclk rate needs to change in the same fashion, from=
 54MHz
>     to 60MHz.
>    =20
>     Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> commit 60f975b98cf41476ba0e156f7523b197b046cf2b
> Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Date:   Thu Apr 12 14:09:39 2012 -0600
>=20
>     ARM: tegra: reparent sclk to pll_c_out1
>    =20
>     pll_p_out4 needs to be used for other purposes. Reparent sclk so =
that
>     it runs from pll_c. Change sclk's rate to 120MHz from 108MHz sinc=
e this
>     is the lowest precise rate that can be achieved by dividing the p=
ll_c
>     rate without reducing the sclk rate. (600/5=3D120, 600/5.5=3D109.=
0909...,
>     600/6=3D100).
>    =20
>     Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> commit c8b62ab41f76218efca5e4baa5c22ef52a9fe3a5
> Author: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Date:   Fri Sep 10 09:17:33 2010 -0500
>=20
>     ARM: tegra: Add pllc clock init table
>    =20
>     pll_c will be used as a clock source. Fill in tegra_pll_c_freq_ta=
ble[]
>     so that it's possible to explicitly initialize the PLL.
>    =20
>     NVIDIA's downstream nv-3.1 kernel and the ChromeOS kernel have di=
fferent
>     pll_c tables. nv-3.1 contains entries for 522MHz and 598MHz outpu=
t,
>     whereas the ChromeOS kernel contains entries for 600MHz output. I=
 chose
>     to upstream the ChromeOS values for now, since the 600MHz rate ap=
pears
>     to match the default rate of this PLL when the HW boots, and it's=
 not
>     clear to me why 522 or 598MHz are more useful.
>    =20
>     Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>     Signed-off-by: Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>     Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>     [swarren: wrote commit description]
