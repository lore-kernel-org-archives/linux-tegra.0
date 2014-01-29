From: Jim Lin <jilin@nvidia.com>
Subject: Re: [PATCH v3 3/6] misc: fuse: Add efuse driver for Tegra
Date: Wed, 29 Jan 2014 10:26:18 +0800
Message-ID: <1390962378.2398.11.camel@jilin-desktop>
References: <1390952176-30402-1-git-send-email-pdeschrijver@nvidia.com>
	 <1390952176-30402-4-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1390952176-30402-4-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Landley <rob@landley.net>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Danny Huang <dahuang@nvidia.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2014-01-29 at 07:36 +0800, Peter De Schrijver wrote:
> Implement fuse driver for Tegra20, Tegra30, Tegra114 and Tegra124.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  Documentation/ABI/testing/sysfs-driver-tegra-fuse |    8 +
>  drivers/misc/fuse/Makefile                        |    1 +
>  drivers/misc/fuse/tegra/Makefile                  |    7 +
>  drivers/misc/fuse/tegra/fuse-tegra.c              |  228 ++++++++++++++++
>  drivers/misc/fuse/tegra/fuse-tegra20.c            |  136 ++++++++++
>  drivers/misc/fuse/tegra/fuse-tegra30.c            |  178 +++++++++++++
>  drivers/misc/fuse/tegra/fuse.h                    |   82 ++++++
Could we move this fuse.h to other folder under /include/linux
(like /include/linux/platform_data)
for other driver to include?
So other driver can invoke function to read fuse data if needed.

--nvpublic

