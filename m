From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 10/14] memory: tegra: Add EMC scaling sequence code
 for Tegra210
Date: Tue, 14 Apr 2020 17:45:26 +0200
Message-ID: <20200414154526.GP3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-11-thierry.reding@gmail.com>
 <682c661d-ea3a-7b9a-42f0-d5473b969aa2@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7gQyIpR7q4QSXYu+"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <682c661d-ea3a-7b9a-42f0-d5473b969aa2@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--7gQyIpR7q4QSXYu+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 05:18:51PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +static void tegra210_emc_r21021_set_clock(struct tegra210_emc *emc, u3=
2 clksrc)
> > +{
> > +	/*
> > +	 * This is the timing table for the source frequency. It does _not_
> > +	 * necessarily correspond to the actual timing values in the EMC at t=
he
> > +	 * moment. If the boot BCT differs from the table then this can happe=
n.
> > +	 * However, we need it for accessing the dram_timings (which are not
> > +	 * really registers) array for the current frequency.
> > +	 */
> > +	u32 tmp, cya_allow_ref_cc =3D 0, ref_b4_sref_en =3D 0, cya_issue_pc_r=
ef =3D 0;
> > +	struct tegra210_emc_timing *fake, *last =3D emc->last, *next =3D emc-=
>next;
> > +	u32 bg_regulator_switch_complete_wait_clks, bg_regulator_mode_change;
> > +	u32 opt_zcal_en_cc, opt_do_sw_qrst =3D 1, opt_dvfs_mode, opt_dll_mode;
> > +	u32 emc_zcal_wait_cnt_old, emc_zcal_wait_cnt_new, emc_dbg_active;
> > +	u32 opt_cc_short_zcal =3D 1, opt_short_zcal =3D 1, opt_war_200024907;
> > +	u32 tRTM, RP_war, R2P_war, TRPab_war, deltaTWATM, W2P_war, tRPST;
> > +	u32 adel =3D 0, compensate_trimmer_applicable =3D 0, mrw_req, value;
> > +	unsigned long next_timing_rate_mhz =3D next->rate / 1000, delay;
> > +	u32 tZQCAL_lpddr4 =3D 1000000, zq_wait_long, shared_zq_resistor;
> > +	s32 zq_latch_dvfs_wait_time, tZQCAL_lpddr4_fc_adj, nRTP;
> > +	u32 tFC_lpddr4 =3D 1000 * next->dram_timings[T_FC_LPDDR4];
> > +	u32 emc_auto_cal_config, auto_cal_en, mr13_catr_enable;
> > +	u32 zq_op, zcal_wait_time_clocks, zcal_wait_time_ps;
> > +	u32 emc_cfg, emc_sel_dpd_ctrl, emc_zcal_interval;
> > +	int next_push, next_dq_e_ivref, next_dqs_e_ivref;
> > +	u32 mr13_flip_fspwr, mr13_flip_fspop, is_lpddr3;
> > +	u32 enable_bglp_regulator, enable_bg_regulator;
> > +	u32 emc_dbg_o, emc_cfg_pipe_clk_o, emc_pin_o;
> > +	u32 ramp_up_wait =3D 0, ramp_down_wait =3D 0;
> > +	u32 save_restore_clkstop_pd =3D 1, dll_out;
> > +	u32 ref_delay_mult, ref_delay, dram_type;
> > +	static u32 fsp_for_next_freq;
> > +	/* In picoseconds. */
> > +	u32 source_clock_period, destination_clock_period;
> > +	u32 zqcal_before_cc_cutoff =3D 2400;
> > +	unsigned int i;
>=20
> What about to try to replace this massive egyptian construction with a
> single "u32 val;" ?

I actually tried that after condensing what this used to look like into
the above. The result was a huge failure because some of these temporary
values end up being reused, so I ended up writing bogus values into some
of these registers.

> > +	emc_readl(emc, EMC_CFG);
> > +	emc_auto_cal_config =3D emc_readl(emc, EMC_AUTO_CAL_CONFIG);
>=20
> And remove all the "dummy" variable assigns in the code?
>=20
> ...
> > emc_auto_cal_config =3D next->emc_auto_cal_config;
> ...> +	emc_zcal_interval =3D 0;
>=20
> And replace all "constant" variables with a raw value in place in the cod=
e?

Okay, I'll give this another try, hopefully this time I won't run into
the same problems as earlier.

Thierry

--7gQyIpR7q4QSXYu+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V2pYACgkQ3SOs138+
s6H0UBAAicSH5/f0DWGQgc7Jq0cl6eGEEK6JDuBnYiKwWIxZ9GhuhWYJyO2DCU22
CUz6FzX8kl5QH7FKz+8bnVqv8gryZGCbzZIFitBr/8WJPt+xiioxvY/X0DUyMxlf
rKsAfEj4ohLqCL8kA9IoM3Xt/6QJdJYg6ei5ETZrymHuO8SXlpC2BppqTkFYpwb0
DmNz6k72A2Jqx2i2a7si/rspGcA+Zkt2OsU4qJT3Eb7K2GBRXAPT3bR8x8AfvfHc
Pxvb3TcnXFuy6ng4dCWBYO/E8Bqn1dE35qqrDUL3yxnuVsxPS9tEOAaCqjytqcJ9
MIo8tAkX+MkZRQbAuJU2l/0f1dw9Ti5etb94f+zvAWqVEkCaFUTiZt+U2A1Jj7wN
JTtQq8t+kSZvTA4t0T83fBwmLkthzmACPANIq2kimRtOXVFKdTEvqhDc1MZmjYAp
3ZX0MZFwYOLinugnrHbDs1GUkBHFuOgBNdimFJ5OdFhZqwgK5GsvJDW8VebA0xfq
CLeyUPHRdi28SuGOistvHoap/82tTqDGRosby1PoFaq4ATOh6VfM3KmpEQkVCARO
REVlom7uSxvj1XopyGWdX34UAUrRsmsomVx1CGKnNPdZY+ERClX7t34z4sB4JdrA
cIiUFJKdcgdmYOfWhYE6BVjalTfYsWfXpAVsr/EQjPDvUAXdY6c=
=HUS/
-----END PGP SIGNATURE-----

--7gQyIpR7q4QSXYu+--
