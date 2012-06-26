From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Tue, 26 Jun 2012 11:41:43 -0600
Message-ID: <4FE9F457.6090104@wwwdotorg.org>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de> <4FE9B291.2020305@nvidia.com> <20120626134122.GA1115@avionic-0098.mockup.avionic-design.de> <4FE9C0E9.7060301@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FE9C0E9.7060301-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/26/2012 08:02 AM, Terje Bergstr=C3=B6m wrote:
> On 26.06.2012 16:41, Thierry Reding wrote:
>=20
>> On Tue, Jun 26, 2012 at 04:01:05PM +0300, Terje Bergstr=C3=B6m wrote=
:
>>> We also assign certain host1x common resources per device by conven=
tion,
>>> f.ex. sync points, channels etc. We currently encode that informati=
on in
>>> the device node (3D uses sync point number X, 2D uses numbers Y and=
 Z).
>>> The information is not actually describing hardware, as it just
>>> describes the convention, so I'm not sure if device tree is the pro=
per
>>> place for it.
>> Are they configurable? If so I think we should provide for them bein=
g
>> specified in the device tree. They are still hardware resources bein=
g
>> assigned to devices.
>=20
> Yes, they're configurable, and there's nothing hardware specific in t=
he
> assignment of a sync point to a particular use. It's all just a softw=
are
> agreement. That's why I'm a bit hesitant on putting it in device tree=
s,
> which are supposed to only describe hardware.

So I think that the DT can describe the existence of sync-points
(presumably include a node for the sync-point HW device if it's
separate). However, since the usage of each sync-point is entirely
arbitrary, that seems like something which should be either assigned
dynamically at run-time, or at least managed/assigned in SW at runtime
somehow, rather than hard-coded into DT; it's more policy than HW.

>>> Either way is fine for me. The full addresses are more familiar to =
me as
>>> we tend to use them internally.
>
>> Using the OF mechanism for translating the host1x bus addresses,
>> relative to the host1x base address, to CPU addresses seems "purer",=
 but
>> either way should work fine.
>=20
> I'll let you decide, as I don't have a strong opinion either way. I
> guess whatever is the more common way wins.

I'd certainly prefer all the nodes to use the full/absolute address.
That way, the DT will exactly match the addresses in the documentation.
