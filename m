From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: tegra: Add auxiliary data for nvhost
Date: Mon, 26 Nov 2012 15:53:06 -0700
Message-ID: <50B3F2D2.2030702@wwwdotorg.org>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com> <1353577684-7896-3-git-send-email-tbergstrom@nvidia.com> <20121123234527.GE21555@avionic-0098.adnet.avionic-design.de> <50B07297.3090001@nvidia.com> <20121124191103.GD26154@avionic-0098.adnet.avionic-design.de> <50B338F2.5060501@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B338F2.5060501-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/26/2012 02:40 AM, Terje Bergstr=C3=B6m wrote:
> On 24.11.2012 21:11, Thierry Reding wrote:
>> On Sat, Nov 24, 2012 at 09:09:11AM +0200, Terje Bergstr=C3=B6m wrote=
:
>>> The host1x specifics (number of channels, pts etc) are description =
of
>>> hardware, so they could go to a device tree binding.
>>
>> I'm not sure that's even required. The number of syncpoints and chan=
nels
>> should be static for a particular version of SoC, right? In that cas=
e it
>> can be derived from the DT compatible property, can't it?
>=20
> I might be a bit confused here about the purpose of device trees.
>=20
> The register aperture, irqs and enumerated list of devices could also=
 be
> derived from the information about host1x compatibility properly. The=
y
> don't change within SoC version. Why do we have them in device tree?

That's potentially true.

But, consider something like an I2C controller. We have 4 or 5 instance=
s
of that. Each has a different register base, IRQ, etc. Hence, the
per-instance information is in DT. Some HW modules are singleton so
putting req/IRQ in DT might not be strictly necessary, but then the
argument becomes that its better to be consistent and get reg/IRQ from
DT in all cases, not only where strictly necessary.

Another question is: Can we support likely future HW versions just by
changing DT data? If so, putting the data in DT is probably a good
things. Lets say that Tegra20 and Tegra30 host1x are exactly identical
except for a different base address and different # of syncpoint
registers. If we put that information in DT, we don't even need to add =
a
new compatible value to the driver, nor a new table mapping that
compatible value to the # syncpoints. That means new HW support without
having to write code. There is obviously a trade-off to make in order t=
o
decide exactly what's best to go into DT and what's best to go into the
driver. Something simple like #syncpoints might do well in DT. Somethin=
g
like the entire Tegra pin controller pin/group/... definitions don't
really make sense to put in DT.
