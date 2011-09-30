From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: tegra: Make earlyprintk choose a UART at runtime.
Date: Fri, 30 Sep 2011 15:11:21 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173A2C6B44@HQMAIL01.nvidia.com>
References: <1317061425-1030-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1317061425-1030-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Doug Anderson wrote at Monday, September 26, 2011 12:24 PM:
> With this change we automatically detect which UART to use for
> earlyprintk (and for printing during decompression).  The
> detection involves coordination with the bootloader: it's expected
> that the bootloader will leave a 'D' (for [D]ebug) in the UART
> scratchpad register for whichever UART we should use for debugging.

This works fine on Tegra20; there, even if the UART clock is off and/or
the UART is in reset, you can still read the UART_SCR register (and get
a bogus value) without the system hanging.

However, I just tested on Tegra30, and the behavior has changed; if either
a UART is in reset /or/ the UART clock is stopped, then the system hangs
when UART_SCR is read.

As such, this change will cause Tegra30 to fail to boot. I'd rather it
was augmented to check the clock enable and module reset bits as well
as the scratch register value in all cases.

Yes, I know mainline doesn't support Tegra30 yet, but we're very close
to posting the first few patches to start enabling it, and I wouldn't
want to break it right before that!

-- 
nvpublic
