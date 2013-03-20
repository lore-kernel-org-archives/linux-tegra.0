From: kishon <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: tegra: finalize USB EHCI and PHY bindings
Date: Wed, 20 Mar 2013 16:49:26 +0530
Message-ID: <51499B3E.3080602@ti.com>
References: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com> <1363609781-4045-2-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363609781-4045-2-git-send-email-vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Monday 18 March 2013 05:59 PM, Venu Byravarasu wrote:
> The existing Tegra USB bindings have a few issues:
>
> 1) Many properties are documented as being part of the EHCI controller
> node, yet they apply more to the PHY device. They should be moved.
>
> 2) Some registers in PHY1 are shared with PHY3, and hence PHY3 needs a
> reg entry to point at PHY1's register space. We can't assume the PHY1
> driver is present, so the PHY3 driver will directly access those
> registers.
>
> 3) The list of clocks required by the PHY was missing some required
> entries.
>
> This patch fixes the binding definition to resolve these issues.
>
> Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   .../bindings/usb/nvidia,tegra20-ehci.txt           |   27 +++----------------
>   .../bindings/usb/nvidia,tegra20-usb-phy.txt        |   27 +++++++++++++++++--
>   2 files changed, 29 insertions(+), 25 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
> index 34c9528..df09330 100644
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
> @@ -6,27 +6,10 @@ Practice : Universal Serial Bus" with the following modifications
>   and additions :
>
>   Required properties :
> - - compatible : Should be "nvidia,tegra20-ehci" for USB controllers
> -   used in host mode.
> - - phy_type : Should be one of "ulpi" or "utmi".
> - - nvidia,vbus-gpio : If present, specifies a gpio that needs to be
> -   activated for the bus to be powered.
> - - nvidia,phy : phandle of the PHY instance, the controller is connected to.
> -
> -Required properties for phy_type == ulpi:
> -  - nvidia,phy-reset-gpio : The GPIO used to reset the PHY.
> + - compatible : Should be "nvidia,tegra20-ehci".
> + - nvidia,phy : phandle of the PHY that the controller is connected to.
> + - clocks : Contains a single entry which defines the USB controller's clock.
>
>   Optional properties:
> -  - dr_mode : dual role mode. Indicates the working mode for
> -   nvidia,tegra20-ehci compatible controllers.  Can be "host", "peripheral",
> -   or "otg".  Default to "host" if not defined for backward compatibility.
> -      host means this is a host controller
> -      peripheral means it is device controller
> -      otg means it can operate as either ("on the go")
> -  - nvidia,has-legacy-mode : boolean indicates whether this controller can
> -    operate in legacy mode (as APX 2500 / 2600). In legacy mode some
> -    registers are accessed through the APB_MISC base address instead of
> -    the USB controller. Since this is a legacy issue it probably does not
> -    warrant a compatible string of its own.
> -  - nvidia,needs-double-reset : boolean is to be set for some of the Tegra2
> -    USB ports, which need reset twice due to hardware issues.
> + - nvidia,needs-double-reset : boolean is to be set for some of the Tegra20
> +   USB ports, which need reset twice due to hardware issues.
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
> index 6bdaba2..7ceccd3 100644
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
> @@ -4,8 +4,24 @@ The device node for Tegra SOC USB PHY:
>
>   Required properties :
>    - compatible : Should be "nvidia,tegra20-usb-phy".
> - - reg : Address and length of the register set for the USB PHY interface.
> - - phy_type : Should be one of "ulpi" or "utmi".
> + - reg : Defines the following set of registers, in the order listed:
> +   - The PHY's own register set.
> +     Always present.
> +   - The register set of the PHY containing the UTMI pad control registers.
> +     Present if-and-only-if phy_type == utmi.
> + - phy_type : Should be one of "utmi", "ulpi" or "hsic".

dt property names generally dont have "_".

Thanks
Kishon
