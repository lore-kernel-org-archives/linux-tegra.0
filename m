From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: convert tegra20 to GIC devicetree binding
Date: Thu, 17 Nov 2011 13:41:28 -0700
Message-ID: <CACxGe6vP3dFUeSN0xLPi0iywGbdtZLgieD1k=5z2EiS9cw6VsA@mail.gmail.com>
References: <1321542430-17971-1-git-send-email-pdeschrijver@nvidia.com>
 <4EC52BCF.7020609@gmail.com> <20111117155428.GS19069@tbergstrom-lnx.Nvidia.com>
 <CACxGe6ub2QBO0ZLwNdSvMxP1U087pqL-qL+dfWAbn-08gBQyvg@mail.gmail.com> <4EC54132.5070908@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4EC54132.5070908-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 17, 2011 at 10:15 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> On 11/17/2011 10:53 AM, Grant Likely wrote:
>>
>> On Nov 17, 2011 8:54 AM, "Peter De Schrijver" <pdeschrijver@nvidia.c=
om
>> <mailto:pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>> wrote:
>>>
>>> On Thu, Nov 17, 2011 at 04:44:15PM +0100, Rob Herring wrote:
>>> > On 11/17/2011 09:07 AM, Peter De Schrijver wrote:
>>> > > Convert tegra20 IRQ intialization to the GIC devicetree binding=
=2E
>> Modify the
>>> > > interrupt definitions in the dts files according to
>>> > > Documentation/devicetree/bindings/arm/gic.txt
>>> > >
>>> > > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
>> <mailto:pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>>
>>> >
>>> > One minor comment below, but otherwise:
>>> >
>>> > Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
>> <mailto:rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>>
>>> >
>>> > > ---
>>> > > =A0arch/arm/boot/dts/tegra-paz00.dts | =A0 =A02 +-
>>> > > =A0arch/arm/boot/dts/tegra20.dtsi =A0 =A0| =A0 52
>> ++++++++++++++++++------------------
>>> > > =A0arch/arm/mach-tegra/irq.c =A0 =A0 =A0 =A0 | =A0 18 +++++++++=
++-
>>> > > =A03 files changed, 43 insertions(+), 29 deletions(-)
>>> > >
>>> > > diff --git a/arch/arm/boot/dts/tegra-paz00.dts
>> b/arch/arm/boot/dts/tegra-paz00.dts
>>> > > index 15a949f..7ff8f6f 100644
>>> > > --- a/arch/arm/boot/dts/tegra-paz00.dts
>>> > > +++ b/arch/arm/boot/dts/tegra-paz00.dts
>>> > > @@ -32,7 +32,7 @@
>>> > > =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
>>> > > =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,nvec";
>>> > > =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x7000C500 0x100>;
>>> > > - =A0 =A0 =A0 =A0 =A0 interrupts =3D <124>;
>>> > > + =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 92 0x04>;
>>> > > =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <80000>;
>>> > > =A0 =A0 =A0 =A0 =A0 =A0 request-gpios =3D <&gpio 170 0>;
>>> > > =A0 =A0 =A0 =A0 =A0 =A0 slave-addr =3D <138>;
>>> > > diff --git a/arch/arm/boot/dts/tegra20.dtsi
>> b/arch/arm/boot/dts/tegra20.dtsi
>>> > > index 795b921..cd01b01 100644
>>> > > --- a/arch/arm/boot/dts/tegra20.dtsi
>>> > > +++ b/arch/arm/boot/dts/tegra20.dtsi
>>> > > @@ -5,9 +5,9 @@
>>> > > =A0 =A0 interrupt-parent =3D <&intc>;
>>> > >
>>> > > =A0 =A0 intc: interrupt-controller@50041000 {
>>> > > - =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-gic";
>>> > > + =A0 =A0 =A0 =A0 =A0 compatible =3D "arm,cortex-a9-gic";
>>> > > =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>>> >
>>> > You should add an "interrupt-parent;" here so the gic's parent is=
 null
>>> > and not the gic.
>>>
>>> Ok. I will add that in the next version.
>>
>> No, there is no need to do that, nor is it convention. The gic node
>> doesn't have an interrupts property, so the interrupt-parent is irre=
levant.
>>
> Can't resist the inbox? Go back to your sabbatical.. :) We discussed
> this before and I though agreed this was the correct approach.

It's a little hard to stop cold turkey.  :-(

Yup, we had discussed it (and your description below jogged my
memory), but I don't remember talking about adding an empty
interrupt-parent property.  I only remember making sure that
of_irq_find_parent() got fixed.

> It inherits the interrupt-parent from the parent node. Originally
> of_irq_find_parent would return that node, but this was fixed. So it
> doesn't really matter from a functional standpoint.
>
> So is no interrupt parent defined as no interrupts property or
> interrupt-parent being null phandle?

There is no precedence for setting a null interrupt-parent and no need
to, so I say just leave it out.

>> Rob, perhaps we should adjust of_init_irq() to only set the parent
>> pointer if interrupts is present.
>>
>
> It works correctly already either way.

Okay, I wasn't sure.  Let's leave it alone.

g.
