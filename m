From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH 0/7] PCI irq mapping fixes and cleanups
Date: Mon, 3 Mar 2014 11:01:43 -0700
Message-ID: <20140303180143.GC31062@obsidianresearch.com>
References: <1393608523-17509-1-git-send-email-l.stach@pengutronix.de>
 <CAJ+vNU2VN5haOU2GN5o7UUg9vgYh06pAhvDaoGw6EzTBEbD0mg@mail.gmail.com>
 <20140301183059.GA6315@obsidianresearch.com>
 <000601cf36b8$330b3a90$9921afb0$%han@samsung.com>
 <CAJ+vNU3UL+LTWnoxW7scAig19=z2xoYCA-HZ6a7GUyGEXtKK9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJ+vNU3UL+LTWnoxW7scAig19=z2xoYCA-HZ6a7GUyGEXtKK9Q@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Tim Harvey <tharvey@gateworks.com>
Cc: Jingoo Han <jg1.han@samsung.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Richard Zhu <r65037@freescale.com>, Simon Horman <horms@verge.net.au>, Thierry Reding <thierry.reding@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, Kukjin Kim <kgene.kim@samsung.com>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 03, 2014 at 09:49:52AM -0800, Tim Harvey wrote:

> I'm not clear why irq 20 is getting returned for all the slots with
> (slot%4)=0 and func=0.  If I start debugging of_irq_parse_pci() I see
> that it walks up the tree until it gets to the pcie host controller
> then calls of_irq_parse_raw() which is returning irq20 or -EINVAL.

Can you share your DT as well?

Jason
