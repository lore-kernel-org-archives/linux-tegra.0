From: Srikanth Thokala <sriku.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/6] PCI: tegra: use new OF interrupt mapping when possible
Date: Mon, 14 Apr 2014 16:26:33 +0530
Message-ID: <CA+mB=1KTqmTW9=NftNXM9V7Pms7zpMHbsW6oThf=cPJ1qGLriw@mail.gmail.com>
References: <1394025951-32438-1-git-send-email-l.stach@pengutronix.de>
	<1394025951-32438-3-git-send-email-l.stach@pengutronix.de>
	<5318B232.2020507@wwwdotorg.org>
	<1394127555.4582.1.camel@weser.hi.pengutronix.de>
	<CA+mB=1JCjDMzTuctvSQgjNhBnkyUPC2ooAzJOX_PC5L1gAau8w@mail.gmail.com>
	<20140411204140.GA8967@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140411204140.GA8967-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Apr 12, 2014 at 2:11 AM, Jason Gunthorpe
<jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org> wrote:
> On Fri, Apr 11, 2014 at 11:10:59PM +0530, Srikanth Thokala wrote:
>
>> I see this error too on my setup (Xilinx PCIe Root Complex Driver),
>> https://lkml.org/lkml/2014/3/3/183
>
>> After digging into it, I see I need to override the API
>> pcibios_get_phb_of_node()
>
> No, as I pointed out before, the DT node comes in through
> pci_scan_root_bus:

Thanks Jason for the advice, it is working.

Srikanth

>
> +static struct pci_bus __init *xilinx_pcie_scan_bus(int nr,
> +                               struct pci_sys_data *sys)
> +{
> +       struct xilinx_pcie_port *port = sys_to_pcie(sys);
> +       struct pci_bus *bus;
> +
> +       if (port) {
> +               port->root_busno = sys->busnr;
> +               bus = pci_scan_root_bus(NULL, sys->busnr, &xilinx_pcie_ops,
>                                        ^^^^^^
>
> You can't pass NULL here and have DT work properly.
>
> See http://www.spinics.net/lists/arm-kernel/msg312392.html
>
> Jason
