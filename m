From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: tegra: dts: add slink controller dt entry
Date: Thu, 18 Oct 2012 16:41:25 -0600
Message-ID: <50808595.8070505@wwwdotorg.org>
References: <1350557795-31487-1-git-send-email-ldewangan@nvidia.com> <1350557795-31487-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1350557795-31487-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/18/2012 04:56 AM, Laxman Dewangan wrote:
> Add slink controller details in the dts file of
> Tegra20 and Tegra30.

> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi

> +	slink@7000d400 {
> +		compatible = "nvidia,tegra20-slink";
> +		reg = <0x7000d400 0x200>;
> +		interrupts = <0 59 0x04>;
> +		nvidia,dma-req-sel = <15>;

I thought the common DT DMA bindings were going to be in 3.7, and hence
we could just use them here rather than inventing another custom
property for this purpose?
