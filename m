From: Timur Mehrvarz <timur.mehrvarz-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: ehci-tegra issue with deep sleep
Date: Mon, 07 Jan 2013 18:19:34 +0100
Message-ID: <50EB03A6.9040509@riseup.net>
References: <50C7B250.7020409@riseup.net> <50C8C47A.1080809@wwwdotorg.org> <50E570F1.4030706@riseup.net> <50E71272.5090107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50E71272.5090107-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/04/2013 06:33 PM, Stephen Warren wrote:
> On 01/03/2013 04:52 AM, Timur wrote:
> ...
>> maybe you remember this brief conversation in December. I found the root
>> cause of the reported issue (tegra specific) and I can provide a patch.
>> The outcome is stable, externally powered USB host mode for Nexus 7.
> Isn't USB host mode by definition internally powered, and USB device
> mode by definition externally powered? An externally powered USB host
> mode sounds quite non-standard. If you allow that mode, how does the
> system know whether it should be a host or a device when external power
> is applied; it sounds like this new mode completely breaks the ability
> to connect the tablet to a PC and use it for Android application
> development, or MTP (Media Transfer Protocol) to download pictures/movies.
What I am proposing does not result in any loss of original
functionality (ADB, MTP, etc.). Also, the described added functionality
is fully standard when I look at it. No typical PC needs to switch to
battery power, only to connect USB slave devices. You can operate a
Nexus 7 on external power. But in order to connect USB slave devices,
you *have* to switch to internal battery. Not being able to run USB host
mode at all, while using external power, is a serious shortcoming. One
that is only caused by the installed kernel. In December, I was having
this last difficulty: preserving USB host operations through LP0 phases.
But this problem has been solved. Really wanted to clarify this.

>
>> Do you happen to know anyone responsible for the Ubuntu Nexus7 kernel? I
>> would like to contribute the fix, as I think it would be beneficial to
>> that implementation.
> Sorry, I don't know what kernel they're using; the best place to ask
> would be the Ubuntu project itself.
No, I did not ask what kernel they are using.
