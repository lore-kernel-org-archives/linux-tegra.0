From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: cpufreq: move clk_get/put out of function
 tegra_cpu_init/exit
Date: Wed, 02 Jan 2013 12:36:42 -0700
Message-ID: <50E48C4A.6080207@wwwdotorg.org>
References: <1356084595-17800-1-git-send-email-linuxzsc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1356084595-17800-1-git-send-email-linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/21/2012 03:09 AM, Richard Zhao wrote:
> tegra_cpu_init/exit will be called every time one cpu core is online or
> offline. And all cpu cores share same clocks, redundant clk_get/put
> wast time,  so I move them out.

I've applied this to Tegra's for-3.9/soc branch.
