From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH v10 1/9] dt-bindings: phy: Add NVIDIA Tegra XUSB pad
 controller binding
Date: Fri, 4 Mar 2016 13:36:11 -0800
Message-ID: <CAL1qeaGyd8PLm22XwGHUr+oFeVy2EnT0ipBYJGNkFL9FKrxvjw@mail.gmail.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On Fri, Mar 4, 2016 at 8:19 AM, Thierry Reding <thierry.reding@gmail.com> wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> The NVIDIA Tegra XUSB pad controller provides a set of pads, each with a
> set of lanes that are used for PCIe, SATA and USB.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Thanks, this binding looks much better, IMO.  A couple small comments below...

> +Port nodes:
> +===========
> +
> +A required child node named "ports" contains a list of all the ports exposed
> +by the XUSB pad controller. Per-port configuration is only required for USB.
> +
> +USB2 ports:
> +-----------
> +
> +Required properties:
> +- status: Defines the operation status of the port. Valid values are:
> +  - "disabled": the port is disabled
> +  - "okay": the port is enabled
> +- mode: A string that determines the mode in which to run the port. Valid
> +  values are:
> +  - "host": for USB host mode
> +  - "device": for USB device mode
> +  - "otg": for USB OTG mode
> +
> +Optional properties:
> +- nvidia,internal: A boolean property whose presence determines that a port
> +  is internal. In the absence of this property the port is considered to be
> +  external.
> +- vbus-supply: phandle to a regulator supplying the VBUS voltage.

Both Blaze and Smaug require an offset to be applied to the fused
HS_CURR_LEVEL value, so I think we need another property here for
that.

> +ULPI ports:
> +-----------
> +
> +Optional properties:
> +- status: Defines the operation status of the port. Valid values are:
> +  - "disabled": the port is disabled
> +  - "okay": the port is enabled
> +- nvidia,internal: A boolean property whose presence determines that a port
> +  is internal. In the absence of this property the port is considered to be
> +  external.
> +- vbus-supply: phandle to a regulator supplying the VBUS voltage.
> +
> +HSIC ports:
> +-----------
> +
> +Required properties:
> +- status: Defines the operation status of the port. Valid values are:
> +  - "disabled": the port is disabled
> +  - "okay": the port is enabled
> +
> +Optional properties:
> +- vbus-supply: phandle to a regulator supplying the VBUS voltage.

I believe this pin is named VDDIO_HSIC?

Also there are several other HSIC pad parameters (STROBE_TRIM,
DATA_TRIM, etc.) which probably should be supplied via DT.
