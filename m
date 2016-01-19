From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Fixed typo
Date: Tue, 19 Jan 2016 09:29:29 -0700
Message-ID: <569E6469.10301@wwwdotorg.org>
References: <1453209155-6213-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <1453209155-6213-2-git-send-email-ralf@ramses-pyramidenbau.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453209155-6213-2-git-send-email-ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/19/2016 06:12 AM, Ralf Ramsauer wrote:

> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi

> -	 * the APB DMA based serial driver, the comptible is
> +	 * the APB DMA based serial driver, the compatible is

Presumably this typo exists in tegra*.dtsi not just tegra124.dtsi. 
Perhaps you could fix it there too?

BTW, you didn't Cc any Tegra maintainers, so Thierry (who applies the 
patches) probably isn't going to notice that you sent this patch. Please 
also Cc the ARM kernel mailing list on Tegra patches. For reference, see 
the output of "./scripts/get_maintainer.pl *.patch".
