From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 3/6] clk: tegra: add CVB tables for Tegra210 CPU DFLL
Date: Thu, 1 Feb 2018 12:39:43 +0200
Message-ID: <20180201103943.GA7031@tbergstrom-lnx.Nvidia.com>
References: <1516797938-32044-1-git-send-email-pdeschrijver@nvidia.com>
 <1516797938-32044-5-git-send-email-pdeschrijver@nvidia.com>
 <2050cb08-46ed-eca4-cfee-e8fb47fa312a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2050cb08-46ed-eca4-cfee-e8fb47fa312a-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 31, 2018 at 10:50:31AM +0000, Jon Hunter wrote:
> 
> On 24/01/18 12:45, Peter De Schrijver wrote:
> > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 426 +++++++++++++++++++++++++++++
> >  drivers/clk/tegra/cvb.h                    |   1 +
> >  2 files changed, 427 insertions(+)
> > 
> > diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> > index 6205ce1..9b61f80 100644
> > --- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> > +++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> > @@ -90,6 +90,421 @@ struct dfll_fcpu_data {
> >  	},
> >  };
> >  
> > +static const unsigned long tegra210_cpu_max_freq_table[] = {
> > +	[0] = 1912500000UL,
> > +	[1] = 1912500000UL,
> 
> Any reason why there are two the same here? FWIW I also see this in the
> nvidia downstream kernel. Just seems odd.
> 	

Not sure why speedo 0 and 1 have the same max frequency. Maybe those were
never characterized beyond the initially planned max frequency.

> > +	[2] = 2218500000UL,
> > +	[3] = 1785000000UL,
> > +	[4] = 1632000000UL,
> > +	[5] = 1912500000UL,
> > +	[6] = 2014500000UL,
> > +	[7] = 1734000000UL,
> > +	[8] = 1683000000UL,
> > +	[9] = 1555500000UL,
> > +	[10] = 1504500000UL,
> > +};
> > +
> > +#define CPU_CVB_TABLE \
> > +	.speedo_scale = 100,	\
> > +	.voltage_scale = 1000,	\
> > +	.entries = {		\
> > +		{204000000UL,	{1007452, -23865, 370} }, \
> > +		{306000000UL,	{1052709, -24875, 370} }, \
> > +		{408000000UL,	{1099069, -25895, 370} }, \
> > +		{510000000UL,	{1146534, -26905, 370} }, \
> > +		{612000000UL,	{1195102, -27915, 370} }, \
> > +		{714000000UL,	{1244773, -28925, 370} }, \
> > +		{816000000UL,	{1295549, -29935, 370} }, \
> > +		{918000000UL,	{1347428, -30955, 370} }, \
> > +		{1020000000UL,	{1400411, -31965, 370} }, \
> > +		{1122000000UL,	{1454497, -32975, 370} }, \
> > +		{1224000000UL,	{1509687, -33985, 370} }, \
> > +		{1326000000UL,	{1565981, -35005, 370} }, \
> > +		{1428000000UL,	{1623379, -36015, 370} }, \
> > +		{1530000000UL,	{1681880, -37025, 370} }, \
> > +		{1632000000UL,	{1741485, -38035, 370} }, \
> > +		{1734000000UL,	{1802194, -39055, 370} }, \
> > +		{1836000000UL,	{1864006, -40065, 370} }, \
> > +		{1912500000UL,	{1910780, -40815, 370} }, \
> > +		{2014500000UL,	{1227000,      0,   0} }, \
> > +		{2218500000UL,	{1227000,      0,   0} }, \
> > +		{0,		{      0,      0,   0} }, \
> > +	}
> > +
> > +#define CPU_CVB_TABLE_XA \
> > +	.speedo_scale = 100,	\
> > +	.voltage_scale = 1000,	\
> > +	.entries = {		\
> > +		{204000000UL,	{1250024, -39785, 565} }, \
> > +		{306000000UL,	{1297556, -41145, 565} }, \
> > +		{408000000UL,	{1346718, -42505, 565} }, \
> > +		{510000000UL,	{1397511, -43855, 565} }, \
> > +		{612000000UL,	{1449933, -45215, 565} }, \
> > +		{714000000UL,	{1503986, -46575, 565} }, \
> > +		{816000000UL,	{1559669, -47935, 565} }, \
> > +		{918000000UL,	{1616982, -49295, 565} }, \
> > +		{1020000000UL,	{1675926, -50645, 565} }, \
> > +		{1122000000UL,	{1736500, -52005, 565} }, \
> > +		{1224000000UL,	{1798704, -53365, 565} }, \
> > +		{1326000000UL,	{1862538, -54725, 565} }, \
> > +		{1428000000UL,	{1928003, -56085, 565} }, \
> > +		{1530000000UL,	{1995097, -57435, 565} }, \
> > +		{1606500000UL,	{2046149, -58445, 565} }, \
> > +		{1632000000UL,	{2063822, -58795, 565} }, \
> > +		{0,		{      0,      0,   0} }, \
> > +	}
> > +
> > +#define CPU_CVB_TABLE_EUCM1 \
> > +	.speedo_scale = 100,	\
> > +	.voltage_scale = 1000,	\
> > +	.entries = {		\
> > +		{204000000UL,	{734429, 0, 0} }, \
> > +		{306000000UL,	{768191, 0, 0} }, \
> > +		{408000000UL,	{801953, 0, 0} }, \
> > +		{510000000UL,	{835715, 0, 0} }, \
> > +		{612000000UL,	{869477, 0, 0} }, \
> > +		{714000000UL,	{903239, 0, 0} }, \
> > +		{816000000UL,	{937001, 0, 0} }, \
> > +		{918000000UL,	{970763, 0, 0} }, \
> > +		{1020000000UL,	{1004525, 0, 0} }, \
> > +		{1122000000UL,	{1038287, 0, 0} }, \
> > +		{1224000000UL,	{1072049, 0, 0} }, \
> > +		{1326000000UL,	{1105811, 0, 0} }, \
> > +		{1428000000UL,	{1130000, 0, 0} }, \
> > +		{1555500000UL,	{1130000, 0, 0} }, \
> > +		{1632000000UL,	{1170000, 0, 0} }, \
> > +		{1734000000UL,	{1227500, 0, 0} }, \
> > +		{0,		{      0, 0, 0} }, \
> > +	}
> > +
> > +#define CPU_CVB_TABLE_EUCM2 \
> > +	.speedo_scale = 100,	\
> > +	.voltage_scale = 1000,	\
> > +	.entries = {		\
> > +		{204000000UL,	{742283, 0, 0} }, \
> > +		{306000000UL,	{776249, 0, 0} }, \
> > +		{408000000UL,	{810215, 0, 0} }, \
> > +		{510000000UL,	{844181, 0, 0} }, \
> > +		{612000000UL,	{878147, 0, 0} }, \
> > +		{714000000UL,	{912113, 0, 0} }, \
> > +		{816000000UL,	{946079, 0, 0} }, \
> > +		{918000000UL,	{980045, 0, 0} }, \
> > +		{1020000000UL,	{1014011, 0, 0} }, \
> > +		{1122000000UL,	{1047977, 0, 0} }, \
> > +		{1224000000UL,	{1081943, 0, 0} }, \
> > +		{1326000000UL,	{1090000, 0, 0} }, \
> > +		{1479000000UL,	{1090000, 0, 0} }, \
> > +		{1555500000UL,	{1162000, 0, 0} }, \
> > +		{1683000000UL,	{1195000, 0, 0} }, \
> > +		{0,		{      0, 0, 0} }, \
> > +	}
> > +
> > +#define CPU_CVB_TABLE_EUCM2_JOINT_RAIL \
> > +	.speedo_scale = 100,	\
> > +	.voltage_scale = 1000,	\
> > +	.entries = {		\
> > +		{204000000UL,	{742283, 0, 0} }, \
> > +		{306000000UL,	{776249, 0, 0} }, \
> > +		{408000000UL,	{810215, 0, 0} }, \
> > +		{510000000UL,	{844181, 0, 0} }, \
> > +		{612000000UL,	{878147, 0, 0} }, \
> > +		{714000000UL,	{912113, 0, 0} }, \
> > +		{816000000UL,	{946079, 0, 0} }, \
> > +		{918000000UL,	{980045, 0, 0} }, \
> > +		{1020000000UL,	{1014011, 0, 0} }, \
> > +		{1122000000UL,	{1047977, 0, 0} }, \
> > +		{1224000000UL,	{1081943, 0, 0} }, \
> > +		{1326000000UL,	{1090000, 0, 0} }, \
> > +		{1479000000UL,	{1090000, 0, 0} }, \
> > +		{1504500000UL,	{1120000, 0, 0} }, \
> > +		{0,		{      0, 0, 0} }, \
> > +	}
> > +
> > +#define CPU_CVB_TABLE_ODN \
> > +	.speedo_scale = 100,	\
> > +	.voltage_scale = 1000,	\
> > +	.entries = {		\
> > +		{204000000UL,	{721094, 0, 0} }, \
> > +		{306000000UL,	{754040, 0, 0} }, \
> > +		{408000000UL,	{786986, 0, 0} }, \
> > +		{510000000UL,	{819932, 0, 0} }, \
> > +		{612000000UL,	{852878, 0, 0} }, \
> > +		{714000000UL,	{885824, 0, 0} }, \
> > +		{816000000UL,	{918770, 0, 0} }, \
> > +		{918000000UL,	{915716, 0, 0} }, \
> > +		{1020000000UL,	{984662, 0, 0} }, \
> > +		{1122000000UL,	{1017608, 0, 0} }, \
> > +		{1224000000UL,	{1050554, 0, 0} }, \
> > +		{1326000000UL,	{1083500, 0, 0} }, \
> > +		{1428000000UL,	{1116446, 0, 0} }, \
> > +		{1581000000UL,	{1130000, 0, 0} }, \
> > +		{1683000000UL,	{1168000, 0, 0} }, \
> > +		{1785000000UL,	{1227500, 0, 0} }, \
> > +		{0,		{      0, 0, 0} }, \
> > +	}
> > +
> > +struct cvb_table tegra210_cpu_cvb_tables[] = {
> > +	{
> > +		.speedo_id = 10,
> > +		.process_id = 0,
> > +		.min_millivolts = 840,
> > +		.max_millivolts = 1120,
> > +		CPU_CVB_TABLE_EUCM2_JOINT_RAIL,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune0_high = 0xffead0ff,
> > +			.tune1 = 0x20091d9,
> > +			.tune_high_min_millivolts = 864,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 10,
> > +		.process_id = 1,
> > +		.min_millivolts = 840,
> > +		.max_millivolts = 1120,
> > +		CPU_CVB_TABLE_EUCM2_JOINT_RAIL,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune0_high = 0xffead0ff,
> > +			.tune1 = 0x20091d9,
> > +			.tune_high_min_millivolts = 864,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 9,
> > +		.process_id = 0,
> > +		.min_millivolts = 900,
> > +		.max_millivolts = 1162,
> > +		CPU_CVB_TABLE_EUCM2,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune0_high = 0xffead0ff,
> > +			.tune1 = 0x20091d9,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 9,
> > +		.process_id = 1,
> > +		.min_millivolts = 900,
> > +		.max_millivolts = 1162,
> > +		CPU_CVB_TABLE_EUCM2,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune0_high = 0xffead0ff,
> > +			.tune1 = 0x20091d9,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 8,
> > +		.process_id = 0,
> > +		.min_millivolts = 900,
> > +		.max_millivolts = 1195,
> > +		CPU_CVB_TABLE_EUCM2,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune0_high = 0xffead0ff,
> > +			.tune1 = 0x20091d9,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 8,
> > +		.process_id = 1,
> > +		.min_millivolts = 900,
> > +		.max_millivolts = 1195,
> > +		CPU_CVB_TABLE_EUCM2,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune0_high = 0xffead0ff,
> > +			.tune1 = 0x20091d9,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 7,
> > +		.process_id = 0,
> > +		.min_millivolts = 841,
> > +		.max_millivolts = 1227,
> > +		CPU_CVB_TABLE_EUCM1,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune0_high = 0xffead0ff,
> > +			.tune1 = 0x20091d9,
> > +			.tune_high_min_millivolts = 864,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 7,
> > +		.process_id = 1,
> > +		.min_millivolts = 841,
> > +		.max_millivolts = 1227,
> > +		CPU_CVB_TABLE_EUCM1,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune0_high = 0xffead0ff,
> > +			.tune1 = 0x20091d9,
> > +			.tune_high_min_millivolts = 864,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 6,
> > +		.process_id = 0,
> > +		.min_millivolts = 870,
> > +		.max_millivolts = 1150,
> > +		CPU_CVB_TABLE,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune1 = 0x20091d9,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 6,
> > +		.process_id = 1,
> > +		.min_millivolts = 870,
> > +		.max_millivolts = 1150,
> > +		CPU_CVB_TABLE,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune1 = 0x25501d0,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 5,
> > +		.process_id = 0,
> > +		.min_millivolts = 818,
> > +		.max_millivolts = 1227,
> > +		CPU_CVB_TABLE,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune0_high = 0xffead0ff,
> > +			.tune1 = 0x20091d9,
> > +			.tune_high_min_millivolts = 864,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 5,
> > +		.process_id = 1,
> > +		.min_millivolts = 818,
> > +		.max_millivolts = 1227,
> > +		CPU_CVB_TABLE,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune0_high = 0xffead0ff,
> > +			.tune1 = 0x25501d0,
> > +			.tune_high_min_millivolts = 864,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 4,
> > +		.process_id = -1,
> > +		.min_millivolts = 918,
> > +		.max_millivolts = 1113,
> > +		CPU_CVB_TABLE_XA,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune1 = 0x17711BD,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 3,
> > +		.process_id = 0,
> > +		.min_millivolts = 825,
> > +		.max_millivolts = 1227,
> > +		CPU_CVB_TABLE_ODN,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune0_high = 0xffead0ff,
> > +			.tune1 = 0x20091d9,
> > +			.tune_high_min_millivolts = 864,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 3,
> > +		.process_id = 1,
> > +		.min_millivolts = 825,
> > +		.max_millivolts = 1227,
> > +		CPU_CVB_TABLE_ODN,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune0_high = 0xffead0ff,
> > +			.tune1 = 0x25501d0,
> > +			.tune_high_min_millivolts = 864,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 2,
> > +		.process_id = 0,
> > +		.min_millivolts = 870,
> > +		.max_millivolts = 1227,
> > +		CPU_CVB_TABLE,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune1 = 0x20091d9,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 2,
> > +		.process_id = 1,
> > +		.min_millivolts = 870,
> > +		.max_millivolts = 1227,
> > +		CPU_CVB_TABLE,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune1 = 0x25501d0,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 1,
> > +		.process_id = 0,
> > +		.min_millivolts = 837,
> > +		.max_millivolts = 1227,
> > +		CPU_CVB_TABLE,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune0_high = 0xffead0ff,
> > +			.tune1 = 0x20091d9,
> > +			.tune_high_min_millivolts = 864,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 1,
> > +		.process_id = 1,
> > +		.min_millivolts = 837,
> > +		.max_millivolts = 1227,
> > +		CPU_CVB_TABLE,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune0_high = 0xffead0ff,
> > +			.tune1 = 0x25501d0,
> > +			.tune_high_min_millivolts = 864,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 0,
> > +		.process_id = 0,
> > +		.min_millivolts = 850,
> > +		.max_millivolts = 1170,
> > +		CPU_CVB_TABLE,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune0_high = 0xffead0ff,
> > +			.tune1 = 0x20091d9,
> > +			.tune_high_min_millivolts = 864,
> > +		}
> > +	},
> > +	{
> > +		.speedo_id = 0,
> > +		.process_id = 1,
> > +		.min_millivolts = 850,
> > +		.max_millivolts = 1170,
> > +		CPU_CVB_TABLE,
> > +		.cpu_dfll_data = {
> > +			.tune0_low = 0xffead0ff,
> > +			.tune0_high = 0xffead0ff,
> > +			.tune1 = 0x25501d0,
> > +			.tune_high_min_millivolts = 864,
> > +		}
> > +	},
> > +};
> > +
> >  static const struct dfll_fcpu_data tegra124_dfll_fcpu_data = {
> >  	.cpu_max_freq_table = tegra124_cpu_max_freq_table,
> >  	.cpu_max_freq_table_size = ARRAY_SIZE(tegra124_cpu_max_freq_table),
> > @@ -97,11 +512,22 @@ struct dfll_fcpu_data {
> >  	.cpu_cvb_tables_size = ARRAY_SIZE(tegra124_cpu_cvb_tables)
> >  };
> >  
> > +static const struct dfll_fcpu_data tegra210_dfll_fcpu_data = {
> > +	.cpu_max_freq_table = tegra210_cpu_max_freq_table,
> > +	.cpu_max_freq_table_size = ARRAY_SIZE(tegra210_cpu_max_freq_table),
> > +	.cpu_cvb_tables = tegra210_cpu_cvb_tables,
> > +	.cpu_cvb_tables_size = ARRAY_SIZE(tegra210_cpu_cvb_tables),
> > +};
> > +
> >  static const struct of_device_id tegra124_dfll_fcpu_of_match[] = {
> >  	{
> >  		.compatible = "nvidia,tegra124-dfll",
> >  		.data = &tegra124_dfll_fcpu_data,
> >  	},
> > +	{
> > +		.compatible = "nvidia,tegra210-dfll",
> > +		.data = &tegra210_dfll_fcpu_data
> > +	},
> >  	{ },
> >  };
> >  
> > diff --git a/drivers/clk/tegra/cvb.h b/drivers/clk/tegra/cvb.h
> > index cfa110f..72c0a2d 100644
> > --- a/drivers/clk/tegra/cvb.h
> > +++ b/drivers/clk/tegra/cvb.h
> > @@ -41,6 +41,7 @@ struct cvb_cpu_dfll_data {
> >  	u32 tune0_low;
> >  	u32 tune0_high;
> >  	u32 tune1;
> > +	unsigned int tune_high_min_millivolts;
> >  };
> >  
> >  struct cvb_table {
> > 
> 
> Otherwise ...
> 
> Reviewed-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Cheers
> Jon
> 
> -- 
> nvpublic
