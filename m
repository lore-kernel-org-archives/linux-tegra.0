From: Olof Johansson <olof@lixom.net>
Subject: Re: PCIe device tree support
Date: Thu, 23 Feb 2012 08:17:41 -0800
Message-ID: <CAOesGMh2QfmPdnrEVO4K_oMSsYJ_+T150s3dJgVZs0HFkH_XpA@mail.gmail.com>
References: <20120220191804.GA14499@avionic-0098.adnet.avionic-design.de>
	<74CDBE0F657A3D45AFBB94109FB122FF17BD8BC302@HQMAIL01.nvidia.com>
	<20120222082449.GA15157@avionic-0098.adnet.avionic-design.de>
	<CAErSpo4TfpGmx+HZ1ZnZwj3ZP_cQMCzkMT+6JK6ztYp2zWJcxw@mail.gmail.com>
	<20120223060355.GA21091@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20120223060355.GA21091@avionic-0098.mockup.avionic-design.de>
Sender: linux-pci-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Stephen Warren <swarren@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Jesse Barnes <jbarnes@virtuousgeek.org>, linux-pci@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Wed, Feb 22, 2012 at 10:03 PM, Thierry Reding
<thierry.reding@avionic-design.de> wrote:
> * Bjorn Helgaas wrote:
>> On Wed, Feb 22, 2012 at 12:24 AM, Thierry Reding
>> <thierry.reding@avionic-design.de> wrote:
>> > [Adding Jesse Barnes and the linux-pci mailing list to CC.]
>> >
>> > * Stephen Warren wrote:
>> >> Thierry Reding wrote at Monday, February 20, 2012 12:18 PM:
>> >> > I would like to add device tree support for the Tegra2 PCIe con=
troller. From
>> >> > what I understand this will require the PCIe code to be rewritt=
en as a proper
>> >> > platform driver in order to be able to instantiate it via the d=
evice tree. Is
>> >> > that correct?
>> >>
>> >> That's probably the cleanest way, yes.
>> >>
>> >> Is there a drivers/ directory for PCI/PCIe host controllers? Movi=
ng the
>> >> code there might be nice if so, although IIRC when I asked Olof a=
bout
>> >> that a number of months back, he said quite a few host controller=
s were
>> >> in arch/...
>> >
>> > Most PCI/PCIe host controller drivers seem to currently be in arch=
/. Is there
>> > a specific reason for this? Would it be acceptable to put any new =
drivers
>> > below drivers/pci/?
>>
>> PCI host bridges aren't architected, so discovering them and their
>> properties has historically been mostly architecture-specific. =A0AC=
PI
>> is one exception (with a driver in drivers/acpi/pci_root.c) and it
>> sounds like device tree might be a similar exception. =A0If you can =
make
>> a non-arch-specific driver and put it somewhere other than arch/, I'=
m
>> all in favor of that, especially if you can make it usable by other
>> arches that use device tree. =A0Where to put it? =A0I dunno. =A0driv=
ers/pci/
>> sounds like a reasonable possibility.
>
> I don't think it would be possible to write a driver that works for a=
ll
> device tree based boards or architectures. As you said the implementa=
tion is
> very hardware specific and probably couldn't even be generalized amon=
g two
> chipsets of the same architecture.
>
> However there has recently been a lot of work to move out arch-specif=
ic
> drivers for PWM, GPIO and others out of arch/ and into respective dir=
ectories
> below drivers/. The reason I asked was because I think the same could=
 be done
> for PCI/PCIe.


Right. PCI/PCIe host bridges tend to be custom. Well, I'm sure some
vendors share some of the IP, but I'm not sure how much of the
programming interface comes with that and how much is actually their
own. So, either way, there's only a few ARM platforms so far with
PCI/PCIe, and I think we can keep the logic under arch/arm for them
for now. If more start to show up and we want to move it out, we can
do so.

Sorry for being silent on this thread as well -- I've been travelling
and offline a bit. It shouldn't be too hard to modify the tegra pcie
driver to probe through the device tree, to start with you pretty much
just need to describe the register range with a reg property and a
compatible field to bind against. Some of the powerpc platforms do
similar things, so take a look at how they do it.


-Olof
