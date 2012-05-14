From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [GIT PULL] ARM: tegra: dt2 branch
Date: Mon, 14 May 2012 14:54:11 -0600
Message-ID: <4FB170F3.8080107@wwwdotorg.org>
References: <1337016017-30537-1-git-send-email-swarren@wwwdotorg.org> <201205141854.34331.arnd@arndb.de> <4FB1572D.90500@wwwdotorg.org> <201205142037.08752.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201205142037.08752.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/14/2012 02:37 PM, Arnd Bergmann wrote:
> On Monday 14 May 2012, Stephen Warren wrote:
>> On 05/14/2012 12:54 PM, Arnd Bergmann wrote:
> 
>>>
>>> I can't see anything wrong with your commits but please check again that it all makes
>>> sense and let me know if I should really pull this version.
>>
>> I think that looks OK. I probably just generated the diffstat backwards.
> 
> Ok, thanks for the confirmation.
> 
> I've pulled it into next/dt2 now. In order to merge this with the drivers/mmc branch
> that contains the common mmc binding, I used the complex resolution below, adding
> bus-width properties to both the dtsi and the dts files.

Yeah, sorry about those conflicts. Thanks for fixing them up.

The changes to tegra-*.dts look fine.

I wonder if the changes to tegra-*.dtsi shouldn't just be dropped? I'd
personally err on the side of requiring board files to add this
property, rather than having things accidentally work because the .dtsi
file included a default.

BTW, I assume that in 3.6, I should plan to remove the support-8bit
properties and associated Tegra SDHCI driver code that handles them, and
rely on the SDHCI core handling this from now on?
