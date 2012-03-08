From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 06/11] PCI: Keep pci_fixup_irqs() around after init
Date: Thu, 8 Mar 2012 11:41:13 -0700
Message-ID: <CAErSpo5rsepKu5yP=f83CadfX3acpV+WP9NuC4nf3FqhPW5Enw@mail.gmail.com>
References: <1331218291-16119-1-git-send-email-thierry.reding@avionic-design.de>
 <1331218291-16119-7-git-send-email-thierry.reding@avionic-design.de>
 <CAErSpo6hbWjteESST1+O2WzbtmZq6hC-pnUB4o3MAXWG-EgU+g@mail.gmail.com> <20120308183731.GA25254@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20120308183731.GA25254@avionic-0098.mockup.avionic-design.de>
Sender: linux-pci-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: linux-tegra@vger.kernel.org, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, linux-pci@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 8, 2012 at 11:37 AM, Thierry Reding
<thierry.reding@avionic-design.de> wrote:
> * Bjorn Helgaas wrote:
>> Hmm, your patch looks OK as far as it goes, but the implementation of
>> pci_fixup_irqs() as a call-once-at-boot-time thing with a loop through
>> all the PCI devices we've found so far looks completely broken with
>> regard to hotplug.
>>
>> Who does the swizzle for devices hot-added after boot?
>
> Perhaps I should have mentioned this in the commit message, but the patch
> isn't actually used in a hotplug scenario. In fact, the code is still run
> once at boot time, only very late. Grant's deferred probing allows the
> PCIe controller driver to postpone initialization until all the devices
> that it depends on (regulators) have been probed. This has the side-effect
> that the probing actually takes place *after* code and data annotated with
> __init have already been freed.

Oh, I know *you're* not using the hotplug scenario.  I'm just thinking
that the PCi core looks a little broken in that scenario.

I think your patch is fine; it's just that I think the PCI core needs
a little more attention in this area.

Bjorn
