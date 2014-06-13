From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/3] arm: multi_v7: enable igb, stmpe, lm95245, pwm
 leds
Date: Fri, 13 Jun 2014 09:24:05 -0600
Message-ID: <539B1795.1060507@wwwdotorg.org>
References: <1741a33cd88cd5525f3c50c0e0cacc0853a3512a.1402350905.git.marcel@ziswiler.com> <201406131610.18048.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201406131610.18048.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/13/2014 08:10 AM, Arnd Bergmann wrote:
> On Tuesday 10 June 2014, Marcel Ziswiler wrote:
>> The NVIDIA Tegra 3 based Apalis T30 module contains an Intel i210 resp.
>> i211 gigabit Ethernet controller, an STMPE811 ADC/touch controller, PWM
>> LEDs generically accessible from user space and an LM95245 temperature
>> sensor chip. The later three can also be found on the Colibri T30
>> module.
>>
>> While at it move the NEON entry down to its proper place to have it all
>> nicely ordered again.
>>
>> Signed-off-by: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
> 
> Stephen, Thierry,
> 
> do you want me to queue it up directly, or do you want to put it into
> a tegra fixes branch?

Taking this first patch through arm-soc is easiest to avoid conflicts on
the shared file. I'll take 2 and 3 through the Tegra tree.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
