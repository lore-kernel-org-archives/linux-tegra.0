From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: tegra: make tegra_resume can work with current
 and later chips
Date: Tue, 08 Oct 2013 11:00:20 -0600
Message-ID: <52543A24.3020108@wwwdotorg.org>
References: <1381220587-29697-1-git-send-email-josephl@nvidia.com> <1381220587-29697-4-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381220587-29697-4-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/08/2013 02:23 AM, Joseph Lo wrote:
> Because the CPU0 was the first up and the last down core when cluster
> power up/down or platform suspend. So only CPU0 needs the rest of the
> functions to reset flow controller and re-enable SCU and L2. We also
> move the L2 init function for Cortex-A15 to there. The secondery CPU
> can just call cpu_resume.

Is that really true? I thought that starting with Tegra114, all the CPUs
were independent, so that any CPU could be the last CPU to be
power-gated. Isn't that exactly why we don't need coupled cpuidle or
anything similar on Tegra114

> diff --git a/arch/arm/mach-tegra/reset-handler.S b/arch/arm/mach-tegra/reset-handler.S

>  not_ca9:
> +	mov32	r9, 0xc0f
> +	cmp	r8, r9
> +	bleq	tegra_init_l2_for_a15

That's checking whether the CPU type is a Cortex-A15, isn't it? The only
CPUs that exist NVIDIA SoCs are Cortex-A9 and Cortex-A15, so I don't see
why we need to check whether the CPU is a Cortex-A15, given this label
is jumped to only when the CPU isn't a Cortex-A9.
