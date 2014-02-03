From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v3 3/6] misc: fuse: Add efuse driver for Tegra
Date: Mon, 3 Feb 2014 16:15:29 +0200
Message-ID: <20140203141529.GF19389@tbergstrom-lnx.Nvidia.com>
References: <1390952176-30402-1-git-send-email-pdeschrijver@nvidia.com>
 <1390952176-30402-4-git-send-email-pdeschrijver@nvidia.com>
 <1390962378.2398.11.camel@jilin-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1390962378.2398.11.camel@jilin-desktop>
Sender: linux-doc-owner@vger.kernel.org
To: Jim Lin <jilin@nvidia.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Landley <rob@landley.net>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Danny Huang <dahuang@nvidia.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 29, 2014 at 03:26:18AM +0100, Jim Lin wrote:
> On Wed, 2014-01-29 at 07:36 +0800, Peter De Schrijver wrote:
> > Implement fuse driver for Tegra20, Tegra30, Tegra114 and Tegra124.
> > 
> > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> > ---
> >  Documentation/ABI/testing/sysfs-driver-tegra-fuse |    8 +
> >  drivers/misc/fuse/Makefile                        |    1 +
> >  drivers/misc/fuse/tegra/Makefile                  |    7 +
> >  drivers/misc/fuse/tegra/fuse-tegra.c              |  228 ++++++++++++++++
> >  drivers/misc/fuse/tegra/fuse-tegra20.c            |  136 ++++++++++
> >  drivers/misc/fuse/tegra/fuse-tegra30.c            |  178 +++++++++++++
> >  drivers/misc/fuse/tegra/fuse.h                    |   82 ++++++
> Could we move this fuse.h to other folder under /include/linux
> (like /include/linux/platform_data)
> for other driver to include?

I don't think we should expose everything in fuse.h to the world.

> So other driver can invoke function to read fuse data if needed.

Which functionality do you want? Just reading the fuse data exposed in
the sysfs file from a driver? exporting tegra_fuse_readl() should do
that I think?

Cheers,

Peter.
