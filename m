From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 04/10] ARM: tegra: Add Tegra124 eDP support
Date: Thu, 19 Dec 2013 13:46:13 -0700
Message-ID: <52B35B15.4090008@wwwdotorg.org>
References: <1387469182-14398-1-git-send-email-treding@nvidia.com> <1387469182-14398-5-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387469182-14398-5-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/19/2013 09:06 AM, Thierry Reding wrote:

> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi

> +		sor@54540000 {
> +			compatible = "nvidia,tegra124-sor";

I don't see a binding document for that compatible value anywhere in
next-20131219, nor in your drm/for-next branch. Still, the DT
content/schema is essentially identical to many others that already
exist, so I won't block applying the series because of that. Please do
write a binding document though!

> +		dpaux@545c0000 {
> +			compatible = "nvidia,tegra124-dpaux";

Same comment.
