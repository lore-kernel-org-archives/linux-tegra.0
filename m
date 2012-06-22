From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 07/10] ARM: tegra: pcie: Add device tree support
Date: Fri, 22 Jun 2012 10:49:42 -0600
Message-ID: <CAErSpo56=S2oQ0usYfH28T0178SQUBD=5jqmcKWCT6M5WUQF6g@mail.gmail.com>
References: <4FDA2DDA.1030704@wwwdotorg.org> <CAErSpo6vHn3p96o7DSdL28cjapk2UnQ4ZVJ1oH6ksxbqD=Hh-g@mail.gmail.com>
 <20120622124311.GA21606@avionic-0098.mockup.avionic-design.de> <201206221303.21985.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201206221303.21985.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yinghai Lu <yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 22, 2012 at 7:03 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 22 June 2012, Thierry Reding wrote:
>> On Fri, Jun 22, 2012 at 05:46:52AM -0600, Bjorn Helgaas wrote:
>> > On Fri, Jun 22, 2012 at 5:00 AM, Thierry Reding
>> > <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
>> > >> Is the bus number aperture included somewhere? =A0How do we kno=
w what
>> > >> bus numbers are available for allocation under each bridge?
>> > >
>> > > Not yet. I don't think DT imposes a bus number allocation on PCI
>> > > bridges. However the matching of DT nodes to PCI bridges is done=
 based
>> > > on the bus number. For that you provide a bus-ranges property wh=
ich
>> > > defines the bus aperture of the given PCI bridge. The DT matchin=
g code
>> > > compares the first cell of this property with the primary bus nu=
mber of
>> > > the bridge.
>> >
>> > I don't fully understand this, but I can tell you that things don'=
t
>> > work very well if we don't know the aperture. =A0We can make
>> > assumptions, like the root bus is 00, and then enumerate everythin=
g
>> > reachable from there. =A0But then all we know is the largest bus n=
umber
>> > actually reachable from bus 00, which is usually smaller then the =
end
>> > of the aperture. =A0We don't know how many unused bus numbers ther=
e are
>> > in the aperture, so we can't safely allocate any for hot-added
>> > devices.
>
> I believe the assumption today is that all bus numbers are ok on each
> root port, which is usually the case. There was something about a Pow=
er
> Mac that faked a single PCI bus number space across both an AGP and
> a PCIe domain in pmac_pci_fixup_u4_of_node(), but I think that is the
> exception.
>
> Is there any requirement to use a bus aperture on non-PC hardware?

The requirement (if there is one) isn't anything related to PC-ness.
I just don't understand how things can actually work if two host
bridges both claim the same bus number.  If we do a config read to
that bus, both bridges should claim it and turn it into config cycles
on their respective root buses, and we should get two responses.  I
would expect the second response to cause an "unexpected response"
machine check or similar.

Beyond that, Yinghai's recent "busn-alloc" work (now in my -next
branch) tracks bus number assignments using a struct resource tree,
and that obviously won't work with overlaps.  Here's one of the
relevant commits:
http://git.kernel.org/?p=3Dlinux/kernel/git/helgaas/pci.git;a=3Dcommitd=
iff;h=3D5cc62c202211096ec26309722ec27455d52c8726

>> I think DT support for PCI is lacking in a lot of areas. PowerPC see=
ms
>> to be the only architecture actively setting up busses according to =
the
>> bus-range property specified in the DT. All other architectures seem=
 to
>> not pre-allocate bus apertures and go with the default instead. From
>> what you say that means hot-plugging is out. Although I don't think =
the
>> Tegra PCIe controller even supports hot-plugging.
>
> If the default is allowing any bus numbers, and that matches the
> hardware capabilities, I think hot-plugging would work.
>
> =A0 =A0 =A0 =A0Arnd
