From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v10 1/9] dt-bindings: phy: Add NVIDIA Tegra XUSB pad
 controller binding
Date: Fri, 4 Mar 2016 22:31:45 -0600
Message-ID: <20160305043145.GL13525@rob-hp-laptop>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 04, 2016 at 05:19:31PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The NVIDIA Tegra XUSB pad controller provides a set of pads, each with a
> set of lanes that are used for PCIe, SATA and USB.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v10:
> - clarify that the hardware documentation means something different when
>   referring to a "port" (intra-SoC connectivity)
> 
> Changes in v9:
> - rename UTMI -> USB2 to match hardware documentation
> - reword according to suggestions by Stephen Warren
> - make Tegra132 compatible string list consistent
> - remove mailbox support
> 
>  .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   | 376 +++++++++++++++++++++
>  .../pinctrl/nvidia,tegra124-xusb-padctl.txt        |   5 +
>  2 files changed, 381 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt

Without really understanding the h/w here, looks okay to me.

Acked-by: Rob Herring <robh@kernel.org>

> +SoC include:
> +
> +	padctl@0,7009f000 {

Drop the comma. Commas should only be used if there are distinct fields.

If I get my dtc patch done, these are going to start warning, so you 
might want to go fix dts files (assuming that's where this is coming 
from).

Rob
