From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2] i2c: tegra: Add i2c support
Date: Sun, 20 Feb 2011 20:37:29 -0800
Message-ID: <AANLkTi=ia1FGur6mrVuE2rOBGjjRYZ3A41mTq3qOowmS@mail.gmail.com>
References: <AANLkTim0X=gUwYJmR+EAYjGamiJb7tgiVEjwqCEF0-L0@mail.gmail.com>
	<1298250861-27094-1-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298250861-27094-1-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

Just a couple of minor nits. I wouldn't worry about respinning just
for these comments, but if you end up doing it for other feedback, see
below.


-Olof

On Sun, Feb 20, 2011 at 5:14 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote=
:

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-=
tegra.c
> new file mode 100644
> index 0000000..3921f66
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -0,0 +1,700 @@
> +/*
> + * drivers/i2c/busses/i2c-tegra.c
> + *
> + * Copyright (C) 2010 Google, Inc.

2011?

[..]

> +/*
> + * i2c_writel and i2c_readl will offset the register if necessary to=
 talk
> + * to the I2C block inside the DVC block
> + */
> +static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_de=
v,
> + =A0 =A0 =A0 unsigned long reg)
> +{
> + =A0 =A0 =A0 if (i2c_dev->is_dvc)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg +=3D (reg >=3D I2C_TX_FIFO) ? 0x10 =
: 0x40;
> + =A0 =A0 =A0 return reg;
> +}
> +
> +static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
> + =A0 =A0 =A0 unsigned long reg)
> +{
> + =A0 =A0 =A0 writel(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev,=
 reg));
> +}
> +
> +static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned long re=
g)
> +{
> + =A0 =A0 =A0 return readl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev=
, reg));
> +}
> +
> +static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
> + =A0 =A0 =A0 unsigned long reg, int len)
> +{
> + =A0 =A0 =A0 writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg=
), data, len);
> +}
> +
> +static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
> + =A0 =A0 =A0 unsigned long reg, int len)
> +{
> + =A0 =A0 =A0 readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg)=
, data, len);
> +}


All of the above pass in i2c_dev to tegra_i2c_reg_addr, might as well
do the base addition in there.

> diff --git a/include/linux/i2c-tegra.h b/include/linux/i2c-tegra.h
> new file mode 100644
> index 0000000..9c85da4
> --- /dev/null
> +++ b/include/linux/i2c-tegra.h
> @@ -0,0 +1,25 @@
> +/*
> + * drivers/i2c/busses/i2c-tegra.c
> + *
> + * Copyright (C) 2010 Google, Inc.

2011?
