From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 07/10] ARM: tegra: pcie: Add device tree support
Date: Fri, 22 Jun 2012 13:48:39 +0000
Message-ID: <201206221348.39346.arnd@arndb.de>
References: <20120613081910.GB6528@avionic-0098.mockup.avionic-design.de> <20120622110403.GA15710@avionic-0098.mockup.avionic-design.de> <20120622132253.GA30704@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120622132253.GA30704-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 22 June 2012, Thierry Reding wrote:
> > It seems like this isn't working properly. For some reason both the reg
> > property of pci@0 and pci@1 are translated to the same parent address
> > 0x80000000. I'll have to investigate where exactly this goes wrong.
> 
> So it turns out that while of_read_number() can actually read any number
> of cells, only the two least significant are kept because it returns a
> u64. Since of_bus_default_map() uses of_read_number() the addresses
> <0 0 0> and <1 0 0> are in fact the same. I'm not sure how best to solve
> this. I'm not aware of a 128 bit integer type in the kernel, so I guess
> the better alternative would be to fix of_bus_default_map() to cope with
> #address-cells > 2 properly.

of_translate_address should get it right. Which codes uses of_read_number()?
Can it be converted to use of_translate_address()?

	Arnd
