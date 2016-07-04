From: Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH v2 1/2] PCI: Add new method for registering PCI hosts
Date: Mon, 4 Jul 2016 10:56:27 +0100
Message-ID: <20160704095627.GG8609@e106497-lin.cambridge.arm.com>
References: <20160630151931.29216-1-thierry.reding@gmail.com>
 <4061641.rLdO1g8OBR@wuerfel>
 <20160701160923.GF8609@e106497-lin.cambridge.arm.com>
 <3872522.jdXcQClxV5@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3872522.jdXcQClxV5@wuerfel>
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Tomasz Nowicki <tn@semihalf.com>, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 01, 2016 at 06:30:24PM +0200, Arnd Bergmann wrote:
> On Friday, July 1, 2016 5:09:23 PM CEST Liviu Dudau wrote:
> > > > >=20
> > > > > The main idea is to pull the allocation of 'struct pci_host_b=
ridge' out
> > > > > of the registration, and let individual host drivers and arch=
itecture
> > > > > code fill the members before calling the registration functio=
n.
> > > >=20
> > > > That's how we got into the arch/arm mess that we currently have=
=2E The host driver
> > > > should not drive the instantiation of the pci_host_bridge struc=
ture because it
> > > > will prevent you from having two drivers running at the same ti=
me.
> > >=20
> > > Can you clarify that? I don't see what prevents two drivers from =
each
> > > creating a pci_host_bridge structure and passing it into
> > > pci_host_bridge_register().
> >=20
> > Maybe I'm exagerating a bit, but I always disliked the pci_common_i=
nit() function and
> > the way it is creating a pci_host_bridge while relying on hw_pci ho=
oks to get
> > things ready. I'm pretty sure there are still issues around the fac=
t that a lot of
> > platform drivers have a subsys_initcall() function that calls pci_c=
ommon_init(). I
> > don't want us to go down that path again.
>=20
> I see what you mean now, and I agree we don't want to do this like
> pci_common_init(), but the patch here does a number of things very
> differently:
>=20
> - it's not architecture specific
> - it is not tied into architecture specific pcibios_* functions
> - it does not create multiple bridges at once
> - it does not have three levels of callbacks going back and forth,
>   the idea is to eventually end up with one structure for the
>   callback pointers including those that today are done as __weak
>   functions.
>=20
> Today we only have four callers of pci_common_init_dev that probe the
> PCI host from DT: cns3xxx, versatile, mvebu and rcar-gen2. I hope
> we can replace all of them with the new method here directly and
> not take any intermediate steps.
>=20
> The users of pci_common_init() (not _dev) are limited to board files
> on really old platforms that are either not getting updated (ixp, iop=
,
> footbridge, ks8695, mv78xx0, sa1100) or that have DT based replacemen=
t
> code coming (dove, orion5x, cns3xxx, integrator).
>=20
> > Don't get me wrong, clearly someone needs to create an instance of =
pci_host_bridge.
> > What I want people to accept is that in the PCI(e) architecture the=
re is nothing that
> > stops a piece of HW that used to be the bridge between host and und=
erlying bus into
> > becoming the bridge between a higher PCI(e) bus and the bus underne=
ath. If the writes
> > to the configuration registers happens somehow, the Host Bridge doe=
sn't even know if
> > it is talking to the actual host. Can the driver in that case make =
sure it did not made
> > assumptions that were tied to a specific SoC implementation?
>=20
> Sorry, I'm not really following what you mean with that, or what the
> consequence is for the Linux implementation. Can you try to rephrase =
this?

I'm thinking drivers expecting to drive the bridge between the host and=
 the PCI bus.
When that HW is used to bridge between another bus (PCI or PCIe) becaus=
e the
functionality was there all the time in terms of signals, the driver's =
assumptions
break down. But maybe I'm being too theoretical and such beasts don't e=
xist? (I remember
seeing a network card that had native PCI chip plus an added PCIe-to-PC=
I bridge and
the driver was tripping badly, but I can't remember the exact details.

Best regards,
Liviu

>=20
> 	Arnd
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
