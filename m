From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: Re: [PATCH 9/9] ARM: tegra: Add initial support for Tegra 114 SoC.
Date: Fri, 4 Jan 2013 08:16:07 +0100
Message-ID: <20130104.091607.1562807518754570421.hdoyu@nvidia.com>
References: <1355996654-6579-1-git-send-email-hdoyu@nvidia.com><1355996654-6579-10-git-send-email-hdoyu@nvidia.com><201301031628.19743.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <201301031628.19743.arnd@arndb.de>
Sender: linux-doc-owner@vger.kernel.org
To: "arnd@arndb.de" <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "andrew@lunn.ch" <andrew@lunn.ch>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "johnstul@us.ibm.com" <johnstul@us.ibm.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob@landley.net" <rob@landley.net>, "olof@lixom.net" <olof@lixom.net>, "tglx@linutronix.de" <tglx@linutronix.de>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "plagnioj@jcrosoft.com" <plagnioj@jcroso>
List-Id: linux-tegra@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> wrote @ Thu, 3 Jan 2013 17:28:19 +0100:

> On Thursday 20 December 2012, Hiroshi Doyu wrote:
> > +
> > +DT_MACHINE_START(TEGRA114_DT, "NVIDIA Tegra114 (Flattened Device Tree)")
> > +       .smp            = smp_ops(tegra_smp_ops),
> > +       .map_io         = tegra_map_common_io,
> > +       .init_early     = tegra30_init_early,
> > +       .init_irq       = tegra_dt_init_irq,
> > +       .handle_irq     = gic_handle_irq,
> > +       .init_time      = clocksource_of_init,
> > +       .init_machine   = tegra114_dt_init,
> > +       .init_late      = tegra_init_late,
> > +       .restart        = tegra_assert_system_reset,
> > +       .dt_compat      = tegra114_dt_board_compat,
> > +MACHINE_END
> 
> This one is so similar to Tegra30 that I wonder if it's actually worth keeping
> them separate still. The only difference I see is the clock initialization.
> Maybe that can be factored out to keep this the same as Tegra30.
> 
> Or are you planning to add more SoC specific here that would make this harder?

That was the original plan, but I'll consider if your proposal works
or not once again. Thanks.
