From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: tegra: add seaboard, wario and kaen boards
Date: Tue, 22 Feb 2011 20:48:21 +0000
Message-ID: <20110222204821.GE29559@n2100.arm.linux.org.uk>
References: <1298354117-19097-1-git-send-email-olof@lixom.net> <1298354117-19097-7-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1298354117-19097-7-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 21, 2011 at 11:55:17PM -0600, Olof Johansson wrote:
> +++ b/arch/arm/mach-tegra/board-seaboard-pinmux.c
> @@ -0,0 +1,179 @@
> +/*
> + * Copyright (C) 2010 NVIDIA Corporation
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +
> +#include <mach/pinmux.h>
> +#include <mach/pinmux-t2.h>
> +#include <mach/gpio.h>

Another linux/gpio.h please.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
