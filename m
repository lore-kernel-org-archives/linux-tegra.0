From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCHv2 3/3] Documentation: DT bindings: Tegra AHB: note base
 address change
Date: Tue, 17 Mar 2015 10:38:06 +0000
Message-ID: <20150317103806.GU8656@n2100.arm.linux.org.uk>
References: <20150317083221.32662.14647.stgit@baseline>
 <20150317083221.32662.96822.stgit@baseline>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150317083221.32662.96822.stgit@baseline>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul@pwsan.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Paul Walmsley <pwalmsley@nvidia.com>, Kumar Gala <galak@codeaurora.org>, Hiroshi DOYU <hdoyu@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 17, 2015 at 01:32:21AM -0700, Paul Walmsley wrote:
>  Required properties:
>  - compatible : For Tegra20, must contain "nvidia,tegra20-ahb".  For
> -  Tegra30, must contain "nvidia,tegra30-ahb".  Otherwise, must contain
> -  '"nvidia,<chip>-ahb", "nvidia,tegra30-ahb"' where <chip> is tegra124,
> -  tegra132, or tegra210.
> -- reg : Should contain 1 register ranges(address and length)
> +  Tegra30, must contain "nvidia,tegra30-ahb".  For Tegra114 and Tegra124, must
> +  contain '"nvidia,<chip>-ahb", "nvidia,tegra30-ahb"' where <chip> is tegra114
> +  or tegra124.  For Tegra132, the compatible string must contain
> +  "nvidia,tegra132-ahb".
> +
> +- reg : Should contain 1 register ranges(address and length).  On Tegra20,
> +  Tegra30, Tegra114, and Tegra124 chips, the low byte of the physical base
> +  address of the IP block must end in 0x04.  On DT files for later chips, the
> +  actual hardware base address of the IP block should be used.

You could check that in the driver.  If you can check it in the driver,
you can also decide to ignore it if it were offset by 0x04 (possibly
printing a warning.)  That opens up the ability to fix the older Tegra
DT files going forward while still remaining compatible with existing
DT files, and avoiding the need for a complex note about this.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
