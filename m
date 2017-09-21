From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] firmware: tegra: add BPMP debugfs support
Date: Thu, 21 Sep 2017 12:10:06 +0100
Message-ID: <31191fe9-41d6-5527-2a31-389d113c459e@nvidia.com>
References: <1503410640-2691-1-git-send-email-talho@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1503410640-2691-1-git-send-email-talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Timo,

On 22/08/17 15:04, Timo Alho wrote:
> Tegra power management firmware running on co-processor (BPMP)
> implements a simple pseudo file system akin to debugfs. The file
> system can be used for debugging purposes to examine and change the
> status of selected resources controlled by the firmware (such as
> clocks, resets, voltages, powergates, ...).
> 
> Add support to "mirror" the firmware's file system to debugfs. At
> boot, query firmware for a list of all possible files and create
> corresponding debugfs entries. Read/write of individual files is
> implemented by sending a Message ReQuest (MRQ) that passes the full
> file path name and data to firmware via DRAM.
> 
> Signed-off-by: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/firmware/tegra/Makefile       |   4 +-
>  drivers/firmware/tegra/bpmp.c         |   2 +
>  drivers/firmware/tegra/bpmp_debugfs.c | 446 ++++++++++++++++++++++++++++++++++
>  include/soc/tegra/bpmp.h              |  14 ++
>  4 files changed, 465 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/firmware/tegra/bpmp_debugfs.c
> 
> diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/Makefile
> index e34a2f7..0314568 100644
> --- a/drivers/firmware/tegra/Makefile
> +++ b/drivers/firmware/tegra/Makefile
> @@ -1,2 +1,4 @@
> -obj-$(CONFIG_TEGRA_BPMP)	+= bpmp.o
> +tegra-bpmp-y			= bpmp.o
> +tegra-bpmp-$(CONFIG_DEBUG_FS)	+= bpmp_debugfs.o
> +obj-$(CONFIG_TEGRA_BPMP)	+= tegra-bpmp.o
>  obj-$(CONFIG_TEGRA_IVC)		+= ivc.o
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> index 73ca55b..bf2a376 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -824,6 +824,8 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
>  	if (err < 0)
>  		goto free_mrq;
>  
> +	(void)tegra_bpmp_init_debugfs(bpmp);
> +

This looks a bit odd, why not just return the error code here?

>  	return 0;
>  
>  free_mrq:
> diff --git a/drivers/firmware/tegra/bpmp_debugfs.c b/drivers/firmware/tegra/bpmp_debugfs.c
> new file mode 100644
> index 0000000..4d0279d
> --- /dev/null
> +++ b/drivers/firmware/tegra/bpmp_debugfs.c
> @@ -0,0 +1,446 @@
> +/*
> + * Copyright (c) 2017, NVIDIA CORPORATION.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + */
> +#include <linux/debugfs.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/uaccess.h>
> +
> +#include <soc/tegra/bpmp.h>
> +#include <soc/tegra/bpmp-abi.h>
> +
> +struct seqbuf {
> +	char *buf;
> +	size_t pos;
> +	size_t size;
> +};
> +
> +static void seqbuf_init(struct seqbuf *seqbuf, void *buf, size_t size)
> +{
> +	seqbuf->buf = buf;
> +	seqbuf->size = size;
> +	seqbuf->pos = 0;
> +}
> +
> +static size_t seqbuf_avail(struct seqbuf *seqbuf)
> +{
> +	return seqbuf->pos < seqbuf->size ? seqbuf->size - seqbuf->pos : 0;
> +}
> +
> +static size_t seqbuf_status(struct seqbuf *seqbuf)
> +{
> +	return seqbuf->pos <= seqbuf->size ? 0 : -EOVERFLOW;
> +}
> +
> +static int seqbuf_eof(struct seqbuf *seqbuf)
> +{
> +	return seqbuf->pos >= seqbuf->size;
> +}
> +
> +static int seqbuf_read(struct seqbuf *seqbuf, void *buf, size_t nbyte)
> +{
> +	nbyte = min(nbyte, seqbuf_avail(seqbuf));
> +	memcpy(buf, seqbuf->buf + seqbuf->pos, nbyte);
> +	seqbuf->pos += nbyte;
> +	return seqbuf_status(seqbuf);
> +}
> +
> +static int seqbuf_read_u32(struct seqbuf *seqbuf, uint32_t *v)
> +{
> +	int err;
> +
> +	err = seqbuf_read(seqbuf, v, 4);
> +	*v = le32_to_cpu(*v);
> +	return err;
> +}
> +
> +static int seqbuf_read_str(struct seqbuf *seqbuf, const char **str)
> +{
> +	*str = seqbuf->buf + seqbuf->pos;
> +	seqbuf->pos += strnlen(*str, seqbuf_avail(seqbuf));
> +	seqbuf->pos++;
> +	return seqbuf_status(seqbuf);
> +}
> +
> +static void seqbuf_seek(struct seqbuf *seqbuf, ssize_t offset)
> +{
> +	seqbuf->pos += offset;
> +}
> +
> +/* map filename in Linux debugfs to corresponding entry in BPMP */
> +static const char *get_filename(struct tegra_bpmp *bpmp,
> +				const struct file *file, char *buf, int size)
> +{
> +	char root_path_buf[512];
> +	const char *root_path;
> +	const char *filename;
> +	size_t root_len;
> +
> +	root_path = dentry_path_raw(bpmp->debugfs_mirror, root_path_buf,
> +				    sizeof(root_path_buf));
> +	if (IS_ERR_OR_NULL(root_path))

Looks like IS_ERR() is sufficient here.

> +		return NULL;
> +
> +	root_len = strlen(root_path);
> +
> +	filename = dentry_path(file->f_path.dentry, buf, size);
> +	if (IS_ERR_OR_NULL(filename))

And here.

> +		return NULL;
> +
> +	if (strlen(filename) < root_len ||
> +			strncmp(filename, root_path, root_len))
> +		return NULL;
> +
> +	filename += root_len;
> +
> +	return filename;
> +}
> +
> +static int mrq_debugfs_read(struct tegra_bpmp *bpmp,
> +			    dma_addr_t name, size_t sz_name,
> +			    dma_addr_t data, size_t sz_data,
> +			    size_t *nbytes)
> +{
> +	struct mrq_debugfs_request req = {
> +		.cmd = cpu_to_le32(CMD_DEBUGFS_READ),
> +		.fop = {
> +			.fnameaddr = cpu_to_le32((uint32_t)name),
> +			.fnamelen = cpu_to_le32((uint32_t)sz_name),
> +			.dataaddr = cpu_to_le32((uint32_t)data),
> +			.datalen = cpu_to_le32((uint32_t)sz_data),
> +		},
> +	};
> +	struct mrq_debugfs_response resp;
> +	struct tegra_bpmp_message msg = {
> +		.mrq = MRQ_DEBUGFS,
> +		.tx = {
> +			.data = &req,
> +			.size = sizeof(req),
> +		},
> +		.rx = {
> +			.data = &resp,
> +			.size = sizeof(resp),
> +		},
> +	};

Not sure if the above would be better in some sub-function to prepare
the message. Looks like such a sub/helper function could be used by some
of the following functions too.

> +	int err;
> +
> +	err = tegra_bpmp_transfer(bpmp, &msg);
> +	if (err < 0)
> +		return err;
> +
> +	*nbytes = (size_t)resp.fop.nbytes;
> +
> +	return 0;
> +}
> +
> +static int mrq_debugfs_write(struct tegra_bpmp *bpmp,
> +			     dma_addr_t name, size_t sz_name,
> +			     dma_addr_t data, size_t sz_data)
> +{
> +	const struct mrq_debugfs_request req = {
> +		.cmd = cpu_to_le32(CMD_DEBUGFS_WRITE),
> +		.fop = {
> +			.fnameaddr = cpu_to_le32((uint32_t)name),
> +			.fnamelen = cpu_to_le32((uint32_t)sz_name),
> +			.dataaddr = cpu_to_le32((uint32_t)data),
> +			.datalen = cpu_to_le32((uint32_t)sz_data),
> +		},
> +	};
> +	struct tegra_bpmp_message msg = {
> +		.mrq = MRQ_DEBUGFS,
> +		.tx = {
> +			.data = &req,
> +			.size = sizeof(req),
> +		},
> +	};
> +
> +	return tegra_bpmp_transfer(bpmp, &msg);
> +}
> +
> +static int mrq_debugfs_dumpdir(struct tegra_bpmp *bpmp, dma_addr_t addr,
> +			       size_t size, size_t *nbytes)
> +{
> +	const struct mrq_debugfs_request req = {
> +		.cmd = cpu_to_le32(CMD_DEBUGFS_DUMPDIR),
> +		.dumpdir = {
> +			.dataaddr = cpu_to_le32((uint32_t)addr),
> +			.datalen = cpu_to_le32((uint32_t)size),
> +		},
> +	};
> +	struct mrq_debugfs_response resp;
> +	struct tegra_bpmp_message msg = {
> +		.mrq = MRQ_DEBUGFS,
> +		.tx = {
> +			.data = &req,
> +			.size = sizeof(req),
> +		},
> +		.rx = {
> +			.data = &resp,
> +			.size = sizeof(resp),
> +		},
> +	};
> +	int err;
> +
> +	err = tegra_bpmp_transfer(bpmp, &msg);
> +	if (err < 0)
> +		return err;
> +
> +	*nbytes = (size_t)resp.dumpdir.nbytes;
> +
> +	return 0;
> +}
> +
> +static int debugfs_show(struct seq_file *m, void *p)
> +{
> +	struct file *file = m->private;
> +	struct inode *inode = file_inode(file);
> +	struct tegra_bpmp *bpmp = inode->i_private;
> +	const size_t datasize = m->size;
> +	const size_t namesize = SZ_256;
> +	void *datavirt, *namevirt;
> +	dma_addr_t dataphys, namephys;
> +	char buf[256];
> +	const char *filename;
> +	size_t len, nbytes;
> +	int ret;
> +
> +	filename = get_filename(bpmp, file, buf, sizeof(buf));
> +	if (!filename)
> +		return -ENOENT;

Is it guaranteed that filename is null terminated here? If not then ...

> +
> +	namevirt = dma_alloc_coherent(bpmp->dev, namesize, &namephys,
> +				      GFP_KERNEL | GFP_DMA32);
> +	if (!namevirt)
> +		return -ENOMEM;
> +
> +	datavirt = dma_alloc_coherent(bpmp->dev, datasize, &dataphys,
> +				      GFP_KERNEL | GFP_DMA32);
> +	if (!datavirt) {
> +		ret = -ENOMEM;
> +		goto free_namebuf;
> +	}
> +
> +	len = strlen(filename);
> +	strlcpy(namevirt, filename, namesize);

Although very unlikely a name would be 256 characters long, but if it
was 256 chars then the last character would be truncated.

> +	ret = mrq_debugfs_read(bpmp, namephys, len, dataphys, datasize,
> +			       &nbytes);
> +
> +	if (!ret)
> +		seq_write(m, datavirt, nbytes);
> +
> +	dma_free_coherent(bpmp->dev, datasize, datavirt, dataphys);
> +free_namebuf:
> +	dma_free_coherent(bpmp->dev, namesize, namevirt, namephys);
> +
> +	return ret;
> +}
> +
> +static int debugfs_open(struct inode *inode, struct file *file)
> +{
> +	return single_open_size(file, debugfs_show, file, SZ_128K);
> +}
> +
> +static ssize_t debugfs_store(struct file *file, const char __user *buf,
> +		size_t count, loff_t *f_pos)
> +{
> +	struct inode *inode = file_inode(file);
> +	struct tegra_bpmp *bpmp = inode->i_private;
> +	const size_t datasize = count;
> +	const size_t namesize = SZ_256;
> +	void *datavirt, *namevirt;
> +	dma_addr_t dataphys, namephys;
> +	char fnamebuf[256];
> +	const char *filename;
> +	size_t len;
> +	int ret;
> +
> +	filename = get_filename(bpmp, file, fnamebuf, sizeof(fnamebuf));
> +	if (!filename)
> +		return -ENOENT;
> +
> +	namevirt = dma_alloc_coherent(bpmp->dev, namesize, &namephys,
> +				      GFP_KERNEL | GFP_DMA32);
> +	if (!namevirt)
> +		return -ENOMEM;
> +
> +	datavirt = dma_alloc_coherent(bpmp->dev, datasize, &dataphys,
> +				      GFP_KERNEL | GFP_DMA32);
> +	if (!datavirt) {
> +		ret = -ENOMEM;
> +		goto free_namebuf;
> +	}
> +
> +	len = strlen(filename);
> +	strlcpy(namevirt, filename, namesize);
> +
> +	if (copy_from_user(datavirt, buf, count)) {
> +		ret = -EFAULT;
> +		goto free_databuf;
> +	}
> +
> +	ret = mrq_debugfs_write(bpmp, namephys, len, dataphys,
> +				count);
> +
> +free_databuf:
> +	dma_free_coherent(bpmp->dev, datasize, datavirt, dataphys);
> +free_namebuf:
> +	dma_free_coherent(bpmp->dev, namesize, namevirt, namephys);
> +
> +	return ret ?: count;
> +}
> +
> +static const struct file_operations debugfs_fops = {
> +	.open		= debugfs_open,
> +	.read		= seq_read,
> +	.llseek		= seq_lseek,
> +	.write		= debugfs_store,
> +	.release	= single_release,
> +};
> +
> +static int bpmp_populate_dir(struct tegra_bpmp *bpmp, struct seqbuf *seqbuf,
> +			     struct dentry *parent, uint32_t depth)

Do we need to use uint32_t here?

> +{
> +	int err;
> +	uint32_t d, t;

And here?

> +	const char *name;
> +	struct dentry *dentry;
> +
> +	while (!seqbuf_eof(seqbuf)) {
> +		if (seqbuf_read_u32(seqbuf, &d) < 0)
> +			return -EIO;

Why not return the actual error code?

> +
> +		if (d < depth) {
> +			seqbuf_seek(seqbuf, -4);
> +			/* go up a level */
> +			return 0;
> +		} else if (d != depth) {
> +			/* malformed data received from BPMP */
> +			return -EIO;
> +		}
> +
> +		if (seqbuf_read_u32(seqbuf, &t))
> +			return -EIO;
> +		if (seqbuf_read_str(seqbuf, &name))
> +			return -EIO;
> +
> +		if (t & DEBUGFS_S_ISDIR) {
> +			dentry = debugfs_create_dir(name, parent);
> +			if (IS_ERR_OR_NULL(dentry))

Only need to check for NULL here.

> +				return dentry ? PTR_ERR(dentry) : -ENOMEM;
> +			err = bpmp_populate_dir(bpmp, seqbuf, dentry, depth+1);
> +			if (err < 0)
> +				return err;

Do we need to remove the directory created here? Or is that handled by
the recursive removal below?

> +		} else {
> +			umode_t mode;
> +
> +			mode = t & DEBUGFS_S_IRUSR ? S_IRUSR : 0;
> +			mode |= t & DEBUGFS_S_IWUSR ? S_IWUSR : 0;
> +			dentry = debugfs_create_file(name, mode,
> +						     parent, bpmp,
> +						     &debugfs_fops);
> +			if (IS_ERR_OR_NULL(dentry))

Just check for NULL.

> +				return dentry ? PTR_ERR(dentry) : -ENOMEM;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int create_debugfs_mirror(struct tegra_bpmp *bpmp, void *buf,
> +				 size_t bufsize, struct dentry *root)
> +{
> +	struct seqbuf seqbuf;
> +	int err;
> +
> +	bpmp->debugfs_mirror = debugfs_create_dir("debug", root);
> +	if (IS_ERR_OR_NULL(bpmp->debugfs_mirror)) {

NULL.

> +		bpmp->debugfs_mirror = NULL;
> +		dev_err(bpmp->dev, "failed to create debugfs mirror root\n");
> +		return -ENOMEM;
> +	}
> +
> +	seqbuf_init(&seqbuf, buf, bufsize);
> +	err = bpmp_populate_dir(bpmp, &seqbuf, bpmp->debugfs_mirror, 0);
> +	if (err < 0) {
> +		debugfs_remove_recursive(bpmp->debugfs_mirror);
> +		bpmp->debugfs_mirror = NULL;
> +	}
> +
> +	return err;
> +}
> +
> +
> +static int mrq_is_supported(struct tegra_bpmp *bpmp, unsigned int mrq)
> +{
> +	struct mrq_query_abi_request req = { .mrq = cpu_to_le32(mrq) };
> +	struct mrq_query_abi_response resp;
> +	struct tegra_bpmp_message msg = {
> +		.mrq = MRQ_QUERY_ABI,
> +		.tx = {
> +			.data = &req,
> +			.size = sizeof(req),
> +		},
> +		.rx = {
> +			.data = &resp,
> +			.size = sizeof(resp),
> +		},
> +	};
> +	int ret;
> +
> +	ret = tegra_bpmp_transfer(bpmp, &msg);
> +	/* something went wrong; assume not supported */
> +	if (ret < 0)

dev_warn?

> +		return 0;
> +
> +	return resp.status ? 0 : 1;
> +}
> +
> +int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
> +{
> +	dma_addr_t phys;
> +	void *virt;
> +	const size_t sz = SZ_256K;
> +	size_t nbytes;
> +	int ret;
> +	struct dentry *root;
> +
> +	if (!mrq_is_supported(bpmp, MRQ_DEBUGFS))
> +		return 0;
> +
> +	root = debugfs_create_dir("bpmp", NULL);
> +	if (IS_ERR_OR_NULL(root))

NULL.

> +		return PTR_ERR(root);
> +
> +	virt = dma_alloc_coherent(bpmp->dev, sz, &phys,
> +				  GFP_KERNEL | GFP_DMA32);
> +	if (!virt) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	ret = mrq_debugfs_dumpdir(bpmp, phys, sz, &nbytes);
> +	if (ret < 0)
> +		goto free;
> +
> +	ret = create_debugfs_mirror(bpmp, virt, nbytes, root);
> +	if (ret < 0)
> +		dev_err(bpmp->dev, "create_debugfs_mirror failed (%d)\n", ret);
> +
> +free:
> +	dma_free_coherent(bpmp->dev, sz, virt, phys);
> +out:
> +	if (ret < 0)
> +		debugfs_remove(root);

Should we have a generic warning message here? Looks like it could fail
silently.

> +
> +	return ret;
> +}
> diff --git a/include/soc/tegra/bpmp.h b/include/soc/tegra/bpmp.h
> index 9ba6522..21a522a 100644
> --- a/include/soc/tegra/bpmp.h
> +++ b/include/soc/tegra/bpmp.h
> @@ -94,6 +94,10 @@ struct tegra_bpmp {
>  	struct reset_controller_dev rstc;
>  
>  	struct genpd_onecell_data genpd;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	struct dentry *debugfs_mirror;
> +#endif
>  };
>  
>  struct tegra_bpmp *tegra_bpmp_get(struct device *dev);
> @@ -150,4 +154,14 @@ static inline int tegra_bpmp_init_powergates(struct tegra_bpmp *bpmp)
>  }
>  #endif
>  
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp);
> +#else
> +static inline int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
> +{
> +	return 0;
> +}
> +#endif
> +
> +
>  #endif /* __SOC_TEGRA_BPMP_H */
> 

Cheers
Jon

-- 
nvpublic
