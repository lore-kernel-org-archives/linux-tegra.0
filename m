From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: harmony: initialize the TPS65862 PMIC
Date: Wed, 9 Mar 2011 12:22:22 +0000
Message-ID: <20110309122222.GG6923@opensource.wolfsonmicro.com>
References: <cover.1299588456.git.mike@compulab.co.il>
 <4ade6d195fff78271085eafb0a99de3be8beb426.1299588456.git.mike@compulab.co.il>
 <20110308131541.GB5892@sirena.org.uk>
 <4D772F23.70304@compulab.co.il>
 <20110309101508.GD6923@opensource.wolfsonmicro.com>
 <4D776A42.9030107@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4D776A42.9030107-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 09, 2011 at 01:53:38PM +0200, Mike Rapoport wrote:

> As for me, I'd be fine with registering only the pex_clk supply and ldo0 to
> allow PCI-e on Harmony :)
> If Tegra folks are Ok with it, I'd drop the rest and we'll add more regulators
> and supplies together with drivers that use them.

Note that there's no issue with having no supplies set for a regulator
so no reason not to register the supplies themselves, it's just the
supply map that I was flagging.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
