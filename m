From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: disable nonboot CPUs when reboot
Date: Fri, 07 Jun 2013 15:28:38 -0600
Message-ID: <51B25086.6020209@wwwdotorg.org>
References: <1370597810-1153-1-git-send-email-josephl@nvidia.com> <51B20DF1.3030207@wwwdotorg.org> <20130607181846.GL8111@mudshark.cambridge.arm.com> <51B22CDC.4080200@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51B22CDC.4080200-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/07/2013 12:56 PM, Stephen Warren wrote:
...
> [1] Perhaps the issue is why ipi_send_stop() calls down into 
> tegra_cpu_kill() rather than tegra_cpu_die(), since die() is what
> should be run on the killed CPU, and kill() on the killing CPU?

Scratch that; I don't think it's calling down to /either/; I was
confused. It seems like it /should/ call cpu_die() though, at least if
hotplug is enabled, right?
