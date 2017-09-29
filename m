From: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] firmware: tegra: add BPMP debugfs support
Date: Fri, 29 Sep 2017 16:41:25 +0300
Message-ID: <7d3aaba8-13ef-7713-d0a9-726ed5fbde0e@nvidia.com>
References: <1503410640-2691-1-git-send-email-talho@nvidia.com>
 <31191fe9-41d6-5527-2a31-389d113c459e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <31191fe9-41d6-5527-2a31-389d113c459e-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Jon,

Thanks for reviewing this!

On 21.09.2017 14:10, Jonathan Hunter wrote:
>> --- a/drivers/firmware/tegra/bpmp.c
>> +++ b/drivers/firmware/tegra/bpmp.c
>> @@ -824,6 +824,8 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
>>   	if (err < 0)
>>   		goto free_mrq;
>>   
>> +	(void)tegra_bpmp_init_debugfs(bpmp);
>> +
> 
> This looks a bit odd, why not just return the error code here?

I wanted to avoid failing probe if only debugfs initialization fails. 
I'll add a error print in next version here, but let probing to complete.

>> diff --git a/drivers/firmware/tegra/bpmp_debugfs.c b/drivers/firmware/tegra/bpmp_debugfs.c
>> new file mode 100644
>> index 0000000..4d0279d
>> --- /dev/null
>> +++ b/drivers/firmware/tegra/bpmp_debugfs.c
...
>> +/* map filename in Linux debugfs to corresponding entry in BPMP */
>> +static const char *get_filename(struct tegra_bpmp *bpmp,
>> +				const struct file *file, char *buf, int size)
>> +{
>> +	char root_path_buf[512];
>> +	const char *root_path;
>> +	const char *filename;
>> +	size_t root_len;
>> +
>> +	root_path = dentry_path_raw(bpmp->debugfs_mirror, root_path_buf,
>> +				    sizeof(root_path_buf));
>> +	if (IS_ERR_OR_NULL(root_path))
> 
> Looks like IS_ERR() is sufficient here.

Will fix that and all other places where IS_ERR_OR_NULL() is used.

>> +static int mrq_debugfs_read(struct tegra_bpmp *bpmp,
>> +			    dma_addr_t name, size_t sz_name,
>> +			    dma_addr_t data, size_t sz_data,
>> +			    size_t *nbytes)
>> +{
>> +	struct mrq_debugfs_request req = {
>> +		.cmd = cpu_to_le32(CMD_DEBUGFS_READ),
>> +		.fop = {
>> +			.fnameaddr = cpu_to_le32((uint32_t)name),
>> +			.fnamelen = cpu_to_le32((uint32_t)sz_name),
>> +			.dataaddr = cpu_to_le32((uint32_t)data),
>> +			.datalen = cpu_to_le32((uint32_t)sz_data),
>> +		},
>> +	};
>> +	struct mrq_debugfs_response resp;
>> +	struct tegra_bpmp_message msg = {
>> +		.mrq = MRQ_DEBUGFS,
>> +		.tx = {
>> +			.data = &req,
>> +			.size = sizeof(req),
>> +		},
>> +		.rx = {
>> +			.data = &resp,
>> +			.size = sizeof(resp),
>> +		},
>> +	};
> 
> Not sure if the above would be better in some sub-function to prepare
> the message. Looks like such a sub/helper function could be used by some
> of the following functions too.

I thought about it but gave up as it would be just generic extra wrapper 
for existing API (that is not specific to this driver).


>> +static int debugfs_show(struct seq_file *m, void *p)
>> +{
>> +	struct file *file = m->private;
>> +	struct inode *inode = file_inode(file);
>> +	struct tegra_bpmp *bpmp = inode->i_private;
>> +	const size_t datasize = m->size;
>> +	const size_t namesize = SZ_256;
>> +	void *datavirt, *namevirt;
>> +	dma_addr_t dataphys, namephys;
>> +	char buf[256];
>> +	const char *filename;
>> +	size_t len, nbytes;
>> +	int ret;
>> +
>> +	filename = get_filename(bpmp, file, buf, sizeof(buf));
>> +	if (!filename)
>> +		return -ENOENT;
> 
> Is it guaranteed that filename is null terminated here? If not then ...

As far as I can tell by looking at get_filename() and the functions it 
calls, filename should be null terminated.

>> +
>> +	namevirt = dma_alloc_coherent(bpmp->dev, namesize, &namephys,
>> +				      GFP_KERNEL | GFP_DMA32);
>> +	if (!namevirt)
>> +		return -ENOMEM;
>> +
>> +	datavirt = dma_alloc_coherent(bpmp->dev, datasize, &dataphys,
>> +				      GFP_KERNEL | GFP_DMA32);
>> +	if (!datavirt) {
>> +		ret = -ENOMEM;
>> +		goto free_namebuf;
>> +	}
>> +
>> +	len = strlen(filename);
>> +	strlcpy(namevirt, filename, namesize);
> 
> Although very unlikely a name would be 256 characters long, but if it
> was 256 chars then the last character would be truncated.

Yes, will replace this with strncpy(). BPMP does not require this string 
to be NULL terminated anyway.

>> +static int bpmp_populate_dir(struct tegra_bpmp *bpmp, struct seqbuf *seqbuf,
>> +			     struct dentry *parent, uint32_t depth)
> 
> Do we need to use uint32_t here?
> 
>> +{
>> +	int err;
>> +	uint32_t d, t;
> 
> And here?

It's part of the BPMP ABI that the data passed is 32 bit unsigned 
integer. I wanted to emphasise that with the choice of integer type. Or 
did you mean why I did not use u32?

>> +	const char *name;
>> +	struct dentry *dentry;
>> +
>> +	while (!seqbuf_eof(seqbuf)) {
>> +		if (seqbuf_read_u32(seqbuf, &d) < 0)
>> +			return -EIO;
> 
> Why not return the actual error code?

Will fix in next patch

>> +				return dentry ? PTR_ERR(dentry) : -ENOMEM;
>> +			err = bpmp_populate_dir(bpmp, seqbuf, dentry, depth+1);
>> +			if (err < 0)
>> +				return err;
> 
> Do we need to remove the directory created here? Or is that handled by
> the recursive removal below?

Recursive removal will take care of it.

>> +static int mrq_is_supported(struct tegra_bpmp *bpmp, unsigned int mrq)
>> +{
>> +	struct mrq_query_abi_request req = { .mrq = cpu_to_le32(mrq) };
>> +	struct mrq_query_abi_response resp;
>> +	struct tegra_bpmp_message msg = {
>> +		.mrq = MRQ_QUERY_ABI,
>> +		.tx = {
>> +			.data = &req,
>> +			.size = sizeof(req),
>> +		},
>> +		.rx = {
>> +			.data = &resp,
>> +			.size = sizeof(resp),
>> +		},
>> +	};
>> +	int ret;
>> +
>> +	ret = tegra_bpmp_transfer(bpmp, &msg);
>> +	/* something went wrong; assume not supported */
>> +	if (ret < 0)
> 
> dev_warn?

Will add.

>> +
>> +	virt = dma_alloc_coherent(bpmp->dev, sz, &phys,
>> +				  GFP_KERNEL | GFP_DMA32);
>> +	if (!virt) {
>> +		ret = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	ret = mrq_debugfs_dumpdir(bpmp, phys, sz, &nbytes);
>> +	if (ret < 0)
>> +		goto free;
>> +
>> +	ret = create_debugfs_mirror(bpmp, virt, nbytes, root);
>> +	if (ret < 0)
>> +		dev_err(bpmp->dev, "create_debugfs_mirror failed (%d)\n", ret);
>> +
>> +free:
>> +	dma_free_coherent(bpmp->dev, sz, virt, phys);
>> +out:
>> +	if (ret < 0)
>> +		debugfs_remove(root);
> 
> Should we have a generic warning message here? Looks like it could fail
> silently.

I'll add a warning to call site (bpmp.c) if this fails.

-Timo
