From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Tue, 26 Jun 2012 17:02:17 +0300
Message-ID: <4FE9C0E9.7060301@nvidia.com>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de> <4FE9B291.2020305@nvidia.com> <20120626134122.GA1115@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120626134122.GA1115-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 26.06.2012 16:41, Thierry Reding wrote:

> On Tue, Jun 26, 2012 at 04:01:05PM +0300, Terje Bergstr=C3=B6m wrote:
>> We also assign certain host1x common resources per device by convent=
ion,
>> f.ex. sync points, channels etc. We currently encode that informatio=
n in
>> the device node (3D uses sync point number X, 2D uses numbers Y and =
Z).
>> The information is not actually describing hardware, as it just
>> describes the convention, so I'm not sure if device tree is the prop=
er
>> place for it.
> Are they configurable? If so I think we should provide for them being
> specified in the device tree. They are still hardware resources being
> assigned to devices.


Yes, they're configurable, and there's nothing hardware specific in the
assignment of a sync point to a particular use. It's all just a softwar=
e
agreement. That's why I'm a bit hesitant on putting it in device trees,
which are supposed to only describe hardware.

>> Yes, we already have a bus_type for nvhost, and we have nvhost_devic=
e
>> and nvhost_driver that device from device and device_driver
>> respectively. They all accommodate some host1x client device common
>> behavior and data that we need to store. We use the bus_type also to
>> match each device and driver together, but the matching is version
>> sensitive. For example, Tegra2 3D needs different driver than Tegra3=
 3D.
>=20
> We'll have to figure out the best place to put this driver. The drive=
r
> will need some code to instantiate its children from the DT and fill =
the
> nvhost_device structures with the data parsed from it.


True. We could say that the host1x driver is the "father", and will hav=
e
to instantiate the nvhost device structs for the children. We just have
to ensure the correct ordering at boot-up.

> BTW, what's the reason for calling it nvhost and not host1x?


When I started, there was only one driver and one device, and all clien=
t
devices were just hidden as internal implementation details. Thus the
driver wasn't really "host1x" driver. Now we refer to the collection of
drivers for host1x and client devices as nvhost.

>> Either way is fine for me. The full addresses are more familiar to m=
e as
>> we tend to use them internally.
> Using the OF mechanism for translating the host1x bus addresses,
> relative to the host1x base address, to CPU addresses seems "purer", =
but
> either way should work fine.


I'll let you decide, as I don't have a strong opinion either way. I
guess whatever is the more common way wins.

>> We use carveout for Tegra2. Memory management is a big question mark
>> still for tegradrm that I'm trying to find a solution for.
> AIUI CMA is one particular implementation of the carveout concept, so=
 I
> think we should use it, or extend it if it doesn't suit us.


Here I'd refer to Hiroshi's message: host1x driver doesn't need to know
the details of what memory management we use. We'll just hide that fact
behind one of the memory management APIs that nvhost uses.

Terje
