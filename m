From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: DTS: whistler: enable keyboard
Date: Fri, 18 Jan 2013 09:44:38 -0700
Message-ID: <50F97BF6.6020705@wwwdotorg.org>
References: <1358488723-23184-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358488723-23184-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/17/2013 10:58 PM, Laxman Dewangan wrote:
> Enable tegra based keyboard controller and populate the key mapping
> for whistler.
> 
> With this patch, HOME, BACK, POWER and MENU keys will work.
> Still other keys which are in ROW3 and ROW4 will not work as it
> conflicts with KBC pins on SDIO2 pinmux.

Thanks, applied to Tegra's for-3.9/dt branch.
