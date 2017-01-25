From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] clk: tegra: Add BPMP clock driver
Date: Wed, 25 Jan 2017 08:41:12 +0100
Message-ID: <20170125074112.GC13025@ulmo.ba.sec>
References: <20161115161129.29722-1-thierry.reding@gmail.com>
 <20161117154731.29528-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161117154731.29528-1-thierry.reding@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2016 at 04:47:31PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> This driver uses the services provided by the BPMP firmware driver to
> implement a clock driver based on the MRQ_CLK request. This part of the
> BPMP ABI provides a means to enumerate and control clocks and should
> allow the driver to work on any chip that supports this ABI.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - rename ->prepare() and ->unprepare() implementations for consistency
> - implement ->is_prepared() instead of ->is_enabled() to avoid the need
>   for atomic operations
> - rename tegra_bpmp_clk_message.clk member to id
> - remove a double semi-colon and a stray ampersand
> - drop extra check for validity of parent index, the core does it
>   already
> - make struct tegra_bpmp carry an array of struct tegra_bpmp_clk instead
>   of struct clk_hw to simplify some driver code
> - zero out struct clk_init_data to avoid potentially uninitialized data
> - use devm_clk_hw_register() instead of clk_register() because we never
>   need the opaque struct clk cookie
> - rearrange functions so that they appear in the order specified by
>   struct clk_ops
>=20
>  drivers/clk/tegra/Kconfig    |   4 +
>  drivers/clk/tegra/Makefile   |   1 +
>  drivers/clk/tegra/clk-bpmp.c | 620 +++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 625 insertions(+)
>  create mode 100644 drivers/clk/tegra/clk-bpmp.c

Stephen, Mike,

we missed the last merge window with this, but it would be nice to get
it in this time. Any more comments?

Thierry

> diff --git a/drivers/clk/tegra/Kconfig b/drivers/clk/tegra/Kconfig
> index 1ba30d1e14f2..7ddacae5d0b1 100644
> --- a/drivers/clk/tegra/Kconfig
> +++ b/drivers/clk/tegra/Kconfig
> @@ -1,3 +1,7 @@
>  config TEGRA_CLK_EMC
>  	def_bool y
>  	depends on TEGRA124_EMC
> +
> +config CLK_TEGRA_BPMP
> +	def_bool y
> +	depends on TEGRA_BPMP
> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> index 33fd0938d79e..4be8af28ee61 100644
> --- a/drivers/clk/tegra/Makefile
> +++ b/drivers/clk/tegra/Makefile
> @@ -22,3 +22,4 @@ obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+=3D clk-tegra124-dfll=
-fcpu.o
>  obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+=3D clk-tegra124.o
>  obj-y					+=3D cvb.o
>  obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+=3D clk-tegra210.o
> +obj-$(CONFIG_CLK_TEGRA_BPMP)		+=3D clk-bpmp.o
> diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
> new file mode 100644
> index 000000000000..638ace64033b
> --- /dev/null
> +++ b/drivers/clk/tegra/clk-bpmp.c
> @@ -0,0 +1,620 @@
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
> +	unsigned int id;
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
> +static int tegra_bpmp_clk_transfer(struct tegra_bpmp *bpmp,
> +				   const struct tegra_bpmp_clk_message *clk)
> +{
> +	struct mrq_clk_request request;
> +	struct tegra_bpmp_message msg;
> +	void *req =3D &request;
> +
> +	memset(&request, 0, sizeof(request));
> +	request.cmd_and_id =3D (clk->cmd << 24) | clk->id;
> +
> +	/*
> +	 * The mrq_clk_request structure has an anonymous union at offset 4
> +	 * that contains all possible sub-command structures. Copy the data
> +	 * to that union. Ideally we'd be able to refer to it by name, but
> +	 * doing so would require changing the ABI header and increase the
> +	 * maintenance burden.
> +	 */
> +	memcpy(req + 4, clk->tx.data, clk->tx.size);
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.mrq =3D MRQ_CLK;
> +	msg.tx.data =3D &request;
> +	msg.tx.size =3D sizeof(request);
> +	msg.rx.data =3D clk->rx.data;
> +	msg.rx.size =3D clk->rx.size;
> +
> +	return tegra_bpmp_transfer(bpmp, &msg);
> +}
> +
> +static int tegra_bpmp_clk_prepare(struct clk_hw *hw)
> +{
> +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> +	struct tegra_bpmp_clk_message msg;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd =3D CMD_CLK_ENABLE;
> +	msg.id =3D clk->id;
> +
> +	return tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> +}
> +
> +static void tegra_bpmp_clk_unprepare(struct clk_hw *hw)
> +{
> +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> +	struct tegra_bpmp_clk_message msg;
> +	int err;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd =3D CMD_CLK_DISABLE;
> +	msg.id =3D clk->id;
> +
> +	err =3D tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> +	if (err < 0)
> +		dev_err(clk->bpmp->dev, "failed to disable clock %s: %d\n",
> +			clk_hw_get_name(hw), err);
> +}
> +
> +static int tegra_bpmp_clk_is_prepared(struct clk_hw *hw)
> +{
> +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> +	struct cmd_clk_is_enabled_response response;
> +	struct tegra_bpmp_clk_message msg;
> +	int err;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd =3D CMD_CLK_IS_ENABLED;
> +	msg.id =3D clk->id;
> +	msg.rx.data =3D &response;
> +	msg.rx.size =3D sizeof(response);
> +
> +	err =3D tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> +	if (err < 0)
> +		return err;
> +
> +	return response.state;
> +}
> +
> +static unsigned long tegra_bpmp_clk_recalc_rate(struct clk_hw *hw,
> +						unsigned long parent_rate)
> +{
> +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> +	struct cmd_clk_get_rate_response response;
> +	struct cmd_clk_get_rate_request request;
> +	struct tegra_bpmp_clk_message msg;
> +	int err;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd =3D CMD_CLK_GET_RATE;
> +	msg.id =3D clk->id;
> +	msg.tx.data =3D &request;
> +	msg.tx.size =3D sizeof(request);
> +	msg.rx.data =3D &response;
> +	msg.rx.size =3D sizeof(response);
> +
> +	err =3D tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> +	if (err < 0)
> +		return err;
> +
> +	return response.rate;
> +}
> +
> +static long tegra_bpmp_clk_round_rate(struct clk_hw *hw, unsigned long r=
ate,
> +				      unsigned long *parent_rate)
> +{
> +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> +	struct cmd_clk_round_rate_response response;
> +	struct cmd_clk_round_rate_request request;
> +	struct tegra_bpmp_clk_message msg;
> +	int err;
> +
> +	memset(&request, 0, sizeof(request));
> +	request.rate =3D rate;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd =3D CMD_CLK_ROUND_RATE;
> +	msg.id =3D clk->id;
> +	msg.tx.data =3D &request;
> +	msg.tx.size =3D sizeof(request);
> +	msg.rx.data =3D &response;
> +	msg.rx.size =3D sizeof(response);
> +
> +	err =3D tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> +	if (err < 0)
> +		return err;
> +
> +	return response.rate;
> +}
> +
> +static int tegra_bpmp_clk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> +	struct cmd_clk_set_parent_response response;
> +	struct cmd_clk_set_parent_request request;
> +	struct tegra_bpmp_clk_message msg;
> +	int err;
> +
> +	memset(&request, 0, sizeof(request));
> +	request.parent_id =3D clk->parents[index];
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd =3D CMD_CLK_SET_PARENT;
> +	msg.id =3D clk->id;
> +	msg.tx.data =3D &request;
> +	msg.tx.size =3D sizeof(request);
> +	msg.rx.data =3D &response;
> +	msg.rx.size =3D sizeof(response);
> +
> +	err =3D tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> +	if (err < 0)
> +		return err;
> +
> +	/* XXX check parent ID in response */
> +
> +	return 0;
> +}
> +
> +static u8 tegra_bpmp_clk_get_parent(struct clk_hw *hw)
> +{
> +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> +	struct cmd_clk_get_parent_response response;
> +	struct tegra_bpmp_clk_message msg;
> +	unsigned int i;
> +	int err;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd =3D CMD_CLK_GET_PARENT;
> +	msg.id =3D clk->id;
> +	msg.rx.data =3D &response;
> +	msg.rx.size =3D sizeof(response);
> +
> +	err =3D tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> +	if (err < 0) {
> +		dev_err(clk->bpmp->dev, "failed to get parent for %s: %d\n",
> +			clk_hw_get_name(hw), err);
> +		return U8_MAX;
> +	}
> +
> +	for (i =3D 0; i < clk->num_parents; i++)
> +		if (clk->parents[i] =3D=3D response.parent_id)
> +			return i;
> +
> +	return U8_MAX;
> +}
> +
> +static int tegra_bpmp_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +				   unsigned long parent_rate)
> +{
> +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> +	struct cmd_clk_set_rate_response response;
> +	struct cmd_clk_set_rate_request request;
> +	struct tegra_bpmp_clk_message msg;
> +
> +	memset(&request, 0, sizeof(request));
> +	request.rate =3D rate;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd =3D CMD_CLK_SET_RATE;
> +	msg.id =3D clk->id;
> +	msg.tx.data =3D &request;
> +	msg.tx.size =3D sizeof(request);
> +	msg.rx.data =3D &response;
> +	msg.rx.size =3D sizeof(response);
> +
> +	return tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> +}
> +
> +static const struct clk_ops tegra_bpmp_clk_gate_ops =3D {
> +	.prepare =3D tegra_bpmp_clk_prepare,
> +	.unprepare =3D tegra_bpmp_clk_unprepare,
> +	.is_prepared =3D tegra_bpmp_clk_is_prepared,
> +	.recalc_rate =3D tegra_bpmp_clk_recalc_rate,
> +};
> +
> +static const struct clk_ops tegra_bpmp_clk_mux_ops =3D {
> +	.prepare =3D tegra_bpmp_clk_prepare,
> +	.unprepare =3D tegra_bpmp_clk_unprepare,
> +	.is_prepared =3D tegra_bpmp_clk_is_prepared,
> +	.recalc_rate =3D tegra_bpmp_clk_recalc_rate,
> +	.set_parent =3D tegra_bpmp_clk_set_parent,
> +	.get_parent =3D tegra_bpmp_clk_get_parent,
> +};
> +
> +static const struct clk_ops tegra_bpmp_clk_rate_ops =3D {
> +	.prepare =3D tegra_bpmp_clk_prepare,
> +	.unprepare =3D tegra_bpmp_clk_unprepare,
> +	.is_prepared =3D tegra_bpmp_clk_is_prepared,
> +	.recalc_rate =3D tegra_bpmp_clk_recalc_rate,
> +	.round_rate =3D tegra_bpmp_clk_round_rate,
> +	.set_rate =3D tegra_bpmp_clk_set_rate,
> +};
> +
> +static const struct clk_ops tegra_bpmp_clk_mux_rate_ops =3D {
> +	.prepare =3D tegra_bpmp_clk_prepare,
> +	.unprepare =3D tegra_bpmp_clk_unprepare,
> +	.is_prepared =3D tegra_bpmp_clk_is_prepared,
> +	.recalc_rate =3D tegra_bpmp_clk_recalc_rate,
> +	.round_rate =3D tegra_bpmp_clk_round_rate,
> +	.set_parent =3D tegra_bpmp_clk_set_parent,
> +	.get_parent =3D tegra_bpmp_clk_get_parent,
> +	.set_rate =3D tegra_bpmp_clk_set_rate,
> +};
> +
> +static int tegra_bpmp_clk_get_max_id(struct tegra_bpmp *bpmp)
> +{
> +	struct cmd_clk_get_max_clk_id_response response;
> +	struct tegra_bpmp_clk_message msg;
> +	int err;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd =3D CMD_CLK_GET_MAX_CLK_ID;
> +	msg.rx.data =3D &response;
> +	msg.rx.size =3D sizeof(response);
> +
> +	err =3D tegra_bpmp_clk_transfer(bpmp, &msg);
> +	if (err < 0)
> +		return err;
> +
> +	if (response.max_id > INT_MAX)
> +		return -E2BIG;
> +
> +	return response.max_id;
> +}
> +
> +static int tegra_bpmp_clk_get_info(struct tegra_bpmp *bpmp, unsigned int=
 id,
> +				   struct tegra_bpmp_clk_info *info)
> +{
> +	struct cmd_clk_get_all_info_response response;
> +	struct tegra_bpmp_clk_message msg;
> +	unsigned int i;
> +	int err;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.cmd =3D CMD_CLK_GET_ALL_INFO;
> +	msg.id =3D id;
> +	msg.rx.data =3D &response;
> +	msg.rx.size =3D sizeof(response);
> +
> +	err =3D tegra_bpmp_clk_transfer(bpmp, &msg);
> +	if (err < 0)
> +		return err;
> +
> +	strlcpy(info->name, response.name, MRQ_CLK_NAME_MAXLEN);
> +	info->num_parents =3D response.num_parents;
> +
> +	for (i =3D 0; i < info->num_parents; i++)
> +		info->parents[i] =3D response.parents[i];
> +
> +	info->flags =3D response.flags;
> +
> +	return 0;
> +}
> +
> +static void tegra_bpmp_clk_info_dump(struct tegra_bpmp *bpmp,
> +				     const char *level,
> +				     const struct tegra_bpmp_clk_info *info)
> +{
> +	const char *prefix =3D "";
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
> +		prefix =3D ", ";
> +	}
> +
> +	if ((info->flags & TEGRA_BPMP_CLK_HAS_SET_RATE) =3D=3D 0) {
> +		seq_buf_printf(&buf, "%sfixed", prefix);
> +		prefix =3D ", ";
> +	}
> +
> +	if (info->flags & TEGRA_BPMP_CLK_IS_ROOT) {
> +		seq_buf_printf(&buf, "%sroot", prefix);
> +		prefix =3D ", ";
> +	}
> +
> +	if (info->flags)
> +		seq_buf_printf(&buf, ")");
> +
> +	dev_printk(level, bpmp->dev, "%03u: %s\n", info->id, info->name);
> +	dev_printk(level, bpmp->dev, "  flags: %lx %s\n", info->flags, flags);
> +	dev_printk(level, bpmp->dev, "  parents: %u\n", info->num_parents);
> +
> +	for (i =3D 0; i < info->num_parents; i++)
> +		dev_printk(level, bpmp->dev, "    %03u\n", info->parents[i]);
> +}
> +
> +static int tegra_bpmp_probe_clocks(struct tegra_bpmp *bpmp,
> +				   struct tegra_bpmp_clk_info **clocksp)
> +{
> +	struct tegra_bpmp_clk_info *clocks;
> +	unsigned int max_id, id, count =3D 0;
> +	unsigned int holes =3D 0;
> +	int err;
> +
> +	err =3D tegra_bpmp_clk_get_max_id(bpmp);
> +	if (err < 0)
> +		return err;
> +
> +	max_id =3D err;
> +
> +	dev_dbg(bpmp->dev, "maximum clock ID: %u\n", max_id);
> +
> +	clocks =3D kcalloc(max_id + 1, sizeof(*clocks), GFP_KERNEL);
> +	if (!clocks)
> +		return -ENOMEM;
> +
> +	for (id =3D 0; id <=3D max_id; id++) {
> +		struct tegra_bpmp_clk_info *info =3D &clocks[count];
> +
> +		err =3D tegra_bpmp_clk_get_info(bpmp, id, info);
> +		if (err < 0) {
> +			dev_err(bpmp->dev, "failed to query clock %u: %d\n",
> +				id, err);
> +			continue;
> +		}
> +
> +		if (info->num_parents >=3D U8_MAX) {
> +			dev_err(bpmp->dev,
> +				"clock %u has too many parents (%u, max: %u)\n",
> +				id, info->num_parents, U8_MAX);
> +			continue;
> +		}
> +
> +		/* clock not exposed by BPMP */
> +		if (info->name[0] =3D=3D '\0') {
> +			holes++;
> +			continue;
> +		}
> +
> +		info->id =3D id;
> +		count++;
> +
> +		if (TEGRA_BPMP_DUMP_CLOCK_INFO)
> +			tegra_bpmp_clk_info_dump(bpmp, KERN_DEBUG, info);
> +	}
> +
> +	dev_dbg(bpmp->dev, "holes: %u\n", holes);
> +	*clocksp =3D clocks;
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
> +	for (i =3D 0; i < num_clocks; i++)
> +		if (clocks[i].id =3D=3D id)
> +			return &clocks[i];
> +
> +	return NULL;
> +}
> +
> +static struct tegra_bpmp_clk *
> +tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
> +			const struct tegra_bpmp_clk_info *info,
> +			const struct tegra_bpmp_clk_info *clocks,
> +			unsigned int num_clocks)
> +{
> +	struct tegra_bpmp_clk *clk;
> +	struct clk_init_data init;
> +	const char **parents;
> +	unsigned int i;
> +	int err;
> +
> +	clk =3D devm_kzalloc(bpmp->dev, sizeof(*clk), GFP_KERNEL);
> +	if (!clk)
> +		return ERR_PTR(-ENOMEM);
> +
> +	clk->id =3D info->id;
> +	clk->bpmp =3D bpmp;
> +
> +	clk->parents =3D devm_kcalloc(bpmp->dev, info->num_parents,
> +				    sizeof(*clk->parents), GFP_KERNEL);
> +	if (!clk->parents)
> +		return ERR_PTR(-ENOMEM);
> +
> +	clk->num_parents =3D info->num_parents;
> +
> +	/* hardware clock initialization */
> +	memset(&init, 0, sizeof(init));
> +	init.name =3D info->name;
> +	clk->hw.init =3D &init;
> +
> +	if (info->flags & TEGRA_BPMP_CLK_HAS_MUX) {
> +		if (info->flags & TEGRA_BPMP_CLK_HAS_SET_RATE)
> +			init.ops =3D &tegra_bpmp_clk_mux_rate_ops;
> +		else
> +			init.ops =3D &tegra_bpmp_clk_mux_ops;
> +	} else {
> +		if (info->flags & TEGRA_BPMP_CLK_HAS_SET_RATE)
> +			init.ops =3D &tegra_bpmp_clk_rate_ops;
> +		else
> +			init.ops =3D &tegra_bpmp_clk_gate_ops;
> +	}
> +
> +	init.num_parents =3D info->num_parents;
> +
> +	parents =3D kcalloc(info->num_parents, sizeof(*parents), GFP_KERNEL);
> +	if (!parents)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i =3D 0; i < info->num_parents; i++) {
> +		const struct tegra_bpmp_clk_info *parent;
> +
> +		/* keep a private copy of the ID to parent index map */
> +		clk->parents[i] =3D info->parents[i];
> +
> +		parent =3D tegra_bpmp_clk_find(clocks, num_clocks,
> +					     info->parents[i]);
> +		if (!parent) {
> +			dev_err(bpmp->dev, "no parent %u found for %u\n",
> +				info->parents[i], info->id);
> +			continue;
> +		}
> +
> +		parents[i] =3D parent->name;
> +	}
> +
> +	init.parent_names =3D parents;
> +
> +	err =3D devm_clk_hw_register(bpmp->dev, &clk->hw);
> +
> +	kfree(parents);
> +
> +	if (err < 0)
> +		return ERR_PTR(err);
> +
> +	return clk;
> +}
> +
> +static int tegra_bpmp_register_clocks(struct tegra_bpmp *bpmp,
> +				      struct tegra_bpmp_clk_info *infos,
> +				      unsigned int count)
> +{
> +	struct tegra_bpmp_clk *clk;
> +	unsigned int i;
> +
> +	bpmp->num_clocks =3D count;
> +
> +	bpmp->clocks =3D devm_kcalloc(bpmp->dev, count, sizeof(clk), GFP_KERNEL=
);
> +	if (!bpmp->clocks)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < count; i++) {
> +		struct tegra_bpmp_clk_info *info =3D &infos[i];
> +
> +		clk =3D tegra_bpmp_clk_register(bpmp, info, infos, count);
> +		if (IS_ERR(clk)) {
> +			dev_err(bpmp->dev,
> +				"failed to register clock %u (%s): %ld\n",
> +				info->id, info->name, PTR_ERR(clk));
> +			continue;
> +		}
> +
> +		bpmp->clocks[i] =3D clk;
> +	}
> +
> +	return 0;
> +}
> +
> +static void tegra_bpmp_unregister_clocks(struct tegra_bpmp *bpmp)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < bpmp->num_clocks; i++)
> +		clk_hw_unregister(&bpmp->clocks[i]->hw);
> +}
> +
> +static struct clk_hw *tegra_bpmp_clk_of_xlate(struct of_phandle_args *cl=
kspec,
> +					      void *data)
> +{
> +	unsigned int id =3D clkspec->args[0], i;
> +	struct tegra_bpmp *bpmp =3D data;
> +
> +	for (i =3D 0; i < bpmp->num_clocks; i++)
> +		if (bpmp->clocks[i]->id =3D=3D id)
> +			return &bpmp->clocks[i]->hw;
> +
> +	return NULL;
> +}
> +
> +int tegra_bpmp_init_clocks(struct tegra_bpmp *bpmp)
> +{
> +	struct tegra_bpmp_clk_info *clocks;
> +	unsigned int count;
> +	int err;
> +
> +	err =3D tegra_bpmp_probe_clocks(bpmp, &clocks);
> +	if (err < 0)
> +		return err;
> +
> +	count =3D err;
> +
> +	dev_dbg(bpmp->dev, "%u clocks probed\n", count);
> +
> +	err =3D tegra_bpmp_register_clocks(bpmp, clocks, count);
> +	if (err < 0)
> +		goto free;
> +
> +	err =3D of_clk_add_hw_provider(bpmp->dev->of_node,
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
> --=20
> 2.10.2
>=20

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliIVpUACgkQ3SOs138+
s6H8AA/9FhgW3y0fX0E2x10cGOiB2jizudYCgaBW/SM8PQztvtxkRB6PijB+n1mI
B310XzX88kWPmoPJLchSo6uFzmUl71fJGdMCKfJaLXoL1uqSKuQZ0XYnNf2/23lu
2hmuak1uOc0foBSUn4fEU1Jm2jmdG60BfeoJsFPKOY3yWe+wQBZgkbU+K8L+wjBK
O1bdeYdmm7RXoNbL79KgtlfU2h3SpKDXDWpHn5orGCrSINvT8Daa4yD8iXC4Ry2W
Es20AHxTa2Erio+NFDXWAk6OdqdsZyOX2SNBbGurs7MTyBaZ+x7WPaq8P44vYjII
AD4Orj6AJupnB+4eEiBg3UFYA34L7tK1eLB+CqV2X8Gz6dIMxEhgscGfHm8heMh9
IJRHs/UeGtegBJsmuDJED48do9ZdMHxW8mILJ5VgsgQYf/VFmk6QrabPaj+eU7wZ
tUto/KN3aosyTTj29yi4X3ZW+CFp6KYxCk4ks1A6/7W3ZyNfUwtmx5zDqzSvhcD0
1F6pW+OOOpUKpk+CMKl4iVkjcDqMZi5QvdUtVlN7eRtuCjUgpQmfXWtoF/Xio/Ih
guaGjy0q1CEG8S9UXQ1iMSvpmU58jL9ELs61dI8MVhOSe9sPua1T8ofqTn5Qqhyt
uQUxbkIfJ8I/8PH8wkZGJUY+vOpVGP3ClV8CA8ZQgZc8heyVSF8=
=KF6S
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--
