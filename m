From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 2/3] power: power_supply: Add core support for supplied_from
Date: Tue, 02 Apr 2013 15:31:30 -0600
Message-ID: <515B4E32.8080006@wwwdotorg.org>
References: <1364852755-17425-1-git-send-email-rklein@nvidia.com> <1364852755-17425-3-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364852755-17425-3-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/01/2013 03:45 PM, Rhyland Klein wrote:
> This patch adds support for supplies to register a list of char *'s
> which represent the list of supplies which supply them. This is the
> opposite as the supplied_to list.

This patch resolves the concerns I had before, so,
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> diff --git a/drivers/power/power_supply_core.c b/drivers/power/power_supply_core.c

> +static bool __power_supply_is_supplied_by(struct power_supply *supplier,
> +					 struct power_supply *supply)
> +{
> +	int i;
> +
> +	if (!supply->supplied_from && !supplier->supplied_to)
> +		return false;

Nit: that somewhat duplicates the if below, so perhaps could just be
removed?

> +	/* Support both supplied_to and supplied_from modes */
> +	if (supply->supplied_from) {
> +		if (!supplier->name)
> +			return false;

Likewise, I'm still not convinced these !name tests should be required.

However, there's no harm here I think, so it's fine.
