From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra_defconfig: enable CONFIG_ARM_APPENDED_DTB
Date: Thu, 19 Sep 2013 18:39:40 -0700
Message-ID: <CAOesGMh8NE7h=BH2sPrG4eE3Vbv0Q5+hCj52gi0072phtjcghw@mail.gmail.com>
References: <1379638594-28888-1-git-send-email-olof@lixom.net>
	<CAKCjkJbavWtWBxvKqpesmJfcKTUCpbsM_xL0JfS49vOpkZ8AUw@mail.gmail.com>
	<CAOesGMjP+QMyuLCykg0nW4yWwmnNtoyzf7nK2dPAWuqcpfp5OA@mail.gmail.com>
	<523BA64F.1050607@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <523BA64F.1050607-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Steev Klimaszewski <steev-4jv++OSWV9OTkO8mciVlQg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 19, 2013 at 6:35 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 09/19/2013 07:09 PM, Olof Johansson wrote:
>> They do? The hardware I have came with a very old u-boot. Got a link
>> to the newer one?
>
> Mainline U-Boot runs nicely on the TrimSlice. Missing functionality
> includes PCIe Ethernet and HDMI, but everything else works fine IIRC.
> You can flash it using:
>
> https://github.com/NVIDIA/tegra-uboot-flasher-scripts
>
> (read README-developer.txt first, then README-user.txt)

Oh great. Unfortunately lack of PCI-e makes it hard to network boot
(unless I add a redundant usb-ethernet adapter on it). Hmm.


-Olof
