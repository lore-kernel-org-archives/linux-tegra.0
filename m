From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 0/6] Device tree updates for host1x support
Date: Fri, 16 Nov 2012 11:56:32 +0800
Message-ID: <50A5B970.7020600@nvidia.com>
References: <1353013679-16773-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353013679-16773-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

Thank you for your hard work.

The series,

Acked-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On Ventana, LVDS and HDMI worked.
PS: Alex's power sequence patch is needed to enable panel and backlight.
    Also we need to define dc and hdmi nodes in tegra20-ventana.dts.
    We may publish the patches for different boards next.

Mark
On 11/16/2012 05:07 AM, Thierry Reding wrote:
> This second version of this patch series splits the patches up into more
> logical chunks as requested by Stephen. Instead of renaming the matching
> parameters in the clock driver, this version renames the AUXDATA entries
> to match what the clock driver expects. Furthermore the host1x clock is
> initialized to 150 MHz instead of the unsupported 144 MHz.
> 
> Thierry
> 
> Thierry Reding (6):
>   ARM: tegra: Add Tegra20 host1x support
>   ARM: tegra: Add AUXDATA for Tegra20 host1x
>   ARM: tegra: Add Tegra20 host1x clock support
>   ARM: tegra: Add Tegra30 host1x support
>   ARM: tegra: Add AUXDATA for Tegra30 host1x
>   ARM: tegra: Add Tegra30 host1x clock support
> 
>  arch/arm/boot/dts/tegra20.dtsi            | 87 +++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/tegra30.dtsi            | 87 +++++++++++++++++++++++++++++++
>  arch/arm/mach-tegra/board-dt-tegra20.c    |  9 ++++
>  arch/arm/mach-tegra/board-dt-tegra30.c    |  9 ++++
>  arch/arm/mach-tegra/tegra20_clocks_data.c | 11 ++--
>  arch/arm/mach-tegra/tegra30_clocks_data.c |  5 +-
>  6 files changed, 203 insertions(+), 5 deletions(-)
> 
