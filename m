From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: enable console framebuffer rotation
Date: Wed, 07 May 2014 09:57:46 -0600
Message-ID: <536A57FA.2090608@wwwdotorg.org>
References: <1399432682-677-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399432682-677-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/06/2014 09:18 PM, Alexandre Courbot wrote:
> Console rotation is needed for devices like Tegra Note 7 and NVIDIA
> SHIELD to get the boot console in the expected orientation.

I've squashed this into Tegra's for-3.16/defconfig branch.

Can you please also update multi_v7_defconfig, and send that change to
arm-soc (arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org) to be applied. Thanks.
