From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Wed, 27 Jun 2012 09:13:52 +0300
Message-ID: <4FEAA4A0.3060407@nvidia.com>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de> <4FE9B291.2020305@nvidia.com> <4FE9F582.6010805@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FE9F582.6010805-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 26.06.2012 20:46, Stephen Warren wrote:

> I'd certainly like to see some upstream discussion re: why exactly we
> have a custom bus type here. What does it do that a regular platform bus
> doesn't do? Are those features something that would be generally useful
> to add to the existing platform bus? Can we instead add hooks into
> platform bus rather than creating a new bus? I recall you saying that
> the nvhost_bus duplicated a lot of code from the existing platform bus.

Yes, the code is largely a copy of platform bus. One big difference is
type safety - all the nvhost_bus APIs take in and give out nvhost_device
or nvhost_driver pointers. At the registration time I also enforce
parent-child relationship to host1x and bus clients.

Another is that I am able to enumerate all host1x related devices. The
latter could of course be done via listing the children of host1x.

And third is that I was able to add version field to device to
distinguish between Tegra2 and Tegra3 3D (for example) and make the bus
use that information for binding driver and device. As the sysfs entry
path is determined by the device name, this allows keeping the old sysfs
APIs.

As you can see, most of the reasons are more related to convenience than
own bus_type being the only way to implement them.

Terje
