From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 07/10] ARM: tegra: pcie: Add device tree support
Date: Wed, 13 Jun 2012 20:21:08 +0000
Message-ID: <201206132021.09774.arnd@arndb.de>
References: <1339427118-32263-1-git-send-email-thierry.reding@avionic-design.de> <4FD84133.4060401@firmworks.com> <20120613075232.GA6139@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120613075232.GA6139-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday 13 June 2012, Thierry Reding wrote:
>                 pci@80000000 {
>                         reg = <0x80000000 0x00001000>;
>                         status = "disabled";
> 
>                         #address-cells = <3>;
>                         #size-cells = <2>;
> 
>                         ranges = <0x80400000 0x80400000 0x00008000   /* I/O */
>                                   0x90000000 0x90000000 0x08000000   /* non-prefetchable memory */
>                                   0xa0000000 0xa0000000 0x08000000>; /* prefetchable memory */
> 
>                         nvidia,ctrl-offset = <0x0>;
>                         nvidia,num-lanes = <2>;
>                 };
> 

I believe you will need an "interrupt-map" property here, to map the host
interrupts to the INTA-INTD lines of the attached devices.

I'm not sure whether we want to have a device_type="pciex" property here.
powerpc and sparc seem to use that information, to distinguish a pcie
bus from pci or cardbus.

	Arnd
