From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: Re: [PATCH v5 6/6] soc/tegra: Expose Boot Configuration Table via
 sysfs
Date: Mon, 18 May 2020 09:45:57 +0200
Message-ID: <20200518074557.GA12306@qmqm.qmqm.pl>
References: <20200516153644.13748-1-digetx@gmail.com>
 <20200516153644.13748-7-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200516153644.13748-7-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nils =?iso-8859-2?Q?=D6stlund?= <nils-ElENwYY5mljQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles-4LeZiQkTMnPR7s880joybQ@public.gmane.org>, Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TasMV2rI37PzA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, May 16, 2020 at 06:36:44PM +0300, Dmitry Osipenko wrote:
> It's quite useful to have unencrypted BCT exposed to userspace for
> debugging purposes, so let's expose it via sysfs.  The BCT data will be
> present in '/sys/tegra/boot_config_table' binary file if BCT is available.
[...]
> +/*
> + * spare_bct[] will be released once kernel is booted, hence not wasting
> + * kernel space if BCT is missing. The tegra_bct can't be allocated during
> + * of BCT setting up because it's too early for the slab allocator.
> + */
> +static u8 spare_bct[SZ_8K] __initdata;
> +static u8 *tegra_bct;
> +
> +static ssize_t boot_config_table_read(struct file *filp,
> +				      struct kobject *kobj,
> +				      struct bin_attribute *bin_attr,
> +				      char *buf, loff_t off, size_t count)
> +{
> +	memcpy(buf, tegra_bct + off, count);
> +	return count;
> +}
> +static BIN_ATTR_RO(boot_config_table, 0);
> +
> +static int __init tegra_bootdata_bct_sysfs_init(void)
> +{
> +	if (!bin_attr_boot_config_table.size)
> +		return 0;
> +
> +	tegra_bct = kmalloc(GFP_KERNEL, bin_attr_boot_config_table.size);
> +	if (!tegra_bct)
> +		return -ENOMEM;
> +
> +	memcpy(tegra_bct, spare_bct, bin_attr_boot_config_table.size);
> +
> +	return sysfs_create_bin_file(tegra_soc_kobj,
> +				     &bin_attr_boot_config_table);

Should we consider freeing the table if sysfs registration fails?

> +}
> +late_initcall(tegra_bootdata_bct_sysfs_init)
> +
> +void __init tegra_bootdata_bct_setup(void __iomem *bct_ptr, size_t bct_size)
> +{
> +	memcpy_fromio(spare_bct, bct_ptr, bct_size);
> +	bin_attr_boot_config_table.size = bct_size;
[...]

The size isn't checked anywhere. How the maximum is obtained? At least
a comment would be good if the 8k limit is guaranteed by other means.

Best Regards,
Micha³ Miros³aw
