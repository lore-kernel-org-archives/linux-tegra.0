From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 3/4] power_supply: tps65090-charger: Add binding doc
Date: Tue, 05 Mar 2013 11:15:39 -0700
Message-ID: <5136364B.7000506@wwwdotorg.org>
References: <1362423709-29596-1-git-send-email-rklein@nvidia.com> <1362423709-29596-4-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362423709-29596-4-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/04/2013 12:01 PM, Rhyland Klein wrote:
> This change adds the binding documentation for the tps65090-charger.

> diff --git a/Documentation/devicetree/bindings/power_supply/tps65090.txt b/Documentation/devicetree/bindings/power_supply/tps65090.txt
...
> +Example:
> +
> +	tps65090@48 {
...
> +		regulators {
> +			...
> +		};
> 

The "regulators" node in the example isn't mentioned in the list of
properties/nodes that's above. What goes in there? You probably want to
include text similar to what I've quoted below from
Documentation/devicetree/bindings/regulator/tps6586x.txt:

> - regulators: A node that houses a sub-node for each regulator within the
>   device. Each sub-node is identified using the node's name (or the deprecated
>   regulator-compatible property if present), with valid values listed below.
>   The content of each sub-node is defined by the standard binding for
>   regulators; see regulator.txt.
>   sys, sm[0-2], ldo[0-9] and ldo_rtc
