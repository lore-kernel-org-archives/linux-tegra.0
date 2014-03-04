From: Tim Harvey <tharvey@gateworks.com>
Subject: Re: [PATCH 1/2] of/irq: Fix irq-mapping in of_irq_parse_raw()
Date: Tue, 4 Mar 2014 11:40:46 -0800
Message-ID: <CAJ+vNU07D-u+-Lj5nOSveO94S93d_5=FKq34Gk2O2OVDRexWww@mail.gmail.com>
References: <1393944864-28113-1-git-send-email-tharvey@gateworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1393944864-28113-1-git-send-email-tharvey@gateworks.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jingoo Han <jg1.han@samsung.com>, Lucas Stach <l.stach@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Richard Zhu <r65037@freescale.com>, Sascha Hauer <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Bjorn Helgaas <bhelgaas@google.com>, Simon Horman <horms@verge.net.au>, Thierry Reding <thierry.reding@gmail.com>, Ben Dooks <ben-linux@fluff.org>, linux-tegra <linux-tegra@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Shawn Guo <shawn.guo@linaro.org>, Grant Likely <grant.likely@linaro.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 4, 2014 at 6:54 AM, Tim Harvey <tharvey@gateworks.com> wrote:
> When an interrupt-map contains multiple entries an imap pointer arithmetic
> bug can cause only the first entry to be properly evaluated and causes
> the out_irq parameters to be incorrect depending on the #interrupt-cells
> and #address-cells of the parent interrupt controller.
>
> Specifically, the imap pointer into the interrupt-map table should be
> adjusted by the parent interrupt controller #interrupt-cells size only
> as at this point the only the parent unit interrupt specifier needs to be
> stepped over.
>
> This resolves an issue encountered when using the of_irq_parse_and_map_pci()
> for the imx6 pcie host controller driver map_irq function where a P2P bridge
> is on the bus and legacy PCI interrupts are to be used.
>

Note the subject of my patch was incorrect - its a single patch, not a
series.  The subject should read:

[PATCH] of/irq: Fix irq-mapping in of_irq_parse_raw()

Sorry for the confusion,

Tim
