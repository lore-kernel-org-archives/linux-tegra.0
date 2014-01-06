From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 3/6] ARM: tegra: Add efuse bindings
Date: Mon, 06 Jan 2014 13:40:51 -0700
Message-ID: <52CB14D3.2060904@wwwdotorg.org>
References: <1387891931-9854-1-git-send-email-pdeschrijver@nvidia.com> <1387891931-9854-4-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387891931-9854-4-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/24/2013 06:32 AM, Peter De Schrijver wrote:
> Add efuse bindings for Tegra20, Tegra30, Tegra114 and Tegra124.

This patch doesn't add bindings, it adds nodes to device trees. Bindings
are the schemas that dictate how the nodes are to be constructed, not
the nodes themselves.

On that topic, this series needs to create
Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt etc.

> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi

> +	efuse@7000f800 {
...
> +	};
> +
>  	cpus {

This node isn't sorted correctly. It should be between sdhci@700b0600
and ahub@70300000, not after the ahub.

> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi

> +	efuse@7000F800 {

"fuse" might be a better node name; "efuse" is presumably the name of
the instance, not the type of object.

Please use lower-case for hex constants; both here and in the reg property.
