From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 0/5] rtc: tegra: cleanups to remove warning/code lines
Date: Mon, 11 Mar 2013 11:19:23 -0600
Message-ID: <513E121B.60401@wwwdotorg.org>
References: <1362991468-30226-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362991468-30226-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/11/2013 02:44 AM, Laxman Dewangan wrote:
> This patch series does the cleanups in the rtc driver as follows:
> - Protect suspend/resume with CONFIG_PM_SLEEP.
> - Use dev_pm_ops in place of legacy way for suspend/resume.
> - Properly reflect teh irq name when doing cat /proc/interrupts.
> - Use module_platform_probe() to remove boilerplate code.
> - use devm_rtc_device_register.

Assuming there's a good explanation for my question re: patch 3/5, then
the series,
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
