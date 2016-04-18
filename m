From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] gpio: tegra: Remove the need of keeping device handle
 for gpio driver
Date: Mon, 18 Apr 2016 22:30:32 +0530
Message-ID: <571512B0.90303@nvidia.com>
References: <1460969178-20914-1-git-send-email-ldewangan@nvidia.com> <1460969178-20914-2-git-send-email-ldewangan@nvidia.com> <57150B81.6040104@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57150B81.6040104-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Monday 18 April 2016 09:59 PM, Stephen Warren wrote:
> On 04/18/2016 02:46 AM, Laxman Dewangan wrote:
>> Remove the file static device handle variable as this is just
>> required for prints. The required handle can be stored in
>> tegra_gpio_chip and hence it become redundancy.
>
> This seems fine as far as it goes, but if it's worth doing this, 
> please move all the globals into the GPIO chip rather than just one of 
> the 7 globals.

the device pointer is part of the gpiochip and so it is better to use 
gpiochip parent member instead of locally duplicating.

However, moving to other global variables needs some major changes and I 
think it should be treated as independent of this patch.
This patch just utilizes the gpiochip.parent here.
