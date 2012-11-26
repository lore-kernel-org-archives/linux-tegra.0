From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC v2 5/8] ARM: tegra: Add auxiliary data for nvhost
Date: Mon, 26 Nov 2012 16:39:56 -0700
Message-ID: <50B3FDCC.7080709@wwwdotorg.org>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-6-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353935954-13763-6-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/26/2012 06:19 AM, Terje Bergstrom wrote:
> Add SoC specific auxiliary data to host1x and gr2d. nvhost uses
> this data.
> 
> Signed-off-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Arto's S-o-b really should be first and yours last since you're (Terje)
the one who touched the patches last.

> diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/board-dt-tegra20.c

I think none of the changes the board-dt-tegra*.c should be made.

AUXDATA is a temporary measure to keep things working during the
transition to device tree. We want to remove entries from the AUXDATA
tables rather than add them. The only thing that's stopping us from
doing so right now is the lack of DT-based clock lookups, which hence
require devices to have a specific name.

> +static struct nvhost_device_data tegra_host1x_info = {
> +	.clocks = { {"host1x", UINT_MAX} },

> +static struct nvhost_device_data tegra_gr2d_info = {
> +	.clocks		= { {"gr2d", UINT_MAX, true}, {"epp", UINT_MAX, true} },

Clock names shouldn't be passed in platform data; instead, clk_get()
should be passed the device object and device-relative (i.e. not global)
clock name. I expect if the driver is fixed to make this change, the
changes to tegra*_clocks_data.c won't be needed either.
