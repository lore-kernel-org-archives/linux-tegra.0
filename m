From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Wed, 27 Jun 2012 08:10:46 +0300
Message-ID: <4FEA95D6.5030400@nvidia.com>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de> <4FE9B291.2020305@nvidia.com> <20120626134122.GA1115@avionic-0098.mockup.avionic-design.de> <4FE9C0E9.7060301@nvidia.com> <4FE9F457.6090104@wwwdotorg.org> <20120626192712.GA5247@avionic-0098.adnet.avionic-design.de> <4FEA0F99.3080603@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FEA0F99.3080603-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 26.06.2012 22:38, Stephen Warren wrote:

> I would assume this can safely be inferred from the compatible value;
> nvidia,tegra20-host1x v.s. nvidia,tegra30-host1x, and so there's no
> need to represent this in DT. I would assume (and it's certainly just
> an assumption) that there are numerous other small details that are
> different between the two SoCs, and so the driver will need to have
> some table mapping from compatible value to various information
> anyway. Terje, can you confirm/deny this (and hopefully use your
> knowledge of any future chips to guide the decision without giving
> anything away)?


I'll now discuss what is going in our internal driver, which will be
visible in our public git tree at some point.

Regarding just host1x, I have just parameterized per SoC the following
properties in the driver:
 * number of sync points
 * number of channels
 * number of wait bases
 * number of mlocks

In addition to this, per SoC we parameterize the mapping of sync points
to channels, the names of sync points (for debugging purposes) and
whether sync point is stream managed or client managed.

For host1x and other devices, we have parameters indicating ability to
power gate, idle times before clock gating and power gating, power
domain ids (also used for resetting), associated clocks and some other
stuff. In the driver parameters we have function pointers for context
management and clock scaling.

Of these, possibility to power gate, power domain ids, number of
resources are hardware properties, and rest are more of less agreements
on how software uses the resources. Context management is in the
borderline - each SoC has its own sequence to save and restore a context
for 3D and MPE.

We will also have different register layouts for host1x in different
SoCs and I have recently made nvhost ready for that.

Everything else except the register layout and the context management
could be encoded into device trees. The remaining things will ensure
that we will need to have some SoC specific code in the driver.

Terje
