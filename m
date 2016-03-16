From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: pci: tegra: Update for per-lane PHYs
Date: Wed, 16 Mar 2016 10:51:58 -0600
Message-ID: <56E98F2E.5010307@wwwdotorg.org>
References: <1457452094-5409-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457452094-5409-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/08/2016 08:48 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Changes to the pad controller device tree binding have required that
> each lane be associated with a separate PHY.

I still don't think this has anything to do with DT bindings. Rather, 
the definition of a PHY (in HW and the Linux PHY subsystem) is a single 
lane. That fact then requires drivers to support a PHY per lane rather 
than a single multi-lane PHY, and equally means the DT bindings must be 
written according to the correct definition of a PHY.

Still, I suppose the commit description is fine as is.

> Update the PCI host bridge
> device tree binding to allow each root port to define the list of PHYs
> required to drive the lanes associated with it.

> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt

> +Required properties for Tegra124 and later:
> +- phys: Must contain an phandle to a PHY for each entry in phy-names.
> +- phy-names: Must include an entry for each active lane. Note that the number
> +  of entries does not have to (though usually will) be equal to the specified
> +  number of lanes in the nvidia,num-lanes property. Entries are of the form
> +  "pcie-N": where N ranges from 0 to the value specified in nvidia,num-lanes.

When would the number of PHYs not equal the number of lanes? I thought 
the whole point of this patch was to switch to per-lane PHYs? Perhaps 
I'm just misremembering some exception, so there may be no need to 
change this.

>   Example:
>
>   SoC DTSI:
> @@ -169,6 +179,9 @@ SoC DTSI:
>   			ranges;
>
>   			nvidia,num-lanes = <2>;
> +
> +			phys = <&{/padctl@0,7009f000/pads/pcie/pcie-4}>;
> +			phy-names = "pcie-0";
>   		};

The example shows a Tegra20 PCIe controller, yet includes 
Tegra124-or-greater properties. That seems a bit odd. Should the changes 
to the example be dropped, or does "Required properties for Tegra124 and 
later" mean "Required for T124+, optional for earlier chips"?

Conceptually this change is fine by me though.
