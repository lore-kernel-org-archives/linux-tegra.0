From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Fixed typo
Date: Tue, 19 Jan 2016 17:36:34 +0100
Message-ID: <569E6612.5020609@ramses-pyramidenbau.de>
References: <1453209155-6213-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <1453209155-6213-2-git-send-email-ralf@ramses-pyramidenbau.de>
 <569E6469.10301@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <569E6469.10301-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/19/16 17:29, Stephen Warren wrote:
> On 01/19/2016 06:12 AM, Ralf Ramsauer wrote:
>
>> diff --git a/arch/arm/boot/dts/tegra124.dtsi
>> b/arch/arm/boot/dts/tegra124.dtsi
>
>> -     * the APB DMA based serial driver, the comptible is
>> +     * the APB DMA based serial driver, the compatible is
>
> Presumably this typo exists in tegra*.dtsi not just tegra124.dtsi.
> Perhaps you could fix it there too?
I'll check it.
>
> BTW, you didn't Cc any Tegra maintainers, so Thierry (who applies the
> patches) probably isn't going to notice that you sent this patch.
> Please also Cc the ARM kernel mailing list on Tegra patches. For
> reference, see the output of "./scripts/get_maintainer.pl *.patch".
Sure, I'll prepare and send a v2.

  Ralf
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Ralf Ramsauer
GPG: 0x8F10049B
