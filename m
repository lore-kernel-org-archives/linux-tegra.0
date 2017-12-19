From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 4/8] clk: tegra: dfll: support PWM regulator control
Date: Tue, 19 Dec 2017 11:17:21 -0800
Message-ID: <151371104193.45969.16504297321753674956@resonance>
References: <1510846389-28712-1-git-send-email-pdeschrijver@nvidia.com>
 <1510846389-28712-5-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1510846389-28712-5-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi Peter,

Quoting Peter De Schrijver (2017-11-16 07:33:05)
> The DFLL can directly generate a PWM signal to control the regulator rath=
er
> then sending i2c messages. This patch adds support for this mode. In this=
 mode
> the LUT is not used and also there is no regulator object involved because
> there is no way to force the regulator voltage without also changing the =
DFLL
> output frequency. Also the register debugfs file is slightly reworked to =
only

Since the DFLL frequency can be set by clk_set_rate, why not implement a
.set_voltage or .set_voltage_sel callback that calls clk_set_rate?

Best regards,
Mike

> show the i2c registers when i2c mode is in use.
> =

> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-dfll.c | 481 ++++++++++++++++++++++++++++++++++++-=
------
>  drivers/clk/tegra/clk-dfll.h |   7 +
>  2 files changed, 410 insertions(+), 78 deletions(-)
> =

> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index 2c44aeb..c08a2b4 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -243,6 +243,12 @@ enum dfll_tune_range {
>         DFLL_TUNE_LOW =3D 1,
>  };
>  =

> +
> +enum tegra_dfll_pmu_if {
> +       TEGRA_DFLL_PMU_I2C =3D 0,
> +       TEGRA_DFLL_PMU_PWM =3D 1,
> +};
> +
>  /**
>   * struct dfll_rate_req - target DFLL rate request data
>   * @rate: target frequency, after the postscaling
> @@ -292,18 +298,27 @@ struct tegra_dfll {
>         u32                             force_mode;
>         u32                             cf;
>         u32                             ci;
> -       u32                             cg;
> +       s32                             cg;
>         bool                            cg_scale;
> +       u32                             reg_init_uV;
>  =

>         /* I2C interface parameters */
>         u32                             i2c_fs_rate;
>         u32                             i2c_reg;
>         u32                             i2c_slave_addr;
>  =

> -       /* i2c_lut array entries are regulator framework selectors */
> -       unsigned                        i2c_lut[MAX_DFLL_VOLTAGES];
> -       int                             i2c_lut_size;
> -       u8                              lut_min, lut_max, lut_safe;
> +       /* lut array entries are regulator framework selectors or PWM val=
ues*/
> +       unsigned                        lut[MAX_DFLL_VOLTAGES];
> +       unsigned                        lut_uv[MAX_DFLL_VOLTAGES];
> +       int                             lut_size;
> +       u8                              lut_bottom, lut_min, lut_max, lut=
_safe;
> +
> +       /* PWM interface */
> +       enum tegra_dfll_pmu_if          pmu_if;
> +       unsigned long                   pwm_rate;
> +       struct pinctrl                  *pwm_pin;
> +       struct pinctrl_state            *pwm_enable_state;
> +       struct pinctrl_state            *pwm_disable_state;
>  };
>  =

>  #define clk_hw_to_dfll(_hw) container_of(_hw, struct tegra_dfll, dfll_cl=
k_hw)
> @@ -490,6 +505,36 @@ static void dfll_set_mode(struct tegra_dfll *td,
>  }
>  =

>  /*
> + * DVCO rate control
> + */
> +
> +static unsigned long get_dvco_rate_below(struct tegra_dfll *td, u8 out_m=
in)
> +{
> +       struct dev_pm_opp *opp;
> +       unsigned long rate, prev_rate;
> +       int uv, min_uv;
> +
> +       min_uv =3D td->lut_uv[out_min];
> +       for (rate =3D 0, prev_rate =3D 0; ; rate++) {
> +               rcu_read_lock();
> +               opp =3D dev_pm_opp_find_freq_ceil(td->soc->dev, &rate);
> +               if (IS_ERR(opp)) {
> +                       rcu_read_unlock();
> +                       break;
> +               }
> +               uv =3D dev_pm_opp_get_voltage(opp);
> +               rcu_read_unlock();
> +
> +               if (uv && uv > min_uv)
> +                       return prev_rate;
> +
> +               prev_rate =3D rate;
> +       }
> +
> +       return prev_rate;
> +}
> +
> +/*
>   * DFLL-to-I2C controller interface
>   */
>  =

> @@ -518,6 +563,118 @@ static int dfll_i2c_set_output_enabled(struct tegra=
_dfll *td, bool enable)
>         return 0;
>  }
>  =

> +
> +/*
> + * DFLL-to-PWM controller interface
> + */
> +
> +/**
> + * dfll_pwm_set_output_enabled - enable/disable PWM voltage requests
> + * @td: DFLL instance
> + * @enable: whether to enable or disable the PWM voltage requests
> + *
> + * Set the master enable control for PWM control value updates. If disab=
led,
> + * then the PWM signal is not driven. Also configure the PWM output pad
> + * to the approriate state.
> + */
> +static int dfll_pwm_set_output_enabled(struct tegra_dfll *td, bool enabl=
e)
> +{
> +       int ret;
> +       u32 val, div;
> +
> +       if (enable) {
> +               ret =3D pinctrl_select_state(td->pwm_pin, td->pwm_enable_=
state);
> +               if (ret < 0) {
> +                       dev_err(td->dev, "setting enable state failed\n");
> +                       return -EINVAL;
> +               }
> +               val =3D dfll_readl(td, DFLL_OUTPUT_CFG);
> +               val &=3D ~DFLL_OUTPUT_CFG_PWM_DIV_MASK;
> +               div =3D DIV_ROUND_UP(td->ref_rate, td->pwm_rate);
> +               val |=3D (div << DFLL_OUTPUT_CFG_PWM_DIV_SHIFT)
> +                               & DFLL_OUTPUT_CFG_PWM_DIV_MASK;
> +               dfll_writel(td, val, DFLL_OUTPUT_CFG);
> +               dfll_wmb(td);
> +
> +               val |=3D DFLL_OUTPUT_CFG_PWM_ENABLE;
> +               dfll_writel(td, val, DFLL_OUTPUT_CFG);
> +               dfll_wmb(td);
> +       } else {
> +               ret =3D pinctrl_select_state(td->pwm_pin, td->pwm_disable=
_state);
> +               if (ret < 0)
> +                       dev_warn(td->dev, "setting disable state failed\n=
");
> +
> +               val =3D dfll_readl(td, DFLL_OUTPUT_CFG);
> +               val &=3D ~DFLL_OUTPUT_CFG_PWM_ENABLE;
> +               dfll_writel(td, val, DFLL_OUTPUT_CFG);
> +               dfll_wmb(td);
> +       }
> +
> +       return 0;
> +}
> +/**
> + * dfll_set_force_output_value - set fixed value for force output
> + * @td: DFLL instance
> + * @out_val: value to force output
> + *
> + * Set the fixec value for force output, DFLL will output this value when
> + * force output is enabled.
> + */
> +static u32 dfll_set_force_output_value(struct tegra_dfll *td, u8 out_val)
> +{
> +       u32 val =3D dfll_readl(td, DFLL_OUTPUT_FORCE);
> +
> +       val =3D (val & DFLL_OUTPUT_FORCE_ENABLE) | (out_val & OUT_MASK);
> +       dfll_writel(td, val, DFLL_OUTPUT_FORCE);
> +       dfll_wmb(td);
> +
> +       return dfll_readl(td, DFLL_OUTPUT_FORCE);
> +}
> +
> +/**
> + * dfll_set_force_output_enabled - enable/disable force output
> + * @td: DFLL instance
> + * @enable: whether to enable or disable the force output
> + *
> + * Set the enable control for fouce output with fixed value.
> + */
> +static void dfll_set_force_output_enabled(struct tegra_dfll *td, bool en=
able)
> +{
> +       u32 val =3D dfll_readl(td, DFLL_OUTPUT_FORCE);
> +
> +       if (enable)
> +               val |=3D DFLL_OUTPUT_FORCE_ENABLE;
> +       else
> +               val &=3D ~DFLL_OUTPUT_FORCE_ENABLE;
> +
> +       dfll_writel(td, val, DFLL_OUTPUT_FORCE);
> +       dfll_wmb(td);
> +}
> +
> +/**
> + * dfll_i2c_set_output_enabled - enable/disable I2C PMIC voltage requests
> + * @td: DFLL instance
> + * @enable: whether to enable or disable the I2C voltage requests
> + *
> + * Set the master enable control for I2C control value updates. If disab=
led,
> + * then I2C control messages are inhibited, regardless of the DFLL mode.
> + */
> +static int dfll_force_output(struct tegra_dfll *td, unsigned int out_sel)
> +{
> +       u32 val;
> +
> +       if (out_sel > OUT_MASK)
> +               return -EINVAL;
> +
> +       val =3D dfll_set_force_output_value(td, out_sel);
> +       if ((td->mode < DFLL_CLOSED_LOOP) &&
> +           !(val & DFLL_OUTPUT_FORCE_ENABLE)) {
> +               dfll_set_force_output_enabled(td, true);
> +       }
> +
> +       return 0;
> +}
> +
>  /**
>   * dfll_load_lut - load the voltage lookup table
>   * @td: struct tegra_dfll *
> @@ -531,15 +688,15 @@ static void dfll_load_i2c_lut(struct tegra_dfll *td)
>         u32 val;
>  =

>         for (i =3D 0; i < MAX_DFLL_VOLTAGES; i++) {
> -               if (i < td->lut_min)
> -                       lut_index =3D td->lut_min;
> -               else if (i > td->lut_max)
> -                       lut_index =3D td->lut_max;
> +               if (i < td->lut_bottom)
> +                       lut_index =3D td->lut_bottom;
> +               else if (i > td->lut_size - 1)
> +                       lut_index =3D td->lut_size - 1;
>                 else
>                         lut_index =3D i;
>  =

>                 val =3D regulator_list_hardware_vsel(td->vdd_reg,
> -                                                    td->i2c_lut[lut_inde=
x]);
> +                                                    td->lut[lut_index]);
>                 __raw_writel(val, td->lut_base + i * 4);
>         }
>  =

> @@ -595,23 +752,53 @@ static void dfll_init_out_if(struct tegra_dfll *td)
>         u32 val;
>  =

>         td->lut_min =3D 0;
> -       td->lut_max =3D td->i2c_lut_size - 1;
> -       td->lut_safe =3D td->lut_min + 1;
> -
> -       dfll_i2c_writel(td, 0, DFLL_OUTPUT_CFG);
> -       val =3D (td->lut_safe << DFLL_OUTPUT_CFG_SAFE_SHIFT) |
> -               (td->lut_max << DFLL_OUTPUT_CFG_MAX_SHIFT) |
> -               (td->lut_min << DFLL_OUTPUT_CFG_MIN_SHIFT);
> -       dfll_i2c_writel(td, val, DFLL_OUTPUT_CFG);
> -       dfll_i2c_wmb(td);
> -
> -       dfll_writel(td, 0, DFLL_OUTPUT_FORCE);
> -       dfll_i2c_writel(td, 0, DFLL_INTR_EN);
> -       dfll_i2c_writel(td, DFLL_INTR_MAX_MASK | DFLL_INTR_MIN_MASK,
> -                       DFLL_INTR_STS);
> -
> -       dfll_load_i2c_lut(td);
> -       dfll_init_i2c_if(td);
> +       td->lut_max =3D td->lut_size - 1;
> +       td->lut_safe =3D td->lut_min + (td->lut_min < td->lut_max ? 1 : 0=
);
> +
> +       if (td->pmu_if =3D=3D TEGRA_DFLL_PMU_PWM) {
> +               int vinit =3D td->reg_init_uV;
> +               int vstep =3D td->soc->alignment.step_uv;
> +               int vmin =3D td->lut_uv[0];
> +
> +               /* clear DFLL_OUTPUT_CFG before setting new value */
> +               dfll_writel(td, 0, DFLL_OUTPUT_CFG);
> +               dfll_wmb(td);
> +
> +               val =3D dfll_readl(td, DFLL_OUTPUT_CFG);
> +               val |=3D (td->lut_safe << DFLL_OUTPUT_CFG_SAFE_SHIFT) |
> +                      (td->lut_max << DFLL_OUTPUT_CFG_MAX_SHIFT) |
> +                      (td->lut_min << DFLL_OUTPUT_CFG_MIN_SHIFT);
> +               dfll_writel(td, val, DFLL_OUTPUT_CFG);
> +               dfll_wmb(td);
> +
> +               dfll_writel(td, 0, DFLL_OUTPUT_FORCE);
> +               dfll_i2c_writel(td, 0, DFLL_INTR_EN);
> +               dfll_i2c_writel(td, DFLL_INTR_MAX_MASK | DFLL_INTR_MIN_MA=
SK,
> +                               DFLL_INTR_STS);
> +
> +               /* set initial voltage */
> +               if ((vinit >=3D vmin) && vstep) {
> +                       unsigned int vsel;
> +
> +                       vsel =3D DIV_ROUND_UP((vinit - vmin), vstep);
> +                       dfll_force_output(td, vsel);
> +               }
> +       } else {
> +               dfll_i2c_writel(td, 0, DFLL_OUTPUT_CFG);
> +               val =3D (td->lut_safe << DFLL_OUTPUT_CFG_SAFE_SHIFT) |
> +                       (td->lut_max << DFLL_OUTPUT_CFG_MAX_SHIFT) |
> +                       (td->lut_min << DFLL_OUTPUT_CFG_MIN_SHIFT);
> +               dfll_i2c_writel(td, val, DFLL_OUTPUT_CFG);
> +               dfll_i2c_wmb(td);
> +
> +               dfll_writel(td, 0, DFLL_OUTPUT_FORCE);
> +               dfll_i2c_writel(td, 0, DFLL_INTR_EN);
> +               dfll_i2c_writel(td, DFLL_INTR_MAX_MASK | DFLL_INTR_MIN_MA=
SK,
> +                               DFLL_INTR_STS);
> +
> +               dfll_load_i2c_lut(td);
> +               dfll_init_i2c_if(td);
> +       }
>  }
>  =

>  /*
> @@ -637,11 +824,12 @@ static int find_lut_index_for_rate(struct tegra_dfl=
l *td, unsigned long rate)
>         if (IS_ERR(opp))
>                 return PTR_ERR(opp);
>  =

> -       uv =3D dev_pm_opp_get_voltage(opp);
> +       uv =3D dev_pm_opp_get_voltage(opp) / td->soc->alignment.step_uv;
> +
>         dev_pm_opp_put(opp);
>  =

> -       for (i =3D 0; i < td->i2c_lut_size; i++) {
> -               if (regulator_list_voltage(td->vdd_reg, td->i2c_lut[i]) =
=3D=3D uv)
> +       for (i =3D td->lut_bottom; i < td->lut_size; i++) {
> +               if ((td->lut_uv[i] / td->soc->alignment.step_uv) >=3D uv)
>                         return i;
>         }
>  =

> @@ -863,9 +1051,14 @@ static int dfll_lock(struct tegra_dfll *td)
>                         return -EINVAL;
>                 }
>  =

> -               dfll_i2c_set_output_enabled(td, true);
> +               if (td->pmu_if =3D=3D TEGRA_DFLL_PMU_PWM)
> +                       dfll_pwm_set_output_enabled(td, true);
> +               else
> +                       dfll_i2c_set_output_enabled(td, true);
> +
>                 dfll_set_mode(td, DFLL_CLOSED_LOOP);
>                 dfll_set_frequency_request(td, req);
> +               dfll_set_force_output_enabled(td, false);
>                 return 0;
>  =

>         default:
> @@ -889,7 +1082,10 @@ static int dfll_unlock(struct tegra_dfll *td)
>         case DFLL_CLOSED_LOOP:
>                 dfll_set_open_loop_config(td);
>                 dfll_set_mode(td, DFLL_OPEN_LOOP);
> -               dfll_i2c_set_output_enabled(td, false);
> +               if (td->pmu_if =3D=3D TEGRA_DFLL_PMU_PWM)
> +                       dfll_pwm_set_output_enabled(td, false);
> +               else
> +                       dfll_i2c_set_output_enabled(td, false);
>                 return 0;
>  =

>         case DFLL_OPEN_LOOP:
> @@ -1171,15 +1367,17 @@ static int attr_registers_show(struct seq_file *s=
, void *data)
>                 seq_printf(s, "[0x%02x] =3D 0x%08x\n", offs,
>                            dfll_i2c_readl(td, offs));
>  =

> -       seq_puts(s, "\nINTEGRATED I2C CONTROLLER REGISTERS:\n");
> -       offs =3D DFLL_I2C_CLK_DIVISOR;
> -       seq_printf(s, "[0x%02x] =3D 0x%08x\n", offs,
> -                  __raw_readl(td->i2c_controller_base + offs));
> -
> -       seq_puts(s, "\nLUT:\n");
> -       for (offs =3D 0; offs <  4 * MAX_DFLL_VOLTAGES; offs +=3D 4)
> +       if (td->pmu_if =3D=3D TEGRA_DFLL_PMU_I2C) {
> +               seq_puts(s, "\nINTEGRATED I2C CONTROLLER REGISTERS:\n");
> +               offs =3D DFLL_I2C_CLK_DIVISOR;
>                 seq_printf(s, "[0x%02x] =3D 0x%08x\n", offs,
> -                          __raw_readl(td->lut_base + offs));
> +                          __raw_readl(td->i2c_controller_base + offs));
> +
> +               seq_puts(s, "\nLUT:\n");
> +               for (offs =3D 0; offs <  4 * MAX_DFLL_VOLTAGES; offs +=3D=
 4)
> +                       seq_printf(s, "[0x%02x] =3D 0x%08x\n", offs,
> +                                  __raw_readl(td->lut_base + offs));
> +       }
>  =

>         return 0;
>  }
> @@ -1377,15 +1575,17 @@ static int dfll_init(struct tegra_dfll *td)
>   */
>  static int find_vdd_map_entry_exact(struct tegra_dfll *td, int uV)
>  {
> -       int i, n_voltages, reg_uV;
> +       int i, n_voltages, reg_mult, align_mult;
>  =

> +       align_mult =3D uV / td->soc->alignment.step_uv;
>         n_voltages =3D regulator_count_voltages(td->vdd_reg);
>         for (i =3D 0; i < n_voltages; i++) {
> -               reg_uV =3D regulator_list_voltage(td->vdd_reg, i);
> -               if (reg_uV < 0)
> +               reg_mult =3D regulator_list_voltage(td->vdd_reg, i) /
> +                                       td->soc->alignment.step_uv;
> +               if (reg_mult < 0)
>                         break;
>  =

> -               if (uV =3D=3D reg_uV)
> +               if (align_mult =3D=3D reg_mult)
>                         return i;
>         }
>  =

> @@ -1399,15 +1599,17 @@ static int find_vdd_map_entry_exact(struct tegra_=
dfll *td, int uV)
>   * */
>  static int find_vdd_map_entry_min(struct tegra_dfll *td, int uV)
>  {
> -       int i, n_voltages, reg_uV;
> +       int i, n_voltages, reg_mult, align_mult;
>  =

> +       align_mult =3D uV / td->soc->alignment.step_uv;
>         n_voltages =3D regulator_count_voltages(td->vdd_reg);
>         for (i =3D 0; i < n_voltages; i++) {
> -               reg_uV =3D regulator_list_voltage(td->vdd_reg, i);
> -               if (reg_uV < 0)
> +               reg_mult =3D regulator_list_voltage(td->vdd_reg, i) /
> +                                       td->soc->alignment.step_uv;
> +               if (reg_mult < 0)
>                         break;
>  =

> -               if (uV <=3D reg_uV)
> +               if (align_mult <=3D reg_mult)
>                         return i;
>         }
>  =

> @@ -1415,6 +1617,53 @@ static int find_vdd_map_entry_min(struct tegra_dfl=
l *td, int uV)
>         return -EINVAL;
>  }
>  =

> +/*
> + * Look-up table in h/w is ignored when PWM is used as DFLL interface to=
 PMIC.
> + * In this case closed loop output is controlling duty cycle directly. T=
he s/w
> + * look-up that maps PWM duty cycle to voltage is still built by this fu=
nction.
> + */
> +static int dfll_build_lut_pwm(struct tegra_dfll *td, int v_max)
> +{
> +       int i, reg_volt;
> +       unsigned long rate;
> +       u8 lut_bottom =3D MAX_DFLL_VOLTAGES;
> +       int v_min =3D td->soc->cvb->min_millivolts * 1000;
> +
> +       for (i =3D 0; i < MAX_DFLL_VOLTAGES; i++) {
> +               reg_volt =3D td->lut_uv[i];
> +
> +               /* since opp voltage is exact mv */
> +               reg_volt =3D (reg_volt / 1000) * 1000;
> +               if (reg_volt > v_max)
> +                       break;
> +
> +               td->lut[i] =3D i;
> +               if ((lut_bottom =3D=3D MAX_DFLL_VOLTAGES) && (reg_volt >=
=3D v_min))
> +                       lut_bottom =3D i;
> +       }
> +
> +       /* determine voltage boundaries */
> +       td->lut_size =3D i;
> +       if ((lut_bottom =3D=3D MAX_DFLL_VOLTAGES) ||
> +           (lut_bottom + 1 >=3D td->lut_size)) {
> +               dev_err(td->dev, "no voltage above DFLL minimum %d mV\n",
> +                       td->soc->cvb->min_millivolts);
> +               return -EINVAL;
> +       }
> +       td->lut_bottom =3D lut_bottom;
> +
> +       /* determine rate boundaries */
> +       rate =3D get_dvco_rate_below(td, td->lut_bottom);
> +       if (!rate) {
> +               dev_err(td->dev, "no opp below DFLL minimum voltage %d mV=
\n",
> +                       td->soc->cvb->min_millivolts);
> +               return -EINVAL;
> +       }
> +       td->dvco_rate_min =3D rate;
> +
> +       return 0;
> +}
> +
>  /**
>   * dfll_build_i2c_lut - build the I2C voltage register lookup table
>   * @td: DFLL instance
> @@ -1427,31 +1676,24 @@ static int find_vdd_map_entry_min(struct tegra_df=
ll *td, int uV)
>   *
>   * On success, fills in td->i2c_lut and returns 0, or -err on failure.
>   */
> -static int dfll_build_i2c_lut(struct tegra_dfll *td)
> +static int dfll_build_i2c_lut(struct tegra_dfll *td, int v_max)
>  {
> +       unsigned long rate;
>         int ret =3D -EINVAL;
> -       int j, v, v_max, v_opp;
> +       int j, v, v_opp;
>         int selector;
> -       unsigned long rate;
> -       struct dev_pm_opp *opp;
>         int lut;
>  =

> -       rate =3D ULONG_MAX;
> -       opp =3D dev_pm_opp_find_freq_floor(td->soc->dev, &rate);
> -       if (IS_ERR(opp)) {
> -               dev_err(td->dev, "couldn't get vmax opp, empty opp table?=
\n");
> -               goto out;
> -       }
> -       v_max =3D dev_pm_opp_get_voltage(opp);
> -       dev_pm_opp_put(opp);
> -
>         v =3D td->soc->cvb->min_millivolts * 1000;
>         lut =3D find_vdd_map_entry_exact(td, v);
>         if (lut < 0)
>                 goto out;
> -       td->i2c_lut[0] =3D lut;
> +       td->lut[0] =3D lut;
> +       td->lut_bottom =3D 0;
>  =

>         for (j =3D 1, rate =3D 0; ; rate++) {
> +               struct dev_pm_opp *opp;
> +
>                 opp =3D dev_pm_opp_find_freq_ceil(td->soc->dev, &rate);
>                 if (IS_ERR(opp))
>                         break;
> @@ -1470,32 +1712,61 @@ static int dfll_build_i2c_lut(struct tegra_dfll *=
td)
>                         selector =3D find_vdd_map_entry_min(td, v);
>                         if (selector < 0)
>                                 goto out;
> -                       if (selector !=3D td->i2c_lut[j - 1])
> -                               td->i2c_lut[j++] =3D selector;
> +                       if (selector !=3D td->lut[j - 1])
> +                               td->lut[j++] =3D selector;
>                 }
>  =

>                 v =3D (j =3D=3D MAX_DFLL_VOLTAGES - 1) ? v_max : v_opp;
>                 selector =3D find_vdd_map_entry_exact(td, v);
>                 if (selector < 0)
>                         goto out;
> -               if (selector !=3D td->i2c_lut[j - 1])
> -                       td->i2c_lut[j++] =3D selector;
> +               if (selector !=3D td->lut[j - 1])
> +                       td->lut[j++] =3D selector;
>  =

>                 if (v >=3D v_max)
>                         break;
>         }
> -       td->i2c_lut_size =3D j;
> +       td->lut_size =3D j;
>  =

>         if (!td->dvco_rate_min)
>                 dev_err(td->dev, "no opp above DFLL minimum voltage %d mV=
\n",
>                         td->soc->cvb->min_millivolts);
> -       else
> +       else {
>                 ret =3D 0;
> +               for (j =3D 0; j < td->lut_size; j++)
> +                       td->lut_uv[j] =3D
> +                               regulator_list_voltage(td->vdd_reg,
> +                                                      td->lut[j]);
> +       }
>  =

>  out:
>         return ret;
>  }
>  =

> +static int dfll_build_lut(struct tegra_dfll *td)
> +{
> +       unsigned long rate;
> +       struct dev_pm_opp *opp;
> +       int v_max;
> +
> +       rcu_read_lock();
> +
> +       rate =3D ULONG_MAX;
> +       opp =3D dev_pm_opp_find_freq_floor(td->soc->dev, &rate);
> +       if (IS_ERR(opp)) {
> +               dev_err(td->dev, "couldn't get vmax opp, empty opp table?=
\n");
> +               return -EINVAL;
> +       }
> +       v_max =3D dev_pm_opp_get_voltage(opp);
> +
> +       rcu_read_unlock();
> +
> +       if (td->pmu_if =3D=3D TEGRA_DFLL_PMU_PWM) {
> +               return dfll_build_lut_pwm(td, v_max);
> +       } else
> +               return dfll_build_i2c_lut(td, v_max);
> +}
> +
>  /**
>   * read_dt_param - helper function for reading required parameters from =
the DT
>   * @td: DFLL instance
> @@ -1554,12 +1825,55 @@ static int dfll_fetch_i2c_params(struct tegra_dfl=
l *td)
>         }
>         td->i2c_reg =3D vsel_reg;
>  =

> -       ret =3D dfll_build_i2c_lut(td);
> -       if (ret) {
> -               dev_err(td->dev, "couldn't build I2C LUT\n");
> +       return 0;
> +}
> +
> +static int dfll_fetch_pwm_params(struct tegra_dfll *td)
> +{
> +       int ret, i;
> +       u32 pwm_period;
> +
> +       if (!td->soc->alignment.step_uv || !td->soc->alignment.offset_uv)=
 {
> +               dev_err(td->dev, "Missing step or alignment info for PWM =
regulator");
> +               return -EINVAL;
> +       }
> +       for (i =3D 0; i < MAX_DFLL_VOLTAGES; i++)
> +               td->lut_uv[i] =3D td->soc->alignment.offset_uv +
> +                               i * td->soc->alignment.step_uv;
> +
> +       ret =3D read_dt_param(td, "nvidia,init-uv", &td->reg_init_uV);
> +       if (!ret) {
> +               dev_err(td->dev, "couldn't get initialized voltage\n");
>                 return ret;
>         }
>  =

> +       ret =3D read_dt_param(td, "nvidia,pwm-period", &pwm_period);
> +       if (!ret) {
> +               dev_err(td->dev, "couldn't get PWM period\n");
> +               return ret;
> +       }
> +       td->pwm_rate =3D (NSEC_PER_SEC / pwm_period) * (MAX_DFLL_VOLTAGES=
 - 1);
> +
> +       td->pwm_pin =3D devm_pinctrl_get(td->dev);
> +       if (IS_ERR(td->pwm_pin)) {
> +               dev_err(td->dev, "DT: missing pinctrl device\n");
> +               return PTR_ERR(td->pwm_pin);
> +       }
> +
> +       td->pwm_enable_state =3D pinctrl_lookup_state(td->pwm_pin,
> +                                                   "dvfs_pwm_enable");
> +       if (IS_ERR(td->pwm_enable_state)) {
> +               dev_err(td->dev, "DT: missing pwm enabled state\n");
> +               return PTR_ERR(td->pwm_enable_state);
> +        }
> +
> +        td->pwm_disable_state =3D pinctrl_lookup_state(td->pwm_pin,
> +                                                    "dvfs_pwm_disable");
> +       if (IS_ERR(td->pwm_disable_state)) {
> +               dev_err(td->dev, "DT: missing pwm disabled state\n");
> +               return PTR_ERR(td->pwm_disable_state);
> +       }
> +
>         return 0;
>  }
>  =

> @@ -1625,12 +1939,6 @@ int tegra_dfll_register(struct platform_device *pd=
ev,
>  =

>         td->soc =3D soc;
>  =

> -       td->vdd_reg =3D devm_regulator_get(td->dev, "vdd-cpu");
> -       if (IS_ERR(td->vdd_reg)) {
> -               dev_err(td->dev, "couldn't get vdd_cpu regulator\n");
> -               return PTR_ERR(td->vdd_reg);
> -       }
> -
>         td->dvco_rst =3D devm_reset_control_get(td->dev, "dvco");
>         if (IS_ERR(td->dvco_rst)) {
>                 dev_err(td->dev, "couldn't get dvco reset\n");
> @@ -1643,10 +1951,27 @@ int tegra_dfll_register(struct platform_device *p=
dev,
>                 return ret;
>         }
>  =

> -       ret =3D dfll_fetch_i2c_params(td);
> +       if (of_property_read_bool(td->dev->of_node, "nvidia,pwm-to-pmic")=
) {
> +               td->pmu_if =3D TEGRA_DFLL_PMU_PWM;
> +               ret =3D dfll_fetch_pwm_params(td);
> +       } else  {
> +               td->vdd_reg =3D devm_regulator_get(td->dev, "vdd-cpu");
> +               if (IS_ERR(td->vdd_reg)) {
> +                       dev_err(td->dev, "couldn't get vdd_cpu regulator\=
n");
> +                       return PTR_ERR(td->vdd_reg);
> +               }
> +               td->pmu_if =3D TEGRA_DFLL_PMU_I2C;
> +               ret =3D dfll_fetch_i2c_params(td);
> +       }
>         if (ret)
>                 return ret;
>  =

> +       ret =3D dfll_build_lut(td);
> +       if (ret) {
> +               dev_err(td->dev, "couldn't build LUT\n");
> +               return ret;
> +       }
> +
>         mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         if (!mem) {
>                 dev_err(td->dev, "no control register resource\n");
> diff --git a/drivers/clk/tegra/clk-dfll.h b/drivers/clk/tegra/clk-dfll.h
> index ed2ad88..b15c690 100644
> --- a/drivers/clk/tegra/clk-dfll.h
> +++ b/drivers/clk/tegra/clk-dfll.h
> @@ -21,6 +21,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>  #include <linux/types.h>
> +#include "cvb.h"
>  =

>  /**
>   * struct tegra_dfll_soc_data - SoC-specific hooks/integration for the D=
FLL driver
> @@ -35,6 +36,12 @@ struct tegra_dfll_soc_data {
>         struct device *dev;
>         unsigned long max_freq;
>         const struct cvb_table *cvb;
> +       struct rail_alignment alignment;
> +       unsigned int min_millivolts;
> +       unsigned int tune_high_min_millivolts;
> +       u32 tune0_low;
> +       u32 tune0_high;
> +       u32 tune1;
>  =

>         void (*init_clock_trimmers)(void);
>         void (*set_clock_trimmers_high)(void);
> -- =

> 1.9.1
> =

> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
