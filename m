From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: ehci-tegra issue with deep sleep
Date: Fri, 04 Jan 2013 10:33:38 -0700
Message-ID: <50E71272.5090107@wwwdotorg.org>
References: <50C7B250.7020409@riseup.net> <50C8C47A.1080809@wwwdotorg.org> <50E570F1.4030706@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50E570F1.4030706-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timur <timur.mehrvarz-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/03/2013 04:52 AM, Timur wrote:
...
> maybe you remember this brief conversation in December. I found the root
> cause of the reported issue (tegra specific) and I can provide a patch.
> The outcome is stable, externally powered USB host mode for Nexus 7.

Isn't USB host mode by definition internally powered, and USB device
mode by definition externally powered? An externally powered USB host
mode sounds quite non-standard. If you allow that mode, how does the
system know whether it should be a host or a device when external power
is applied; it sounds like this new mode completely breaks the ability
to connect the tablet to a PC and use it for Android application
development, or MTP (Media Transfer Protocol) to download pictures/movies.

> Do you happen to know anyone responsible for the Ubuntu Nexus7 kernel? I
> would like to contribute the fix, as I think it would be beneficial to
> that implementation.

Sorry, I don't know what kernel they're using; the best place to ask
would be the Ubuntu project itself.
