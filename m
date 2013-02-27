From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Multi-platform, and secure-only ARM errata workarounds
Date: Wed, 27 Feb 2013 10:42:27 -0700
Message-ID: <512E4583.4080609@wwwdotorg.org>
References: <512BF81A.3080700@wwwdotorg.org> <4928288.ie8EUukfVD@fb07-iapwap2.physik.uni-giessen.de> <512CE533.6020005@wwwdotorg.org> <22709540.96uJddbx1U@fb07-iapwap2.physik.uni-giessen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <22709540.96uJddbx1U-D3pzGp0ZKuDWZbiwp4sFPyrtisivX6KghOMvlBiLbJSELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/27/2013 02:03 AM, Marc Dietrich wrote:
> Am Dienstag, 26. Februar 2013, 09:39:15 schrieb Stephen Warren:
>> On 02/26/2013 02:36 AM, Marc Dietrich wrote:
>>> Am Montag, 25. Februar 2013, 16:47:38 schrieb Stephen Warren:
>>>> ...
>>>> Now, I can easily add those 3 errata workarounds to U-Boot, but that
>>>> will require people to reflash their bootloader. This is probably
>>>> acceptable for development/reference boards (although I'm sure people
>>>> will find it annoying) but for re-purposed production boards (such as
>>>> the Toshiba AC100 or various tablets) it will be impossible to update
>>>> the factory bootloader. Switching to upstream U-Boot would currently
>>>> lose some functionality, and significantly affect people's boot flow, so
>>>> is likely unacceptable.
>>>
>>> personally, I have no problem to require a certain u-boot version for a
>>> given kernel. From a distro point of view, you will likely update the
>>> bootloader/kernel on a distro update anyway.
>>
>> So a distro will certainly update the kernel.
>>
>> But updating a bootloader would be very unusual, I believe.
> 
> mmh? Every time I update to a new distro release, the bootloader gets also 
> updated - even on arm, e.g. ftp://ports.ubuntu.com/ubuntu-ports/pool/main/u/u-boot-linaro lists four version of uboot - one for each supported distro 
> release. I know for closed embedded device this is different, but that's not 
> our target.

I have no idea why that package exists or what it is. It clearly doesn't
install U-Boot on the device when the package is installed, or anyone
using an AC100 would already be running U-Boot not our binary
bootloader, right?

>> Also, I hope that upstream U-Boot is never going to support the bizarre
>> "Tegra partition table" cruft that our "fastboot" bootloader supports,
>> so you'll end up completely re-programming the flash (BCT, bootloader,
>> partition table, all filesystems) if you want to switch to U-Boot. That
>> seems like a fair chunk for the installer to own, but I guess if you're
>> comfortable with doing that, I won't complain.
> 
> Yes, that a huge pile of work and people are working on this already. One the 
> other hand, why (if not for upgrade use) do we have u-boot support for all 
> these legacy boards?

Mainly because I didn't want to use our binary bootloader when
developing or testing kernel support for the AC100, I think:-)

But yes, I would support all AC100 general Linux usage switching to U-Boot.

I think what I'll do when Tegra is converted to multi-platform is:

a) The WARs will be disabled in the kernel; no choice there really.

b) I've already submitted patches to U-Boot to implement the WARs there.

c) Everyone will need to update to the latest U-Boot:-(

d) For people wanting to continue running our binary bootloader (which
only implements 1 of the 3 WARs in question in the latest code, and I
have no idea if it even did that when the AC100 bootloader binary was
compiled), they'll need to create a small stub binary that implements
the WARs and prepend this to the zImage. I can help create this if
people need. Or, you can chain-load U-Boot. I've filed bugs against our
binary bootloader, so hopefully within a few years or something, new
products won't need this stub!
