From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: initialise parent of uart clocks
Date: Wed, 06 Feb 2013 10:43:41 -0700
Message-ID: <5112964D.50707@wwwdotorg.org>
References: <1360147661-5435-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360147661-5435-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/06/2013 03:47 AM, Laxman Dewangan wrote:
> Initialise the parent of UARTs to PLLP

OK

> and disabling clock by default.

Hmm. Only the clocks initialized by the new entries you added are marked
disabled (or rather, not actively enabled; if they're enabled already,
they won't be disabled). We should treat all UARTs equally. Historically
we've needed to enable the serial clocks forcibly since the regular
serial driver didn't call clk_get() or clk_prepare_enable() on any
clocks, but I notice that it does now, since sometime in kernel 3.8. As
such, I think you can modify all the UART entries in these tables to
have the enable/state field set to false (0). Can you try that and check
that it works for the serial console ports? Thanks.
