From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V2 03/12] clk: tegra: save and restore PLLs state for system
Date: Wed, 29 May 2019 16:28:09 -0700
Message-ID: <20190529232810.14A5224366@mail.kernel.org>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com> <1559084936-4610-4-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559084936-4610-4-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jason@lakedaemon.net, jonathanh@nvidia.com, linus.walleij@linaro.org, marc.zyngier@arm.com, mark.rutland@arm.com, stefan@agner.ch, tglx@linutronix.de, thierry.reding@gmail.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Sowjanya Komatineni (2019-05-28 16:08:47)
> This patch has implementation of saving and restoring PLL's state to
> support system suspend and resume operations.

Can you provide some more background on _why_ this patch should exist?
That's typically what gets written in the commit text.

>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-divider.c | 19 ++++++++
>  drivers/clk/tegra/clk-pll-out.c | 25 +++++++++++
>  drivers/clk/tegra/clk-pll.c     | 99 ++++++++++++++++++++++++++++++++---=
------
>  drivers/clk/tegra/clk.h         |  9 ++++
>  4 files changed, 132 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divi=
der.c
> index 2a1822a22740..718694727042 100644
> --- a/drivers/clk/tegra/clk-divider.c
> +++ b/drivers/clk/tegra/clk-divider.c
> @@ -14,6 +14,7 @@
>   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
> =20
> +#include <linux/clk.h>
>  #include <linux/kernel.h>
>  #include <linux/io.h>
>  #include <linux/err.h>
> @@ -179,3 +180,21 @@ struct clk *tegra_clk_register_mc(const char *name, =
const char *parent_name,
>                                           reg, 16, 1, CLK_DIVIDER_READ_ON=
LY,
>                                           mc_div_table, lock);
>  }
> +
> +#if defined(CONFIG_PM_SLEEP)
> +void tegra_clk_divider_resume(struct clk_hw *hw, unsigned long rate)
> +{
> +       struct clk_hw *parent =3D clk_hw_get_parent(hw);
> +       unsigned long parent_rate;
> +
> +       if (IS_ERR(parent)) {

Will this ever happen? Collapse the WARN_ON into the if please:

	if (WARN_ON(IS_ERR(parent)))

> +               WARN_ON(1);
> +               return;
> +       }
> +
> +       parent_rate =3D clk_hw_get_rate(parent);
> +
> +       if (clk_frac_div_set_rate(hw, rate, parent_rate) < 0)
> +               WARN_ON(1);
> +}
> +#endif
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 09bccbb9640c..e4d124cc5657 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -841,6 +841,15 @@ int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll,=
 u8 p_div);
>  int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
>                  u8 frac_width, u8 flags);
> =20
> +#ifdef CONFIG_PM_SLEEP

Can you remove this ifdef? It just complicates compilation testing.

> +void tegra_clk_pll_resume(struct clk *c, unsigned long rate);
> +void tegra_clk_divider_resume(struct clk_hw *hw, unsigned long rate);
> +void tegra_clk_pll_out_resume(struct clk *clk, unsigned long rate);
> +void tegra_clk_plle_tegra210_resume(struct clk *c);
> +void tegra_clk_sync_state_pll(struct clk *c);
> +void tegra_clk_sync_state_pll_out(struct clk *clk);

Do these APIs need to operate on struct clk? Why can't they operate on
clk_hw or why can't we drive the suspend/resume sequence from the clk
provider driver itself?
