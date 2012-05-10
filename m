From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: tegra30: Add Tegra Memory Controller(MC) driver
Date: Thu, 10 May 2012 14:46:04 -0700
Message-ID: <20120510214604.GA3525@kroah.com>
References: <1336635764-30597-1-git-send-email-hdoyu@nvidia.com>
 <1336635764-30597-3-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1336635764-30597-3-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Benoit Cousson <b-cousson-l0cyMroinI0@public.gmane.org>, Aneesh V <aneesh-l0cyMroinI0@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 10, 2012 at 10:42:32AM +0300, Hiroshi DOYU wrote:
> Tegra Memory Controller(MC) driver for Tegra30
> Added to support MC General interrupts, mainly for IOMMU(SMMU).

I'll apply this, but:

> +static inline u32 mc_readl(struct tegra30_mc *mc, u32 offs)
> +{
> +	if (offs < 0x10)
> +		return readl(mc->regs[0] + offs);
> +	BUG_ON(offs < 0x3c);
> +	if (offs < 0x1f0)
> +		return readl(mc->regs[1] + offs - 0x3c);
> +	BUG_ON(offs < 0x200);
> +	if (offs < 0x228)
> +		return readl(mc->regs[2] + offs - 0x200);
> +	BUG_ON(offs < 0x284);
> +	if (offs < 0x400)
> +		return readl(mc->regs[3] + offs - 0x284);
> +	BUG();
> +}

That's a lot of BUG* calls.  Same thing with the 1/4 patch in this
series.

We really should not have a BUG call in any driver, as you just stopped
the whole system.  I can understand this being there for debugging when
you create the code originally, but as these are things no one should
ever be able to hit now, you should remove them, right?

Care to write a follow-on patch removing all of these BUG_ON and BUG
calls in this and the drivers/memory/tegra20-mc.c driver?

thanks,

greg k-h
