From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [GIT PULL 3/8] ARM: tegra: cleanup
Date: Tue, 09 Apr 2013 09:36:45 -0600
Message-ID: <5164358D.1050204@wwwdotorg.org>
References: <1365181426-11547-1-git-send-email-swarren@wwwdotorg.org> <1365181426-11547-3-git-send-email-swarren@wwwdotorg.org> <201304091544.32377.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201304091544.32377.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/09/2013 07:44 AM, Arnd Bergmann wrote:
> On Friday 05 April 2013, Stephen Warren wrote:
>> This branch includes various cleanup of the core Tegra support.
>>
>> * Unification of the separate board-dt-tegra*.c files into a single
>>   tegra.c, now that everything is DT-driven and basically identical.
>> * Use of_clk_get() in the Tegra clocksource driver so that clocks are
>>   described in DT rather than hard-coding clock names.
>> * Some cleanup of the PMC-related code, with the aim that the PMC
>>   "driver" contains more of the code that touches PMC registers, rather
>>   than spreading PMC register accesses through other files.
>> * Conversion of the "PMC" driver to acquire resources describe in device
>>   tree rather than hard-coding them.
>> * Use of common code for the CPU sleep TLB invalidation.
>>
> 
> Pulled into next/cleanup branch and resolved the conflict against
> an earlier cleanup that was already present there, fixup below.

Oh yes, sorry I forgot to mention that; of course this conflict doesn't
show up when I build my own for-next, but rather only in
arm-soc/linux-next so I forgot about it:-(

Anyway, the resolution you posted looks good. Thanks.
