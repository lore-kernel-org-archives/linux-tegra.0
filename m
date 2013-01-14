From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: Use DT /cpu node to detect number of
	CPU core
Date: Mon, 14 Jan 2013 09:27:20 +0000
Message-ID: <20130114092720.GX23505@n2100.arm.linux.org.uk>
References: <1358149970-28156-1-git-send-email-hdoyu@nvidia.com> <1358149970-28156-2-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1358149970-28156-2-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 14, 2013 at 09:52:50AM +0200, Hiroshi Doyu wrote:
> +	if (!arm_dt_cpu_map_valid())
> +		set_cpu_possible(0, true);

You don't need to do any of this (and, therefore, I don't think you even
need the first patch.)

The generic boot code will set CPU0 as possible, present and online.  Think
about it: you're booting on that very CPU so it better be possible, present
and online.  If it isn't, what CPU is executing your code?

arm_dt_init_cpu_maps() will only ever set _additional_ CPUs in the possible
map.

Ergo, by the time the above code is run, CPU0 will already be marked as
possible.  Therefore, the above code and arm_dt_cpu_map_valid() is not
required.
