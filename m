From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 9/9] ARM: tegra: Add initial support for Tegra 114 SoC.
Date: Thu, 3 Jan 2013 16:28:19 +0000
Message-ID: <201301031628.19743.arnd@arndb.de>
References: <1355996654-6579-1-git-send-email-hdoyu@nvidia.com> <1355996654-6579-10-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1355996654-6579-10-git-send-email-hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Hiroshi Doyu <hdoyu@nvidia.com>, linux-tegra@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Stephen Warren <swarren@wwwdotorg.org>, John Stultz <johnstul@us.ibm.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Landley <rob@landley.net>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawn.guo@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: linux-tegra@vger.kernel.org

On Thursday 20 December 2012, Hiroshi Doyu wrote:
> +
> +DT_MACHINE_START(TEGRA114_DT, "NVIDIA Tegra114 (Flattened Device Tree)")
> +       .smp            = smp_ops(tegra_smp_ops),
> +       .map_io         = tegra_map_common_io,
> +       .init_early     = tegra30_init_early,
> +       .init_irq       = tegra_dt_init_irq,
> +       .handle_irq     = gic_handle_irq,
> +       .init_time      = clocksource_of_init,
> +       .init_machine   = tegra114_dt_init,
> +       .init_late      = tegra_init_late,
> +       .restart        = tegra_assert_system_reset,
> +       .dt_compat      = tegra114_dt_board_compat,
> +MACHINE_END

This one is so similar to Tegra30 that I wonder if it's actually worth keeping
them separate still. The only difference I see is the clock initialization.
Maybe that can be factored out to keep this the same as Tegra30.

Or are you planning to add more SoC specific here that would make this harder?

	Arnd
