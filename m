From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: enable console framebuffer rotation
Date: Thu, 8 May 2014 08:40:15 +0900
Message-ID: <536AC45F.6080608@nvidia.com>
References: <1399432682-677-1-git-send-email-acourbot@nvidia.com> <536A57FA.2090608@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536A57FA.2090608-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/08/2014 12:57 AM, Stephen Warren wrote:
> On 05/06/2014 09:18 PM, Alexandre Courbot wrote:
>> Console rotation is needed for devices like Tegra Note 7 and NVIDIA
>> SHIELD to get the boot console in the expected orientation.
>
> I've squashed this into Tegra's for-3.16/defconfig branch.
>
> Can you please also update multi_v7_defconfig, and send that change to
> arm-soc (arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org) to be applied. Thanks.

I omitted doing this for now because the devices that require this 
option (TN7/SHIELD) need a custom build with appended DTB and/or 
command-line anyway. Therefore they cannot use a multi-mach kernel and 
might as well be built against Tegra's defconfig. Does your remark above 
still apply in spite of this?

Thanks,
Alex.
