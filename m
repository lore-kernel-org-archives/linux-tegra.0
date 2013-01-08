From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: ehci-tegra issue with deep sleep
Date: Tue, 08 Jan 2013 15:19:47 -0700
Message-ID: <50EC9B83.5050107@wwwdotorg.org>
References: <50C7B250.7020409@riseup.net> <50C8C47A.1080809@wwwdotorg.org> <50E570F1.4030706@riseup.net> <50E71272.5090107@wwwdotorg.org> <50EB03A6.9040509@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50EB03A6.9040509-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timur Mehrvarz <timur.mehrvarz-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/07/2013 10:19 AM, Timur Mehrvarz wrote:
> On 01/04/2013 06:33 PM, Stephen Warren wrote:
>> On 01/03/2013 04:52 AM, Timur wrote:
>> ...
>>> maybe you remember this brief conversation in December. I found the root
>>> cause of the reported issue (tegra specific) and I can provide a patch.
>>> The outcome is stable, externally powered USB host mode for Nexus 7.
>> Isn't USB host mode by definition internally powered, and USB device
>> mode by definition externally powered? An externally powered USB host
>> mode sounds quite non-standard. If you allow that mode, how does the
>> system know whether it should be a host or a device when external power
>> is applied; it sounds like this new mode completely breaks the ability
>> to connect the tablet to a PC and use it for Android application
>> development, or MTP (Media Transfer Protocol) to download pictures/movies.
>
> What I am proposing does not result in any loss of original
> functionality (ADB, MTP, etc.). Also, the described added functionality
> is fully standard when I look at it.

IIUC, a system usually determines if it's a USB host or a USB device
based on whether the USB port is being fed with +5v or not; if +5v is
fed from the cable, it's a device and if not it's a host.

In order to allow +5v to be fed in from the cable, but operate in host
mode, isn't the above convention broken?

Also, doesn't feeding power into the device while it operates in host
mode require some kind of non-standard cable in order to inject the power?
