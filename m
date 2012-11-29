From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC v2 1/8] video: tegra: Add nvhost driver
Date: Thu, 29 Nov 2012 11:34:14 -0700
Message-ID: <50B7AAA6.70702@wwwdotorg.org>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-2-git-send-email-tbergstrom@nvidia.com> <20121128212301.GA25531@avionic-0098.adnet.avionic-design.de> <50B73710.2040102@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B73710.2040102-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/29/2012 03:21 AM, Terje Bergstr=F6m wrote:
> On 28.11.2012 23:23, Thierry Reding wrote:
=2E..
>>> +     regs =3D platform_get_resource(dev, IORESOURCE_MEM, 0);
>>> +     intr0 =3D platform_get_resource(dev, IORESOURCE_IRQ, 0);
>>> +     intr1 =3D platform_get_resource(dev, IORESOURCE_IRQ, 1);
>>> +
>>> +     if (!regs || !intr0 || !intr1) {
>>
>> I prefer to have these checked for explicitly, one by one for
>> readability and potentially more useful diagnostics.
>=20
> Can do.
>=20
>> Also you should be using platform_get_irq() for interrupts. Furtherm=
ore
>> the host1x DT node (and the TRM) name the interrupts "syncpt" and
>> "general", so maybe those would be more useful variable names than
>> "intr0" and "intr1".
>>
>> But since you don't use them anyway they shouldn't be part of this
>> patch.
>=20
> True. I might also as well delete the general interrupt altogether, a=
s
> we don't use it for any real purpose.

Do make sure the interrupts still are part of the DT binding though, so
that the binding fully describes the HW, and the interrupt is available
to retrieve if we ever do use it in the future.

>>> +     for (i =3D 0; i < pdata->num_clks; i++)
>>> +             clk_prepare_enable(pdata->clk[i]);
>>> +     nvhost_syncpt_reset(&host->syncpt);
>>> +     for (i =3D 0; i < pdata->num_clks; i++)
>>> +             clk_disable_unprepare(pdata->clk[i]);
>>
>> Stephen already hinted at this when discussing the AUXDATA. You shou=
ld
>> explicitly request the clocks.
>=20
> I'm not too happy about that idea. The clock management code is gener=
ic
> for all modules, and that's why it's driven by a data structure. Now
> Stephen and you ask me to unroll the loops and make copies of the cod=
e
> to facilitate different modules and different SoCs.

You can still create tables of clocks inside the driver and loop over
them. So, loop unrolling isn't related to my comments at least. It's
just that clk_get() shouldn't take its parameters from platform data.

But if these are clocks for (arbitrary) child modules (that may or may
not exist dynamically), why aren't the drivers for the child modules
managing them?
