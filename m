From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/7] PCI irq mapping fixes and cleanups
Date: Fri, 28 Feb 2014 21:04:14 +0100
Message-ID: <201402282104.14295.arnd@arndb.de>
References: <1393608523-17509-1-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1393608523-17509-1-git-send-email-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org, Richard Zhu <r65037@freescale.com>, kernel@pengutronix.de, linux-sh@vger.kernel.org, Tim Harvey <tharvey@gateworks.com>, Stephen Warren <swarren@wwwdotorg.org>, Bjorn Helgaas <bhelgaas@google.com>, Simon Horman <horms@verge.net.au>, Thierry Reding <thierry.reding@gmail.com>, Ben Dooks <ben-linux@fluff.org>, linux-tegra@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Friday 28 February 2014, Lucas Stach wrote:
> This series cleans up the PCI irq mapping for all
> the ARM PCI host drivers, so they handle it in the
> way defined in the common PCI bindings.
> 
> Testing appreciated.
> 
> Lucas Stach (7):
>   ARM: dts: tegra: add PCIe interrupt mapping properties
>   PCI: tegra: use new OF interrupt mapping when possible
>   PCI: rcar: use new OF interrupt mapping when possible
>   ARM: dts: exynos5440: fix PCIe interrupt mapping
>   ARM: dts: imx6: add PCIe interrupt mapping properties
>   PCI: designware: use new OF interrupt mapping when possible
>   PCI: designware: split samsung and fsl bindings

Patches 1-6

Acked-by: Arnd Bergmann <arnd@arndb.de>

For the last patch, the clock information looks like it needs to
be fixed. I realize that you are just documenting what the driver
is using at the moment, but that is not a proper way of establishing
a binding.

	Arnd
