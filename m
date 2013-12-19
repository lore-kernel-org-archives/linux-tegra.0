From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 01/10] ARM: tegra: Add AS3722 PMIC on Venice2
Date: Thu, 19 Dec 2013 13:24:12 -0700
Message-ID: <52B355EC.9040306@wwwdotorg.org>
References: <1387469182-14398-1-git-send-email-treding@nvidia.com> <1387469182-14398-2-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387469182-14398-2-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/19/2013 09:06 AM, Thierry Reding wrote:
> This also adds the vmmc-supply property to the SDMMC node on Venice2.
> Otherwise the core will turn the regulator off automatically because it
> is unused.

Laxman sent a version of this patch first, which I have already applied.
His version is almost a pure subset of yours. I've pointed out the
differences (other than simple naming) below so you two can work
together to resolve them.

(Laxman, as an aside, I'm not sure why you're upstreaming patches that
don't exactly match the existing kernel support for this board...)

> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts

> +				sd0 {
> +					regulator-name = "vdd_cpu";
> +					regulator-min-microvolt = <700000>;
> +					regulator-max-microvolt = <1350000>;

Laxman's patch has:

 					regulator-max-microvolt = <1400000>;


> +					regulator-always-on;
> +					ams,ext-control = <2>;
> +				};

Laxman's patch adds:

 					regulator-min-microamp = <3500000>;
 					regulator-max-microamp = <3500000>;
 					regulator-boot-on;

Those properties (with various values) are added to quite a few nodes; I
won't bother pointing them out elsewhere.


> +				sd1 {
...
> +					regulator-max-microamp = <3500000>;

Laxman's patch has:

 					regulator-max-microamp = <2500000>;

Laxman's patch adds the following node:

 				sd3 {
 					regulator-name = "vddio-ddr-2phase";
 					regulator-min-microvolt = <1350000>;
 					regulator-max-microvolt = <1350000>;
 					regulator-always-on;
 					regulator-boot-on;
 				};


> +				sd6 {
...
> +					regulator-min-microvolt = <800000>;

Laxman's patch has:

 					regulator-min-microvolt = <650000>;

> +				ldo6 {
...
> +					regulator-min-microvolt = <3300000>;

Laxman's patch has:

 					regulator-min-microvolt = <1800000>;
