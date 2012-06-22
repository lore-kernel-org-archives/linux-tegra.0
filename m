From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 07/10] ARM: tegra: pcie: Add device tree support
Date: Fri, 22 Jun 2012 16:40:17 +0000
Message-ID: <201206221640.18014.arnd@arndb.de>
References: <20120613081910.GB6528@avionic-0098.mockup.avionic-design.de>
 <201206221348.39346.arnd@arndb.de>
 <20120622140210.GA32097@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120622140210.GA32097-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 22 June 2012, Thierry Reding wrote:
> Actually this is from of_translate_address(). The calling sequence looks
> like this:
> 
>         of_address_to_resource()
>           __of_address_to_resource()
>             of_translate_address()
>               __of_translate_address()
>                 of_translate_one()
>                   of_bus_default_map()
>                     of_read_number()

Ok, I see.

This looks like a problem in of_bus_default_map, which expects to
see only 64 bit addresses at most. of_bus_pci_map by comparison
handles the pci addresses with three cells.

If I read this correctly, this fix is to make sure we compare the
upper cells of the address in of_bus_default_map:

static u64 of_bus_default_map(u32 *addr, const __be32 *range,
                int na, int ns, int pna)
{
        u64 cp, s, da;

        cp = of_read_number(range, na);
        s  = of_read_number(range + na + pna, ns);
        da = of_read_number(addr, na);

        pr_debug("OF: default map, cp=%llx, s=%llx, da=%llx\n",
                 (unsigned long long)cp, (unsigned long long)s,
                 (unsigned long long)da);

        if (da < cp || da >= (cp + s))
                return OF_BAD_ADDR;
        return da - cp;
}

How about adding code like:

	if ((na > 2) && memcmp(range, addr, na * 4) != 0)
		return OF_BAD_ADDR;

This won't handle entries with #size-cells>2 or those that
span a 64-bit boundary, but I think it will work for all
relevant cases.

	Arnd
