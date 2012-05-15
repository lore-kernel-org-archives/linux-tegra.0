From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [GIT PULL] ARM: tegra: dt2 branch
Date: Tue, 15 May 2012 13:24:10 -0600
Message-ID: <4FB2AD5A.2060803@wwwdotorg.org>
References: <1337016017-30537-1-git-send-email-swarren@wwwdotorg.org> <201205151143.26008.arnd@arndb.de> <4FB2812F.1010500@wwwdotorg.org> <201205151915.25543.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201205151915.25543.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/15/2012 01:15 PM, Arnd Bergmann wrote:
> On Tuesday 15 May 2012, Stephen Warren wrote:
>>> I think we can't drop it from the driver because of existing powerpc machines
>>> providing the property, but it would be ok if you drop it from your .dts
>>> files.
>>
>> support-8bit is parsed by the Tegra driver only, and only appears in
>> tegra-*.dts across all arch/*/boot.dts. I assume you were talking about
>> some other property, although I can't tell which from a very quick look
>> at arch/powerpc/boot/dts/*.
> 
> Right, my mistake.
> 
> I guess we could have just removed it right away then.

No worries. I'll take an action to do this in 3.6. Thanks for cleaning
up the bindings.
