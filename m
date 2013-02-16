From: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 1/3] power_supply: Define Binding for supplied-nodes
Date: Sat, 16 Feb 2013 14:38:05 -0800
Message-ID: <20130216223804.GF1741@lizard.sbx05280.losalca.wayport.net>
References: <1360971416-30717-1-git-send-email-rklein@nvidia.com>
 <1360971416-30717-2-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1360971416-30717-2-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Rajanikanth H.V" <rajanikanth.hv-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 15, 2013 at 06:36:54PM -0500, Rhyland Klein wrote:
> This property is meant to be used in device nodes which represent
> power_supply devices that wish to provide a list of supplies to
> which they provide power. A common case is a AC Charger with
> the batteries it powers.
> 
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/power_supply/power_supply.txt         |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power_supply/power_supply.txt
> 
> diff --git a/Documentation/devicetree/bindings/power_supply/power_supply.txt b/Documentation/devicetree/bindings/power_supply/power_supply.txt
> new file mode 100644
> index 0000000..1c58d4ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power_supply/power_supply.txt
> @@ -0,0 +1,17 @@
> +Power Supply Core Support
> +
> +Optional Properties:
> + - power-supply,supplied-nodes : This property is added to a supply
> +   in order to specify the list of supplicant devices directly by their
> +   phandles.

"supplied nodes" sounds confusing (doesn't reflect direction), IMO. I'd
rather call it power-supply,supplied-to = <&some_battery>;

But... I'm recalling there was a similar discussion not that long ago, and
Arnd came up with the idea that supplied-to is not fully in spirit of DT,
and proposed his view of proper bindings. Please find the discussion here:

  http://lkml.org/lkml/2012/9/14/104

Thanks,

Anton

> +
> +Example:
> +
> +	charger@e {
> +		compatible = "some,charger";
> +		...
> +
> +		power-supply,supplied-nodes = <&some_battery>,
> +					      <&another_battery>;
> +		...
> +	};
> -- 
> 1.7.9.5
