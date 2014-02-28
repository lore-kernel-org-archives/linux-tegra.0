From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/7] PCI: designware: split samsung and fsl bindings
Date: Fri, 28 Feb 2014 21:03:01 +0100
Message-ID: <201402282103.01897.arnd@arndb.de>
References: <1393608523-17509-1-git-send-email-l.stach@pengutronix.de>
 <1393608523-17509-8-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1393608523-17509-8-git-send-email-l.stach@pengutronix.de>
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
> +Required properties:
> +- compatible: "fsl,imx6q-pcie"
> +- reg: base addresse and length of the pcie controller
> +- interrupts: First entry must contain interrupt handle for controller
> +  INTA output.

I think this should be documented as "optional" and only for
backwards compatibility with old kernels.

> +- clocks: Must contain an entry for each entry in clock-names.
> +       See ../clocks/clock-bindings.txt for details.
> +- clock-names: Must include the following entries: 
> +       - "pcie_ref_125m"
> +       - "sata_ref_100m"
> +       - "lvds_gate"
> +       - "pcie_axi"

I don't understand why you have completely different clocks here
from the exynos documentation. The clock names should really be
the same. Also, why do you have a "sata_ref_100m" clock?
Is this just driving a device that happens to be on-board
for a specific machine? Same for the "lvds_gate".

	Arnd
