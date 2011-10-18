From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC] [PATCH] ARM: tegra: emc: device tree bindings
Date: Tue, 18 Oct 2011 11:30:44 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173CA2CBFB@HQMAIL01.nvidia.com>
References: <1318873976-25335-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318873976-25335-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm
Cc: "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Monday, October 17, 2011 11:53 AM:
> First cut at device tree bindings for the EMC tables on tegra.
> 
> Note that I have a prerequisite patch that changes the tegra2_emc code
> to be a platform driver; but I wanted to do a sanity-check of my device
> tree usage here before posting the whole series.

...
> +++ b/Documentation/devicetree/bindings/arm/tegra/emc.txt
...
> +Embedded Memory Controller
> +
> +Properties:
> +- name : Should be emc
> +- #address-cells : Should be 1
> +- #size-cells : Should be 0

The address/size-cells properties define the require number of cells for
child nodes, where the child nodes are addressable objects in a bus. For
the EMC table child nodes, they're more configuration than nodes on a
bus, so I don't think it's appropriate for the EMC controller to define
the address/size-cells properties. Those properties would be appropriate
if we ever have child nodes for the individual SDRAM chips, but I suspect
we won't ever do that?

...
> +Embedded Memory Controller configuration table
...
> +Properties:
> +- name : Should start with emc-table

> +- compatible : should contain "nvidia,tegra20-emc-table".
> +- reg : only needed if nvidia,use-ram-code is present in the
> +  parent. If so, the numerical representation of the selected ram code
> +  as reported by the strap option APB misc register.

I don't think the compatible or reg properties are needed; the EMC tables
aren't addressable objects on a bus, so no need for reg. I could see an
argument that we'd want to version the emc-table format, and so the
compatible flag might be useful, yet AIUI, compatible is more for defining
HW compatibility (and hence driver instantiation), rather than a property
of some configuration node.

> +- clock-frequency : the clock frequency for the EMC at which this
> +  table should be used (in kHz).
> +- nvidia,emc-registers : a 46 word array of EMC registers to be programmed
> +  for operation at the 'clock-frequency' setting.
> +  The order and contents of the registers are defined in the Tegra TRM.

That's not a very semantic representation. Still, I guess there isn't
any benefit representing this at a higher level.

...
> +++ b/arch/arm/boot/dts/tegra-seaboard.dts
> @@ -20,6 +20,42 @@
>  		clock-frequency = < 216000000 >;
>  	};
> 
> +	emc {

I think that should be emc@7000f400, so it matches tegra20.dtsi?

-- 
nvpublic
