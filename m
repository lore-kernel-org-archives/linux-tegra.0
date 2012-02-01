From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 3/8] ARM: tegra: rework Tegra secondary CPU core
 bringup
Date: Tue, 31 Jan 2012 23:54:48 -0800
Message-ID: <20120201075448.GI7399@quad.lixom.net>
References: <1328028051-24271-1-git-send-email-pdeschrijver@nvidia.com>
 <1328028051-24271-4-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1328028051-24271-4-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 31, 2012 at 06:40:41PM +0200, Peter De Schrijver wrote:

> +	.align L1_CACHE_SHIFT
> +	.type	__tegra_cpu_reset_handler_data, %object
> +	.globl	__tegra_cpu_reset_handler_data
> +__tegra_cpu_reset_handler_data:
> +	.rept	TEGRA_RESET_DATA_SIZE
> +	.long	0
> +	.endr
> +	.size	__tegra_cpu_reset_handler_data, .-tegra_cpu_reset_handler_data
> +	.align L1_CACHE_SHIFT
> +

This doesn't build:

/tmp/ccPd4Pcj.s: Assembler messages:
/tmp/ccPd4Pcj.s: Error: .size expression for __tegra_cpu_reset_handler_data does not evaluate to a constant

Did you mean .-__tegra_cpu_reset_handler_data there?

-Olof
