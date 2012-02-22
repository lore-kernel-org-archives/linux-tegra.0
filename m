From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: PCIe device tree support
Date: Wed, 22 Feb 2012 08:01:55 -0800
Message-ID: <CAErSpo4TfpGmx+HZ1ZnZwj3ZP_cQMCzkMT+6JK6ztYp2zWJcxw@mail.gmail.com>
References: <20120220191804.GA14499@avionic-0098.adnet.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF17BD8BC302@HQMAIL01.nvidia.com> <20120222082449.GA15157@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120222082449.GA15157-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 22, 2012 at 12:24 AM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> [Adding Jesse Barnes and the linux-pci mailing list to CC.]
>
> * Stephen Warren wrote:
>> Thierry Reding wrote at Monday, February 20, 2012 12:18 PM:
>> > I would like to add device tree support for the Tegra2 PCIe controller. From
>> > what I understand this will require the PCIe code to be rewritten as a proper
>> > platform driver in order to be able to instantiate it via the device tree. Is
>> > that correct?
>>
>> That's probably the cleanest way, yes.
>>
>> Is there a drivers/ directory for PCI/PCIe host controllers? Moving the
>> code there might be nice if so, although IIRC when I asked Olof about
>> that a number of months back, he said quite a few host controllers were
>> in arch/...
>
> Most PCI/PCIe host controller drivers seem to currently be in arch/. Is there
> a specific reason for this? Would it be acceptable to put any new drivers
> below drivers/pci/?

PCI host bridges aren't architected, so discovering them and their
properties has historically been mostly architecture-specific.  ACPI
is one exception (with a driver in drivers/acpi/pci_root.c) and it
sounds like device tree might be a similar exception.  If you can make
a non-arch-specific driver and put it somewhere other than arch/, I'm
all in favor of that, especially if you can make it usable by other
arches that use device tree.  Where to put it?  I dunno.  drivers/pci/
sounds like a reasonable possibility.

Bjorn
