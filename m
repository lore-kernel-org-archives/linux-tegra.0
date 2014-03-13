From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] ARM: DT: fix gic interrupt controller documentation
Date: Thu, 13 Mar 2014 11:44:33 -0600
Message-ID: <5321EE81.1030207@wwwdotorg.org>
References: <1394732405-2260-1-git-send-email-tharvey@gateworks.com> <1394732405-2260-2-git-send-email-tharvey@gateworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1394732405-2260-2-git-send-email-tharvey@gateworks.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Tim Harvey <tharvey@gateworks.com>, linux-pci@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jingoo Han <jg1.han@samsung.com>, Lucas Stach <l.stach@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Richard Zhu <r65037@freescale.com>, Sascha Hauer <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, Simon Horman <horms@verge.net.au>, Thierry Reding <thierry.reding@gmail.com>, Ben Dooks <ben-linux@fluff.org>, linux-tegra <linux-tegra@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Shawn Guo <shawn.guo@linaro.org>, Grant Likely <grant.likely@linaro.org>
List-Id: linux-tegra@vger.kernel.org

On 03/13/2014 11:40 AM, Tim Harvey wrote:
> When using interrupt-maps, the size of a map entry is #address-cells +
>  #interrupt-cells for the parent interrupt controller.  For the ARM GIC
> address-cells should be 0 as this is not used.
> 
> This patch fixes the example by correctly specifying #address-cells = 0.

If the #address-cells property is required (well, or even optional...)
in the node, shouldn't it be included in the list of required/optional
properties above, and not solely included in the example?
