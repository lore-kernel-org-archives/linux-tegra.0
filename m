From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH 08/19] clk: tegra: dfll: round down voltages based on
 alignment
Date: Wed, 5 Dec 2018 11:11:14 +0200
Message-ID: <20181205091114.GF26056@pdeschrijver-desktop.Nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-9-josephl@nvidia.com>
 <20181204154618.GC26056@pdeschrijver-desktop.Nvidia.com>
 <1cbe2662-1b5e-8261-f0c1-04a760cb08c1@nvidia.com>
 <7f90eae3-42fe-e771-b2f0-421c617db11e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <7f90eae3-42fe-e771-b2f0-421c617db11e@nvidia.com>
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 05, 2018 at 02:51:07PM +0800, Joseph Lo wrote:
> On 12/5/18 2:20 PM, Joseph Lo wrote:
> > On 12/4/18 11:46 PM, Peter De Schrijver wrote:
> > > On Tue, Dec 04, 2018 at 05:25:37PM +0800, Joseph Lo wrote:
> > > > When generating the OPP table, the voltages are round down with the
> > > > alignment from the regulator. The alignment should be applied for
> > > > voltages look up as well.
> > > > =

> > > > Based on the work of Penny Chiu <pchiu@nvidia.com>.
> > > > =

> > > > Signed-off-by: Joseph Lo <josephl@nvidia.com>
> > > > ---
> > > > =A0 drivers/clk/tegra/clk-dfll.c | 26 +++++++++++++++-----------
> > > > =A0 1 file changed, 15 insertions(+), 11 deletions(-)
> > > > =

> > > > diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-d=
fll.c
> > > > index c294a2989f31..4a943c136d4d 100644
> > > > --- a/drivers/clk/tegra/clk-dfll.c
> > > > +++ b/drivers/clk/tegra/clk-dfll.c
> > > > @@ -804,17 +804,17 @@ static void dfll_init_out_if(struct
> > > > tegra_dfll *td)
> > > > =A0 static int find_lut_index_for_rate(struct tegra_dfll *td,
> > > > unsigned long rate)
> > > > =A0 {
> > > > =A0=A0=A0=A0=A0 struct dev_pm_opp *opp;
> > > > -=A0=A0=A0 int i, uv;
> > > > +=A0=A0=A0 int i, align_volt;
> > > > =A0=A0=A0=A0=A0 opp =3D dev_pm_opp_find_freq_ceil(td->soc->dev, &ra=
te);
> > > > =A0=A0=A0=A0=A0 if (IS_ERR(opp))
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 return PTR_ERR(opp);
> > > > -=A0=A0=A0 uv =3D dev_pm_opp_get_voltage(opp);
> > > > +=A0=A0=A0 align_volt =3D dev_pm_opp_get_voltage(opp) /
> > > > td->soc->alignment.step_uv;
> > > > =A0=A0=A0=A0=A0 dev_pm_opp_put(opp);
> > > > =A0=A0=A0=A0=A0 for (i =3D td->lut_bottom; i < td->lut_size; i++) {
> > > > -=A0=A0=A0=A0=A0=A0=A0 if (regulator_list_voltage(td->vdd_reg, td->=
lut[i]) =3D=3D uv)
> > > > +=A0=A0=A0=A0=A0=A0=A0 if ((td->lut_uv[i] / td->soc->alignment.step=
_uv) >=3D align_volt)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return i;
> > > > =A0=A0=A0=A0=A0 }
> > > > @@ -1532,15 +1532,17 @@ static int dfll_init(struct tegra_dfll *td)
> > > > =A0=A0 */
> > > =

> > > These 2 functions are only valid for I2C mode. We should probably add=
 a
> > > WARN_ON() in case they are called when PWM mode is used and return
> > > -EINVAL.
> > > =

> > =

> > Okay, will add that.
> > =

> Peter,
> =

> Sorry, just double check again. These 2 functions are used for generating
> LUT table for DFLL-I2C mode. They are only used in "dfll_build_i2c_lut"
> function. So I think it's fine. The WARN_ON for protection from PWM mode =
is
> not necessary.
> =


They are indeed not used today, but to prevent them from being used in
the future I was thinking it makes sense to add some form of protection
here.

Peter.

> =

> > =

> > > > =A0 static int find_vdd_map_entry_exact(struct tegra_dfll *td, int =
uV)
> > > > =A0 {
> > > > -=A0=A0=A0 int i, n_voltages, reg_uV;
> > > > +=A0=A0=A0 int i, n_voltages, reg_volt, align_volt;
> > > > +=A0=A0=A0 align_volt =3D uV / td->soc->alignment.step_uv;
> > > > =A0=A0=A0=A0=A0 n_voltages =3D regulator_count_voltages(td->vdd_reg=
);
> > > > =A0=A0=A0=A0=A0 for (i =3D 0; i < n_voltages; i++) {
> > > > -=A0=A0=A0=A0=A0=A0=A0 reg_uV =3D regulator_list_voltage(td->vdd_re=
g, i);
> > > > -=A0=A0=A0=A0=A0=A0=A0 if (reg_uV < 0)
> > > > +=A0=A0=A0=A0=A0=A0=A0 reg_volt =3D regulator_list_voltage(td->vdd_=
reg, i) /
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 td->soc->alignment.s=
tep_uv;
> > > > +=A0=A0=A0=A0=A0=A0=A0 if (reg_volt < 0)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> > > > -=A0=A0=A0=A0=A0=A0=A0 if (uV =3D=3D reg_uV)
> > > > +=A0=A0=A0=A0=A0=A0=A0 if (align_volt =3D=3D reg_volt)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return i;
> > > > =A0=A0=A0=A0=A0 }
> > > > @@ -1554,15 +1556,17 @@ static int
> > > > find_vdd_map_entry_exact(struct tegra_dfll *td, int uV)
> > > > =A0=A0 * */
> > > > =A0 static int find_vdd_map_entry_min(struct tegra_dfll *td, int uV)
> > > > =A0 {
> > > > -=A0=A0=A0 int i, n_voltages, reg_uV;
> > > > +=A0=A0=A0 int i, n_voltages, reg_volt, align_volt;
> > > > +=A0=A0=A0 align_volt =3D uV / td->soc->alignment.step_uv;
> > > > =A0=A0=A0=A0=A0 n_voltages =3D regulator_count_voltages(td->vdd_reg=
);
> > > > =A0=A0=A0=A0=A0 for (i =3D 0; i < n_voltages; i++) {
> > > > -=A0=A0=A0=A0=A0=A0=A0 reg_uV =3D regulator_list_voltage(td->vdd_re=
g, i);
> > > > -=A0=A0=A0=A0=A0=A0=A0 if (reg_uV < 0)
> > > > +=A0=A0=A0=A0=A0=A0=A0 reg_volt =3D regulator_list_voltage(td->vdd_=
reg, i) /
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 td->soc->alignment.s=
tep_uv;
> > > > +=A0=A0=A0=A0=A0=A0=A0 if (reg_volt < 0)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> > > > -=A0=A0=A0=A0=A0=A0=A0 if (uV <=3D reg_uV)
> > > > +=A0=A0=A0=A0=A0=A0=A0 if (align_volt <=3D reg_volt)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return i;
> > > > =A0=A0=A0=A0=A0 }
> > > > -- =

> > > > 2.19.2
> > > > =
