From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: define Jetson TK1 regulators
Date: Wed, 16 Apr 2014 10:33:45 -0600
Message-ID: <534EB0E9.4030204@wwwdotorg.org>
References: <1397516120-18220-1-git-send-email-swarren@wwwdotorg.org> <CAL1qeaF+Kha6bS27OLoWw-G2Tv6PzeB6=GcK6dM6s_hWidvLiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaF+Kha6bS27OLoWw-G2Tv6PzeB6=GcK6dM6s_hWidvLiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/15/2014 06:24 PM, Andrew Bresticker wrote:
> On Mon, Apr 14, 2014 at 3:55 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> These are mostly identical to the Venice2 regulator definitions, since
>> the board designs are very similar. Differences are:
>>
>> - Jetson TK1 doesn't have a built-in LCD panel, so on-board regulators
>>   are not present for the backlight, touchscreen, or panel.
>> - +3.3V_RUN needs to be boot-on/always-on, since it's widely used. This
>>   change should likely be propagated to Venice2 for completeness,
>>   although it will have no practical effect there since various other
>>   regulators use +3.3V_RUN as their supply and are always-on.
>> - +3.3V_LP0 needs to be boot-on as well as always-on. One reason
>>   is because it's used to driver the UART level-shifter; without this, I
>>   see a brief period of UART corruption during cold boots.I suspect this
>>   change needs to be propagated to Venice2, and we simply haven't noticed
>>   the need since there's no UART level-shifter on Venice2.
>> - A few rails have different names in the schematics.

>> diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts

>> @@ -1462,6 +1611,7 @@
>>                 cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
>>                 power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
>>                 bus-width = <4>;
>> +               vmmc-supply = <&vddio_sdmmc3>;
> 
> I don't have schematics for this board, but I suspect you mean
> vqmmc-supply here, per the discussion in the Venice2 VQMMC thread.

This portion of the schematics is essentially identical to Venice2, and
you're correct; this should be vqmmc not vmmc. I'll send a patch.
