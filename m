Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5061DF25F;
	Thu, 19 Feb 2026 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771496923; cv=none; b=p2D7HjsgnPR1UboqEjvk67AwKpMPrmSoZa41+iwCyp0FjXHeWeo2VFleAmRD2HxlB4AC4E5deSLnqNwtMM/kkFKf+9mGctDJdBXMFTuQbQRYOQI2G2WlJ6+BPYeyyGyGgdAKQLL/E8F2C14Y/pRL1RRtr5iB0PrpJqbrYELHJNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771496923; c=relaxed/simple;
	bh=x17DcDfzdNRuQCTZUaQuMbvvf0OoBu2IJExejWxLZ5g=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eUa1lh0aTFvqaW7Q3HnEO3WpjSXKU+yd6wLGjeGSKkrP2L37o6HWSspIalGVactm9KK2YOZJ3Riv3OtmcPxN5CNSViB8Oul4LivlrUE0B5W2z+JxRIl8zrDgz+iLdy/Ziqb7xcOyYfAvVDWzyr10SIvM65f6aZ+XWEnTX+lG25s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fGqN75vSQzJ46Bs;
	Thu, 19 Feb 2026 18:28:23 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 0CAE940569;
	Thu, 19 Feb 2026 18:28:37 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 19 Feb
 2026 10:28:36 +0000
Date: Thu, 19 Feb 2026 10:28:34 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
CC: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>,
	<skelley@nvidia.com>, <ywan@nvidia.com>, <mochs@nvidia.com>,
	<nirmoyd@nvidia.com>
Subject: Re: [PATCH v2 6/8] perf: add NVIDIA Tegra410 CPU Memory Latency PMU
Message-ID: <20260219102834.0000777c@huawei.com>
In-Reply-To: <20260218145809.1622856-7-bwicaksono@nvidia.com>
References: <20260218145809.1622856-1-bwicaksono@nvidia.com>
	<20260218145809.1622856-7-bwicaksono@nvidia.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml500005.china.huawei.com (7.214.145.207)

On Wed, 18 Feb 2026 14:58:07 +0000
Besar Wicaksono <bwicaksono@nvidia.com> wrote:

> Adds CPU Memory (CMEM) Latency PMU support in Tegra410 SOC.
> The PMU is used to measure latency between the edge of the
> Unified Coherence Fabric to the local system DRAM.
> 
> Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>

Hi Besar

Various fairly superficial things inline.  Problem with reviewing
uncore drivers is that I've always forgotten the details of the interactions
with the perf core.  There aren't enough of them coming through to keep it in my head.
Sadly I don't have time today to page all that info back in :(

Jonathan

> diff --git a/drivers/perf/nvidia_t410_cmem_latency_pmu.c b/drivers/perf/nvidia_t410_cmem_latency_pmu.c
> new file mode 100644
> index 000000000000..9b466581c8fc
> --- /dev/null
> +++ b/drivers/perf/nvidia_t410_cmem_latency_pmu.c
> @@ -0,0 +1,727 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * NVIDIA Tegra410 CPU Memory (CMEM) Latency PMU driver.
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

> +#define NUM_INSTANCES    14
> +#define BCAST(pmu) pmu->base[NUM_INSTANCES]

As below.  This is a weird macro.  I'd just split the
base addresses up into a broad_cast_base and array of
the individual bases.

> +
> +/* Register offsets. */
> +#define CG_CTRL         0x800
> +#define CTRL            0x808
> +#define STATUS          0x810
> +#define CYCLE_CNTR      0x818
> +#define MC0_REQ_CNTR    0x820
> +#define MC0_AOR_CNTR    0x830
> +#define MC1_REQ_CNTR    0x838
> +#define MC1_AOR_CNTR    0x848
> +#define MC2_REQ_CNTR    0x850
> +#define MC2_AOR_CNTR    0x860
> +
> +/* CTRL values. */
> +#define CTRL_DISABLE    0x0ULL
> +#define CTRL_ENABLE     0x1ULL
> +#define CTRL_CLR        0x2ULL
> +
> +/* CG_CTRL values. */
> +#define CG_CTRL_DISABLE    0x0ULL
> +#define CG_CTRL_ENABLE     0x1ULL
> +
> +/* STATUS register field. */
> +#define STATUS_CYCLE_OVF      BIT(0)
> +#define STATUS_MC0_AOR_OVF    BIT(1)
> +#define STATUS_MC0_REQ_OVF    BIT(3)
> +#define STATUS_MC1_AOR_OVF    BIT(4)
> +#define STATUS_MC1_REQ_OVF    BIT(6)
> +#define STATUS_MC2_AOR_OVF    BIT(7)
> +#define STATUS_MC2_REQ_OVF    BIT(9)
> +
> +/* Events. */
> +#define EVENT_CYCLES    0x0
> +#define EVENT_REQ       0x1
> +#define EVENT_AOR       0x2
> +
> +#define NUM_EVENTS           0x3
> +#define MASK_EVENT           0x3
> +#define MAX_ACTIVE_EVENTS    32
> +
> +#define ACTIVE_CPU_MASK        0x0

Some of these are very generic names.  To avoid a future clash with something in a
header, I'd prefix them with something related to this driver.

> +#define ASSOCIATED_CPU_MASK    0x1
> +
> +static unsigned long cmem_lat_pmu_cpuhp_state;
> +
> +struct cmem_lat_pmu_hw_events {
> +	struct perf_event *events[MAX_ACTIVE_EVENTS];
> +	DECLARE_BITMAP(used_ctrs, MAX_ACTIVE_EVENTS);
> +};
> +
> +struct cmem_lat_pmu {
> +	struct pmu pmu;
> +	struct device *dev;
> +	const char *name;
> +	const char *identifier;
> +	void __iomem *base[NUM_INSTANCES + 1];

As below. There are two types of things in this array (hence the +1)
I'd just split it into an array of NUMSTANCES and a seperate
pointer for the last one.

> +	cpumask_t associated_cpus;
> +	cpumask_t active_cpu;
> +	struct hlist_node node;
> +	struct cmem_lat_pmu_hw_events hw_events;
> +};

> +static bool cmem_lat_pmu_validate_event(struct pmu *pmu,
> +				 struct cmem_lat_pmu_hw_events *hw_events,
> +				 struct perf_event *event)
> +{
> +	if (is_software_event(event))
> +		return true;
> +
> +	/* Reject groups spanning multiple HW PMUs. */
> +	if (event->pmu != pmu)
> +		return false;
> +
> +	return (cmem_lat_pmu_get_event_idx(hw_events, event) >= 0);
I'd be tempted to use
	int ret;
	...

	ret = cmem_lat_pmu_get_event_idx(hw_events, event);
	if (ret < 0)
		return false;

	return true;

As that make it more obvious the final check is on the validity of the idx.


> +}
> +
> +/*
> + * Make sure the group of events can be scheduled at once
> + * on the PMU.

Wrap to 80 chars.

> + */
> +static bool cmem_lat_pmu_validate_group(struct perf_event *event)

> +
> +static int cmem_lat_pmu_event_init(struct perf_event *event)
> +{
> +	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(event->pmu);
> +	struct hw_perf_event *hwc = &event->hw;
> +	u32 event_type = get_event_type(event);
> +
> +	if (event->attr.type != event->pmu->type ||
> +	    event_type >= NUM_EVENTS)
> +		return -ENOENT;
> +
> +	/*
> +	 * Following other "uncore" PMUs, we do not support sampling mode or
> +	 * attach to a task (per-process mode).
Perhaps nicer to say why all uncore PMUs do this rather than this is
doing the same as others...

Basically it's that they are system wide and so not clear what either sampling
or task attachment would actually mean.

> +	 */
> +	if (is_sampling_event(event)) {
> +		dev_dbg(cmem_lat_pmu->pmu.dev,
> +			"Can't support sampling events\n");
> +		return -EOPNOTSUPP;
> +	}



> +
> +static void cmem_lat_pmu_read(struct perf_event *event)
> +{
> +	cmem_lat_pmu_event_update(event);
> +}
> +
> +static inline void cmem_lat_pmu_cg_ctrl(struct cmem_lat_pmu *cmem_lat_pmu, u64 val)
> +{
> +	writeq(val, BCAST(cmem_lat_pmu) + CG_CTRL);

The BCAST macro is odd enough I'd just put what it does in inline here so it's
clear it's just the last element.  I'm not entirely sure why you put it at the
end of that array though.  Why not just have a separate element in the struct?

> +}
> +
> +static inline void cmem_lat_pmu_ctrl(struct cmem_lat_pmu *cmem_lat_pmu, u64 val)
> +{
> +	writeq(val, BCAST(cmem_lat_pmu) + CTRL);
> +}
> +
> +static void cmem_lat_pmu_enable(struct pmu *pmu)
> +{
> +	bool disabled;
> +	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(pmu);
> +
> +	disabled = bitmap_empty(
> +		cmem_lat_pmu->hw_events.used_ctrs, MAX_ACTIVE_EVENTS);

This is unusual formatting. Much better to have the parameters up a line
and if you go to a second line, then start under the first character after (

> +
> +	if (disabled)
> +		return;
> +
> +	/* Enable all the counters. */
> +	cmem_lat_pmu_cg_ctrl(cmem_lat_pmu, CG_CTRL_ENABLE);
> +	cmem_lat_pmu_ctrl(cmem_lat_pmu, CTRL_ENABLE);
> +}
> +
> +static void cmem_lat_pmu_disable(struct pmu *pmu)
> +{
> +	int idx;
> +	struct perf_event *event;
> +	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(pmu);
> +
> +	/* Disable all the counters. */
> +	cmem_lat_pmu_ctrl(cmem_lat_pmu, CTRL_DISABLE);
> +
> +	/*
> +	 * The counters will start from 0 again on restart.
> +	 * Update the events immediately to avoid losing the counts.
> +	 */
> +	for_each_set_bit(
> +		idx, cmem_lat_pmu->hw_events.used_ctrs, MAX_ACTIVE_EVENTS) {

Very unusual formatting for a for loop.  Move at least some / maybe all of the
parameters up a line.  The last thing we want is them to be indented
the same as the stuff in the loop.

Probably drag declaration of event in here to make it clearer what scope that
local variable has.

> +		event = cmem_lat_pmu->hw_events.events[idx];
> +
> +		if (!event)
> +			continue;
> +
> +		cmem_lat_pmu_event_update(event);
> +
> +		local64_set(&event->hw.prev_count, 0ULL);
> +	}
> +
> +	cmem_lat_pmu_ctrl(cmem_lat_pmu, CTRL_CLR);
> +	cmem_lat_pmu_cg_ctrl(cmem_lat_pmu, CG_CTRL_DISABLE);
> +}

> +static struct attribute *cmem_lat_pmu_formats[] = {
> +	NV_PMU_EXT_ATTR(event, device_show_string, "config:0-1"),
> +	NULL,
As below.

> +};

> +
> +#define NV_PMU_CPUMASK_ATTR(_name, _config)			\
> +	NV_PMU_EXT_ATTR(_name, cmem_lat_pmu_cpumask_show,	\
> +				(unsigned long)_config)
> +
> +static struct attribute *cmem_lat_pmu_cpumask_attrs[] = {
> +	NV_PMU_CPUMASK_ATTR(cpumask, ACTIVE_CPU_MASK),
> +	NV_PMU_CPUMASK_ATTR(associated_cpus, ASSOCIATED_CPU_MASK),
> +	NULL,

As below.

> +};
> +
> +static const struct attribute_group cmem_lat_pmu_cpumask_attr_group = {
> +	.attrs = cmem_lat_pmu_cpumask_attrs,
> +};
> +
> +/* Per PMU device attribute groups. */
> +
> +static const struct attribute_group *cmem_lat_pmu_attr_groups[] = {
> +	&cmem_lat_pmu_identifier_attr_group,
> +	&cmem_lat_pmu_format_group,
> +	&cmem_lat_pmu_events_group,
> +	&cmem_lat_pmu_cpumask_attr_group,
> +	NULL,

New code, so no need to copy any local style. Hence drop that trailing comma :)

> +};
> +

> +static int cmem_lat_pmu_get_cpus(struct cmem_lat_pmu *cmem_lat_pmu,
> +				unsigned int socket)
> +{
> +	int ret = 0, cpu;
> +
> +	for_each_possible_cpu(cpu) {
> +		if (cpu_to_node(cpu) == socket)
> +			cpumask_set_cpu(cpu, &cmem_lat_pmu->associated_cpus);
> +	}
> +
> +	if (cpumask_empty(&cmem_lat_pmu->associated_cpus)) {
> +		dev_dbg(cmem_lat_pmu->dev,
> +			"No cpu associated with PMU socket-%u\n", socket);
> +		ret = -ENODEV;
		return -ENODEV;

Saves reviewer reading on and...
> +	}
> +
> +	return ret;
	return 0;

so the know that getting here always indicates success.

> +}

> +
> +static const struct acpi_device_id cmem_lat_pmu_acpi_match[] = {
> +	{ "NVDA2021", },

The trailing comma after the string doesn't add anything, so I'd drop it.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, cmem_lat_pmu_acpi_match);

