From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 07/10] ARM: tegra: pcie: Add device tree support
Date: Fri, 22 Jun 2012 04:18:05 -0600
Message-ID: <CAErSpo6Bpfqm-0yGiBOXEhF4kD3PTDYvWVr0babLZ4GkBLXJiA@mail.gmail.com>
References: <4FD849CF.4030009@firmworks.com> <20120613081910.GB6528@avionic-0098.mockup.avionic-design.de>
 <4FD85127.8050301@firmworks.com> <20120614091905.GA9081@avionic-0098.mockup.avionic-design.de>
 <4FDA2DDA.1030704@wwwdotorg.org> <20120614192903.GA2212@avionic-0098.mockup.avionic-design.de>
 <4FDA40A0.4030206@wwwdotorg.org> <20120615061236.GA4081@avionic-0098.mockup.avionic-design.de>
 <20120619133001.GB24138@avionic-0098.mockup.avionic-design.de>
 <4FE0EFBB.6090206@firmworks.com> <20120621064722.GA1122@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120621064722.GA1122-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 21, 2012 at 12:47 AM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> On Tue, Jun 19, 2012 at 11:31:39AM -1000, Mitch Bradley wrote:

>> Version A - 3 address cells: =A0In this version, the intermediate
>> address space has 3 cells: =A0port#, address type, offset. =A0Addres=
s
>> type is
>> =A0 0 : root port
>> =A0 1 : config space
>> =A0 2 : extended config space
>> =A0 3 : I/O
>> =A0 4 : non-prefetchable memory
>> =A0 5 : prefetchable memory.
>>
>> The third cell "offset" is necessary so that the size field has a
>> number space that can include it.
>>
>> =A0 =A0 =A0 pcie-controller {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-pcie";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x80003000 0x00000800 =A0 /* PA=
DS registers */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x80003800 0x00000200>; /=
* extended configuration space */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 98 0x04 =A0 /* control=
ler interrupt */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 99 0x04>; =
/* MSI interrupt */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D "disabled";
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0 0 0 =A00x80000000 0x000010=
00 =A0 /* Root port 0 */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 1 0 =A00x80004000 =
0x00080000 =A0 /* Port 0 config space */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 2 0 =A00x80104000 =
0x00080000 =A0 /* Port 0 ext config space *
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 3 0 =A00x80400000 =
0x00008000 =A0 /* Port 0 downstream I/O */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 4 0 =A00x90000000 =
0x08000000 =A0 /* Port 0 non-prefetchable memory */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 5 0 =A00xa0000000 =
0x08000000 =A0 /* Port 0 prefetchable memory */
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 0 0 =A00x80001000 =
0x00001000 =A0 /* Root port 1 */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 1 0 =A00x80004000 =
0x00080000 =A0 /* Port 1 config space */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 2 0 =A00x80184000 =
0x00080000 =A0 /* Port 1 ext config space */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 3 0 =A00x80408000 =
0x00010000 =A0 /* Port 1 downstream I/O */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 4 0 =A00x98000000 =
0x08000000 =A0 /* Port 1 non-prefetchable memory */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 5 0 =A00xa0000000 =
0x08000000>; /* Port 1 prefetchable memory */
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <3>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pci@0 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0 0 0 0x1000>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D "disabled";
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <3>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <2>;
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x80000000 0=
 0 =A00 1 0 =A00 0x00080000 =A0 /* config */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x90=
000000 0 0 =A00 2 0 =A00 0x00080000 =A0 /* extended config */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x81=
000000 0 0 =A00 3 0 =A00 0x00008000 =A0 /* I/O */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x82=
000000 0 0 =A00 4 0 =A00 0x08000000 =A0 /* non-prefetchable memory */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0xc2=
000000 0 0 =A00 5 0 =A00 0x08000000>; /* prefetchable memory */
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,ctrl-offset =3D <=
0x110>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,num-lanes =3D <2>=
;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>>
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pci@1 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <1 0 0 0x1000>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D "disabled";
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <3>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <2>;
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x80000000 0=
 0 =A01 1 0 =A00 0x00080000 =A0 /* config */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x90=
000000 0 0 =A01 2 0 =A00 0x00080000 =A0 /* extended config */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x81=
000000 0 0 =A01 3 0 =A00 0x00008000 =A0 /* I/O */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x82=
000000 0 0 =A01 4 0 =A00 0x08000000 =A0 /* non-prefetchable memory */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0xc2=
000000 0 0 =A01 5 0 =A00 0x08000000>; /* prefetchable memory */
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,ctrl-offset =3D <=
0x118>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,num-lanes =3D <2>=
;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 };

I'm not familiar with device tree, so pardon me if these are stupid
questions.  These seem to be describing PCI host bridges.  I assume
some of these ranges describe MMIO, prefetchable MMIO, and I/O port
apertures that the bridge forwards to the PCI bus.

Is there provision for any address offset applied by the bridge when
it forwards downstream?  (Maybe these bridges don't apply any offset?)
 "0xa0000000 0x08000000" appears for both ports 0 and 1 prefetchable
memory; I don't know if that's an error, an indication that each
bridge applies a different offset, or that both bridges forward the
same aperture (I hope not the latter, because Linux can't really deal
with that).

Is the bus number aperture included somewhere?  How do we know what
bus numbers are available for allocation under each bridge?

I see mention of config space.  Is some of that referring to the ECAM
as in 7.2.2 of the PCIe spec v3.0 (what we refer to as MMCONFIG on
x86)?
