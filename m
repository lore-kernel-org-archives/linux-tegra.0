From: Gen Zhang <blackgod016574@gmail.com>
Subject: Re: [PATCH] tegra_wm9712: Fix a memory leaking bug in
 tegra_wm9712_driver_probe()
Date: Fri, 24 May 2019 22:33:09 +0800
Message-ID: <20190524143309.GA8631@zhanggen-UX430UQ>
References: <20190524005014.GA2289@zhanggen-UX430UQ>
 <b2d43dfe-17e5-a975-435b-49f2aa2ad550@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b2d43dfe-17e5-a975-435b-49f2aa2ad550@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, May 24, 2019 at 09:33:13AM +0100, Jon Hunter wrote:
> 
> On 24/05/2019 01:50, Gen Zhang wrote:
> > In tegra_wm9712_driver_probe(), 'machine->codec' is allocated by
> > platform_device_alloc(). When it is NULL, function returns ENOMEM.
> > However, 'machine' is allocated by devm_kzalloc() before this site.
> > Thus we should free 'machine' before function ends to prevent memory
> > leaking.
> 
> Memory allocated by devm_xxx() is automatically freed on failure so this
> is not correct.
Thanks for your comments, Jon. But after I examined the code, I am still
confused about the usage of devm_kmalloc(). You can kindly refer to 
hisi_sas_debugfs_init() in drivers/scsi/hisi_sas/hisi_sas_main.c. And
devm_kfree() is used to free a memory allocated by devm_kmalloc(). And
I found other situations similar to this in other files.

So, I hope you can give me some guidance on this. Thanks!
> 
> > Further, we should free 'machine->util_data', 'machine->codec' and
> > 'machine' before this function normally ends to prevent memory leaking.
> 
> This is also incorrect. Why would we free all resources after
> successfully initialising the driver?
I re-checked this part, and it is totally incorrect. It should be deleted.

Thanks
Gen
