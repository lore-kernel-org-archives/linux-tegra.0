From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v10 6/9] dt-bindings: usb: Add NVIDIA Tegra XUSB
 controller binding
Date: Wed, 16 Mar 2016 12:08:05 -0600
Message-ID: <56E9A105.9010408@wwwdotorg.org>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
 <1457108379-20794-6-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457108379-20794-6-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/04/2016 09:19 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Add device-tree binding documentation for the XUSB controller present
> on Tegra124 and later SoCs. This controller supports USB 3.0 via an xHCI
> compliant interface.
>
> Based on work by Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>.

> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt

> +Required properties:

> +- nvidia,xusb-padctl: phandle to the XUSB pad controller that is used to
> +  configure the USB pads used by the XHCI controller

Is "global" access to the PADCTL DT node/driver required? I rather would 
have expected this binding to reference the port objects in the PADCTL 
node. Perhaps the intent is that drivers can use this property to go and 
read the port information directly from the PADCTL node and interpret it 
themselves without requiring the PADCTL driver to provide an interface 
for ports? I guess that would also explain why this binding references 
only PHYs and not ports:

> +Optional properties:
> +--------------------
> +- phys: Must contain an entry for each entry in phy-names.
> +  See ../phy/phy-bindings.txt for details.
> +- phy-names: Should include an entry for each PHY used by the controller. The
> +  following PHYs are available:
> +  - Tegra124: usb2-0, usb2-1, usb2-2, hsic-0, hsic-1, usb3-0, usb3-1
> +  - Tegra132: usb2-0, usb2-1, usb2-2, hsic-0, hsic-1, usb3-0, usb3-1

If that's how this works (which might be worth mentioning in the binding 
doc), then:
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
