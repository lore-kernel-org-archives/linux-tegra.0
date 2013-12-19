From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 2/6] misc: fuse: Add efuse driver for Tegra
Date: Thu, 19 Dec 2013 09:59:31 -0800
Message-ID: <20131219175931.GA18004@kroah.com>
References: <1387468474-26521-1-git-send-email-pdeschrijver@nvidia.com>
 <1387468474-26521-3-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1387468474-26521-3-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 19, 2013 at 05:54:30PM +0200, Peter De Schrijver wrote:
> +int tegra_fuse_sysfs(struct device *dev, int size,
> +		     u32 (*readl)(const unsigned int offset),
> +		     struct tegra_sku_info *sku_info)

Odd function name, there's no "verb" in it to give a hint as to what it
does.

> +{
> +	int err;
> +
> +	if (fuse_size)
> +		return -ENODEV;
> +
> +	fuse_bin_attr.size = size;
> +	fuse_bin_attr.read = fuse_read;
> +
> +	fuse_size = size;
> +	fuse_readl = readl;
> +
> +	err = device_create_bin_file(dev, &fuse_bin_attr);
> +	if (err)
> +		return err;
> +
> +	pr_info("Tegra Revision: %s SKU: %d CPU Process: %d Core Process: %d\n",
> +		tegra_revision_name[sku_info->revision],
> +		sku_info->sku_id, sku_info->cpu_process_id,
> +		sku_info->core_process_id);

Why pollute the kernel log with this type of thing?  Who really needs
it?

And if you really need it, please use dev_info() to properly identify
the device you are referring to.

Also, you forgot to document your new sysfs file that you created in
Documentation/ABI/ :(

thanks,

greg k-h
