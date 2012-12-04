From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: tegra20: clocks: add CPU low-power function
 into tegra_cpu_car_ops
Date: Tue, 4 Dec 2012 10:42:38 +0530
Message-ID: <50BD8646.6070608@nvidia.com>
References: <1354503607-13707-1-git-send-email-josephl@nvidia.com> <1354503607-13707-3-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1354503607-13707-3-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Monday 03 December 2012 08:30 AM, Joseph Lo wrote:
> Add suspend, resume and rail_off_ready API into tegra_cpu_car_ops. These
> functions were used for CPU powered-down state maintenance.
>
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   arch/arm/mach-tegra/tegra20_clocks.c |  102 ++++++++++++++++++++++++++++++++++
>   1 files changed, 102 insertions(+), 0 deletions(-)

I have a concern here, I am working on removing these ops and replacing 
it with clock.
Adding suspend/resume to these will make it more difficult to remove.

Any other way to implement this?

> diff --git a/arch/arm/mach-tegra/tegra20_clocks.c b/arch/arm/mach-tegra/tegra20_clocks.c
> index 4eb6bc8..05968d7 100644
> --- a/arch/arm/mach-tegra/tegra20_clocks.c
> +++ b/arch/arm/mach-tegra/tegra20_clocks.c
> @@ -159,6 +159,31 @@
>   #define CPU_CLOCK(cpu)	(0x1 << (8 + cpu))
>   #define CPU_RESET(cpu)	(0x1111ul << (cpu))
>   
