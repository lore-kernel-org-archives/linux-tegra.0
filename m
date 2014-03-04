From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/7] PCI: designware: split samsung and fsl bindings
Date: Tue, 4 Mar 2014 15:53:39 +0100
Message-ID: <201403041553.40202.arnd@arndb.de>
References: <1393608523-17509-1-git-send-email-l.stach@pengutronix.de> <201402282103.01897.arnd@arndb.de> <1393942383.9405.8.camel@weser.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1393942383.9405.8.camel@weser.hi.pengutronix.de>
Sender: linux-sh-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-sh@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Simon Horman <horms@verge.net.au>, Shawn Guo <shawn.guo@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Jingoo Han <jg1.han@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Tim Harvey <tharvey@gateworks.com>, Richard Zhu <r65037@freescale.com>, kernel@pengutronix.de
List-Id: linux-tegra@vger.kernel.org

On Tuesday 04 March 2014, Lucas Stach wrote:
> Right, we should be able to reuse the clock names. Though I'm not really
> sure how the Samsung clocks maps to those used on i.MX, as the names are
> a bit generic. Maybe someone from Samsung could shed a bit of light on
> this.
> 
> On i.MX6 the clock names (which I have to agree are pretty bad) map as
> follows:
> pcie_axi: host controller main register/bus access clock
> pcie_ref_125m: pcie phy reference clock
> 
> sata_ref_100m: pcie bus 100MHz reference clock

That doesn't explain why it's called "sata_ref_100m".

> lvds_gate: bad abstraction. Decides if the reference clock is sourced
> internal (i.e. the 100MHz ref clock above) or from an SoC external
> source. We should really find a better way of representing this in the
> clock tree.

I don't understand this description at all. Can you try to explain that
with different words?

	Arnd
