From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: tegra: roth: pinmux fixes
Date: Fri, 27 Jun 2014 16:08:31 -0600
Message-ID: <53ADEB5F.5030502@wwwdotorg.org>
References: <1403508779-25896-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403508779-25896-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/23/2014 01:32 AM, Alexandre Courbot wrote:
> Two small but important fixes to SHIELD's pinmux configuration.
> The use of invalid properties caused the pinmux to not be applied
> at all. Also the setting for sdmmc clock lines resulted in random
> errors or even the impossibility to probe attached devices.
> 
> Alexandre Courbot (2):
>   ARM: tegra: roth: fix unsupported pinmux properties
>   ARM: tegra: roth: enable input on mmc clock pins

The series, applied to Tegra's for-3.17/dt branch.

Sorry for the delay; I'd forgotten that our internal discussion resolved
my questions about patch 2.

Still looking forward to internal bugs files against the Jetson TK1 and
Venice2 board pinmux spreadsheets for the same issue:-)
