From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 08/10] of/address: Handle #address-cells > 2 specially
Date: Tue, 31 Jul 2012 15:18:43 -0500
Message-ID: <50183DA3.8020308@gmail.com>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de> <1343332512-28762-9-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1343332512-28762-9-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/26/2012 02:55 PM, Thierry Reding wrote:
> When a bus specifies #address-cells > 2, of_bus_default_map() now
> assumes that the mapping isn't for a physical address but rather an
> identifier that needs to match exactly.
> 
> This is required by bindings that use multiple cells to translate a
> resource to the parent bus (device index, type, ...).
> 
> See here for the discussion:
> 
> 	https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-June/016577.html
> 
> Originally-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

> ---
> Changes in v3:
> - new patch
> 
>  drivers/of/address.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 7e262a6..2776119 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -69,6 +69,14 @@ static u64 of_bus_default_map(u32 *addr, const __be32 *range,
>  		 (unsigned long long)cp, (unsigned long long)s,
>  		 (unsigned long long)da);
>  
> +	/*
> +	 * If the number of address cells is larger than 2 we assume the
> +	 * mapping doesn't specify a physical address. Rather, the address
> +	 * specifies an identifier that must match exactly.
> +	 */
> +	if (na > 2 && memcmp(range, addr, na * 4) != 0)
> +		return OF_BAD_ADDR;
> +
>  	if (da < cp || da >= (cp + s))
>  		return OF_BAD_ADDR;
>  	return da - cp;
> 
