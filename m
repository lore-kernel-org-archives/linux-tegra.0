From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V2 1/3] soc/tegra: fuse: Add custom SoC attributes
Date: Tue, 31 Mar 2020 16:39:15 +0300
Message-ID: <4f1fabbb-a0a3-6f7d-f62c-2bd545f2644a@gmail.com>
References: <20200331103341.19571-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200331103341.19571-1-jonathanh@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

31.03.2020 13:33, Jon Hunter пишет:
> Add a custom SoC attribute for Tegra to expose the HIDREV register
> fields to userspace via the sysfs. This register provides additional
> details about the type of device (eg, silicon, FPGA, etc) as well as
> revision. Exposing this information is useful for identifying the
> exact device revision and device type.
> 
> For Tegra devices up until Tegra186, the majorrev and minorrev fields of
> the HIDREV register are used to determine the device revision and device
> type. For Tegra194, the majorrev and minorrev fields only determine the
> revision. Starting with Tegra194, there is an additional field,
> pre_si_platform (which occupies bits 20-23), that now determines device
> type. Therefore, for all Tegra devices, add a custom SoC attribute for
> the majorrev and minorrev fields and for Tegra194 add an additional
> attribute for the pre_si_platform field.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra.c    | 51 ++++++++++++++++++++++++++
>  drivers/soc/tegra/fuse/fuse-tegra20.c  |  1 +
>  drivers/soc/tegra/fuse/fuse-tegra30.c  |  6 +++
>  drivers/soc/tegra/fuse/fuse.h          |  8 ++++
>  drivers/soc/tegra/fuse/tegra-apbmisc.c | 10 +++++
>  5 files changed, 76 insertions(+)
> 
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
> index 802717b9f6a3..639734dca5df 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
> @@ -300,6 +300,56 @@ static void tegra_enable_fuse_clk(void __iomem *base)
>  	writel(reg, base + 0x14);
>  }
>  
> +static ssize_t tegra_soc_majorrev_show(struct device *dev,
> +				       struct device_attribute *attr,
> +				       char *buf)
> +{
> +	return sprintf(buf, "%d\n", tegra_get_major_rev());
> +}
> +
> +static DEVICE_ATTR(majorrev, S_IRUGO, tegra_soc_majorrev_show,  NULL);
> +
> +static ssize_t tegra_soc_minorrev_show(struct device *dev,
> +				       struct device_attribute *attr,
> +				       char *buf)
> +{
> +	return sprintf(buf, "%d\n", tegra_get_minor_rev());
> +}
> +
> +static DEVICE_ATTR(minorrev, S_IRUGO, tegra_soc_minorrev_show,  NULL);

Checkpatch should give a warning about that permission isn't in octal
format, please don't ignore it.
