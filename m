From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: enable console framebuffer rotation
Date: Tue, 13 May 2014 21:45:52 -0600
Message-ID: <5372E6F0.1050604@wwwdotorg.org>
References: <1399432682-677-1-git-send-email-acourbot@nvidia.com> <536A57FA.2090608@wwwdotorg.org> <536AC45F.6080608@nvidia.com> <536CE414.5030406@suse.de> <536CF33A.3020906@wwwdotorg.org> <53727D9E.9050800@suse.de> <5372CE37.1080601@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5372CE37.1080601-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?Andreas_F=E4?= =?ISO-8859-1?Q?rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/13/2014 08:00 PM, Alexandre Courbot wrote:
...
> Both SHIELD and TN7 come with a locked bootloader and cannot use U-boot.
> The bootloader can only boot a kernel from a dedicated, raw boot
> partition (Android style), can only pass a device tree from another raw
> "dtb" partition, and will fill it with plenty of dirty command-line
> options that make mainline unusable. That seems to be a lot for distros
> to handle, so at this stage we'd rather advise users to use a root FS
> image of their favorite distro along with a self-compiled kernel.

I don't know how much effort it's worth putting into this, but it
/might/ be possible to port U-Boot to the devices, and use that as the
"kernel" image that the binary bootloader boots, and then have U-Boot
boot a kernel from a filesystem in the "normal" way. That's kind what I
did by porting U-Boot to the Raspberry Pi. It would certainly increase
the possibility of a distro supporting these devices in a generic way,
as well as avoiding the need for hard-coded command-lines, memory
layout, etc. in the DT files. We'd have to make sure that any installer
didn't change the GPT layout, since then it'd get out of sync with the
tegrapt partitions, which could cause the bootloader to fail.
