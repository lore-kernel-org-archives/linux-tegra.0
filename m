From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v9 11/22] clk: tegra: clk-dfll: Add suspend and resume support
Date: Fri, 08 Nov 2019 13:20:14 -0800
Message-ID: <20191108212015.07BC720869@mail.kernel.org>
References: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com> <1565984527-5272-12-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565984527-5272-12-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jason@lakedaemon.net, jonathanh@nvidia.com, linus.walleij@linaro.org, marc.zyngier@arm.com, mark.rutland@arm.com, stefan@agner.ch, tglx@linutronix.de, thierry.reding@gmail.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Sowjanya Komatineni (2019-08-16 12:41:56)
> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index f8688c2ddf1a..c051d92c2bbf 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -1487,6 +1487,7 @@ static int dfll_init(struct tegra_dfll *td)
>         td->last_unrounded_rate =3D 0;
> =20
>         pm_runtime_enable(td->dev);
> +       pm_runtime_irq_safe(td->dev);

Why irq_safe? It would be good to mention it in the commit text or
something.

>         pm_runtime_get_sync(td->dev);
> =20
>         dfll_set_mode(td, DFLL_DISABLED);
> @@ -1513,6 +1514,61 @@ static int dfll_init(struct tegra_dfll *td)
>         return ret;
>  }
> =20
> +/**
> + * tegra_dfll_suspend - check DFLL is disabled
> + * @dev: DFLL device *
> + *
> + * DFLL clock should be disabled by the CPUFreq driver. So, make
> + * sure it is disabled and disable all clocks needed by the DFLL.
> + */
> +int tegra_dfll_suspend(struct device *dev)
> +{
> +       struct tegra_dfll *td =3D dev_get_drvdata(dev);
> +
> +       if (dfll_is_running(td)) {
> +               dev_err(td->dev, "DFLL still enabled while suspending\n");
> +               return -EBUSY;
> +       }
> +
> +       reset_control_assert(td->dvco_rst);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(tegra_dfll_suspend);
> +
> +/**
> + * tegra_dfll_resume - reinitialize DFLL on resume
> + * @dev: DFLL instance

I prefer this description for tegra_dfll_suspend's 'dev' argument.

> + *
> + * DFLL is disabled and reset during suspend and resume.
> + * So, reinitialize the DFLL IP block back for use.
> + * DFLL clock is enabled later in closed loop mode by CPUFreq
> + * driver before switching its clock source to DFLL output.
> + */
> +int tegra_dfll_resume(struct device *dev)
> +{
> +       struct tegra_dfll *td =3D dev_get_drvdata(dev);
> +
> +       reset_control_deassert(td->dvco_rst);
> +
> +       pm_runtime_get_sync(td->dev);
> +
> +       dfll_set_mode(td, DFLL_DISABLED);
> +       dfll_set_default_params(td);
