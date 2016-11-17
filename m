From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4] clk: tegra: Add BPMP clock driver
Date: Wed, 16 Nov 2016 17:19:15 -0800
Message-ID: <20161117011915.GN25626@codeaurora.org>
References: <20161115161129.29722-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161115161129.29722-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/15, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This driver uses the services provided by the BPMP firmware driver to

What does BPMP mean?

> implement a clock driver based on the MRQ_CLK request. This part of the
> BPMP ABI provides a means to enumerate and control clocks and should
> allow the driver to work on any chip that supports this ABI.

Cool! Discoverable is great.

> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Hi Mike, Stephen,
> 
> I'm looking for an Acked-by on this so that I can take it through the
> Tegra tree because the dependencies are fairly complex.

Getting this merged for the next window is fairly unlikely. This
is the first time I've seen the patch and it's on v4.

> diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
> new file mode 100644
> index 000000000000..9b89cedfcb98
> --- /dev/null
> +++ b/drivers/clk/tegra/clk-bpmp.c
> @@ -0,0 +1,665 @@
> +/*
> + * Copyright (C) 2016 NVIDIA Corporation
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/seq_buf.h>
> +#include <linux/slab.h>
> +
> +#include <soc/tegra/bpmp.h>
> +#include <soc/tegra/bpmp-abi.h>
> +
> +#define TEGRA_BPMP_DUMP_CLOCK_INFO	0
> +
> +#define TEGRA_BPMP_CLK_HAS_MUX		BIT(0)
> +#define TEGRA_BPMP_CLK_HAS_SET_RATE	BIT(1)
> +#define TEGRA_BPMP_CLK_IS_ROOT		BIT(2)
> +
> +struct tegra_bpmp_clk_info {
> +	unsigned int id;
> +	char name[MRQ_CLK_NAME_MAXLEN];
> +	unsigned int parents[MRQ_CLK_MAX_PARENTS];
> +	unsigned int num_parents;
> +	unsigned long flags;
> +};
> +
> +struct tegra_bpmp_clk {
> +	struct clk_hw hw;
> +
> +	struct tegra_bpmp *bpmp;
> +	unsigned int id;
> +
> +	unsigned int num_parents;
> +	unsigned int *parents;
> +};
> +
> +static inline struct tegra_bpmp_clk *to_tegra_bpmp_clk(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct tegra_bpmp_clk, hw);
> +}
> +
> +struct tegra_bpmp_clk_message {
> +	unsigned int cmd;
> +	unsigned int clk;

s/clk/id or clk_id?

> +
> +	struct {
> +		const void *data;
> +		size_t size;
> +	} tx;
> +
> +	struct {
> +		void *data;
> +		size_t size;
> +	} rx;
> +};
> +
> +static int
> +__tegra_bpmp_clk_transfer_atomic(struct tegra_bpmp *bpmp,
> +				 struct tegra_bpmp_message *msg)
> +{
> +	unsigned long flags;
> +	int err;
> +
> +	local_irq_save(flags);
> +	err = tegra_bpmp_transfer_atomic(bpmp, msg);
> +	local_irq_restore(flags);

Why do we need to disable irqs? Seems like an odd thing for the
caller to decide given that there aren't any interrupt handlers
in this driver.

> +
> +	return err;
> +}
> +
> +static int
> +tegra_bpmp_clk_transfer_atomic(struct tegra_bpmp *bpmp,
> +			       const struct tegra_bpmp_clk_message *clk)
> +{
> +	struct mrq_clk_request request;
> +	struct tegra_bpmp_message msg;
> +	void *req = (void *)&request;

We shouldn't need to cast to void * here.

> +
> +	memset(&request, 0, sizeof(request));
> +	request.cmd_and_id = (clk->cmd << 24) | clk->clk;
> +	memcpy(req + 4, clk->tx.data, clk->tx.size);
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.mrq = MRQ_CLK;
> +	msg.tx.data = &request;
> +	msg.tx.size = sizeof(request);
> +	msg.rx.data = clk->rx.data;
> +	msg.rx.size = clk->rx.size;
> +
> +	return __tegra_bpmp_clk_transfer_atomic(bpmp, &msg);;

Double semicolon here.

> +}
> +
> +static int tegra_bpmp_clk_transfer(struct tegra_bpmp *bpmp,
> +				   const struct tegra_bpmp_clk_message *clk)
> +{
> +	struct mrq_clk_request request;
> +	struct tegra_bpmp_message msg;
> +	void *req = (void *)&request;

Useless cast to void.

> +	int err;
> +
> +	memset(&request, 0, sizeof(request));
> +	request.cmd_and_id = (clk->cmd << 24) | clk->clk;

Haha clk clk. I sound like a chicken when I read this.

> +	memcpy(req + 4, clk->tx.data, clk->tx.size);

struct mrq_clk_request could have a member for this called "data"
or something. Then all the casting to void and adding 4 magic
could be computed by the compiler and changeable without us
having to remember we're doing void pointer math here.

> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.mrq = MRQ_CLK;
> +	msg.tx.data = &request;
> +	msg.tx.size = sizeof(request);
> +	msg.rx.data = clk->rx.data;
> +	msg.rx.size = clk->rx.size;
> +
> +	err = tegra_bpmp_transfer(bpmp, &msg);
> +	if (err != -EAGAIN)
> +		return err;
> +
> +	return __tegra_bpmp_clk_transfer_atomic(bpmp, &msg);
> +}
> +
> +static int tegra_bpmp_clk_enable(struct clk_hw *hw)

Maybe this should be called tegra_bpmp_clk_prepare() so as to not
confuse the reader.

> +{
> +	struct tegra_bpmp_clk *clk = to_tegra_bpmp_clk(hw);
> +	struct tegra_bpmp_clk_message msg;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd = CMD_CLK_ENABLE;
> +	msg.clk = clk->id;
> +
> +	return tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> +}
> +
> +static void tegra_bpmp_clk_disable(struct clk_hw *hw)
> +{
> +	struct tegra_bpmp_clk *clk = to_tegra_bpmp_clk(hw);
> +	struct tegra_bpmp_clk_message msg;
> +	int err;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd = CMD_CLK_DISABLE;
> +	msg.clk = clk->id;
> +
> +	err = tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> +	if (err < 0)
> +		dev_err(clk->bpmp->dev, "failed to disable clock %s: %d\n",
> +			clk_hw_get_name(hw), err);
> +}
> +
> +static int tegra_bpmp_clk_is_enabled(struct clk_hw *hw)

Why not *_is_prepared()?

> +{
> +	struct tegra_bpmp_clk *clk = to_tegra_bpmp_clk(hw);
> +	struct cmd_clk_is_enabled_response response;
> +	struct tegra_bpmp_clk_message msg;
> +	int err;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd = CMD_CLK_IS_ENABLED;
> +	msg.clk = clk->id;
> +	msg.rx.data = &response;
> +	msg.rx.size = sizeof(response);
> +
> +	err = tegra_bpmp_clk_transfer_atomic(clk->bpmp, &msg);

And then I presume this wouldn't need to worry about being called
in atomic situations.

> +	if (err < 0)
> +		return err;
> +
> +	return response.state;
> +}
> +
> +static u8 tegra_bpmp_clk_get_parent(struct clk_hw *hw)
> +{
> +	struct tegra_bpmp_clk *clk = to_tegra_bpmp_clk(hw);
> +	struct cmd_clk_get_parent_response response;
> +	struct tegra_bpmp_clk_message msg;
> +	unsigned int i;
> +	int err;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd = CMD_CLK_GET_PARENT;
> +	msg.clk = clk->id;
> +	msg.rx.data = &response;
> +	msg.rx.size = sizeof(&response);

Shouldn't that be sizeof(response)? Or you're expecting a
pointer to come back?

> +
> +	err = tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> +	if (err < 0) {
> +		dev_err(clk->bpmp->dev, "failed to get parent for %s: %d\n",
> +			clk_hw_get_name(hw), err);
> +		return U8_MAX;
> +	}
> +
> +	for (i = 0; i < clk->num_parents; i++)

Could be clk_hw_get_num_parents() instead?

> +		if (clk->parents[i] == response.parent_id)
> +			return i;
> +
> +	return U8_MAX;
> +}
> +
> +static int tegra_bpmp_clk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct tegra_bpmp_clk *clk = to_tegra_bpmp_clk(hw);
> +	struct cmd_clk_set_parent_response response;
> +	struct cmd_clk_set_parent_request request;
> +	struct tegra_bpmp_clk_message msg;
> +	int err;
> +
> +	if (index >= clk->num_parents)
> +		return -EINVAL;

The framework already handles that. Why do we need to check here?

> +
> +	memset(&request, 0, sizeof(request));
> +	request.parent_id = clk->parents[index];
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd = CMD_CLK_SET_PARENT;
> +	msg.clk = clk->id;
> +	msg.tx.data = &request;
> +	msg.tx.size = sizeof(request);
> +	msg.rx.data = &response;
> +	msg.rx.size = sizeof(response);

Maybe this could be a macro as it comes up a few times.

	msg_set_tx(m, d) ({ m.tx.data = d; m.tx.size = sizeof(d); })
	msg_set_rx(m, d) ({ m.rx.data = d; m.rx.size = sizeof(d); })
	msg_set_tx_rx(m, t, r) ({ msg_set_tx(m, t); msg_set_rx(m, r); })

> +
> +	err = tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> +	if (err < 0)
> +		return err;
> +
> +	/* XXX check parent ID in response */
> +
> +	return 0;
> +}
> +
> +static int tegra_bpmp_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +				   unsigned long parent_rate)
> +{
> +	struct tegra_bpmp_clk *clk = to_tegra_bpmp_clk(hw);
> +	struct cmd_clk_set_rate_response response;
> +	struct cmd_clk_set_rate_request request;
> +	struct tegra_bpmp_clk_message msg;
> +
> +	memset(&request, 0, sizeof(request));
> +	request.rate = rate;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd = CMD_CLK_SET_RATE;
> +	msg.clk = clk->id;
> +	msg.tx.data = &request;
> +	msg.tx.size = sizeof(request);
> +	msg.rx.data = &response;
> +	msg.rx.size = sizeof(response);
> +
> +	return tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> +}
> +
> +static long tegra_bpmp_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> +				      unsigned long *parent_rate)
> +{
> +	struct tegra_bpmp_clk *clk = to_tegra_bpmp_clk(hw);
> +	struct cmd_clk_round_rate_response response;
> +	struct cmd_clk_round_rate_request request;

Would this structure be used outside of this driver? Why can't we
define it in this C file?

> +	struct tegra_bpmp_clk_message msg;
> +	int err;
> +
> +	memset(&request, 0, sizeof(request));
> +	request.rate = rate;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd = CMD_CLK_ROUND_RATE;
> +	msg.clk = clk->id;
> +	msg.tx.data = &request;
> +	msg.tx.size = sizeof(request);
> +	msg.rx.data = &response;
> +	msg.rx.size = sizeof(response);
> +
> +	err = tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> +	if (err < 0)
> +		return err;
> +
> +	return response.rate;
> +}
> +
> +static unsigned long tegra_bpmp_clk_get_rate(struct tegra_bpmp *bpmp,
> +					     unsigned int id)
> +{
> +	struct cmd_clk_get_rate_response response;
> +	struct cmd_clk_get_rate_request request;
> +	struct tegra_bpmp_clk_message msg;
> +	int err;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd = CMD_CLK_GET_RATE;
> +	msg.clk = id;
> +	msg.tx.data = &request;
> +	msg.tx.size = sizeof(request);
> +	msg.rx.data = &response;
> +	msg.rx.size = sizeof(response);
> +
> +	err = tegra_bpmp_clk_transfer(bpmp, &msg);
> +	if (err < 0)
> +		return err;
> +
> +	return response.rate;
> +}
> +
> +static unsigned long tegra_bpmp_clk_recalc_rate(struct clk_hw *hw,
> +						unsigned long parent_rate)
> +{
> +	struct tegra_bpmp_clk *clk = to_tegra_bpmp_clk(hw);
> +
> +	return tegra_bpmp_clk_get_rate(clk->bpmp, clk->id);
> +}

Is there a reason to have two functions? Please fold the two
together into one.

> +
> +static const struct clk_ops tegra_bpmp_clk_gate_ops = {
> +	.is_enabled = tegra_bpmp_clk_is_enabled,
> +	.prepare = tegra_bpmp_clk_enable,
> +	.unprepare = tegra_bpmp_clk_disable,
> +	.recalc_rate = tegra_bpmp_clk_recalc_rate,
> +};
> +
> +static const struct clk_ops tegra_bpmp_clk_mux_ops = {
> +	.get_parent = tegra_bpmp_clk_get_parent,
> +	.set_parent = tegra_bpmp_clk_set_parent,
> +	.is_enabled = tegra_bpmp_clk_is_enabled,
> +	.prepare = tegra_bpmp_clk_enable,
> +	.unprepare = tegra_bpmp_clk_disable,
> +	.recalc_rate = tegra_bpmp_clk_recalc_rate,
> +};
> +
> +static const struct clk_ops tegra_bpmp_clk_rate_ops = {
> +	.is_enabled = tegra_bpmp_clk_is_enabled,
> +	.prepare = tegra_bpmp_clk_enable,
> +	.unprepare = tegra_bpmp_clk_disable,
> +	.set_rate = tegra_bpmp_clk_set_rate,
> +	.round_rate = tegra_bpmp_clk_round_rate,
> +	.recalc_rate = tegra_bpmp_clk_recalc_rate,
> +};
> +
> +static const struct clk_ops tegra_bpmp_clk_mux_rate_ops = {
> +	.get_parent = tegra_bpmp_clk_get_parent,
> +	.set_parent = tegra_bpmp_clk_set_parent,
> +	.is_enabled = tegra_bpmp_clk_is_enabled,
> +	.prepare = tegra_bpmp_clk_enable,
> +	.unprepare = tegra_bpmp_clk_disable,
> +	.set_rate = tegra_bpmp_clk_set_rate,
> +	.round_rate = tegra_bpmp_clk_round_rate,
> +	.recalc_rate = tegra_bpmp_clk_recalc_rate,
> +};
> +
> +static int tegra_bpmp_clk_get_max_id(struct tegra_bpmp *bpmp)
> +{
> +	struct cmd_clk_get_max_clk_id_response response;
> +	struct tegra_bpmp_clk_message msg;
> +	int err;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd = CMD_CLK_GET_MAX_CLK_ID;
> +	msg.rx.data = &response;
> +	msg.rx.size = sizeof(response);
> +
> +	err = tegra_bpmp_clk_transfer(bpmp, &msg);
> +	if (err < 0)
> +		return err;
> +
> +	if (response.max_id > INT_MAX)
> +		return -E2BIG;

I'm not sure the argument list is too long.

> +
> +	return response.max_id;
> +}
> +
> +static int tegra_bpmp_clk_get_info(struct tegra_bpmp *bpmp, unsigned int id,
> +				   struct tegra_bpmp_clk_info *info)
> +{
> +	struct cmd_clk_get_all_info_response response;
> +	struct tegra_bpmp_clk_message msg;
> +	unsigned int i;
> +	int err;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd = CMD_CLK_GET_ALL_INFO;
> +	msg.clk = id;
> +	msg.rx.data = &response;
> +	msg.rx.size = sizeof(response);
> +
> +	err = tegra_bpmp_clk_transfer(bpmp, &msg);
> +	if (err < 0)
> +		return err;
> +
> +	strlcpy(info->name, response.name, MRQ_CLK_NAME_MAXLEN);
> +	info->num_parents = response.num_parents;
> +
> +	for (i = 0; i < info->num_parents; i++)
> +		info->parents[i] = response.parents[i];
> +
> +	info->flags = response.flags;
> +
> +	return 0;
> +}
> +
> +static void tegra_bpmp_clk_info_dump(struct tegra_bpmp *bpmp,
> +				     const char *level,
> +				     const struct tegra_bpmp_clk_info *info)
> +{
> +	const char *prefix = "";
> +	struct seq_buf buf;
> +	unsigned int i;
> +	char flags[64];
> +
> +	seq_buf_init(&buf, flags, sizeof(flags));
> +
> +	if (info->flags)
> +		seq_buf_printf(&buf, "(");
> +
> +	if (info->flags & TEGRA_BPMP_CLK_HAS_MUX) {
> +		seq_buf_printf(&buf, "%smux", prefix);
> +		prefix = ", ";
> +	}
> +
> +	if ((info->flags & TEGRA_BPMP_CLK_HAS_SET_RATE) == 0) {
> +		seq_buf_printf(&buf, "%sfixed", prefix);
> +		prefix = ", ";
> +	}
> +
> +	if (info->flags & TEGRA_BPMP_CLK_IS_ROOT) {
> +		seq_buf_printf(&buf, "%sroot", prefix);
> +		prefix = ", ";
> +	}
> +
> +	if (info->flags)
> +		seq_buf_printf(&buf, ")");
> +
> +	dev_printk(level, bpmp->dev, "%03u: %s\n", info->id, info->name);
> +	dev_printk(level, bpmp->dev, "  flags: %lx %s\n", info->flags, flags);
> +	dev_printk(level, bpmp->dev, "  parents: %u\n", info->num_parents);
> +
> +	for (i = 0; i < info->num_parents; i++)
> +		dev_printk(level, bpmp->dev, "    %03u\n", info->parents[i]);
> +}
> +
> +static int tegra_bpmp_probe_clocks(struct tegra_bpmp *bpmp,
> +				   struct tegra_bpmp_clk_info **clocksp)
> +{
> +	struct tegra_bpmp_clk_info *clocks;
> +	unsigned int max_id, id, count = 0;
> +	unsigned int holes = 0;
> +	int err;
> +
> +	err = tegra_bpmp_clk_get_max_id(bpmp);

Just assign to max_id here and make max_id int instead?

> +	if (err < 0)
> +		return err;
> +
> +	max_id = err;

Would make this redundant.

> +
> +	dev_dbg(bpmp->dev, "maximum clock ID: %u\n", max_id);
> +
> +	clocks = kcalloc(max_id + 1, sizeof(*clocks), GFP_KERNEL);
> +	if (!clocks)
> +		return -ENOMEM;
> +
> +	for (id = 0; id <= max_id; id++) {
> +		struct tegra_bpmp_clk_info *info = &clocks[count];
> +
> +		err = tegra_bpmp_clk_get_info(bpmp, id, info);
> +		if (err < 0) {
> +			dev_err(bpmp->dev, "failed to query clock %u: %d\n",
> +				id, err);
> +			continue;
> +		}
> +
> +		if (info->num_parents >= U8_MAX) {
> +			dev_err(bpmp->dev,
> +				"clock %u has too many parents (%u, max: %u)\n",
> +				id, info->num_parents, U8_MAX);
> +			continue;
> +		}
> +
> +		/* clock not exposed by BPMP */
> +		if (info->name[0] == '\0') {
> +			holes++;
> +			continue;
> +		}
> +
> +		info->id = id;

Why not store info at the offset associated with id? We've
already computed max so it should work?

> +		count++;
> +
> +		if (TEGRA_BPMP_DUMP_CLOCK_INFO)
> +			tegra_bpmp_clk_info_dump(bpmp, KERN_DEBUG, info);
> +	}
> +
> +	dev_dbg(bpmp->dev, "holes: %u\n", holes);
> +	*clocksp = clocks;
> +
> +	return count;
> +}
> +
> +static const struct tegra_bpmp_clk_info *
> +tegra_bpmp_clk_find(const struct tegra_bpmp_clk_info *clocks,
> +		    unsigned int num_clocks, unsigned int id)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < num_clocks; i++)
> +		if (clocks[i].id == id)
> +			return &clocks[i];
> +
> +	return NULL;
> +}
> +
> +static struct clk_hw *
> +tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
> +			const struct tegra_bpmp_clk_info *info,
> +			const struct tegra_bpmp_clk_info *clocks,
> +			unsigned int num_clocks)
> +{
> +	struct tegra_bpmp_clk *priv;
> +	struct clk_init_data init;

Best to intialize init to { } here. I don't see init.flags set
anywhere so that's already a problem.

> +	const char **parents;
> +	struct clk *clk;
> +	unsigned int i;
> +
> +	priv = devm_kzalloc(bpmp->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return ERR_PTR(-ENOMEM);
> +
> +	priv->bpmp = bpmp;
> +	priv->id = info->id;
> +
> +	priv->parents = devm_kcalloc(bpmp->dev, info->num_parents,
> +				     sizeof(*priv->parents), GFP_KERNEL);
> +	if (!priv->parents)
> +		return ERR_PTR(-ENOMEM);
> +
> +	priv->num_parents = info->num_parents;
> +
> +	/* hardware clock initialization */
> +	priv->hw.init = &init;
> +	init.name = info->name;
> +
> +	if (info->flags & TEGRA_BPMP_CLK_HAS_MUX) {
> +		if (info->flags & TEGRA_BPMP_CLK_HAS_SET_RATE)
> +			init.ops = &tegra_bpmp_clk_mux_rate_ops;
> +		else
> +			init.ops = &tegra_bpmp_clk_mux_ops;
> +	} else {
> +		if (info->flags & TEGRA_BPMP_CLK_HAS_SET_RATE)
> +			init.ops = &tegra_bpmp_clk_rate_ops;
> +		else
> +			init.ops = &tegra_bpmp_clk_gate_ops;
> +	}
> +
> +	init.num_parents = info->num_parents;
> +
> +	parents = kcalloc(info->num_parents, sizeof(*parents), GFP_KERNEL);
> +	if (!parents)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < info->num_parents; i++) {
> +		const struct tegra_bpmp_clk_info *parent;
> +
> +		/* keep a private copy of the ID to parent index map */
> +		priv->parents[i] = info->parents[i];
> +
> +		parent = tegra_bpmp_clk_find(clocks, num_clocks,
> +					     info->parents[i]);
> +		if (!parent) {
> +			dev_err(bpmp->dev, "no parent %u found for %u\n",
> +				info->parents[i], info->id);
> +			continue;
> +		}
> +
> +		parents[i] = parent->name;
> +	}
> +
> +	init.parent_names = parents;
> +
> +	clk = clk_register(bpmp->dev, &priv->hw);

Just use clk_hw_register() please, or devm_clk_hw_register().

> +
> +	kfree(parents);
> +
> +	if (IS_ERR(clk))
> +		return ERR_CAST(clk);
> +
> +	return &priv->hw;
> +}
> +
> +static int tegra_bpmp_register_clocks(struct tegra_bpmp *bpmp,
> +				      struct tegra_bpmp_clk_info *clocks,

s/clocks/infos?

> +				      unsigned int count)
> +{
> +	struct clk_hw *hw;
> +	unsigned int i;
> +
> +	bpmp->num_clocks = count;
> +
> +	bpmp->clocks = devm_kcalloc(bpmp->dev, count, sizeof(hw), GFP_KERNEL);
> +	if (!bpmp->clocks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < count; i++) {
> +		struct tegra_bpmp_clk_info *info = &clocks[i];
> +
> +		hw = tegra_bpmp_clk_register(bpmp, info, clocks, count);
> +		if (IS_ERR(hw)) {
> +			dev_err(bpmp->dev,
> +				"failed to register clock %u (%s): %ld\n",
> +				info->id, info->name, PTR_ERR(hw));
> +			continue;
> +		}
> +
> +		bpmp->clocks[i] = hw;
> +	}
> +
> +	return 0;
> +}
> +
> +static void tegra_bpmp_unregister_clocks(struct tegra_bpmp *bpmp)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < bpmp->num_clocks; i++)
> +		clk_hw_unregister(bpmp->clocks[i]);
> +}
> +
> +static struct clk_hw *tegra_bpmp_clk_of_xlate(struct of_phandle_args *clkspec,
> +					      void *data)
> +{
> +	unsigned int id = clkspec->args[0], i;
> +	struct tegra_bpmp *bpmp = data;
> +	struct tegra_bpmp_clk *clk;
> +
> +	for (i = 0; i < bpmp->num_clocks; i++) {
> +		clk = to_tegra_bpmp_clk(bpmp->clocks[i]);
> +		if (clk->id == id)
> +			return bpmp->clocks[i];
> +	}

 	for (i = 0; i < bpmp->num_clocks; i++) {
		hw = bpmp->clocks[i];
		clk = to_tegra_bpmp_clk(hw);
		if (clk->id == id)
			return hw;
	}

Uses another local variable but is much clearer.

> +
> +	return NULL;
> +}
> +
> +int tegra_bpmp_init_clocks(struct tegra_bpmp *bpmp)

Someone is going to call this function? Why aren't we doing the
typical device driver probe?

> +{
> +	struct tegra_bpmp_clk_info *clocks;
> +	unsigned int count;
> +	int err;
> +
> +	err = tegra_bpmp_probe_clocks(bpmp, &clocks);
> +	if (err < 0)
> +		return err;
> +
> +	count = err;
> +
> +	dev_dbg(bpmp->dev, "%u clocks probed\n", count);
> +
> +	err = tegra_bpmp_register_clocks(bpmp, clocks, count);
> +	if (err < 0)
> +		goto free;
> +
> +	err = of_clk_add_hw_provider(bpmp->dev->of_node,
> +				     tegra_bpmp_clk_of_xlate,
> +				     bpmp);
> +	if (err < 0) {
> +		tegra_bpmp_unregister_clocks(bpmp);
> +		goto free;
> +	}
> +
> +free:
> +	kfree(clocks);
> +	return err;
> +}
> -- 
> 2.10.2
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
