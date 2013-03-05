From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 03/10] ARM: tegra: get power management configurations
 for PMC from DT
Date: Tue, 05 Mar 2013 11:41:17 -0700
Message-ID: <51363C4D.9090702@wwwdotorg.org>
References: <1362397207-5597-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362397207-5597-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/04/2013 04:40 AM, Joseph Lo wrote:
> If the system supports deep sleep mode (i.e. suspend), it should have
> the power management configuration for PMC in the DT under the sub-node
> of PMC. Different system may have different configurations, it should
> be parsed from DT.

> diff --git a/arch/arm/mach-tegra/pmc.c b/arch/arm/mach-tegra/pmc.c

> +struct pmc_pm_data {
> +	unsigned long cpu_good_time;	/* CPU power good time in uS */
> +	unsigned long cpu_off_time;	/* CPU power off time in uS */
> +	unsigned long core_osc_time;	/* Core power good osc time in uS */
> +	unsigned long core_pmu_time;	/* Core power good pmu time in uS */
> +	unsigned long core_off_time;	/* Core power off time in uS */

Since those values are all coming from DT, shouldn't they be u32 to
match the DT cell type?
