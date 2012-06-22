From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 07/10] ARM: tegra: pcie: Add device tree support
Date: Fri, 22 Jun 2012 05:46:52 -0600
Message-ID: <CAErSpo6vHn3p96o7DSdL28cjapk2UnQ4ZVJ1oH6ksxbqD=Hh-g@mail.gmail.com>
References: <4FD85127.8050301@firmworks.com> <20120614091905.GA9081@avionic-0098.mockup.avionic-design.de>
 <4FDA2DDA.1030704@wwwdotorg.org> <20120614192903.GA2212@avionic-0098.mockup.avionic-design.de>
 <4FDA40A0.4030206@wwwdotorg.org> <20120615061236.GA4081@avionic-0098.mockup.avionic-design.de>
 <20120619133001.GB24138@avionic-0098.mockup.avionic-design.de>
 <4FE0EFBB.6090206@firmworks.com> <20120621064722.GA1122@avionic-0098.mockup.avionic-design.de>
 <CAErSpo6Bpfqm-0yGiBOXEhF4kD3PTDYvWVr0babLZ4GkBLXJiA@mail.gmail.com> <20120622110038.GA15212@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20120622110038.GA15212@avionic-0098.mockup.avionic-design.de>
Sender: linux-pci-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Mitch Bradley <wmb@firmworks.com>, Stephen Warren <swarren@wwwdotorg.org>, Russell King <linux@arm.linux.org.uk>, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, Colin Cross <ccross@android.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 22, 2012 at 5:00 AM, Thierry Reding
<thierry.reding@avionic-design.de> wrote:
> On Fri, Jun 22, 2012 at 04:18:05AM -0600, Bjorn Helgaas wrote:
>> On Thu, Jun 21, 2012 at 12:47 AM, Thierry Reding
>> <thierry.reding@avionic-design.de> wrote:
>> > On Tue, Jun 19, 2012 at 11:31:39AM -1000, Mitch Bradley wrote:
>>
>> >> Version A - 3 address cells: =A0In this version, the intermediate
>> >> address space has 3 cells: =A0port#, address type, offset. =A0Add=
ress
>> >> type is
>> >> =A0 0 : root port
>> >> =A0 1 : config space
>> >> =A0 2 : extended config space
>> >> =A0 3 : I/O
>> >> =A0 4 : non-prefetchable memory
>> >> =A0 5 : prefetchable memory.
>> >>
>> >> The third cell "offset" is necessary so that the size field has a
>> >> number space that can include it.
>> >>
>> >> =A0 =A0 =A0 pcie-controller {
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-pcie";
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x80003000 0x00000800 =A0 /*=
 PADS registers */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x80003800 0x00000200>=
; /* extended configuration space */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 98 0x04 =A0 /* cont=
roller interrupt */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 99 0x04=
>; /* MSI interrupt */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D "disabled";
>> >>
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0 0 0 =A00x80000000 0x000=
01000 =A0 /* Root port 0 */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 1 0 =A00x800040=
00 0x00080000 =A0 /* Port 0 config space */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 2 0 =A00x801040=
00 0x00080000 =A0 /* Port 0 ext config space *
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 3 0 =A00x804000=
00 0x00008000 =A0 /* Port 0 downstream I/O */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 4 0 =A00x900000=
00 0x08000000 =A0 /* Port 0 non-prefetchable memory */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 5 0 =A00xa00000=
00 0x08000000 =A0 /* Port 0 prefetchable memory */
>> >>
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 0 0 =A00x800010=
00 0x00001000 =A0 /* Root port 1 */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 1 0 =A00x800040=
00 0x00080000 =A0 /* Port 1 config space */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 2 0 =A00x801840=
00 0x00080000 =A0 /* Port 1 ext config space */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 3 0 =A00x804080=
00 0x00010000 =A0 /* Port 1 downstream I/O */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 4 0 =A00x980000=
00 0x08000000 =A0 /* Port 1 non-prefetchable memory */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 5 0 =A00xa00000=
00 0x08000000>; /* Port 1 prefetchable memory */
>> >>
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <3>;
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
>> >>
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pci@0 {
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0 0 0 0x1000=
>;
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D "disabled"=
;
>> >>
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <3=
>;
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <2>;
>> >>
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x8000000=
0 0 0 =A00 1 0 =A00 0x00080000 =A0 /* config */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0=
x90000000 0 0 =A00 2 0 =A00 0x00080000 =A0 /* extended config */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0=
x81000000 0 0 =A00 3 0 =A00 0x00008000 =A0 /* I/O */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0=
x82000000 0 0 =A00 4 0 =A00 0x08000000 =A0 /* non-prefetchable memory *=
/
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0=
xc2000000 0 0 =A00 5 0 =A00 0x08000000>; /* prefetchable memory */
>> >>
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,ctrl-offset =3D=
 <0x110>;
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,num-lanes =3D =
<2>;
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> >>
>> >>
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pci@1 {
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <1 0 0 0x1000=
>;
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D "disabled"=
;
>> >>
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <3=
>;
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <2>;
>> >>
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x8000000=
0 0 0 =A01 1 0 =A00 0x00080000 =A0 /* config */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0=
x90000000 0 0 =A01 2 0 =A00 0x00080000 =A0 /* extended config */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0=
x81000000 0 0 =A01 3 0 =A00 0x00008000 =A0 /* I/O */
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0=
x82000000 0 0 =A01 4 0 =A00 0x08000000 =A0 /* non-prefetchable memory *=
/
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0=
xc2000000 0 0 =A01 5 0 =A00 0x08000000>; /* prefetchable memory */
>> >>
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,ctrl-offset =3D=
 <0x118>;
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,num-lanes =3D =
<2>;
>> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>>
>> I'm not familiar with device tree, so pardon me if these are stupid
>> questions. =A0These seem to be describing PCI host bridges.
>
> Yes, correct.
>
>> I assume some of these ranges describe MMIO, prefetchable MMIO, and
>> I/O port apertures that the bridge forwards to the PCI bus.
>
> Yes.
>
>> Is there provision for any address offset applied by the bridge when
>> it forwards downstream? =A0(Maybe these bridges don't apply any offs=
et?)
>> =A0"0xa0000000 0x08000000" appears for both ports 0 and 1 prefetchab=
le
>> memory; I don't know if that's an error, an indication that each
>> bridge applies a different offset, or that both bridges forward the
>> same aperture (I hope not the latter, because Linux can't really dea=
l
>> with that).
>
> That seems to be a typo. It should have been 0xa8000000 in the second
> case. The PCIe controller has registers that are programmed with the
> aperture for the configuration and extended configuration spaces, as
> well as the downstream I/O, prefetchable and non-prefetchable memory
> regions.
>
> The configuration spaces aren't actually forwarded by the bridges, bu=
t
> are handled only by the controller.

Right.  The host bridge (controller) would convert memory accesses on
the upstream side into PCI config accesses on its downstream PCI
interface.

> The other apertures are programmed
> into the bridges using standard PCI registers.

If you're talking about programming host bridge apertures, there are
no "standard PCI registers" to do that.  The programming model of the
host bridge itself is not part of the PCI spec.  PCI-to-PCI bridge
apertures *are* specified by the PCI Bridge spec, so those are
standard.

>> Is the bus number aperture included somewhere? =A0How do we know wha=
t
>> bus numbers are available for allocation under each bridge?
>
> Not yet. I don't think DT imposes a bus number allocation on PCI
> bridges. However the matching of DT nodes to PCI bridges is done base=
d
> on the bus number. For that you provide a bus-ranges property which
> defines the bus aperture of the given PCI bridge. The DT matching cod=
e
> compares the first cell of this property with the primary bus number =
of
> the bridge.

I don't fully understand this, but I can tell you that things don't
work very well if we don't know the aperture.  We can make
assumptions, like the root bus is 00, and then enumerate everything
reachable from there.  But then all we know is the largest bus number
actually reachable from bus 00, which is usually smaller then the end
of the aperture.  We don't know how many unused bus numbers there are
in the aperture, so we can't safely allocate any for hot-added
devices.

> This is in fact somewhat counter-productive because it requires you t=
o
> hard-code the PCI hierarchy within the DT and you loose a lot of the
> probing functionality. This is not much of an issue for typical PCI
> endpoints (like network cards) but becomes a problem if you have a PC=
I
> endpoint that implements an I2C bus and you want to match I2C slaves =
on
> that bus to device nodes so that the kernel can parse and instantiate
> them properly. I guess in the latter cases hard-coding the PCI tree i=
n
> DT is not actually a drawback, though.
>
>> I see mention of config space. =A0Is some of that referring to the E=
CAM
>> as in 7.2.2 of the PCIe spec v3.0 (what we refer to as MMCONFIG on
>> x86)?
>
> I only have access to the PCIe 2.0 specification, but it seems to
> contain the same 7.2.2 section. In fact it looks as though this
> particular controller indeed implements something similar to ECAM. Th=
e
> address mapping is a little different, though:
>
> =A0 =A0 =A0 =A0A[(16 + n - 1):16]: bus number
> =A0 =A0 =A0 =A0A[15:11]: device number
> =A0 =A0 =A0 =A0A[10:8]: function number
> =A0 =A0 =A0 =A0A[7:2]: register number
> =A0 =A0 =A0 =A0A[1:0]: unused
>
> That information comes directly from the driver and I have no access =
to
> the corresponding documentation. It seems like the extended
> configuration space is accessed using the same mapping but starting a=
t a
> different base address.
>
> But now that you mention it, maybe the driver code is buggy here, and
> the controller indeed implements ECAM. Furthermore it also seems like
> the current code doesn't work for the extended configuration space
> because while the correct offset into the extended configuration spac=
e
> is chosen, the access to registers is done using the same mapping as
> above, so instead of the 12 (10) bits required for the register numbe=
r
> only 8 (6) are in fact used.
>
> I wonder whether anyone's actually tested this.
>
> Stephen: can you try to find out whether the Tegra PCIe controller
> indeed implements ECAM, or if this scheme is actually just a propriet=
ary
> variant?

It'd be a real shame if they made up a proprietary scheme when ECAM
seems to be required by the spec.  I'm interested because the current
MMCONFIG code seems unnecessarily x86-specific, and I expect every
arch with PCIe would want to use ECAM, so maybe there's some chance
for a generic implementation.
