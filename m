From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH 0/7] PCI irq mapping fixes and cleanups
Date: Sat, 1 Mar 2014 11:30:59 -0700
Message-ID: <20140301183059.GA6315@obsidianresearch.com>
References: <1393608523-17509-1-git-send-email-l.stach@pengutronix.de>
 <CAJ+vNU2VN5haOU2GN5o7UUg9vgYh06pAhvDaoGw6EzTBEbD0mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJ+vNU2VN5haOU2GN5o7UUg9vgYh06pAhvDaoGw6EzTBEbD0mg@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Tim Harvey <tharvey@gateworks.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jingoo Han <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org, Richard Zhu <r65037@freescale.com>, Sascha Hauer <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Bjorn Helgaas <bhelgaas@google.com>, Simon Horman <horms@verge.net.au>, Thierry Reding <thierry.reding@gmail.com>, Ben Dooks <ben-linux@fluff.org>, linux-tegra@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 28, 2014 at 04:53:33PM -0800, Tim Harvey wrote:

> In testing this on IMX6 I'm finding that 'of_irq_parse_and_map_pci()'
> always returns -EINVAL because it can't find a dt node for the host
> bridge: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/of/of_pci_irq.c#n60.

There may be some kind of issue in the pcie-designware.c:

static struct pci_bus *dw_pcie_scan_bus(int nr, struct pci_sys_data *sys)
{
        struct pci_bus *bus;
        struct pcie_port *pp = sys_to_pcie(sys);

        if (pp) {
                pp->root_bus_nr = sys->busnr;
                bus = pci_scan_root_bus(NULL, sys->busnr, &dw_pcie_ops,
                                     ^^^^^^^^^^^
                                     Shouldn't be null for DT cases.

Perhaps since the driver doesn't pass in a parent pointer, no parent
device is associated with the struct pci_bus that gets created, so
pci_bus_to_OF_node will always fail and the DT PCI mechanisms become
broken.

Jason
