From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 2/2] ARM:Tegra: Device Tree Support: Initialize audio card
 gpio's from the device tree.
Date: Thu, 2 Jun 2011 09:40:05 -0600
Message-ID: <BANLkTikyDmPiSWFh2yemsz3Uk6UWu0Fksw@mail.gmail.com>
References: <20110527205444.21000.90209.stgit@riker> <20110527205721.21000.78599.stgit@riker>
 <20110528012427.GB5971@opensource.wolfsonmicro.com> <BANLkTinKLcYmStvBEGDcN84BapJXe5Y5bg@mail.gmail.com>
 <20110530033826.GE4130@opensource.wolfsonmicro.com> <20110530061155.GC23517@ponder.secretlab.ca>
 <4DE336A1.5040509@firmworks.com> <20110530070138.GA5036@opensource.wolfsonmicro.com>
 <8d2515b13c817cc956b185d043bcef00@kernel.crashing.org> <BANLkTi=hkScxYpt449CQCky+bLU3UvkC_A@mail.gmail.com>
 <4DE403C5.7060003@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4DE403C5.7060003-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, May 30, 2011 at 2:53 PM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrot=
e:
> Perhaps the interrupt-mapping binding is not the best model. =A0Inter=
rupt
> hardware in general is hierarchical but is not isomorphic to the phys=
ical
> addressing hierarchy of the device tree.
>
> GPIOs share the need to "point across the tree to different nodes", b=
ut it
> is unclear that there is a need for a entirely different hierarchy.
>
> That suggests the possibility of using the device tree addressing mec=
hanism
> as much as possible. =A0Normal device tree addresses could be used to=
 specify
> GPIO numbers.
>
> Suppose we have:
>
> =A0 =A0 =A0 =A0gpio-controller1: gpio-controller {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#address-cells =3D <2>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#mode-cells =3D <2>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpio1: gpio@12,0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <12 0>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mode =3D <55 66>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0usage =3D "Audio Codec chip se=
lect"; =A0/* Optional */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0gpio-controller2: gpio-controller {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #mode-cells =3D <1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio2: gpio@4 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <4>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #mode-cells =3D <1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0[...]
> =A0 =A0 =A0 =A0chipsel-gpio =3D =A0<&gpio1>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&gpio-controller1 13 =
0 55 77>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<0>, /* holes are perm=
itted, means no GPIO 2 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&gpio2 88>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&gpio-controller2 5 1=
>;
>
>
> A GPIO spec consist of:
>
> 1) A reference to either a gpio-controller or a gpio device node.
>
> 2) 0 or more address cells, according to the value of #address-cells =
in the
> referenced node. =A0If the node has no #address-cells property, the v=
alue is
> assumed to be 0.
>
> 3) 0 or more mode cells, according to the value of #mode-cells in the
> referenced node.

I can see having nodes for individual gpios being useful in
circumstances, but I really don't like having multiple methods of
specifying a gpio (handle to the gpio-controller, or a handle to the
gpio node, and a different specifier depending on the contents of the
target node).  I think it will be less confusing for users if the
reference is always to the gpio controller.  A specific gpio
controller can still use child nodes to capture extra information
about specific gpios, but doing so doesn't need to be exposed to a
gpio consumer; it can all be internal to the gpio controller and its
hardware specific binding (since any mode details are going to be
hardware specific anyway most likely).

[Amending to the above which was written before you latest post: even
with the refined proposal to link to only a child node, the gpio
specifier still changes depending on the contents of the child node]

If a gpio controller does use child nodes, then I do like the approach
of using #{address,size}-cells to line up with gpio numbering.
However, we've already got a definition of #gpio-cells in use which
specifies the total number of cells for a '*-gpio' property binding,
so I do want to take care not to conflict with the existing pattern.
I suspect the solution would simply be to state that #gpio-cells >=3D
#address-cells must be true.

> In the example, the chipsel-gpio specs are interpreted as:
>
> <&gpio1> =A0- =A0refers to a pre-bound gpio device node, in which the=
 address
> (12 0) and mode (55 66) are specified within that node.
>
> <&gpio-controller1 13 0 55 77> =A0- =A0refers to a GPIO controller no=
de,
> specifing the address (13 0) and the mode (55 77) in the client's GPI=
O spec.
>
> <gpio2> =A0- =A0another reference to a gpio node on a different contr=
oller. =A0In
> this case the address (4) is bound in the gpio node, but the mode (88=
) is
> passed in from the client's GPIO spec.
>
> <&gpio-controller2 5 1> =A0- =A0another reference to a controller nod=
e, with a
> one-cell address (5) and a one-cell mode (1), according to the values=
 of
> #address-cells and #mode-cells in that controller node.
>
> I expect that the "pre-bound gpio node" case would get a lot of use i=
n
> practice, as it lets you isolate the client from the details of the
> interrupt controller addressing and modes. =A0In my experience, GPIOs=
 often
> get reassigned between revisions of the same board, especially early =
in the
> development cycle.

I'm not convinced that the pre-bound gpio node will be any better or
worse from a usability standpoint that direct references.  I've
certainly not had problems with keeping up with gpio moves (and
everything else moving) on the FPGA projects that I've worked with.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
