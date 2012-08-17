From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: dynamically control fast clk
Date: Fri, 17 Aug 2012 12:41:21 -0600
Message-ID: <502E9051.4090507@wwwdotorg.org>
References: <1345189711-24104-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1345189711-24104-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/17/2012 01:48 AM, Laxman Dewangan wrote:
> Tegra I2C driver enables the fast clock during initialization
> and does not disable till driver removed.
> Enable this clock before transfer and disable after transfer done.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This patch is on top of the clock chnages which is in Tegra sub system and
> based on 
>  i2c: tegra: I2_M_NOSTART functionality not supported in Tegra20
> So recommend to go on tegra sub-system.

What exactly is this patch based on? I checked out Tegra's
for-3.7/drivers-i2c, cherry-picked the M_NOSTART patch you mentioned,
and attempted to apply this patch. It doesn't apply. Same if I don't
cherry-pick the M_NOSTART patch, and same for next-20120816 with/without
the M_NOSTART patch.
