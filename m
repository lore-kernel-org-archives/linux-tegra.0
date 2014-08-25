From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [pinmux PATCH] Jetson TK1: add missing PCIe-related pin configuration
Date: Mon, 25 Aug 2014 10:22:24 -0600
Message-ID: <53FB62C0.8040804@wwwdotorg.org>
References: <1408741353-10259-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408741353-10259-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/22/2014 03:02 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The Jetson TK1 spreadsheet is missing configuration for the PCIe clk_req,
> rst, and wake pins. This causes the generated pinmux tables to also omit
> any configuration for these pins, which in turn causes U-Boot's and the
> Linux Kernel's PCIe support to fail.
>
> Manually add configuration for these pins. The values here match the
> values found in the downstream L4T kernel, and common sense based on the
> usage of these pins.

I've applied this.
