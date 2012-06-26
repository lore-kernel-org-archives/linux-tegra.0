From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Tue, 26 Jun 2012 11:46:42 -0600
Message-ID: <4FE9F582.6010805@wwwdotorg.org>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de> <4FE9B291.2020305@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FE9B291.2020305-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/26/2012 07:01 AM, Terje Bergstr=F6m wrote:
> On 26.06.2012 13:55, Thierry Reding wrote:
=2E..
>> An alternative would be to call of_platform_populate() from the host=
1x

[alternative to making the host1x node contain compatible=3D"simple-bus=
".]

>> driver. This has the advantage that it could integrate better with t=
he
>> host1x bus implementation that Terje is working on, but it also need=
s
>> additional code to tear down the devices when the host1x driver is
>> unloaded because a module reload would try to create duplicate devic=
es
>> otherwise.
>=20
> Yes, we already have a bus_type for nvhost, and we have nvhost_device
> and nvhost_driver that device from device and device_driver
> respectively. They all accommodate some host1x client device common
> behavior and data that we need to store. We use the bus_type also to
> match each device and driver together, but the matching is version
> sensitive. For example, Tegra2 3D needs different driver than Tegra3 =
3D.

I'd certainly like to see some upstream discussion re: why exactly we
have a custom bus type here. What does it do that a regular platform bu=
s
doesn't do? Are those features something that would be generally useful
to add to the existing platform bus? Can we instead add hooks into
platform bus rather than creating a new bus? I recall you saying that
the nvhost_bus duplicated a lot of code from the existing platform bus.
