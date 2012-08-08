From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: dt: tegra: cardhu: add entry for regulators
Date: Wed, 08 Aug 2012 11:28:58 -0600
Message-ID: <5022A1DA.5000203@wwwdotorg.org>
References: <1344408527-32051-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344408527-32051-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/08/2012 12:48 AM, Laxman Dewangan wrote:
> This patch series add the PMIC and fixed regulators for 
> cardhu board. There is multiple versions of cardhu baord named
> as A01, A02, A03..and so on. Cardhu A01 and A03 are not supported.
> Cardhu A02 and A04 have different sets of GPIO for regualtors.
> The cardhu A04 is compatible for A05, A06 and A07 in GPIOs.
> This patch series split the cardhu dts file to cardhu-a02 and 
> carchu-a04 and then add entry for different fixed regualtors.

Two more comments on this patch, sorry for the noise...

1) With this patch, running "reboot" or "shutdown -r now" no longer
works; the system hangs. Reboot works fine without this patch, in
next-20120708.

2) U-Boot initializes the LCD, and prints to it. This is left running
when the kernel is booted, and the kernel doesn't reprogram the HW, so
the LCD continues to scan out some "random" area of memory. Typically,
this then gets used and so the LCD shows random patterns. In today's
linux-next it seems to be turned black though; not sure why that's
happening. Either way, this patch turns the whole LCD completely white.
Is that an expected change?
