From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: PCIe device tree support
Date: Tue, 28 Feb 2012 11:17:15 -0700
Message-ID: <CAErSpo4ACvHS7CdL4MGDXkhJfrrTpp2Pb9YDrZ5dwCffLZ2Z-g@mail.gmail.com>
References: <20120220191804.GA14499@avionic-0098.adnet.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF17BD8BC302@HQMAIL01.nvidia.com>
 <20120222082449.GA15157@avionic-0098.adnet.avionic-design.de>
 <CAErSpo4TfpGmx+HZ1ZnZwj3ZP_cQMCzkMT+6JK6ztYp2zWJcxw@mail.gmail.com>
 <20120223060355.GA21091@avionic-0098.mockup.avionic-design.de> <CAErSpo7wSB-uCjV4YeA-fUOHPtugn4ASXScN3MndVybfkk8mOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAErSpo7wSB-uCjV4YeA-fUOHPtugn4ASXScN3MndVybfkk8mOw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 23, 2012 at 10:49 AM, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> w=
rote:
> On Wed, Feb 22, 2012 at 10:03 PM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
>> * Bjorn Helgaas wrote:
>>> On Wed, Feb 22, 2012 at 12:24 AM, Thierry Reding
>>> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
>>> > [Adding Jesse Barnes and the linux-pci mailing list to CC.]
>>> >
>>> > * Stephen Warren wrote:
>>> >> Thierry Reding wrote at Monday, February 20, 2012 12:18 PM:
>>> >> > I would like to add device tree support for the Tegra2 PCIe co=
ntroller. From
>>> >> > what I understand this will require the PCIe code to be rewrit=
ten as a proper
>>> >> > platform driver in order to be able to instantiate it via the =
device tree. Is
>>> >> > that correct?
>>> >>
>>> >> That's probably the cleanest way, yes.
>>> >>
>>> >> Is there a drivers/ directory for PCI/PCIe host controllers? Mov=
ing the
>>> >> code there might be nice if so, although IIRC when I asked Olof =
about
>>> >> that a number of months back, he said quite a few host controlle=
rs were
>>> >> in arch/...
>>> >
>>> > Most PCI/PCIe host controller drivers seem to currently be in arc=
h/. Is there
>>> > a specific reason for this? Would it be acceptable to put any new=
 drivers
>>> > below drivers/pci/?
>>>
>>> PCI host bridges aren't architected, so discovering them and their
>>> properties has historically been mostly architecture-specific. =A0A=
CPI
>>> is one exception (with a driver in drivers/acpi/pci_root.c) and it
>>> sounds like device tree might be a similar exception. =A0If you can=
 make
>>> a non-arch-specific driver and put it somewhere other than arch/, I=
'm
>>> all in favor of that, especially if you can make it usable by other
>>> arches that use device tree. =A0Where to put it? =A0I dunno. =A0dri=
vers/pci/
>>> sounds like a reasonable possibility.
>>
>> I don't think it would be possible to write a driver that works for =
all
>> device tree based boards or architectures. As you said the implement=
ation is
>> very hardware specific and probably couldn't even be generalized amo=
ng two
>> chipsets of the same architecture.
>
> Host bridges may be hardware-specific, but the PCI core really only
> needs an abstract description. =A0It needs the bus number aperture, t=
he
> I/O port apertures, the MMIO apertures, and associated offsets betwee=
n
> CPU and PCI bus addresses. =A0I don't know anything about device tree=
,
> but I'd be surprised and disappointed if it encodes this basic
> information in platform-specific ways.

This made me curious, so I poked around at the callers of
of_get_property("bus-range").  Most of these callers are basically PCI
host bridge drivers, though they aren't really structured as drivers.
They have a very consistent structure of the form:

    for_each_compatible_node(np, "pci", "mpc10x-pci")
        pcibios_alloc_controller()
        of_get_property(dev, "bus-range", &len)
        pci_process_bridge_OF_ranges()
            of_get_property(dev, "ranges", &rlen)
            ...
        pci_create_root_bus()

This basic pattern is used twenty or more times already!  There are
definitely variations and some platform-specific pieces, but I think
there's certainly the possibility of making some of this code more
generic, since the information used by the PCI core seems to be
described consistently across platforms.

Bjorn
