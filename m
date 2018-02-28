From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH] clk: tegra: fix pllu rate configuration
Date: Wed, 28 Feb 2018 11:36:20 +0200
Message-ID: <20180228093620.GC6190@tbergstrom-lnx.Nvidia.com>
References: <20180222230451.15515-1-marcel@ziswiler.com>
 <31f039e8-9afc-22d1-d478-a7f41db0dace@gmail.com>
 <1519686262.6374.3.camel@toradex.com>
 <d6564dd4-de2c-5b28-81d2-6be7bd4319b2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d6564dd4-de2c-5b28-81d2-6be7bd4319b2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 27, 2018 at 02:59:11PM +0300, Dmitry Osipenko wrote:
> On 27.02.2018 02:04, Marcel Ziswiler wrote:
> > On Mon, 2018-02-26 at 15:42 +0300, Dmitry Osipenko wrote:
> >> On 23.02.2018 02:04, Marcel Ziswiler wrote:
> >>> Turns out latest upstream U-Boot does not configure/enable pllu
> >>> which
> >>> leaves it at some default rate of 500 kHz:
> >>>
> >>> root@apalis-t30:~# cat /sys/kernel/debug/clk/clk_summary | grep
> >>> pll_u
> >>>        pll_u                  3        3        0      500000      
> >>>     0
> >>>
> >>> Of course this won't quite work leading to the following messages:
> >>>
> >>> [    6.559593] usb 2-1: new full-speed USB device number 2 using
> >>> tegra-
> >>> ehci
> >>> [   11.759173] usb 2-1: device descriptor read/64, error -110
> >>> [   27.119453] usb 2-1: device descriptor read/64, error -110
> >>> [   27.389217] usb 2-1: new full-speed USB device number 3 using
> >>> tegra-
> >>> ehci
> >>> [   32.559454] usb 2-1: device descriptor read/64, error -110
> >>> [   47.929777] usb 2-1: device descriptor read/64, error -110
> >>> [   48.049658] usb usb2-port1: attempt power cycle
> >>> [   48.759475] usb 2-1: new full-speed USB device number 4 using
> >>> tegra-
> >>> ehci
> >>> [   59.349457] usb 2-1: device not accepting address 4, error -110
> >>> [   59.509449] usb 2-1: new full-speed USB device number 5 using
> >>> tegra-
> >>> ehci
> >>> [   70.069457] usb 2-1: device not accepting address 5, error -110
> >>> [   70.079721] usb usb2-port1: unable to enumerate USB device
> >>>
> >>> Fix this by actually allowing the rate also being set from within
> >>> the Linux kernel.

I think the best solution to this problem would be to make pll_u a fixed
clock and enable it and program the rate if it's not enabled at boot.
This is how it's done for Tegra210. The reason is that the USB IP blocks
can control the pll_u state in hw. This means that if sw would disable
and then re-enable the pll_u clock, but there is no USB activity, pll_u
will still be disable and therefor not lock, causing an error. Today
this is worked around by not polling the lock bit for pll_u, but a better
solution would be to just remove all sw controls for pll_u.

Peter.
