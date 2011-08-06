From: Colin Cross <ccross@google.com>
Subject: Re: [PATCH] i2c/tegra: I2C driver uses the suspend_noirq/resume_noirq
Date: Fri, 5 Aug 2011 21:33:31 -0700
Message-ID: <CAMbhsRScgMaTZ2e3a__OgOrrA6HN9_dkGuuNGaEfP+iqRdjyNQ@mail.gmail.com>
References: <1312586102-27907-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1312586102-27907-1-git-send-email-swarren@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Dilan Lee <dilee@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 5, 2011 at 4:15 PM, Stephen Warren <swarren@nvidia.com> wro=
te:
> From: Dilan Lee <dilee@nvidia.com>
>
> We found the register settings of wm8903(an audio codec) can't be mod=
ified
> in snd_soc_suspend since I2C bus has been suspended before snd_soc_su=
spend.
>
> Pop noise will occur when system resume from LP0 if the register sett=
ings of wm8903
> haven't be modified correctly in snd_soc_suspend.
>
> So, we use the suspend_noirq/resume_noirq callbacks to make sure I2C =
bus still
> operates while running snd_soc_suspend.
>
> Signed-off-by: Dilan Lee <dilee@nvidia.com>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> When applying this, you'll get a trivial merge conflict with the othe=
r
> i2c-tegra.c patch I just reposted titled "i2c: Tegra: Add of_match_ta=
ble".
> Just add the two lines to tegra_i2c_driver.driver in whichever order =
you
> prefer:-).
>
> =A0drivers/i2c/busses/i2c-tegra.c | =A0 19 +++++++++++++------
> =A01 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-=
tegra.c
> index 0c6e840..3d2bf19 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -687,8 +687,9 @@ static int tegra_i2c_remove(struct platform_devic=
e *pdev)
> =A0}
>
> =A0#ifdef CONFIG_PM
> -static int tegra_i2c_suspend(struct platform_device *pdev, pm_messag=
e_t state)
> +static int tegra_i2c_suspend_noirq(struct device *dev)
> =A0{
> + =A0 =A0 =A0 struct platform_device *pdev =3D to_platform_device(dev=
);
> =A0 =A0 =A0 =A0struct tegra_i2c_dev *i2c_dev =3D platform_get_drvdata=
(pdev);
>
> =A0 =A0 =A0 =A0i2c_lock_adapter(&i2c_dev->adapter);
> @@ -698,8 +699,9 @@ static int tegra_i2c_suspend(struct platform_devi=
ce *pdev, pm_message_t state)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> -static int tegra_i2c_resume(struct platform_device *pdev)
> +static int tegra_i2c_resume_noirq(struct device *dev)
> =A0{
> + =A0 =A0 =A0 struct platform_device *pdev =3D to_platform_device(dev=
);
> =A0 =A0 =A0 =A0struct tegra_i2c_dev *i2c_dev =3D platform_get_drvdata=
(pdev);
> =A0 =A0 =A0 =A0int ret;
>
> @@ -718,18 +720,23 @@ static int tegra_i2c_resume(struct platform_dev=
ice *pdev)
>
> =A0 =A0 =A0 =A0return 0;
> =A0}
> +
> +static const struct dev_pm_ops tegra_i2c_dev_pm_ops =3D {
> + =A0 =A0 =A0 .suspend_noirq =3D tegra_i2c_suspend_noirq,
> + =A0 =A0 =A0 .resume_noirq =3D tegra_i2c_resume_noirq,
> +};
> +#define TEGRA_I2C_DEV_PM_OPS (&tegra_i2c_dev_pm_ops)
> +#else
> +#define TEGRA_I2C_DEV_PM_OPS NULL
> =A0#endif
>
> =A0static struct platform_driver tegra_i2c_driver =3D {
> =A0 =A0 =A0 =A0.probe =A0 =3D tegra_i2c_probe,
> =A0 =A0 =A0 =A0.remove =A0=3D tegra_i2c_remove,
> -#ifdef CONFIG_PM
> - =A0 =A0 =A0 .suspend =3D tegra_i2c_suspend,
> - =A0 =A0 =A0 .resume =A0=3D tegra_i2c_resume,
> -#endif
> =A0 =A0 =A0 =A0.driver =A0=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0=3D "tegra-i2c",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =3D THIS_MODULE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pm =A0 =A0=3D TEGRA_I2C_DEV_PM_OPS,
> =A0 =A0 =A0 =A0},
> =A0};
>
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

NAK - moving the suspend order around is not the correct way to solve
this.  If wm8903 needs to talk to the i2c bus in its suspend handler,
it needs to be child device on the i2c bus.  suspend_noirq is for
devices that must suspend with system irqs turned off, not for
ordering suspend handlers.
