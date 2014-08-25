From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add PCIe-related pins to the Jetson TK1 pinmux
 tables
Date: Mon, 25 Aug 2014 11:24:49 -0600
Message-ID: <53FB7161.7040502@wwwdotorg.org>
References: <1408742308-18004-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408742308-18004-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/22/2014 03:18 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> This pinmux tables currently omit any configuration for PCIe clk_req,
> wake, and rst pins, which in turn causes intermittent failures in
> U-Boot's PCIe support. Import an updated version of the pinmux tables
> which rectifies this.
>
> (While I'm still hoping to remove the pinmux tables from DTs for
> Tegra124+ devices, while they're still here, they may as well be
> complete and correct).

I've applied this to Tegra's for-3.18/dt branch.
