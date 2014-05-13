From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: joystick input in tegra_defconfig
Date: Tue, 13 May 2014 12:45:43 +0900
Message-ID: <CAAVeFuLZ_wrxipYn2pfNzuyDiTvAPWH4aSWfonrG+YQsm4tM_g@mail.gmail.com>
References: <1399883209-31169-1-git-send-email-acourbot@nvidia.com>
 <1399883209-31169-2-git-send-email-acourbot@nvidia.com> <5370F794.2020800@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5370F794.2020800-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 13, 2014 at 1:32 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 05/12/2014 02:26 AM, Alexandre Courbot wrote:
>> NVIDIA SHIELD embeds a USB controller. Compile the corresponding support
>
> USB controller or USB joystick?

I understand this sounds like "EHCI controller" here. Will reword.

>
>> as a module in tegra_defconfig.
>
> Why make this a module rather than built-in. Almost everything else in
> tegra_defconfig is built-in, except brcmfmac since it doesn't handle
> lack of firmware availability at probe time.

Goal is to minimize the image size, especially since this is not a
feature I expect to be used much outside of SHIELD. If you prefer it
built-in, I'm fine with it too.

Thanks,
Alex.
