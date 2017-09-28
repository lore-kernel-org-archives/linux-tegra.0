From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v1 1/2] staging: Introduce NVIDIA Tegra20 video decoder
 driver
Date: Thu, 28 Sep 2017 10:23:08 +0300
Message-ID: <20170928072308.s7npizjfnhkxh6zb@mwanda>
References: <cover.1506377430.git.digetx@gmail.com>
 <5c8b83775b982e6ee851c127444a8e839f422ad0.1506377430.git.digetx@gmail.com>
 <20170927094557.yr2fl5arodjnh637@mwanda>
 <2b77bfa7-1272-3d11-9190-326fa0f85f22@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2b77bfa7-1272-3d11-9190-326fa0f85f22@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 28, 2017 at 02:28:04AM +0300, Dmitry Osipenko wrote:
> >> +	if (is_baseline_profile)
> >> +		frame->aux_paddr = 0xF4DEAD00;
> > 
> > The handling of is_baseline_profile is strange to me.  It feels like we
> > should always check it before we use ->aux_paddr but we don't ever do
> > that.
> > 
> 
> In a case of baseline profile, aux buffer isn't needed, HW should't use it. Aux
> phys address is set to a predefined and invalid address, so that in a case of
> VDE trying to use it, its invalid memory accesses would be reported in KMSG by
> memory controller driver and the reported invalid addresses would be known to be
> associated with the aux buffer. I'm not sure what you are meaning.

It's not used perhaps, but we do write it to the hardware, right?

	tegra_vde_write_iram_entry(iram_tables, 0, i, value, aux_paddr);

It's just strange.

regards,
dan carpenter
