From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [pinmux scripts PATCH] Support Tegra210
Date: Mon, 09 Mar 2015 10:06:19 -0600
Message-ID: <54FDC4FB.6000000@wwwdotorg.org>
References: <1424810874-21783-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424810874-21783-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/24/2015 01:47 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Tegra210 changes the pinmux HW in a few ways; at least:
>
> - The set of drive groups is much more 1:1 with the set of pins. Most
>    pins have an associated drive group register as well as an associated
>    pinmux register, and most drive groups cover a single pin.
> - Some register fields have moved from the drive group registers into
>    the pinmux registers.
> - The set of available options for each pin and group varies relative to
>    previous chips, and hence the register layouts vary a bit too.
>
> This patch updates tegra-pinmux-scripts minimally to handle these
> changes, to a level equivalent to the support for previous chips. For
> example, some new options such as per-pin schmitt aren't handled since
> the syseng-supplied pinmux spreadsheets don't provide a value for this
> option.
>
> csv-to-board-tegra124-xlsx.py is renamed to csv-to-board.py since it now
> supports boards using different SoCs, and it's not worth encoding all
> supported SoCs in the filename (Tegra30/114 aren't supported by it, hence
> the previous naming).

Both the U-Boot and Linux kernel SoC drivers that this patch generates 
are now checked in to those project. Hence, I've applied this.
