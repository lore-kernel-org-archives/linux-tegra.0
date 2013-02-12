From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: Re: [v2 3/3] ARM: tegra: Unify Device tree board files
Date: Tue, 12 Feb 2013 06:04:56 +0100
Message-ID: <20130212.070456.532657136988541923.hdoyu@nvidia.com>
References: <5119849B.1070300@wwwdotorg.org><20130212.061240.2083183700176617607.hdoyu@nvidia.com><5119C958.1030304@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5119C958.1030304@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "arnd@arndb.de" <arnd@arndb.de>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "marvin24@gmx.de" <marvin24@gmx.de>, "balbi@ti.com" <balbi@ti.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren@wwwdotorg.org> wrote @ Tue, 12 Feb 2013 05:47:20 +0100:

> >>>  static void __init harmony_init(void)
> >>>  {
> >>> -#ifdef CONFIG_TEGRA_PCI
> >>>  	int ret;
> >>>  
> >>>  	ret = harmony_pcie_init();
> >>>  	if (ret)
> >>>  		pr_err("harmony_pcie_init() failed: %d\n", ret);
> >>> -#endif
> >>>  }
> >>
> >> Why drop those ifdefs? Does the code still compile (link) if built for
> >> Tegra30-only or Tegra114-only, where the Tegra PCI driver won't be
> >> enabled, and hence those functions don't exist?
> > 
> > This function itself will be dropped by the following IS_ENABLED().
> > 
> >>>  static void __init paz00_init(void)
> >>> @@ -129,6 +128,9 @@ static void __init tegra_dt_init_late(void)
> >>>  
> >>>  	tegra_init_late();
> >>>  
> >>> +	if (IS_ENABLED(CONFIG_PCI) && IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC))
> >>> +		return;
> >>
> >> I don't think that's going to help any link issues, so I'd drop it and
> >> keep this function simple.
> > 
> > As explained in the above, a complier will drop unnecessary functions
> > automatically with this IS_ENABLED(), which could save many ifdefs.
> 
> That sounds extremely brittle. Have you validated this on a wide variety
> of compiler versions?

I verified with gcc-4.6.
IIRC, that's the point of IS_ENABLED() being introduced. Arnd?
