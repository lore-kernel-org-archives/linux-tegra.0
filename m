From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/8] memory: tegra: Add Tegra210 EMC clock driver
Date: Wed, 3 Apr 2019 13:34:26 +0200
Message-ID: <20190403113426.GH5238@ulmo>
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-4-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3551796741483993178=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190325074523.26456-4-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============3551796741483993178==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zhtSGe8h3+lMyY1M"
Content-Disposition: inline


--zhtSGe8h3+lMyY1M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2019 at 03:45:18PM +0800, Joseph Lo wrote:
> This is the initial patch for Tegra210 EMC clock driver, which doesn't
> include the support code and detail sequence for clock scaling yet.
>=20
> The driver is designed to support LPDDR4 SDRAMs. Because of the LPDDR4
> devices need to do initial time training before it can be used, the
> firmware will help to do that at early boot stage. The trained table for
> the rates that we will support in the kernel will be merged to the
> kernel DTB. So the driver can get the trained table for clock scaling
> support.
>=20
> For the higher rate support (above 800MHz), the periodic training is
> needed for the timing compensation. So basically, two methodologies for
> clock scaling support, one is following the clock changing sequence to
> update the EMC table to EMC registers and another is if the rate needs
> periodic training, then we will start a timer to do that periodically
> until it leaves the rate that doesn't need that.
>=20
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>=20
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  drivers/memory/tegra/Kconfig             |   10 +
>  drivers/memory/tegra/Makefile            |    1 +
>  drivers/memory/tegra/tegra210-dt-parse.c |  340 +++++++
>  drivers/memory/tegra/tegra210-emc-reg.h  | 1083 ++++++++++++++++++++++
>  drivers/memory/tegra/tegra210-emc.c      |  886 ++++++++++++++++++
>  5 files changed, 2320 insertions(+)
>  create mode 100644 drivers/memory/tegra/tegra210-dt-parse.c
>  create mode 100644 drivers/memory/tegra/tegra210-emc-reg.h
>  create mode 100644 drivers/memory/tegra/tegra210-emc.c
>=20
> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
> index 34e0b70f5c5f..614e9b370183 100644
> --- a/drivers/memory/tegra/Kconfig
> +++ b/drivers/memory/tegra/Kconfig
> @@ -25,3 +25,13 @@ config TEGRA124_EMC
>  	  Tegra124 chips. The EMC controls the external DRAM on the board.
>  	  This driver is required to change memory timings / clock rate for
>  	  external memory.
> +
> +config TEGRA210_EMC
> +	bool "NVIDIA Tegra210 External Memory Controller driver"
> +	default y
> +	depends on TEGRA_MC && ARCH_TEGRA_210_SOC
> +	help
> +	  This driver is for the External Memory Controller (EMC) found on
> +	  Tegra210 chips. The EMC controls the external DRAM on the board.
> +	  This driver is required to change memory timings / clock rate for
> +	  external memory.
> diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
> index 3971a6b7c487..36a835620bbd 100644
> --- a/drivers/memory/tegra/Makefile
> +++ b/drivers/memory/tegra/Makefile
> @@ -12,4 +12,5 @@ obj-$(CONFIG_TEGRA_MC) +=3D tegra-mc.o
> =20
>  obj-$(CONFIG_TEGRA20_EMC)  +=3D tegra20-emc.o
>  obj-$(CONFIG_TEGRA124_EMC) +=3D tegra124-emc.o
> +obj-$(CONFIG_TEGRA210_EMC) +=3D tegra210-emc.o tegra210-dt-parse.o
>  obj-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D tegra186.o
> diff --git a/drivers/memory/tegra/tegra210-dt-parse.c b/drivers/memory/te=
gra/tegra210-dt-parse.c
> new file mode 100644
> index 000000000000..6a3a3a28ac64
> --- /dev/null
> +++ b/drivers/memory/tegra/tegra210-dt-parse.c
> @@ -0,0 +1,340 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2013-2019, NVIDIA CORPORATION.  All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <soc/tegra/fuse.h>
> +
> +#include "tegra210-emc-reg.h"
> +
> +static struct device_node *tegra_emc_ramcode_devnode(
> +	struct device_node *np)

This is weirdly wrapped. Typically if it doesn't all fit on one line
you'd break after the return type, like so:

    static struct device_node *tegra_emc_ramcode_devnode(struct device_node=
 *np)

That said, the above does seem to fit on a single line, so there'n no
reason to wrap at all. You could still try to make it a little shorter
by using the _node suffix instead of _devnode.

> +{
> +	struct device_node *iter;
> +	u32 reg;

I think this is confusingly named. This makes it sound like you're going
to store a register offset in it. "value" would be be more appropriate
here, I think.

> +
> +	for_each_child_of_node(np, iter) {
> +		if (of_property_read_u32(iter, "nvidia,ram-code", &reg))
> +			continue;
> +		if (reg =3D=3D tegra_read_ram_code())

Looks like there are quite a few places where you read the RAM code.
Perhaps it'd be better to cache that in ->probe() and pass it to this
function so we avoid rereading that register over and over again.

Maybe also make it explicit in the name that this looks up the node
corresponding to the RAM code:

    static struct device_node *
    tegra_emc_find_ramcode_node(struct device_node *np, u32 ramcode)

?

> +			return of_node_get(iter);

I think this is wrong. of_get_next_child() (via for_each_child_of_node)
already takes a reference to the child node.

> +	}
> +
> +	return NULL;
> +}
> +
> +static void *tegra_emc_dt_parse_pdata_comp(const char *emc_mode,

We know that this function returns struct emc_table *, why not use that
as the return type?

Also, you're not parsing "platform" data here, so I think the _pdata
suffix (and the _comp suffix for that matter) is somewhat misleading.
Why not just call this what it is: tegra_emc_dt_parse_tables()?

Also, emc_mode seems to be unused.

> +					   const char *comp,
> +					   void *pdata,

This seems to be unused.

> +					   struct device_node *tnp,
> +					   struct platform_device *pdev,

You seem to be only using this for log output, so may as well just make
it struct device *dev. Also, it's unusual to see this passed as the
fourth parameter. It's more typical to pass the object that you're
operating on as the first argument.

> +					   int num_tables, int *table_count)

num_tables and table_count can be unsigned int.

> +{
> +#define PNE_U32(node, entry, tbl_entry)					\
> +	do {								\
> +		int __ret__;						\
> +		u32 __tmp__;						\
> +									\
> +		__ret__ =3D of_property_read_u32((node), (entry), &__tmp__); \
> +		if (__ret__) {						\
> +			dev_err(&pdev->dev, "Failed to parse %s in %s: %d\n", \
> +				(entry), (node)->full_name, __ret__);	\
> +			continue;					\
> +		}							\
> +									\
> +		tables[i].tbl_entry =3D __tmp__;				\
> +	} while (0)
> +
> +#define PNE_U32_ARRAY(node, entry, tbl_entry, length)			\
> +	do {								\
> +		int __ret__;						\
> +									\
> +		__ret__ =3D of_property_read_u32_array((node), (entry),	\
> +						     (tbl_entry), (length)); \
> +		if (__ret__) {						\
> +			dev_err(&pdev->dev, "Failed to parse %s in %s: %d\n", \
> +				(entry), (node)->full_name, __ret__);	\
> +			continue;					\
> +		}							\
> +	} while (0)

You're going to be generating a lot of code here. Could we instead turn
this around and have a table that defines the entries and which fields
they will be read into and then just use a loop to iterate over that
table? That should reduce code size for only a slight increase of the
read-only data.

I think you wouldn't even have to special case fields vs. arrays in such
a setup. Instead you could just consider fields a single-element arrays,
which is what of_property_read_u32() does anyway.

Also, use %pOF to print the name of a device tree node.

> +
> +	int i =3D 0, ret =3D 0;

i can be unsigned.

> +	struct device_node *iter;
> +	struct emc_table *tables;
> +
> +	tables =3D devm_kzalloc(&pdev->dev, sizeof(*tables) * num_tables,
> +			      GFP_KERNEL);
> +
> +	if (!tables) {
> +		of_node_put(tnp);
> +		return tables;
> +	}
> +
> +	for_each_child_of_node(tnp, iter) {
> +		if (of_device_is_compatible(iter, comp)) {
> +			const char *source_name;
> +			const char *dvfs_ver;

The level of indentation is getting pretty high here. Perhaps split the
contents of the innermost loop into a separate function?

> +
> +			ret =3D of_property_read_string(iter, "nvidia,source",
> +						      &source_name);
> +			if (ret) {
> +				dev_err(&pdev->dev, "no source name in %s\n",
> +					iter->full_name);
> +				continue;
> +			}
> +			strlcpy(tables[i].clock_src, source_name,
> +				sizeof(tables[i].clock_src));
> +
> +			ret =3D of_property_read_string(iter,
> +						      "nvidia,dvfs-version",
> +						      &dvfs_ver);
> +			if (ret) {
> +				dev_err(&pdev->dev, "no dvfs version in %s\n",
> +					iter->full_name);
> +				continue;
> +			}
> +			strlcpy(tables[i].dvfs_ver, dvfs_ver,
> +				sizeof(tables[i].dvfs_ver));
> +
> +			PNE_U32(iter, "nvidia,revision", rev);
> +			PNE_U32(iter, "clock-frequency", rate);
> +			PNE_U32(iter, "nvidia,emc-min-mv", min_volt);
> +			PNE_U32(iter, "nvidia,gk20a-min-mv", gpu_min_volt);
> +			PNE_U32(iter, "nvidia,src-sel-reg", clk_src_emc);
> +			PNE_U32(iter, "nvidia,burst-regs-num", num_burst);
> +			PNE_U32(iter, "nvidia,emc-cfg-2", emc_cfg_2);
> +			PNE_U32(iter, "nvidia,emc-sel-dpd-ctrl",
> +				emc_sel_dpd_ctrl);
> +			PNE_U32(iter, "nvidia,emc-auto-cal-config",
> +				emc_auto_cal_config);
> +			PNE_U32(iter, "nvidia,emc-auto-cal-config2",
> +				emc_auto_cal_config2);
> +			PNE_U32(iter, "nvidia,emc-auto-cal-config3",
> +				emc_auto_cal_config3);
> +			PNE_U32(iter, "nvidia,emc-clock-latency-change",
> +				latency);
> +			PNE_U32_ARRAY(iter, "nvidia,emc-registers",
> +				      tables[i].burst_regs,
> +				      tables[i].num_burst);
> +
> +			PNE_U32(iter, "nvidia,needs-training", needs_training);
> +			PNE_U32(iter, "nvidia,trained", trained);
> +			if (tables[i].rev < 0x6)
> +				goto skip_periodic_training_params;
> +			PNE_U32(iter, "nvidia,periodic_training",
> +				periodic_training);
> +			PNE_U32(iter, "nvidia,trained_dram_clktree_c0d0u0",
> +				trained_dram_clktree_c0d0u0);
> +			PNE_U32(iter, "nvidia,trained_dram_clktree_c0d0u1",
> +				trained_dram_clktree_c0d0u1);
> +			PNE_U32(iter, "nvidia,trained_dram_clktree_c0d1u0",
> +				trained_dram_clktree_c0d1u0);
> +			PNE_U32(iter, "nvidia,trained_dram_clktree_c0d1u1",
> +				trained_dram_clktree_c0d1u1);
> +			PNE_U32(iter, "nvidia,trained_dram_clktree_c1d0u0",
> +				trained_dram_clktree_c1d0u0);
> +			PNE_U32(iter, "nvidia,trained_dram_clktree_c1d0u1",
> +				trained_dram_clktree_c1d0u1);
> +			PNE_U32(iter, "nvidia,trained_dram_clktree_c1d1u0",
> +				trained_dram_clktree_c1d1u0);
> +			PNE_U32(iter, "nvidia,trained_dram_clktree_c1d1u1",
> +				trained_dram_clktree_c1d1u1);
> +			PNE_U32(iter, "nvidia,current_dram_clktree_c0d0u0",
> +				current_dram_clktree_c0d0u0);
> +			PNE_U32(iter, "nvidia,current_dram_clktree_c0d0u1",
> +				current_dram_clktree_c0d0u1);
> +			PNE_U32(iter, "nvidia,current_dram_clktree_c0d1u0",
> +				current_dram_clktree_c0d1u0);
> +			PNE_U32(iter, "nvidia,current_dram_clktree_c0d1u1",
> +				current_dram_clktree_c0d1u1);
> +			PNE_U32(iter, "nvidia,current_dram_clktree_c1d0u0",
> +				current_dram_clktree_c1d0u0);
> +			PNE_U32(iter, "nvidia,current_dram_clktree_c1d0u1",
> +				current_dram_clktree_c1d0u1);
> +			PNE_U32(iter, "nvidia,current_dram_clktree_c1d1u0",
> +				current_dram_clktree_c1d1u0);
> +			PNE_U32(iter, "nvidia,current_dram_clktree_c1d1u1",
> +				current_dram_clktree_c1d1u1);
> +			PNE_U32(iter, "nvidia,run_clocks", run_clocks);
> +			PNE_U32(iter, "nvidia,tree_margin", tree_margin);
> +
> +skip_periodic_training_params:
> +			PNE_U32(iter, "nvidia,burst-regs-per-ch-num",
> +				num_burst_per_ch);
> +			PNE_U32(iter, "nvidia,trim-regs-num", num_trim);
> +			PNE_U32(iter, "nvidia,trim-regs-per-ch-num",
> +				num_trim_per_ch);
> +			PNE_U32(iter, "nvidia,burst-mc-regs-num",
> +				num_mc_regs);
> +			PNE_U32(iter, "nvidia,la-scale-regs-num",
> +				num_up_down);
> +			PNE_U32(iter, "nvidia,vref-regs-num", vref_num);
> +			PNE_U32(iter, "nvidia,dram-timing-regs-num",
> +				dram_timing_num);
> +			PNE_U32(iter, "nvidia,min-mrs-wait", min_mrs_wait);
> +			PNE_U32(iter, "nvidia,emc-mrw", emc_mrw);
> +			PNE_U32(iter, "nvidia,emc-mrw2", emc_mrw2);
> +			PNE_U32(iter, "nvidia,emc-mrw3", emc_mrw3);
> +			PNE_U32(iter, "nvidia,emc-mrw4", emc_mrw4);
> +			PNE_U32(iter, "nvidia,emc-mrw9", emc_mrw9);
> +			PNE_U32(iter, "nvidia,emc-mrs", emc_mrs);
> +			PNE_U32(iter, "nvidia,emc-emrs", emc_emrs);
> +			PNE_U32(iter, "nvidia,emc-emrs2", emc_emrs2);
> +			PNE_U32(iter, "nvidia,emc-auto-cal-config4",
> +				emc_auto_cal_config4);
> +			PNE_U32(iter, "nvidia,emc-auto-cal-config5",
> +				emc_auto_cal_config5);
> +			PNE_U32(iter, "nvidia,emc-auto-cal-config6",
> +				emc_auto_cal_config6);
> +			PNE_U32(iter, "nvidia,emc-auto-cal-config7",
> +				emc_auto_cal_config7);
> +			PNE_U32(iter, "nvidia,emc-auto-cal-config8",
> +				emc_auto_cal_config8);
> +			PNE_U32(iter, "nvidia,emc-fdpd-ctrl-cmd-no-ramp",
> +				emc_fdpd_ctrl_cmd_no_ramp);
> +			PNE_U32(iter, "nvidia,dll-clk-src", dll_clk_src);
> +			PNE_U32(iter, "nvidia,clk-out-enb-x-0-clk-enb-emc-dll",
> +				clk_out_enb_x_0_clk_enb_emc_dll);
> +
> +			if (tables[i].rev >=3D 0x7)
> +				PNE_U32_ARRAY(iter, "nvidia,ptfv",
> +					      tables[i].ptfv_list,
> +					      sizeof(tables[i].ptfv_list)
> +						     / sizeof(u32));
> +
> +			PNE_U32_ARRAY(iter, "nvidia,emc-burst-regs-per-ch",
> +				      tables[i].burst_reg_per_ch,
> +				      tables[i].num_burst_per_ch);
> +			PNE_U32_ARRAY(iter, "nvidia,emc-shadow-regs-ca-train",
> +				      tables[i].shadow_regs_ca_train,
> +				      tables[i].num_burst);
> +			PNE_U32_ARRAY(iter, "nvidia,emc-shadow-regs-quse-train",
> +				      tables[i].shadow_regs_quse_train,
> +				      tables[i].num_burst);
> +			PNE_U32_ARRAY(iter, "nvidia,emc-shadow-regs-rdwr-train",
> +				      tables[i].shadow_regs_rdwr_train,
> +				      tables[i].num_burst);
> +			PNE_U32_ARRAY(iter, "nvidia,emc-trim-regs",
> +				      tables[i].trim_regs,
> +				      tables[i].num_trim);
> +			PNE_U32_ARRAY(iter, "nvidia,emc-trim-regs-per-ch",
> +				      tables[i].trim_perch_regs,
> +				      tables[i].num_trim_per_ch);
> +			PNE_U32_ARRAY(iter, "nvidia,emc-vref-regs",
> +				      tables[i].vref_perch_regs,
> +				      tables[i].vref_num);
> +			PNE_U32_ARRAY(iter, "nvidia,emc-dram-timing-regs",
> +				      tables[i].dram_timings,
> +				      tables[i].dram_timing_num);
> +			PNE_U32_ARRAY(iter, "nvidia,emc-burst-mc-regs",
> +				      tables[i].burst_mc_regs,
> +				      tables[i].num_mc_regs);
> +			PNE_U32_ARRAY(iter, "nvidia,emc-la-scale-regs",
> +				      tables[i].la_scale_regs,
> +				      tables[i].num_up_down);
> +			i++;
> +		}
> +	}
> +
> +	*table_count =3D i;
> +
> +	return tables;
> +}
> +
> +static const struct of_device_id emc_table_match[] =3D {
> +	{
> +		.compatible =3D "nvidia,tegra210-emc-table",
> +		.data =3D "nvidia,tegra210-emc-table-derated",
> +	},
> +	{
> +		.compatible =3D "nvidia,tegra21-emc-table",
> +		.data =3D "nvidia,tegra21-emc-table-derated",
> +	},
> +	{ },
> +};
> +
> +int tegra_emc_dt_parse_pdata(struct platform_device *pdev,
> +			     struct emc_table **tables,
> +			     struct emc_table **derated_tables,
> +			     int *num_entries)

You don't seem to be parsing any "platform data" here, so I'd just leave
out the _pdata suffix.

Also: unsigned int *num_entries

> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct device_node *tnp, *iter;
> +	int num_tables, table_count;
> +	u32 tegra_bct_strapping;
> +	const char *emc_mode =3D "nvidia,emc-mode-0";
> +	struct tegra21_emc_pdata *pdata =3D NULL;
> +	const char *comp =3D NULL;
> +	const char *comp_derated =3D NULL;
> +
> +	if (!np) {
> +		dev_err(&pdev->dev,
> +			"Unable to find external-memory-controller node\n");
> +		return -ENODEV;
> +	}

I think you can remove this check. This driver is OF-only, so by
definition the device tree node must exist.

> +
> +	tegra_bct_strapping =3D tegra_read_ram_code();
> +
> +	if (of_find_property(np, "nvidia,use-ram-code", NULL)) {
> +		tnp =3D tegra_emc_ramcode_devnode(np);
> +
> +		if (!tnp) {
> +			dev_warn(&pdev->dev,
> +				 "can't find emc table for ram-code 0x%02x\n",
> +				 tegra_bct_strapping);
> +			return -ENODEV;
> +		}
> +	} else
> +		tnp =3D of_node_get(np);
> +
> +	num_tables =3D 0;
> +	for_each_child_of_node(tnp, iter) {
> +		if (!comp) {
> +			const struct of_device_id *m =3D
> +				of_match_node(emc_table_match, iter);
> +			if (m) {
> +				comp =3D m->compatible;
> +				comp_derated =3D m->data;
> +				num_tables++;
> +			}
> +			continue;
> +		}
> +		if (of_device_is_compatible(iter, comp))
> +			num_tables++;
> +	}

This seems to require that all tables be of the same type. Should it be
considered a DT error if that's not the case? Should we warn if that's
encountered in a DT?

> +
> +	if (!num_tables) {
> +		*tables =3D NULL;
> +		goto out;
> +	}
> +
> +	*tables =3D tegra_emc_dt_parse_pdata_comp(emc_mode, comp, pdata, tnp,
> +						pdev, num_tables, &table_count);
> +	*num_entries =3D table_count;
> +
> +	/* populate the derated tables */
> +	num_tables =3D 0;
> +	for_each_child_of_node(tnp, iter) {
> +		if (of_device_is_compatible(iter, comp_derated))
> +			num_tables++;
> +	}
> +
> +	if (!num_tables) {
> +		*derated_tables =3D NULL;
> +		goto out;
> +	}
> +
> +	*derated_tables =3D tegra_emc_dt_parse_pdata_comp(emc_mode,
> +							comp_derated,
> +							pdata, tnp, pdev,
> +							num_tables,
> +							&table_count);
> +
> +out:
> +	of_node_put(tnp);
> +	return 0;
> +}
> diff --git a/drivers/memory/tegra/tegra210-emc-reg.h b/drivers/memory/teg=
ra/tegra210-emc-reg.h
> new file mode 100644
> index 000000000000..84fcc85f3b6d
> --- /dev/null
> +++ b/drivers/memory/tegra/tegra210-emc-reg.h
> @@ -0,0 +1,1083 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2015-2019, NVIDIA CORPORATION.  All rights reserved.
> + */
> +
> +#ifndef _TEGRA210_EMC_REG_H
> +#define _TEGRA210_EMC_REG_H
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +
> +#include "mc.h"
> +
[...]
> +
> +enum {
> +	REG_MC,
> +	REG_EMC,
> +	REG_EMC0,
> +	REG_EMC1,
> +};
> +
> +#define BURST_REGS_PER_CH_LIST						\
> +{									\
> +	DEFINE_REG(REG_EMC0, EMC_MRW10),				\
> +	DEFINE_REG(REG_EMC1, EMC_MRW10),				\
> +	DEFINE_REG(REG_EMC0, EMC_MRW11),				\
> +	DEFINE_REG(REG_EMC1, EMC_MRW11),				\
> +	DEFINE_REG(REG_EMC0, EMC_MRW12),				\
> +	DEFINE_REG(REG_EMC1, EMC_MRW12),				\
> +	DEFINE_REG(REG_EMC0, EMC_MRW13),				\
> +	DEFINE_REG(REG_EMC1, EMC_MRW13),				\
> +}

I'm not at all a fan of this type of list definition where the content
depends on how the DEFINE_REG macro is defined at the time where the
list macro is used.

It also seems like you're later on generating a couple of different
tables based on these lists and using different definitions of
DEFINE_REG to construct them.

Why can't we have a single table that contains everything? That's a lot
easier to maintain and the code becomes a lot easier to follow.

> +#define DEFINE_REG(type, reg)	reg##_INDEX
> +enum BURST_REGS_LIST;
> +enum TRIM_REGS_LIST;
> +enum BURST_MC_REGS_LIST;
> +enum BURST_UP_DOWN_REGS_LIST;
> +#undef DEFINE_REG
> +
> +#define DEFINE_REG(type, reg)	type##_##reg##_INDEX
> +enum BURST_REGS_PER_CH_LIST;
> +enum TRIM_REGS_PER_CH_LIST;
> +enum VREF_REGS_PER_CH_LIST;
> +#undef DEFINE_REG
> +
> +enum {
> +	DRAM_TYPE_DDR3   =3D 0,

Use consistent padding. Single space around '=3D' will do.

> +	DRAM_TYPE_LPDDR4 =3D 1,
> +	DRAM_TYPE_LPDDR2 =3D 2,
> +	DRAM_TYPE_DDR2 =3D 3,
> +};
> +
> +struct emc_table {

This structure doesn't really have anything to do with registers, so
perhaps move this to tegra210-emc.c?

> +	u32 rev;
> +	char dvfs_ver[60];

Could this just be a const char * pointing to the device tree property?

> +	u32 rate;

Clock rates are usually stored as unsigned long.

> +	u32 min_volt;
> +	u32 gpu_min_volt;

Maybe make these unsigned int, to match the type used for regulator
voltages?

> +	char clock_src[32];

Same comment as for dvfs_ver.

> +	u32 clk_src_emc;

As I mentioned elsewhere, I think it'd be nicer if we could split this
up into individual fields so that the value can be sanity checked.

> +	u32 needs_training;

bool?

> +	u32 training_parttern;

s/parttern/pattern/

> +	u32 trained;

bool?

> +	u32 periodic_training;

bool?

> +	u32 trained_dram_clktree_c0d0u0;
> +	u32 trained_dram_clktree_c0d0u1;
> +	u32 trained_dram_clktree_c0d1u0;
> +	u32 trained_dram_clktree_c0d1u1;
> +	u32 trained_dram_clktree_c1d0u0;
> +	u32 trained_dram_clktree_c1d0u1;
> +	u32 trained_dram_clktree_c1d1u0;
> +	u32 trained_dram_clktree_c1d1u1;
> +	u32 current_dram_clktree_c0d0u0;
> +	u32 current_dram_clktree_c0d0u1;
> +	u32 current_dram_clktree_c0d1u0;
> +	u32 current_dram_clktree_c0d1u1;
> +	u32 current_dram_clktree_c1d0u0;
> +	u32 current_dram_clktree_c1d0u1;
> +	u32 current_dram_clktree_c1d1u0;
> +	u32 current_dram_clktree_c1d1u1;

There's definitely a pattern here. Could these be arrays?

> +	u32 run_clocks;
> +	u32 tree_margin;
> +
> +	u32 num_burst;
> +	u32 num_burst_per_ch;
> +	u32 num_trim;
> +	u32 num_trim_per_ch;
> +	u32 num_mc_regs;
> +	u32 num_up_down;
> +	u32 vref_num;
> +	u32 training_mod_num;
> +	u32 dram_timing_num;
> +
> +	u32  ptfv_list[12];

Gratuitous space.

> +
> +	u32 burst_regs[221];
> +	u32 burst_reg_per_ch[8];
> +	u32 shadow_regs_ca_train[221];
> +	u32 shadow_regs_quse_train[221];
> +	u32 shadow_regs_rdwr_train[221];
> +
> +	u32 trim_regs[138];
> +	u32 trim_perch_regs[10];
> +
> +	u32 vref_perch_regs[4];
> +
> +	u32 dram_timings[5];
> +	u32 training_mod_regs[20];
> +	u32 save_restore_mod_regs[12];
> +	u32 burst_mc_regs[33];
> +	u32 la_scale_regs[24];

Looks like these are all fixed in length. Why do we ened the
corresponding num_* fields? Same goes for the properties in DT. If they
are always of a fixed length, then let's document that in the bindings
and sanity check it when parsing the tables.

> +
> +	u32 min_mrs_wait;
> +	u32 emc_mrw;
> +	u32 emc_mrw2;
> +	u32 emc_mrw3;
> +	u32 emc_mrw4;
> +	u32 emc_mrw9;
> +	u32 emc_mrs;
> +	u32 emc_emrs;
> +	u32 emc_emrs2;
> +	u32 emc_auto_cal_config;
> +	u32 emc_auto_cal_config2;
> +	u32 emc_auto_cal_config3;
> +	u32 emc_auto_cal_config4;
> +	u32 emc_auto_cal_config5;
> +	u32 emc_auto_cal_config6;
> +	u32 emc_auto_cal_config7;
> +	u32 emc_auto_cal_config8;
> +	u32 emc_cfg_2;
> +	u32 emc_sel_dpd_ctrl;
> +	u32 emc_fdpd_ctrl_cmd_no_ramp;
> +	u32 dll_clk_src;
> +	u32 clk_out_enb_x_0_clk_enb_emc_dll;
> +	u32 latency;
> +};
> +
> +struct tegra_emc {

This is also not related to registers, so maybe move it out into
tegra210-emc.c?

> +	struct clk_hw hw;
> +	struct clk *emc_clk;
> +	struct device *dev;
> +
> +	struct tegra_mc *mc;
> +
> +	void __iomem *emc_base;
> +	void __iomem *emc0_base;
> +	void __iomem *emc1_base;

Should this be an array? Seems like that could make it easier to write
the tables to these registers later on.

> +
> +	struct emc_table *current_timing;
> +	struct emc_table *next_timing;
> +	struct emc_table start_timing;

Why is start_timing not a pointer? It looks to me like that's basically
a copy of emc_table[0], so why not just point it at that?

> +
> +	struct emc_table *emc_table;
> +	struct emc_table *emc_table_normal;
> +	struct emc_table *emc_table_derated;

Seems like emc_table will always point at emc_table_normal, so why have
a second copy?

> +
> +	unsigned int emc_table_size;

Is this the number of entries in emc_table?

> +
> +	int dram_dev_num;

What is this?

> +	u32 dram_type;

Should this perhaps be an enum? All in all, I think it'd be good to add
some kerneldoc to this structure explaining what these fields are.

> +	u32 ram_code;
> +	u32 clk_setting;
> +};
> +#define to_emc(_hw) container_of(_hw, struct tegra_emc, hw)

I prefer static inline functions for this. Error reporting is better for
those.

> +
> +struct supported_sequence {
> +	u8     table_rev;
> +	void (*set_clock)(struct tegra_emc *emc, u32 clksrc);
> +	u32  (*periodic_compensation)(struct tegra_emc *emc);
> +	char  *seq_rev;

Use consistent padding. Either pad everything to the same column, or,
better yet, use a single space for padding.

> +};

Looks like this is mostly unused. Is this something that's more widely
used in a later patch? It could be useful to move this to that later
patch so that it doesn't look out of place.

> +
> +int tegra_emc_dt_parse_pdata(struct platform_device *pdev,
> +			     struct emc_table **tables,
> +			     struct emc_table **derated_tables,
> +			     int *num_entries);
> +
> +#endif
> diff --git a/drivers/memory/tegra/tegra210-emc.c b/drivers/memory/tegra/t=
egra210-emc.c
> new file mode 100644
> index 000000000000..0c20bcd0e6de
> --- /dev/null
> +++ b/drivers/memory/tegra/tegra210-emc.c
> @@ -0,0 +1,886 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2015-2019, NVIDIA CORPORATION.  All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk/tegra.h>
> +#include <linux/clk-provider.h>
> +#include <linux/debugfs.h>
> +#include <linux/delay.h>
> +#include <linux/kernel.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <soc/tegra/fuse.h>
> +#include <soc/tegra/mc.h>
> +
> +#include "mc.h"
> +#include "tegra210-emc-reg.h"
> +
> +#define TEGRA_EMC_TABLE_MAX_SIZE		16

Looks like this is only used for the statistics, so the _TABLE in there
is somewhat confusing. Perhaps make this TEGRA_EMC_MAX_STATS? Or
TEGRA_EMC_MAX_FREQS?

> +#define TEGRA210_EMC_SUSPEND_RATE		204000000

What exactly does this mean? Is this the lowest frequency that is
supported? Or just some default value that was determined to be a good
frequency for EMC during suspend?

What if this doesn't actually feature is the set of supported
frequencies by one set of tables?

> +
> +enum TEGRA_EMC_SOURCE {

enum name should be all lowercase. Or just drop it altogether if you
don't use the name anywhere anyway.

> +	TEGRA_EMC_SRC_PLLM,
> +	TEGRA_EMC_SRC_PLLC,
> +	TEGRA_EMC_SRC_PLLP,
> +	TEGRA_EMC_SRC_CLKM,
> +	TEGRA_EMC_SRC_PLLM_UD,
> +	TEGRA_EMC_SRC_PLLMB_UD,
> +	TEGRA_EMC_SRC_PLLMB,
> +	TEGRA_EMC_SRC_PLLP_UD,
> +	TEGRA_EMC_SRC_COUNT,
> +};
> +
> +struct emc_sel {
> +	struct clk *input;
> +	u32 value;
> +	unsigned long input_rate;
> +
> +	struct clk *input_b;
> +	u32 value_b;
> +	unsigned long input_rate_b;
> +};

What's the difference between the two sets of values? Seems like they
could maybe form an array? Or perhaps make each set a structure and
instantiate it twice. I find that suffixes are a poor way of describing
structure.

> +
> +struct emc_stats {
> +	u64 time_at_clock[TEGRA_EMC_TABLE_MAX_SIZE];
> +	int last_sel;
> +	u64 last_update;
> +	u64 clkchange_count;
> +	spinlock_t spinlock;
> +};
> +
> +static struct emc_sel *emc_clk_sel;
> +static struct clk *emc_src[TEGRA_EMC_SRC_COUNT];
> +static const char *emc_src_names[TEGRA_EMC_SRC_COUNT] =3D {
> +	[TEGRA_EMC_SRC_PLLM] =3D "pll_m",
> +	[TEGRA_EMC_SRC_PLLC] =3D "pll_c",
> +	[TEGRA_EMC_SRC_PLLP] =3D "pll_p",
> +	[TEGRA_EMC_SRC_CLKM] =3D "clk_m",
> +	[TEGRA_EMC_SRC_PLLM_UD] =3D "pll_m_ud",
> +	[TEGRA_EMC_SRC_PLLMB_UD] =3D "pll_mb_ud",
> +	[TEGRA_EMC_SRC_PLLMB] =3D "pll_mb",
> +	[TEGRA_EMC_SRC_PLLP_UD] =3D "pll_p_ud",
> +};
> +static struct emc_stats emc_stats;
> +static struct supported_sequence supported_seqs[] =3D {
> +	{
> +		0,
> +		NULL,
> +		NULL,
> +		NULL
> +	}
> +};

I haven't gone through the later patches, but is this going to be filled
with data? If it does, it seems to me like the data would end up being
static, in which case this should be const.

> +static struct supported_sequence *seq;

Some here.

> +static struct tegra_emc *tegra_emc;

It seems like you only need this in order to get at struct tegra_emc in
the emc_train() function below. If you move the emc_training_timer below
into struct tegra_emc, you should be able to use container_of() to get
at it and you can remove the global variable.

> +static DEFINE_SPINLOCK(emc_access_lock);
> +static ktime_t clkchange_time;
> +static int clkchange_delay =3D 100;
> +
> +static void emc_train(struct timer_list *tmr);
> +DEFINE_TIMER(emc_training_timer, emc_train);
> +static u32 timer_period_training =3D 100;

Why are these all global? Can they not be moved into struct tegra_emc?

> +#define DEFINE_REG(type, reg) (reg)
> +u32 burst_regs_per_ch_off[] =3D BURST_REGS_PER_CH_LIST;
> +u32 burst_regs_off[] =3D BURST_REGS_LIST;
> +u32 burst_mc_regs_off[] =3D BURST_MC_REGS_LIST;
> +u32 la_scale_regs_off[] =3D BURST_UP_DOWN_REGS_LIST;
> +u32 trim_regs_per_ch_off[] =3D TRIM_REGS_PER_CH_LIST;
> +u32 trim_regs_off[] =3D TRIM_REGS_LIST;
> +u32 vref_regs_per_ch_off[] =3D VREF_REGS_PER_CH_LIST;
> +#undef DEFINE_REG
> +
> +#define DEFINE_REG(type, reg) (type)
> +u32 burst_regs_per_ch_type[] =3D BURST_REGS_PER_CH_LIST;
> +u32 trim_regs_per_ch_type[] =3D TRIM_REGS_PER_CH_LIST;
> +u32 vref_regs_per_ch_type[] =3D VREF_REGS_PER_CH_LIST;
> +#undef DEFINE_REG

Should these all be static const? Like I said earlier, I'd prefer a
single table with all the values rather than splitting this up into
a large number of arrays.

> +
> +#ifdef CONFIG_PM_SLEEP
> +static bool emc_suspend;
> +static unsigned long emc_resume_rate;
> +#endif

Why are these global? Shouldn't they be part of struct tegra_emc?

> +
> +inline u32 emc_readl(struct tegra_emc *emc, unsigned long offset)

static, please.

> +{
> +	return readl(emc->emc_base + offset);
> +}
> +
> +inline u32 emc_readl_per_ch(struct tegra_emc *emc, int type,
> +			    unsigned long offset)
> +{
> +	u32 val =3D 0;
> +
> +	switch (type) {
> +	case REG_EMC:
> +	case REG_EMC0:
> +		val =3D readl(emc->emc_base + offset);

So if REG_EMC and REG_EMC0 are the same thing, why not define one in
terms of the other? Why use different enum values for them?

If they are the same, you could define emc_base as an array and use the
type as an index into that array and avoid the need for the complicated
switch here. Also, should "type" really be called "channel"?

> +		break;
> +	case REG_EMC1:
> +		val =3D readl(emc->emc1_base + offset);
> +		break;
> +	}
> +
> +	return val;
> +}
> +
> +static inline u32 emc_src_val(u32 val)
> +{
> +	return (val & EMC_CLK_EMC_2X_CLK_SRC_MASK) >>
> +		EMC_CLK_EMC_2X_CLK_SRC_SHIFT;
> +}
> +
> +static inline u32 emc_div_val(u32 val)
> +{
> +	return (val & EMC_CLK_EMC_2X_CLK_DIVISOR_MASK) >>
> +		EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT;
> +}

Seems like this is mostly similar to the macros defined in
include/linux/bitfield.h? Could those not be used here instead?

> +
> +static void emc_train(struct timer_list *tmr)
> +{
> +	unsigned long flags;
> +	struct tegra_emc *emc =3D tegra_emc;
> +
> +	if (!emc->current_timing)
> +		return;

It seems like this can never happen. Training happens as a result of the
EMC clock rate getting set and part of setting the EMC clock rate is to
set emc->current_timing to a valid table.

> +
> +	spin_lock_irqsave(&emc_access_lock, flags);
> +	if (seq->periodic_compensation)
> +		seq->periodic_compensation(emc);
> +	spin_unlock_irqrestore(&emc_access_lock, flags);
> +
> +	mod_timer(&emc_training_timer,
> +		  jiffies + msecs_to_jiffies(timer_period_training));
> +}
> +
> +static void emc_training_timer_start(void)
> +{
> +	mod_timer(&emc_training_timer,
> +		  jiffies + msecs_to_jiffies(timer_period_training));
> +}
> +
> +static void emc_training_timer_stop(void)
> +{
> +	del_timer(&emc_training_timer);

del_timer_sync()?

> +}
> +
> +static void emc_set_clock(struct tegra_emc *emc, u32 clksrc)
> +{
> +	seq->set_clock(emc, clksrc);
> +
> +	if (emc->next_timing->periodic_training)
> +		emc_training_timer_start();
> +	else
> +		emc_training_timer_stop();
> +}

Given that you only use emc_training_timer_{start,stop}() once, I think
you can fold them into the emc_set_clock() function.

> +
> +static inline void emc_get_timing(struct tegra_emc *emc,
> +				  struct emc_table *timing)
> +{
> +	int i, div;
> +	u32 val;
> +	unsigned long rate;
> +
> +	for (i =3D 0; i < timing->num_burst; i++) {
> +		if (burst_regs_off[i])
> +			timing->burst_regs[i] =3D emc_readl(emc,
> +							  burst_regs_off[i]);
> +		else
> +			timing->burst_regs[i] =3D 0;
> +	}
> +
> +	for (i =3D 0; i < timing->num_burst_per_ch; i++)
> +		timing->burst_reg_per_ch[i] =3D emc_readl_per_ch(emc,
> +			burst_regs_per_ch_type[i], burst_regs_per_ch_off[i]);
> +
> +	for (i =3D 0; i < timing->num_trim; i++)
> +		timing->trim_regs[i] =3D emc_readl(emc, trim_regs_off[i]);
> +
> +	for (i =3D 0; i < timing->num_trim_per_ch; i++)
> +		timing->trim_perch_regs[i] =3D emc_readl_per_ch(emc,
> +			trim_regs_per_ch_type[i], trim_regs_per_ch_off[i]);
> +
> +	for (i =3D 0; i < timing->vref_num; i++)
> +		timing->vref_perch_regs[i] =3D emc_readl_per_ch(emc,
> +			vref_regs_per_ch_type[i], vref_regs_per_ch_off[i]);
> +
> +	for (i =3D 0; i < timing->num_mc_regs; i++)
> +		timing->burst_mc_regs[i] =3D mc_readl(emc->mc,
> +						    burst_mc_regs_off[i]);
> +
> +	for (i =3D 0; i < timing->num_up_down; i++)
> +		timing->la_scale_regs[i] =3D mc_readl(emc->mc,
> +						    la_scale_regs_off[i]);
> +
> +	val =3D tegra210_clk_emc_get_setting();
> +	rate =3D clk_get_rate(emc_src[emc_src_val(val)]);

I thought we implemented the EMC clock as a CCF clock, in which case we
could just use clk_get_parent() to retrieve the parent clock, couldn't
we?

> +	div =3D emc_div_val(val);
> +	div +=3D 2;
> +	rate *=3D 2;
> +	rate +=3D div - 1;
> +	do_div(rate, div);
> +	timing->rate =3D rate / 1000;

And couldn't we implement a ->recalc_rate() callback to get at the rate?
Looks like we do already implement those, so perhaps I don't understand
how this is being used. Can you clarify?

> +}
> +
> +static void __emc_copy_table_params(struct emc_table *src,
> +				    struct emc_table *dst, int flags)

Flags are typically unsigned long.

> +{
> +	int i;

unsigned int

> +
> +	if (flags & EMC_COPY_TABLE_PARAM_PERIODIC_FIELDS) {
> +		dst->trained_dram_clktree_c0d0u0 =3D
> +			src->trained_dram_clktree_c0d0u0;
> +		dst->trained_dram_clktree_c0d0u1 =3D
> +			src->trained_dram_clktree_c0d0u1;
> +		dst->trained_dram_clktree_c0d1u0 =3D
> +			src->trained_dram_clktree_c0d1u0;
> +		dst->trained_dram_clktree_c0d1u1 =3D
> +			src->trained_dram_clktree_c0d1u1;
> +		dst->trained_dram_clktree_c1d0u0 =3D
> +			src->trained_dram_clktree_c1d0u0;
> +		dst->trained_dram_clktree_c1d0u1 =3D
> +			src->trained_dram_clktree_c1d0u1;
> +		dst->trained_dram_clktree_c1d1u0 =3D
> +			src->trained_dram_clktree_c1d1u0;
> +		dst->trained_dram_clktree_c1d1u1 =3D
> +			src->trained_dram_clktree_c1d1u1;
> +		dst->current_dram_clktree_c0d0u0 =3D
> +			src->current_dram_clktree_c0d0u0;
> +		dst->current_dram_clktree_c0d0u1 =3D
> +			src->current_dram_clktree_c0d0u1;
> +		dst->current_dram_clktree_c0d1u0 =3D
> +			src->current_dram_clktree_c0d1u0;
> +		dst->current_dram_clktree_c0d1u1 =3D
> +			src->current_dram_clktree_c0d1u1;
> +		dst->current_dram_clktree_c1d0u0 =3D
> +			src->current_dram_clktree_c1d0u0;
> +		dst->current_dram_clktree_c1d0u1 =3D
> +			src->current_dram_clktree_c1d0u1;
> +		dst->current_dram_clktree_c1d1u0 =3D
> +			src->current_dram_clktree_c1d1u0;
> +		dst->current_dram_clktree_c1d1u1 =3D
> +			src->current_dram_clktree_c1d1u1;
> +	}

Yeah, this definitely should be an array.

> +
> +	if (flags & EMC_COPY_TABLE_PARAM_TRIM_REGS) {
> +		for (i =3D 0; i < src->num_trim_per_ch; i++)
> +			dst->trim_perch_regs[i] =3D src->trim_perch_regs[i];
> +
> +		for (i =3D 0; i < src->num_trim; i++)
> +			dst->trim_regs[i] =3D src->trim_regs[i];
> +
> +		for (i =3D 0; i < src->num_burst_per_ch; i++)
> +			dst->burst_reg_per_ch[i] =3D src->burst_reg_per_ch[i];
> +
> +		dst->trained =3D src->trained;
> +	}
> +}
> +
> +static void emc_copy_table_params(struct emc_table *src,
> +				  struct emc_table *dst,
> +				  int table_size,

unsigned int

> +				  int flags)

unsigned long

> +{
> +	int i;

unsigned int

> +
> +	for (i =3D 0; i < table_size; i++)
> +		__emc_copy_table_params(&src[i], &dst[i], flags);
> +}
> +
> +static void emc_last_stats_update(int last_sel)

unsigned int last_sel

Maybe also pass in struct tegra_emc * here so that you can store the
stats in the EMC instance instead of having a global variable for it.

> +{
> +	unsigned long flags;
> +	u64 cur_jiffies =3D get_jiffies_64();
> +
> +	spin_lock_irqsave(&emc_stats.spinlock, flags);
> +
> +	if (emc_stats.last_sel < TEGRA_EMC_TABLE_MAX_SIZE)
> +		emc_stats.time_at_clock[emc_stats.last_sel] =3D
> +			emc_stats.time_at_clock[emc_stats.last_sel]
> +			+ (cur_jiffies - emc_stats.last_update);

Maybe use +=3D here?

> +
> +	emc_stats.last_update =3D cur_jiffies;
> +
> +	if (last_sel < TEGRA_EMC_TABLE_MAX_SIZE) {
> +		emc_stats.clkchange_count++;
> +		emc_stats.last_sel =3D last_sel;
> +	}
> +
> +	spin_unlock_irqrestore(&emc_stats.spinlock, flags);
> +}
> +
> +static int emc_table_lookup(struct tegra_emc *emc, unsigned long rate)
> +{
> +	int i;

unsigned int

> +
> +	for (i =3D 0; i < emc->emc_table_size; i++) {
> +		if (emc_clk_sel[i].input =3D=3D NULL)
> +			continue;
> +
> +		if (emc->emc_table[i].rate =3D=3D rate)
> +			return i;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static struct clk *emc_predict_parent(struct tegra_emc *emc,
> +				      unsigned long rate)
> +{
> +	struct clk *old_parent, *new_parent;
> +	unsigned long parent_rate;
> +	int idx;
> +
> +	idx =3D emc_table_lookup(emc, rate / 1000);
> +	if (idx < 0)
> +		return ERR_PTR(-EINVAL);

Propagate idx

> +
> +	parent_rate =3D emc_clk_sel[idx].input_rate * 1000;
> +	new_parent =3D emc_clk_sel[idx].input;
> +	old_parent =3D clk_get_parent(emc->emc_clk);
> +
> +	if (parent_rate =3D=3D clk_get_rate(old_parent))
> +		return old_parent;
> +
> +	if (clk_is_match(new_parent, old_parent))
> +		new_parent =3D emc_clk_sel[idx].input_b;
> +
> +	if (parent_rate !=3D clk_get_rate(new_parent))
> +		clk_set_rate(new_parent, parent_rate);
> +
> +	return new_parent;
> +}
> +
> +static int emc_set_rate(struct tegra_emc *emc, unsigned long rate)
> +{
> +	int i;
> +	unsigned long flags;
> +	s64 last_change_delay;
> +	struct clk *parent;
> +
> +	if (emc_suspend)
> +		rate =3D TEGRA210_EMC_SUSPEND_RATE;
> +
> +	if (rate =3D=3D emc->current_timing->rate)
> +		return 0;
> +
> +	i =3D emc_table_lookup(emc, rate / 1000);
> +
> +	if (i < 0)

No need for a blank line between the above two.

> +		return i;
> +
> +	if (rate > 204000000 && !emc->emc_table[i].trained)
> +		return -EINVAL;

Where does that 204 MHz come from? Maybe that should be a parameter? Is
it coincidence that it's the same as TEGRA210_EMC_SUSPEND_RATE?

> +
> +	parent =3D emc_predict_parent(emc, rate);
> +	if (clk_is_match(parent, emc_clk_sel[i].input))

Could use a blank line between the above two lines for readability.

> +		emc->clk_setting =3D emc_clk_sel[i].value;
> +	else
> +		emc->clk_setting =3D emc_clk_sel[i].value_b;
> +
> +	emc->next_timing =3D &emc->emc_table[i];
> +	last_change_delay =3D ktime_us_delta(ktime_get(), clkchange_time);
> +	if ((last_change_delay >=3D 0) && (last_change_delay < clkchange_delay))

Could also use a blank line for readability.

> +		udelay(clkchange_delay - (int)last_change_delay);
> +
> +	spin_lock_irqsave(&emc_access_lock, flags);
> +	emc_set_clock(emc, emc->clk_setting);
> +	clkchange_time =3D ktime_get();
> +	emc->current_timing =3D &emc->emc_table[i];
> +	spin_unlock_irqrestore(&emc_access_lock, flags);
> +
> +	emc_last_stats_update(i);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +static int emc_stats_show(struct seq_file *s, void *data)
> +{
> +	int i;

unsigned int.

> +	struct tegra_emc *emc =3D (struct tegra_emc *)s->private;

I don't think the cast is needed here. s->private is void *.

> +
> +	if (!emc->emc_table_size || !seq)
> +		return 0;
> +
> +	emc_last_stats_update(TEGRA_EMC_TABLE_MAX_SIZE);

Isn't this going to falsify the statistics? This causes the last update
time to be captured, which effectively resets to 0 the duration for
which the current timing was applied, doesn't it?

> +
> +	seq_printf(s, "%-10s %-10s\n", "rate kHz", "time");
> +	for (i =3D 0; i < emc->emc_table_size; i++) {
> +		if (emc_clk_sel[i].input =3D=3D NULL)
> +			continue;
> +
> +		seq_printf(s, "%-10u %-10llu\n",
> +			   emc->emc_table[i].rate,
> +			   jiffies_64_to_clock_t(
> +			   emc_stats.time_at_clock[i]));
> +	}
> +	seq_printf(s, "%-15s %llu\n", "transitions:",
> +		   emc_stats.clkchange_count);
> +	seq_printf(s, "%-15s %llu\n", "time-stamp:",
> +		   jiffies_64_to_clock_t(emc_stats.last_update));
> +
> +	return 0;
> +}
> +
> +static int emc_stats_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, emc_stats_show, inode->i_private);
> +}
> +
> +static const struct file_operations emc_stats_fops =3D {
> +	.open		=3D emc_stats_open,
> +	.read		=3D seq_read,
> +	.llseek		=3D seq_lseek,
> +	.release	=3D single_release,
> +};
> +
> +static int debug_emc_get_rate(void *data, u64 *val)
> +{
> +	struct clk *c =3D data;
> +
> +	*val =3D clk_get_rate(c);
> +
> +	return 0;
> +}
> +
> +static int debug_emc_set_rate(void *data, u64 val)
> +{
> +	struct clk *c =3D data;
> +
> +	return clk_set_rate(c, val);
> +}
> +DEFINE_SIMPLE_ATTRIBUTE(emc_rate_fops, debug_emc_get_rate,
> +			debug_emc_set_rate, "%llu\n");
> +
> +static int tegra_emc_debug_init(struct tegra_emc *emc)
> +{
> +	struct dentry *emc_debugfs_root;
> +
> +	emc_debugfs_root =3D debugfs_create_dir("tegra_emc", NULL);
> +	if (!emc_debugfs_root)
> +		return -ENOMEM;
> +
> +	if (!debugfs_create_file("stats", 0444, emc_debugfs_root, emc,
> +				 &emc_stats_fops))
> +		goto err_out;
> +
> +	if (!debugfs_create_file("rate", 0644, emc_debugfs_root, emc->emc_clk,
> +				 &emc_rate_fops))
> +		goto err_out;
> +
> +	return 0;
> +
> +err_out:
> +	debugfs_remove_recursive(emc_debugfs_root);
> +	return -ENOMEM;
> +}
> +#endif /* CONFIG_DEBUG_FS */
> +
> +static u8 clk_emc_get_parent(struct clk_hw *hw)
> +{
> +	struct tegra_emc *emc =3D to_emc(hw);
> +
> +	if (!emc->clk_setting)
> +		emc->clk_setting =3D tegra210_clk_emc_get_setting();
> +
> +	return emc_src_val(emc->clk_setting);
> +}
> +
> +static unsigned long clk_emc_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct tegra_emc *emc =3D to_emc(hw);
> +
> +	if (!emc->emc_table_size || !seq) {
> +		u32 emc_setting =3D tegra210_clk_emc_get_setting();
> +
> +		return clk_get_rate(emc_src[emc_src_val(emc_setting)]);
> +	}
> +
> +	return emc->current_timing->rate * 1000;

There's a lot of conversion between CCF rates and timing rates. Can we
not settle on the timing rates to be stored in Hz (rather than kHz) as
well?

> +}
> +
> +static long clk_emc_round_rate(struct clk_hw *hw, unsigned long rate,
> +			       unsigned long *prate)
> +{
> +	struct tegra_emc *emc =3D to_emc(hw);
> +	int i;
> +
> +	if (!emc->emc_table_size || !seq) {
> +		u32 emc_setting =3D tegra210_clk_emc_get_setting();
> +
> +		return clk_get_rate(emc_src[emc_src_val(emc_setting)]);
> +	}
> +
> +	if (emc_suspend)
> +		return TEGRA210_EMC_SUSPEND_RATE;
> +
> +	rate /=3D 1000;
> +
> +	for (i =3D 0; i < emc->emc_table_size; i++) {
> +		if (emc->emc_table[i].rate >=3D rate)
> +			return emc->emc_table[i].rate * 1000;
> +	}
> +
> +	return emc->emc_table[i - 1].rate * 1000;
> +}
> +
> +static int clk_emc_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct tegra_emc *emc =3D to_emc(hw);
> +	struct clk *old_parent, *new_parent;
> +	int ret =3D -EINVAL;
> +
> +	if (!emc->emc_table_size || !seq)
> +		return ret;
> +
> +	if (emc_suspend)
> +		rate =3D TEGRA210_EMC_SUSPEND_RATE;
> +
> +	old_parent =3D clk_get_parent(hw->clk);
> +	new_parent =3D emc_predict_parent(emc, rate);
> +	if (IS_ERR(new_parent))
> +		goto out;
> +
> +	if (!clk_is_match(new_parent, old_parent))
> +		clk_prepare_enable(new_parent);
> +
> +	ret =3D emc_set_rate(emc, rate);
> +	if (ret) {
> +		if (new_parent !=3D old_parent)
> +			clk_disable_unprepare(new_parent);
> +		goto out;
> +	}
> +
> +	if (!clk_is_match(new_parent, old_parent)) {
> +		clk_hw_reparent(hw, __clk_get_hw(new_parent));
> +		clk_disable_unprepare(old_parent);
> +	}
> +
> +out:
> +	return ret;
> +}
> +
> +static const struct clk_ops tegra_clk_emc_ops =3D {
> +	.get_parent =3D clk_emc_get_parent,
> +	.recalc_rate =3D clk_emc_recalc_rate,
> +	.round_rate =3D clk_emc_round_rate,
> +	.set_rate =3D clk_emc_set_rate,
> +};
> +
> +static int find_matching_input(struct emc_table *table, struct emc_sel *=
sel)
> +{
> +	u32 div_value;
> +	u32 src_value;
> +	unsigned long input_rate =3D 0;
> +	struct clk *input_clk;
> +
> +	div_value =3D emc_div_val(table->clk_src_emc);
> +	src_value =3D emc_src_val(table->clk_src_emc);
> +
> +	if (div_value & 0x1) {
> +		pr_warn("Tegra EMC: invalid odd divider for EMC rate %u\n",
> +			table->rate);
> +		return -EINVAL;
> +	}
> +
> +	if (!(table->clk_src_emc & EMC_CLK_MC_EMC_SAME_FREQ) !=3D
> +	    !(MC_EMEM_ARB_MISC0_EMC_SAME_FREQ &
> +	    table->burst_regs[MC_EMEM_ARB_MISC0_INDEX])) {
> +		pr_warn("Tegra EMC: ambiguous EMC to MC ratio for rate %u\n",
> +			table->rate);
> +		return -EINVAL;
> +	}
> +
> +	input_clk =3D emc_src[src_value];
> +	if (input_clk =3D=3D emc_src[TEGRA_EMC_SRC_PLLM]
> +		|| input_clk =3D=3D emc_src[TEGRA_EMC_SRC_PLLM_UD]) {
> +		input_rate =3D table->rate * (1 + div_value / 2);
> +	} else {
> +		input_rate =3D clk_get_rate(input_clk) / 1000;
> +		if (input_rate !=3D (table->rate * (1 + div_value / 2))) {
> +			pr_warn("Tegra EMC: rate %u doesn't match input\n",
> +				table->rate);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	sel->input =3D input_clk;
> +	sel->input_rate =3D input_rate;
> +	sel->value =3D table->clk_src_emc;
> +	sel->input_b =3D input_clk;
> +	sel->input_rate_b =3D input_rate;
> +	sel->value_b =3D table->clk_src_emc;
> +
> +	if (input_clk =3D=3D emc_src[TEGRA_EMC_SRC_PLLM]) {
> +		sel->input_b =3D emc_src[TEGRA_EMC_SRC_PLLMB];
> +		sel->value_b =3D table->clk_src_emc &
> +			       ~EMC_CLK_EMC_2X_CLK_SRC_MASK;
> +		sel->value_b |=3D TEGRA_EMC_SRC_PLLMB <<
> +				EMC_CLK_EMC_2X_CLK_SRC_SHIFT;
> +	}
> +
> +	if (input_clk =3D=3D emc_src[TEGRA_EMC_SRC_PLLM_UD]) {
> +		sel->input_b =3D emc_src[TEGRA_EMC_SRC_PLLMB_UD];
> +		sel->value_b =3D table->clk_src_emc &
> +			       ~EMC_CLK_EMC_2X_CLK_SRC_MASK;
> +		sel->value_b |=3D TEGRA_EMC_SRC_PLLMB_UD <<
> +				EMC_CLK_EMC_2X_CLK_SRC_SHIFT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tegra210_emc_probe(struct platform_device *pdev)
> +{
> +	int i, div;

i and div can be unsigned int.

> +	unsigned long table_rate;
> +	unsigned long current_rate;
> +	struct device_node *np;
> +	struct platform_device *mc;
> +	struct tegra_emc *emc;
> +	struct clk_init_data init;
> +	struct clk *clk;
> +	struct resource *r;
> +	u32 emc_setting;
> +
> +	emc =3D devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
> +	if (!emc)
> +		return -ENOMEM;
> +
> +	np =3D of_parse_phandle(pdev->dev.of_node, "nvidia,memory-controller", =
0);
> +	if (!np) {
> +		dev_err(&pdev->dev, "could not get memory controller\n");
> +		return -ENOENT;
> +	}
> +
> +	mc =3D of_find_device_by_node(np);
> +	of_node_put(np);
> +	if (!mc)
> +		return -ENOENT;
> +
> +	emc->mc =3D platform_get_drvdata(mc);
> +	if (!emc->mc)
> +		return -EPROBE_DEFER;
> +
> +	emc->ram_code =3D tegra_read_ram_code();

Oh, we do already cache the value here. Might as well reuse this
everywhere instead of calling tegra_read_ram_code() over and over again.

> +	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	emc->emc_base =3D devm_ioremap_resource(&pdev->dev, r);
> +	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	emc->emc0_base =3D devm_ioremap_resource(&pdev->dev, r);
> +	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 2);
> +	emc->emc1_base =3D devm_ioremap_resource(&pdev->dev, r);

That's odd. In emc_readl_per_ch() you use emc->emc_base to access
registers pertaining to the EMC0 channel. Why do we have different
apertures listed here? emc->emc0_base is not at all used right now.

> +
> +	for (i =3D 0; i < TEGRA_EMC_SRC_COUNT; i++) {
> +		emc_src[i] =3D devm_clk_get(&pdev->dev,
> +						emc_src_names[i]);

No need to split this across multiple lines.

> +		if (IS_ERR(emc_src[i])) {
> +			dev_err(&pdev->dev, "Can not find EMC source clock\n");
> +			return -ENODATA;

Propagate the error store in emc_src[i].

> +		}
> +	}
> +
> +	/* Init EMC rate statistic data */
> +	emc_stats.clkchange_count =3D 0;
> +	spin_lock_init(&emc_stats.spinlock);
> +	emc_stats.last_update =3D get_jiffies_64();
> +	emc_stats.last_sel =3D TEGRA_EMC_TABLE_MAX_SIZE;
> +
> +	emc->dram_type =3D (emc_readl(emc, EMC_FBIO_CFG5) &
> +			  EMC_FBIO_CFG5_DRAM_TYPE_MASK) >>
> +			  EMC_FBIO_CFG5_DRAM_TYPE_SHIFT;
> +	if (emc->dram_type !=3D DRAM_TYPE_DDR3 &&
> +	    emc->dram_type !=3D DRAM_TYPE_LPDDR2 &&
> +	    emc->dram_type !=3D DRAM_TYPE_LPDDR4) {
> +		dev_err(&pdev->dev, "DRAM not supported\n");
> +		return -ENODATA;

This is not a very good error code for this situation. Perhaps use
something like -ENODEV or -ENXIO.

> +	}
> +
> +	emc->dram_dev_num =3D tegra_mc_get_emem_device_count(emc->mc);
> +
> +	tegra_emc_dt_parse_pdata(pdev, &emc->emc_table_normal,
> +				 &emc->emc_table_derated,
> +				 &emc->emc_table_size);

Don't you want to handle errors from this function?

> +	if (!emc->emc_table_size ||
> +	    emc->emc_table_size > TEGRA_EMC_TABLE_MAX_SIZE) {
> +		dev_err(&pdev->dev, "Invalid table size %d\n",
> +			emc->emc_table_size);
> +		goto emc_clk_register;
> +	}
> +	emc->emc_table =3D emc->emc_table_normal;
> +
> +	/*
> +	 * Copy trained trimmers from the normal table to the derated
> +	 * table for LP4. Bootloader trains only the normal table.
> +	 * Trimmers are the same for derated and normal tables.
> +	 */
> +	if (emc->emc_table_derated && emc->dram_type =3D=3D DRAM_TYPE_LPDDR4)
> +		emc_copy_table_params(emc->emc_table_normal,
> +				      emc->emc_table_derated,
> +				      emc->emc_table_size,
> +				      EMC_COPY_TABLE_PARAM_PERIODIC_FIELDS |
> +				      EMC_COPY_TABLE_PARAM_TRIM_REGS);
> +
> +	seq =3D supported_seqs;
> +	while (seq->table_rev) {
> +		if (seq->table_rev =3D=3D emc->emc_table[0].rev)
> +			break;
> +		seq++;
> +	}
> +	if (!seq->set_clock) {
> +		seq =3D NULL;
> +		dev_err(&pdev->dev, "Invalid EMC sequence for table Rev. %d\n",
> +			emc->emc_table[0].rev);
> +		goto emc_clk_register;
> +	}
> +
> +	emc_clk_sel =3D devm_kcalloc(&pdev->dev,
> +				   emc->emc_table_size,
> +				   sizeof(struct emc_sel),
> +				   GFP_KERNEL);
> +	if (!emc_clk_sel) {
> +		dev_err(&pdev->dev, "Memory allocation failed\n");

No need to output an error message in this case since the allocator will
already be very noisy when this happens.

> +		return -ENOMEM;
> +	}
> +
> +	/* calculate the rate from source clock */
> +	emc_setting =3D tegra210_clk_emc_get_setting();
> +	current_rate =3D clk_get_rate(emc_src[emc_src_val(emc_setting)]);
> +	div =3D emc_div_val(emc_setting);
> +	div +=3D 2;
> +	current_rate *=3D 2;
> +	current_rate +=3D div - 1;
> +	do_div(current_rate, div);
> +	current_rate /=3D  1000;
> +
> +	for (i =3D 0; i < emc->emc_table_size; i++) {
> +		table_rate =3D emc->emc_table[i].rate;
> +		if (!table_rate)
> +			continue;
> +
> +		if (i && ((table_rate <=3D emc->emc_table[i-1].rate) ||
> +		   (emc->emc_table[i].min_volt <
> +		    emc->emc_table[i-1].min_volt)))
> +			continue;
> +
> +		if (emc->emc_table[i].rev !=3D emc->emc_table[0].rev)
> +			continue;
> +
> +		if (find_matching_input(&emc->emc_table[i], &emc_clk_sel[i]))
> +			continue;
> +
> +		if (table_rate =3D=3D current_rate)
> +			emc_stats.last_sel =3D i;
> +	}
> +
> +	dev_info(&pdev->dev, "validated EMC DFS table\n");

dev_dbg(). Be verbose when unexpected things happen. No need to let the
user know if everything went as expected.

> +
> +	/* Update the start_timing base on the settings from firmware */
> +	emc->start_timing.num_burst =3D emc->emc_table[0].num_burst;
> +	emc->start_timing.num_burst_per_ch =3D
> +		emc->emc_table[0].num_burst_per_ch;
> +	emc->start_timing.num_trim =3D emc->emc_table[0].num_trim;
> +	emc->start_timing.num_trim_per_ch =3D
> +		emc->emc_table[0].num_trim_per_ch;
> +	emc->start_timing.num_mc_regs =3D emc->emc_table[0].num_mc_regs;
> +	emc->start_timing.num_up_down =3D emc->emc_table[0].num_up_down;
> +	emc->start_timing.vref_num =3D emc->emc_table[0].vref_num;
> +
> +	emc_get_timing(emc, &emc->start_timing);
> +	emc->current_timing =3D &emc->start_timing;
> +	emc->clk_setting =3D emc_setting;
> +
> +emc_clk_register:
> +	init.name =3D "emc";
> +	init.ops =3D &tegra_clk_emc_ops;
> +	init.flags =3D CLK_IS_CRITICAL | CLK_GET_RATE_NOCACHE;
> +	init.parent_names =3D emc_src_names;
> +	init.num_parents =3D ARRAY_SIZE(emc_src_names);
> +	emc->hw.init =3D &init;
> +
> +	clk =3D clk_register(&pdev->dev, &emc->hw);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +	emc->emc_clk =3D clk;
> +	emc->dev =3D &pdev->dev;
> +	tegra_emc =3D emc;
> +	dev_set_drvdata(emc->dev, emc);
> +
> +	if (emc->emc_table_size && seq) {
> +		for (i =3D 0; i < emc->emc_table_size; i++) {
> +			table_rate =3D emc->emc_table[i].rate * 1000;
> +			if (clk_set_rate(clk, table_rate))
> +				dev_info(&pdev->dev,
> +					 "rate: %lu validation fail\n",
> +					 table_rate);

This should be dev_err() and you may want to exit at this point?

> +			dev_info(&pdev->dev, "rate: %lu validation success\n",
> +				 table_rate);

Again, no need to let the user know if everything went as expected. Also
in the above error case, you'd be outputing that setting the rate failed
and immediately report that it also succeeded.

Also, do I understand correctly that the above will try to set each rate
and keep the EMC rate set at the one in the last entry in the table? It
would presumably be the highest and I think that's a good default. Just
want to make sure I understand what's happening and that it is on
purpose.

> +		}
> +	}
> +
> +	if (IS_ENABLED(CONFIG_DEBUG_FS))
> +		tegra_emc_debug_init(emc);

You'll have to decide whether you want to use #ifdef or a C conditional
with IS_ENABLED(). If DEBUG_FS is disabled, the above will fail to build
because tegra_emc_debug_init() won't be defined. I would recommend just
dropping the #ifdef around the debugfs implementation and let the
compiler's DCE pass remove debugfs support if DEBUG_FS=3Dn.

> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int tegra210_emc_suspend(struct device *dev)
> +{
> +	struct tegra_emc *emc =3D dev_get_drvdata(dev);
> +
> +	if (!IS_ERR(emc->emc_clk)) {
> +		emc_suspend =3D true;
> +		emc_resume_rate =3D clk_get_rate(emc->emc_clk);
> +		clk_set_rate(emc->emc_clk, TEGRA210_EMC_SUSPEND_RATE);
> +
> +		pr_debug("%s at rate %lu\n", __func__,
> +			 clk_get_rate(emc->emc_clk));

Why not dev_dbg()? Also, perhaps use something like this for better
readability:

	dev_dbg(dev, "suspending at %lu Hz\n", clk_get_rate(emc->emc_clk));

> +	}
> +
> +	return 0;
> +}
> +
> +static int tegra210_emc_resume(struct device *dev)
> +{
> +	struct tegra_emc *emc =3D dev_get_drvdata(dev);
> +
> +	if (!IS_ERR(emc->emc_clk)) {
> +		emc_suspend =3D false;
> +		clk_set_rate(emc->emc_clk, emc_resume_rate);
> +
> +		pr_debug("%s at rate %lu\n", __func__,
> +			 clk_get_rate(emc->emc_clk));
> +	}
> +
> +	return 0;
> +}

Same comments as for suspend.

> +
> +static const struct dev_pm_ops tegra210_emc_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(tegra210_emc_suspend, tegra210_emc_resume)
> +};
> +#endif
> +
> +static const struct of_device_id tegra210_emc_of_match[] =3D {
> +	{ .compatible =3D "nvidia,tegra210-emc", },
> +	{ },
> +};
> +
> +static struct platform_driver tegra210_emc_driver =3D {
> +	.driver	=3D {
> +		.name =3D "tegra210-emc",
> +		.of_match_table =3D tegra210_emc_of_match,
> +		.pm =3D &tegra210_emc_pm_ops,

This is going to fail if PM_SLEEP is unset. Better to always declare
tegra210_emc_pm_ops, SET_SYSTEM_SLEEP_PM_OPS makes sure to replace the
undefined symbols with NULL if PM_SLEEP is unset.

> +	},
> +	.probe =3D tegra210_emc_probe,
> +};
> +
> +static int __init tegra210_emc_init(void)
> +{
> +	return platform_driver_register(&tegra210_emc_driver);
> +}
> +subsys_initcall(tegra210_emc_init);

Since this driver is not meant to be removed, you may want to prevent
users from forcefully removing it using sysfs by setting:

	.suppress_bind_attrs =3D true

in the driver structure.

Thierry

--zhtSGe8h3+lMyY1M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlykmkAACgkQ3SOs138+
s6GmfxAAucY8SoJEBBHKhIkyzOHcmoZwlTlkr42FSctV3VRnyQb+SCU5XiqQ4ltD
gxeqwg5ydynxtBsPcpUCVMeFjrdkboZhLy5KgbrtPFNHfr0rZzweYC8/qaBSGuWC
RKkT2BREcC4zjnJ0fvoNiU810BuL+8kmQ6UiJGP6L9UgFAxm7z50CxxcEdnqzOQW
ISzxAsSaueAPTJjkr4K03+4/m/8utHCQ/YO+pMbVNRfsB1kD/48qOwjvhXO0IOmL
DfwuzVYyKBe6q4O8aJZXxCXqAcW9odAlQMeKngr5XtpZzJG9NGLxBuqGd+YL6Cjp
sxuK1b8uMMCAw1IGeNns/AAa1RfXVaWONeg+xZAXNxJJpSW5nkU0UWz88xwRtNqA
l4T1mgEGM8fwsYc2y8eK+ggtRak8T+Cl0lVwzpbf97Qf5m1TlgyBvvKTJyBCUzTb
rHYqVYMYwQwmJFBBqyOt0CRW1EKXNXoFVf7Z1Eo/jnwDNny+nMrgYNqYP6f06oU8
nSJkvXFrfabj/WC72LTWLN1p7Vl/gn+l1ghcNAVejH2HHNgtsTUGZbqnGN1DfGM3
xMs4Xmqx4IejGQX7gWUT3EX+Fe2GGlijHkQdqbfkLOp6bY1t9jNPngsjU1F3OgYz
fUf49U8ZWPuGXagwWJGFSIPz0PZa6i+I+KPc2CLx2MnASsiHQyI=
=v6o/
-----END PGP SIGNATURE-----

--zhtSGe8h3+lMyY1M--


--===============3551796741483993178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3551796741483993178==--
