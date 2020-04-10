From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 10/14] memory: tegra: Add EMC scaling sequence code for
 Tegra210
Date: Fri, 10 Apr 2020 17:18:51 +0300
Message-ID: <682c661d-ea3a-7b9a-42f0-d5473b969aa2@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-11-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200409175238.3586487-11-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
...
> +static void tegra210_emc_r21021_set_clock(struct tegra210_emc *emc, u32 clksrc)
> +{
> +	/*
> +	 * This is the timing table for the source frequency. It does _not_
> +	 * necessarily correspond to the actual timing values in the EMC at the
> +	 * moment. If the boot BCT differs from the table then this can happen.
> +	 * However, we need it for accessing the dram_timings (which are not
> +	 * really registers) array for the current frequency.
> +	 */
> +	u32 tmp, cya_allow_ref_cc = 0, ref_b4_sref_en = 0, cya_issue_pc_ref = 0;
> +	struct tegra210_emc_timing *fake, *last = emc->last, *next = emc->next;
> +	u32 bg_regulator_switch_complete_wait_clks, bg_regulator_mode_change;
> +	u32 opt_zcal_en_cc, opt_do_sw_qrst = 1, opt_dvfs_mode, opt_dll_mode;
> +	u32 emc_zcal_wait_cnt_old, emc_zcal_wait_cnt_new, emc_dbg_active;
> +	u32 opt_cc_short_zcal = 1, opt_short_zcal = 1, opt_war_200024907;
> +	u32 tRTM, RP_war, R2P_war, TRPab_war, deltaTWATM, W2P_war, tRPST;
> +	u32 adel = 0, compensate_trimmer_applicable = 0, mrw_req, value;
> +	unsigned long next_timing_rate_mhz = next->rate / 1000, delay;
> +	u32 tZQCAL_lpddr4 = 1000000, zq_wait_long, shared_zq_resistor;
> +	s32 zq_latch_dvfs_wait_time, tZQCAL_lpddr4_fc_adj, nRTP;
> +	u32 tFC_lpddr4 = 1000 * next->dram_timings[T_FC_LPDDR4];
> +	u32 emc_auto_cal_config, auto_cal_en, mr13_catr_enable;
> +	u32 zq_op, zcal_wait_time_clocks, zcal_wait_time_ps;
> +	u32 emc_cfg, emc_sel_dpd_ctrl, emc_zcal_interval;
> +	int next_push, next_dq_e_ivref, next_dqs_e_ivref;
> +	u32 mr13_flip_fspwr, mr13_flip_fspop, is_lpddr3;
> +	u32 enable_bglp_regulator, enable_bg_regulator;
> +	u32 emc_dbg_o, emc_cfg_pipe_clk_o, emc_pin_o;
> +	u32 ramp_up_wait = 0, ramp_down_wait = 0;
> +	u32 save_restore_clkstop_pd = 1, dll_out;
> +	u32 ref_delay_mult, ref_delay, dram_type;
> +	static u32 fsp_for_next_freq;
> +	/* In picoseconds. */
> +	u32 source_clock_period, destination_clock_period;
> +	u32 zqcal_before_cc_cutoff = 2400;
> +	unsigned int i;

What about to try to replace this massive egyptian construction with a
single "u32 val;" ?

...

> +	emc_readl(emc, EMC_CFG);
> +	emc_auto_cal_config = emc_readl(emc, EMC_AUTO_CAL_CONFIG);

And remove all the "dummy" variable assigns in the code?

...
> emc_auto_cal_config = next->emc_auto_cal_config;
...> +	emc_zcal_interval = 0;

And replace all "constant" variables with a raw value in place in the code?
