From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Tue, 26 Jun 2012 13:38:01 -0600
Message-ID: <4FEA0F99.3080603@wwwdotorg.org>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de> <4FE9B291.2020305@nvidia.com> <20120626134122.GA1115@avionic-0098.mockup.avionic-design.de> <4FE9C0E9.7060301@nvidia.com> <4FE9F457.6090104@wwwdotorg.org> <20120626192712.GA5247@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120626192712.GA5247-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/26/2012 01:27 PM, Thierry Reding wrote:
> On Tue, Jun 26, 2012 at 11:41:43AM -0600, Stephen Warren wrote:
>> On 06/26/2012 08:02 AM, Terje Bergstr=C3=B6m wrote:
>>> On 26.06.2012 16:41, Thierry Reding wrote:
>>>=20
>>>> On Tue, Jun 26, 2012 at 04:01:05PM +0300, Terje Bergstr=C3=B6m
>>>> wrote:
>>>>> We also assign certain host1x common resources per device
>>>>> by convention, f.ex. sync points, channels etc. We
>>>>> currently encode that information in the device node (3D
>>>>> uses sync point number X, 2D uses numbers Y and Z). The
>>>>> information is not actually describing hardware, as it
>>>>> just describes the convention, so I'm not sure if device
>>>>> tree is the proper place for it.
>>>> Are they configurable? If so I think we should provide for
>>>> them being specified in the device tree. They are still
>>>> hardware resources being assigned to devices.
>>>=20
>>> Yes, they're configurable, and there's nothing hardware
>>> specific in the assignment of a sync point to a particular use.
>>> It's all just a software agreement. That's why I'm a bit
>>> hesitant on putting it in device trees, which are supposed to
>>> only describe hardware.
>>=20
>> So I think that the DT can describe the existence of sync-points=20
>> (presumably include a node for the sync-point HW device if it's=20
>> separate). However, since the usage of each sync-point is
>> entirely arbitrary, that seems like something which should be
>> either assigned dynamically at run-time, or at least
>> managed/assigned in SW at runtime somehow, rather than hard-coded
>> into DT; it's more policy than HW.
>=20
> The sync-points are part of the host1x device as I understand it.
> If their usage is truly generic, then we can probably ignore them
> safely. Maybe it'd make sense to carry a property that defines the
> number of sync points available for the host1x hardware represented
> by the DT?

I would assume this can safely be inferred from the compatible value;
nvidia,tegra20-host1x v.s. nvidia,tegra30-host1x, and so there's no
need to represent this in DT. I would assume (and it's certainly just
an assumption) that there are numerous other small details that are
different between the two SoCs, and so the driver will need to have
some table mapping from compatible value to various information
anyway. Terje, can you confirm/deny this (and hopefully use your
knowledge of any future chips to guide the decision without giving
anything away)?
