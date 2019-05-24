From: Gen Zhang <blackgod016574@gmail.com>
Subject: Re: [PATCH] tegra_wm9712: Fix a memory leaking bug in
 tegra_wm9712_driver_probe()
Date: Fri, 24 May 2019 23:42:52 +0800
Message-ID: <20190524154252.GA10186@zhanggen-UX430UQ>
References: <20190524005014.GA2289@zhanggen-UX430UQ>
 <b2d43dfe-17e5-a975-435b-49f2aa2ad550@nvidia.com>
 <20190524143309.GA8631@zhanggen-UX430UQ>
 <e52f4140-a119-a584-40a2-6359d6e1784a@nvidia.com>
 <20190524150053.GA9235@zhanggen-UX430UQ>
 <1740686f-a466-430c-9d01-ab83ea6998ac@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1740686f-a466-430c-9d01-ab83ea6998ac@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, May 24, 2019 at 04:36:54PM +0100, Jon Hunter wrote:
> There could well be cases where you need to explicitly call
> devm_kfree(), but having a quick glance at the example above, I don't
> see why you would call devm_kfree() here and yes looks like that code
> could be simplified significantly. Notice that hisi_sas_debugfs_exit()
> does not free any memory as it is not necessary to explicitly do so.
> 
> Cheers
> Jon
> 
> -- 
> nvpublic
Thanks for your suggestions, Jon! I think I need to e-mail to those
maintainers about this issue.

Thanks
Gen
