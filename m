Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF4422B8AB;
	Thu, 19 Feb 2026 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771498552; cv=none; b=FkNuD/y8VspbjPYEsf/BzXAAIWMZ1rXMJue48CLgnMd90xU+Jwn5nd92dlqORiYCvs6Q+dfH/g05/+DcOwb2KGHhlPQVXV46fBtC4YJW32xao2mJms08m+tmSKbmZj0Q/zSAfyCUA3IL0IfnFoG08qw/AK64DJoJARhsEkx5+as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771498552; c=relaxed/simple;
	bh=6vwn9d8bYSCJmxih6F1w6yLZp/aN2vV18ZBVLXAcL68=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oMKWLq+wXW5AmG/rRtlkwUrHDnW8m4iWnc5nJgAQntDzwwo5fsUvWYufDXQ62Y11273xnE5aUVmTyRgh2uKX5kYBgIoDV8ksrGNhnQlQ77bIec8YCQQ/w9RIEUIMitpTQiqO7lapWC27dK+l4zFVf85ly95HCQLa5uMEdVz6AFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fGqz82kzWzHnGjB;
	Thu, 19 Feb 2026 18:55:16 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 4BDA040539;
	Thu, 19 Feb 2026 18:55:46 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 19 Feb
 2026 10:55:45 +0000
Date: Thu, 19 Feb 2026 10:55:43 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
CC: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>,
	<skelley@nvidia.com>, <ywan@nvidia.com>, <mochs@nvidia.com>,
	<nirmoyd@nvidia.com>
Subject: Re: [PATCH v2 7/8] perf: add NVIDIA Tegra410 C2C PMU
Message-ID: <20260219105543.00007b0b@huawei.com>
In-Reply-To: <20260218145809.1622856-8-bwicaksono@nvidia.com>
References: <20260218145809.1622856-1-bwicaksono@nvidia.com>
	<20260218145809.1622856-8-bwicaksono@nvidia.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml500005.china.huawei.com (7.214.145.207)

On Wed, 18 Feb 2026 14:58:08 +0000
Besar Wicaksono <bwicaksono@nvidia.com> wrote:

> Adds NVIDIA C2C PMU support in Tegra410 SOC. This PMU is
> used to measure memory latency between the SOC and device
> memory, e.g GPU Memory (GMEM), CXL Memory, or memory on
> remote Tegra410 SOC.
> 
> Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>

Hi Besar.

Another nice looking driver.

My main comment here is around attribute management. In general I'd avoid doing
dynamic assignment of attribute arrays when there are only a couple of options.
Much cleaner and easier to read in those cases if you just have multiple
static const arrays to pick between.

That's made easier if you move to a struct for each of the supported types
(and get rid of the enum currently used as that makes it too easy to end up
with a mix of data in the struct vs code using the enum).

Jonathan

> diff --git a/drivers/perf/nvidia_t410_c2c_pmu.c b/drivers/perf/nvidia_t410_c2c_pmu.c
> new file mode 100644
> index 000000000000..a3891c94dcde
> --- /dev/null
> +++ b/drivers/perf/nvidia_t410_c2c_pmu.c
> @@ -0,0 +1,1062 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * NVIDIA Tegra410 C2C PMU driver.
> + *
> + * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bitops.h>
> +#include <linux/cpumask.h>
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/perf_event.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>

> +
> +struct nv_c2c_pmu {
> +	struct pmu pmu;
> +	struct device *dev;
> +	struct acpi_device *acpi_dev;
> +
> +	const char *name;
> +	const char *identifier;
> +
> +	unsigned int c2c_type;
> +	unsigned int peer_type;
> +	unsigned int socket;
> +	unsigned int nr_inst;
> +	unsigned int nr_peer;
> +	unsigned long peer_insts[C2C_NR_PEER_MAX][BITS_TO_LONGS(C2C_NR_INST_MAX)];
Pity there isn't a DECLARE_BITMAP_ARRAY()
macro.  I guess this isn't that common.
> +	u32 filter_default;
> +
> +	struct nv_c2c_pmu_hw_events hw_events;
> +
> +	cpumask_t associated_cpus;
> +	cpumask_t active_cpu;
> +
> +	struct hlist_node cpuhp_node;
> +
> +	struct attribute **formats;
> +	const struct attribute_group *attr_groups[6];

As below. I'd push this into a type specific structure to remove all the dynamic
code to fill it in.

> +
> +	void __iomem *base_broadcast;
Ah. Good. This matches what I suggested for previous.
> +	void __iomem *base[C2C_NR_INST_MAX];
> +};

> +/*
> + * Read 64-bit register as a pair of 32-bit registers using hi-lo-hi sequence.
> + */
> +static u64 read_reg64_hilohi(const void __iomem *addr, u32 max_poll_count)
> +{
> +	u32 val_lo, val_hi;
> +	u64 val;
> +
> +	/* Use high-low-high sequence to avoid tearing */
> +	do {
> +		if (max_poll_count-- == 0) {
> +			pr_err("NV C2C PMU: timeout hi-low-high sequence\n");
> +			return 0;
> +		}
> +
> +		val_hi = readl(addr + 4);
> +		val_lo = readl(addr);
> +	} while (val_hi != readl(addr + 4));

I wonder if it's worth adding a non tearing variant include/linux/io-64-nonatomic-hi-lo.h

Feels like I see this open coded often enough that it might be nice to replace it
once and for all with a generic version.

Implementation would be pretty much what you have here.

> +
> +	val = (((u64)val_hi << 32) | val_lo);
> +
> +	return val;
> +}


> +
> +static umode_t
> +nv_c2c_pmu_event_attr_is_visible(struct kobject *kobj, struct attribute *attr,
> +				 int unused)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct nv_c2c_pmu *c2c_pmu = to_c2c_pmu(dev_get_drvdata(dev));
> +	struct perf_pmu_events_attr *eattr;
> +
> +	eattr = container_of(attr, typeof(*eattr), attr.attr);
> +
> +	if (c2c_pmu->c2c_type == C2C_TYPE_NVDLINK) {
> +		/* Only incoming reads are available. */
> +		switch (eattr->id) {
> +		case C2C_EVENT_IN_WR_CUM_OUTS:
> +		case C2C_EVENT_IN_WR_REQ:
> +		case C2C_EVENT_OUT_RD_CUM_OUTS:
> +		case C2C_EVENT_OUT_RD_REQ:
> +		case C2C_EVENT_OUT_WR_CUM_OUTS:
> +		case C2C_EVENT_OUT_WR_REQ:
> +			return 0;
> +		default:
> +			return attr->mode;
Given suggestion below to use separate attribute_groups[] for each
of the 3 types, I'd do separate event attribute groups for each as well.
That will cover this case as const data.
> +		}
> +	} else {
> +		/* Hide the write events if C2C connected to another SoC. */
> +		if (c2c_pmu->peer_type == C2C_PEER_TYPE_CPU) {

And only the two types where this is relevant will use the is_visible.

> +			switch (eattr->id) {
> +			case C2C_EVENT_IN_WR_CUM_OUTS:
> +			case C2C_EVENT_IN_WR_REQ:
> +			case C2C_EVENT_OUT_WR_CUM_OUTS:
> +			case C2C_EVENT_OUT_WR_REQ:
> +				return 0;
> +			default:
> +				return attr->mode;
> +			}
> +		}
> +	}
> +
> +	return attr->mode;
> +}
> +
> +static const struct attribute_group nv_c2c_pmu_events_group = {
> +	.name = "events",
> +	.attrs = nv_c2c_pmu_events,
> +	.is_visible = nv_c2c_pmu_event_attr_is_visible,
> +};

> +
> +/* Per PMU device attribute groups. */
> +
> +static int nv_c2c_pmu_alloc_attr_groups(struct nv_c2c_pmu *c2c_pmu)
> +{
> +	const struct attribute_group **attr_groups = c2c_pmu->attr_groups;
> +
> +	attr_groups[0] = nv_c2c_pmu_alloc_format_attr_group(c2c_pmu);
> +	attr_groups[1] = &nv_c2c_pmu_events_group;
> +	attr_groups[2] = &nv_c2c_pmu_cpumask_attr_group;
> +	attr_groups[3] = &nv_c2c_pmu_identifier_attr_group;
> +	attr_groups[4] = &nv_c2c_pmu_peer_attr_group;
> +
> +	if (!attr_groups[0])
> +		return -ENOMEM;

This seems unnecessary code complexity to avoid having a couple of structures
that duplicate some elements.  If you have a choice between picking between
sets of static const data vs more code. Go the data route (as long as it
isn't a huge amount more data!)

So have a 
const struct attribute_groups *xxxx[] = {
};
For each of the 3 types.

Alternative is put all the format group attributes in one group and then use
is_visible() to select what is relevant to each type, but I think that will
be more complex than just replicating the array 3 times.



> +
> +	return 0;
> +}

> +static int nv_c2c_pmu_get_cpus(struct nv_c2c_pmu *c2c_pmu)
> +{
> +	int ret = 0, socket = c2c_pmu->socket, cpu;
> +
> +	for_each_possible_cpu(cpu) {
> +		if (cpu_to_node(cpu) == socket)
> +			cpumask_set_cpu(cpu, &c2c_pmu->associated_cpus);
> +	}
> +
> +	if (cpumask_empty(&c2c_pmu->associated_cpus)) {
> +		dev_dbg(c2c_pmu->dev,
> +			"No cpu associated with C2C PMU socket-%u\n", socket);
> +		ret = -ENODEV;
> +	}
> +
> +	return ret;
Direct returns are often more readable. I think that applies here
as we can then make ti clear where the good exit paths are with return 0.

> +}
> +
> +static int nv_c2c_pmu_init_socket(struct nv_c2c_pmu *c2c_pmu)
> +{
> +	const char *uid_str;
> +	int ret, socket;
> +
> +	uid_str = acpi_device_uid(c2c_pmu->acpi_dev);
> +	if (!uid_str) {
> +		ret = -ENODEV;
> +		goto fail;
> +	}
> +
> +	ret = kstrtou32(uid_str, 0, &socket);
> +	if (ret)
> +		goto fail;
> +
> +	c2c_pmu->socket = socket;
> +	return 0;
> +
> +fail:
> +	dev_err(c2c_pmu->dev, "Failed to initialize socket\n");

I'd return above, with a more specific error message given there are two
different things that can go wrong.

> +	return ret;
> +}
> +
> +static int nv_c2c_pmu_init_id(struct nv_c2c_pmu *c2c_pmu)
> +{
> +	const char *name_fmt[C2C_TYPE_COUNT] = {
> +		[C2C_TYPE_NVLINK] = "nvidia_nvlink_c2c_pmu_%u",
> +		[C2C_TYPE_NVCLINK] = "nvidia_nvclink_pmu_%u",
> +		[C2C_TYPE_NVDLINK] = "nvidia_nvdlink_pmu_%u",
> +	};
> +
> +	char *name;
> +	int ret;
> +
> +	name = devm_kasprintf(c2c_pmu->dev, GFP_KERNEL,
> +		name_fmt[c2c_pmu->c2c_type], c2c_pmu->socket);
> +	if (!name) {
> +		ret = -ENOMEM;
> +		goto fail;
> +	}
> +
> +	c2c_pmu->name = name;
> +
> +	c2c_pmu->identifier = acpi_device_hid(c2c_pmu->acpi_dev);
> +
> +	return 0;
> +
> +fail:
> +	dev_err(c2c_pmu->dev, "Failed to initialize name\n");

Why the goto?  Just error out above.
For any calls like this that are only made from probe() use
	return dev_err_probe(c2c_pmu->dev, ret, "...\n");
However general view is that allocation failures make enough noise
anyway that we never print additional error messages on them.  So
just drop the print here.

There are a few people cleaning the kernel tree up to remove exactly
this case.  Not sure anyone got to perf yet though.


> +	return ret;
> +}
> +
> +static int nv_c2c_pmu_init_filter(struct nv_c2c_pmu *c2c_pmu)
> +{
> +	u32 cpu_en = 0;
> +	struct device *dev = c2c_pmu->dev;
> +
> +	if (c2c_pmu->c2c_type == C2C_TYPE_NVDLINK) {
> +		c2c_pmu->peer_type = C2C_PEER_TYPE_CXLMEM;
> +
> +		c2c_pmu->nr_inst = C2C_NR_INST_NVDLINK;
> +		c2c_pmu->peer_insts[0][0] = (1UL << c2c_pmu->nr_inst) - 1;
> +
> +		c2c_pmu->nr_peer = C2C_NR_PEER_CXLMEM;
> +		c2c_pmu->filter_default = (1 << c2c_pmu->nr_peer) - 1;
> +
> +		c2c_pmu->formats = nv_c2c_pmu_formats;
> +
> +		return 0;
> +	}
> +
> +	c2c_pmu->nr_inst = (c2c_pmu->c2c_type == C2C_TYPE_NVLINK) ?
> +		C2C_NR_INST_NVLINK : C2C_NR_INST_NVCLINK;
> +
> +	if (device_property_read_u32(dev, "cpu_en_mask", &cpu_en))
> +		dev_dbg(dev, "no cpu_en_mask property\n");
> +
> +	if (cpu_en) {
> +		c2c_pmu->peer_type = C2C_PEER_TYPE_CPU;
> +
> +		/* Fill peer_insts bitmap with instances connected to peer CPU. */
> +		bitmap_from_arr32(c2c_pmu->peer_insts[0], &cpu_en,
> +				c2c_pmu->nr_inst);
> +
> +		c2c_pmu->nr_peer = 1;
> +		c2c_pmu->formats = nv_c2c_pmu_formats;
> +	} else {
> +		u32 i;
> +		const char *props[C2C_NR_PEER_MAX] = {
> +			"gpu0_en_mask", "gpu1_en_mask"
> +		};
> +
> +		for (i = 0; i < C2C_NR_PEER_MAX; i++) {
> +			u32 gpu_en = 0;
> +
> +			if (device_property_read_u32(dev, props[i], &gpu_en))
> +				dev_dbg(dev, "no %s property\n", props[i]);
> +
> +			if (gpu_en) {
> +				/* Fill peer_insts bitmap with instances connected to peer GPU. */
> +				bitmap_from_arr32(c2c_pmu->peer_insts[i], &gpu_en,
> +						c2c_pmu->nr_inst);
> +
> +				c2c_pmu->nr_peer++;
> +			}
> +		}
> +
> +		if (c2c_pmu->nr_peer == 0) {
> +			dev_err(dev, "No GPU is enabled\n");
> +			return -EINVAL;
> +		}
> +
> +		c2c_pmu->peer_type = C2C_PEER_TYPE_GPU;
> +		c2c_pmu->formats = nv_c2c_nvlink_pmu_formats;
> +	}
> +
> +	c2c_pmu->filter_default = (1 << c2c_pmu->nr_peer) - 1;
> +
> +	return 0;
> +}
> +
> +static void *nv_c2c_pmu_init_pmu(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct nv_c2c_pmu *c2c_pmu;
> +	struct acpi_device *acpi_dev;
> +	struct device *dev = &pdev->dev;
> +
> +	acpi_dev = ACPI_COMPANION(dev);
> +	if (!acpi_dev)
> +		return ERR_PTR(-ENODEV);
> +
> +	c2c_pmu = devm_kzalloc(dev, sizeof(*c2c_pmu), GFP_KERNEL);
> +	if (!c2c_pmu)
> +		return ERR_PTR(-ENOMEM);
> +
> +	c2c_pmu->dev = dev;
> +	c2c_pmu->acpi_dev = acpi_dev;
> +	c2c_pmu->c2c_type = (unsigned int)(unsigned long)device_get_match_data(dev);

As below, I'd make this a pointer to a struct with all the type specific
info in the struct.

> +	platform_set_drvdata(pdev, c2c_pmu);
> +
> +	ret = nv_c2c_pmu_init_socket(c2c_pmu);
> +	if (ret)
> +		goto done;
> +
> +	ret = nv_c2c_pmu_init_id(c2c_pmu);
> +	if (ret)
> +		goto done;
> +
> +	ret = nv_c2c_pmu_init_filter(c2c_pmu);
> +	if (ret)
> +		goto done;
> +
> +done:
Why not just return ERR_PTR() above and drop this goto?
That will be easier to read as clear that on any error you just return.
With the label here it looks like there might be good paths that use
it.  That briefly confused me :)

> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return c2c_pmu;
> +}


> +
> +static const struct acpi_device_id nv_c2c_pmu_acpi_match[] = {
> +	{ "NVDA2023", (kernel_ulong_t)C2C_TYPE_NVLINK },

Speaking from long experience of maintaining stuff that uses this pattern,
it's much cleaner to have a per device type struct and put a pointer
to that here.  The enum approach tends to lead to lots of switch statements
of scattered data about the uniqueness of each type. 

Up to you though, but I'd suggest this will bite you.

> +	{ "NVDA2022", (kernel_ulong_t)C2C_TYPE_NVCLINK },
> +	{ "NVDA2020", (kernel_ulong_t)C2C_TYPE_NVDLINK },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, nv_c2c_pmu_acpi_match);
> +
> +static struct platform_driver nv_c2c_pmu_driver = {
> +	.driver = {
> +		.name = "nvidia-t410-c2c-pmu",
> +		.acpi_match_table = ACPI_PTR(nv_c2c_pmu_acpi_match),

ACPI_PTR() mostly causes annoying issues with __maybe_unused
being used to save a trivial amount of data for !CONFIG_ACPI.
My advice would be to not use it.  It's not necessary at all.

> +		.suppress_bind_attrs = true,
> +	},
> +	.probe = nv_c2c_pmu_probe,
> +	.remove = nv_c2c_pmu_device_remove,
> +};
> +
> +static int __init nv_c2c_pmu_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
> +				      "perf/nvidia/c2c:online",
> +				      nv_c2c_pmu_online_cpu,
> +				      nv_c2c_pmu_cpu_teardown);
> +	if (ret < 0)
> +		return ret;
> +
> +	nv_c2c_pmu_cpuhp_state = ret;
> +	return platform_driver_register(&nv_c2c_pmu_driver);
> +}
> +
> +static void __exit nv_c2c_pmu_exit(void)
> +{
> +	platform_driver_unregister(&nv_c2c_pmu_driver);
> +	cpuhp_remove_multi_state(nv_c2c_pmu_cpuhp_state);
> +}
> +
> +module_init(nv_c2c_pmu_init);
> +module_exit(nv_c2c_pmu_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("NVIDIA Tegra410 C2C PMU driver");
> +MODULE_AUTHOR("Besar Wicaksono <bwicaksono@nvidia.com>");

