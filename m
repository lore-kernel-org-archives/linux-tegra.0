From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 8/8] drm: tegra: Add gr2d device
Date: Sun, 10 Feb 2013 16:42:53 -0800
Message-ID: <51183E8D.1090607@nvidia.com>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com> <1358250244-9678-9-git-send-email-tbergstrom@nvidia.com> <20130204125618.GD595@avionic-0098.mockup.avionic-design.de> <511095F9.6040607@nvidia.com> <20130205095403.GF20437@avionic-0098.mockup.avionic-design.de> <5112C9C5.8080205@nvidia.com> <20130208070734.GB15429@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130208070734.GB15429-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07.02.2013 23:07, Thierry Reding wrote:
> On Wed, Feb 06, 2013 at 01:23:17PM -0800, Terje Bergstr=C3=B6m wrote:
>>>> That's the security firewall. It walks through each submit, and en=
sures
>>>> that each register write that writes an address, goes through the =
host1x
>>>> reloc mechanism. This way user space cannot ask 2D to write to arb=
itrary
>>>> memory locations.
>>> I see. Can this be made more generic? Perhaps adding a table of val=
id
>>> registers to the device and use a generic function to iterate over =
that
>>> instead of having to provide the same function for each client.
>> For which one does gcc generate more efficient code? I've thought a
>> switch-case statement might get compiled into something more efficie=
nt
>> than a table lookup.
>> But the rest of the code is generic - just the one function which
>> compares against known address registers is specific to 2D.
> Table lookup should be pretty fast. I wouldn't worry too much about
> performance at this stage, though. Readability is more important in m=
y
> opinion. A lookup table is a lot more readable and reusable I think. =
If
> it turns out that using a function is actually faster we can always
> optimize later.

You're right about performance. We already saw quite a bad performance
hit with the current firewall, so we'll need to worry about performance
later.

I'll take a look at converting the register list to a table. Instead of
always doing a linear search of a table, a bitfield might be more
appropriate.

Terje
