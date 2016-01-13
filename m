From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V1 05/10] thermal: tegra: add sysfs to dump registers
Date: Wed, 13 Jan 2016 16:17:40 +0100
Message-ID: <20160113151740.GE2588@ulmo>
References: <1452672007-330-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a1QUDc0q7S3U7/Jg"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452672007-330-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--a1QUDc0q7S3U7/Jg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2016 at 04:00:07PM +0800, Wei Ni wrote:
> Add sysfs interface to dump registers for debug.

You're adding a debugfs interface here, not sysfs.

> diff --git a/drivers/thermal/tegra/tegra_soctherm.c b/drivers/thermal/teg=
ra/tegra_soctherm.c
[...]
> +#ifdef CONFIG_DEBUG_FS
> +static int regs_show(struct seq_file *s, void *data)
> +{
> +	struct platform_device *pdev =3D s->private;
> +	struct tegra_soctherm *ts =3D platform_get_drvdata(pdev);
> +	struct tegra_tsensor *tsensors =3D ts->tsensors;
> +	u32 r, state;
> +	int i;
> +
> +	seq_puts(s, "-----TSENSE (convert HW)-----\n");
> +
> +	for (i =3D 0; tsensors[i].name; i++) {
> +		r =3D readl(ts->regs + tsensors[i].base + SENSOR_CONFIG1);
> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG1_TEMP_ENABLE);
> +		if (!state)
> +			continue;
> +
> +		seq_printf(s, "%s: ", tsensors[i].name);
> +
> +		seq_printf(s, "En(%d) ", state);
> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG1_TIDDQ_EN_MASK);
> +		seq_printf(s, "tiddq(%d) ", state);
> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG1_TEN_COUNT_MASK);
> +		seq_printf(s, "ten_count(%d) ", state);
> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG1_TSAMPLE_MASK);
> +		seq_printf(s, "tsample(%d) ", state + 1);
> +
> +		r =3D readl(ts->regs + tsensors[i].base + SENSOR_STATUS1);
> +		state =3D REG_GET_MASK(r, SENSOR_STATUS1_TEMP_VALID_MASK);
> +		seq_printf(s, "Temp(%d/", state);
> +		state =3D REG_GET_MASK(r, SENSOR_STATUS1_TEMP_MASK);
> +		seq_printf(s, "%d) ", translate_temp(state));
> +
> +		r =3D readl(ts->regs + tsensors[i].base + SENSOR_STATUS0);
> +		state =3D REG_GET_MASK(r, SENSOR_STATUS0_VALID_MASK);
> +		seq_printf(s, "Capture(%d/", state);
> +		state =3D REG_GET_MASK(r, SENSOR_STATUS0_CAPTURE_MASK);
> +		seq_printf(s, "%d) ", state);
> +
> +		r =3D readl(ts->regs + tsensors[i].base + SENSOR_CONFIG0);
> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG0_STOP);
> +		seq_printf(s, "Stop(%d) ", state);
> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG0_TALL_MASK);
> +		seq_printf(s, "Tall(%d) ", state);
> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG0_TCALC_OVER);
> +		seq_printf(s, "Over(%d/", state);
> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG0_OVER);
> +		seq_printf(s, "%d/", state);
> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG0_CPTR_OVER);
> +		seq_printf(s, "%d) ", state);
> +
> +		r =3D readl(ts->regs + tsensors[i].base + SENSOR_CONFIG2);
> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG2_THERMA_MASK);
> +		seq_printf(s, "Therm_A/B(%d/", state);
> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG2_THERMB_MASK);
> +		seq_printf(s, "%d)\n", (s16)state);
> +	}

This isn't really a register dump, it's a decoded form of the register
contents. I think it'd be better to either provide a debugfs file with
the raw register contents, perhaps with register name and offset, or a
decoded version. Or both.

> +
> +	r =3D readl(ts->regs + SENSOR_PDIV);
> +	seq_printf(s, "PDIV: 0x%x\n", r);
> +
> +	r =3D readl(ts->regs + SENSOR_HOTSPOT_OFF);
> +	seq_printf(s, "HOTSPOT: 0x%x\n", r);
> +
> +	seq_puts(s, "\n");
> +	seq_puts(s, "-----SOC_THERM-----\n");

I don't think these separators are any good. debugfs files are
essentially for free, so if you have logical separation of the content,
as indicated by the separator here, a better option would be to make
these separate files.

> +	r =3D readl(ts->regs + SENSOR_TEMP1);
> +	state =3D REG_GET_MASK(r, SENSOR_TEMP1_CPU_TEMP_MASK);
> +	seq_printf(s, "Temperatures: CPU(%d) ", translate_temp(state));
> +	state =3D REG_GET_MASK(r, SENSOR_TEMP1_GPU_TEMP_MASK);
> +	seq_printf(s, " GPU(%d) ", translate_temp(state));
> +	r =3D readl(ts->regs + SENSOR_TEMP2);
> +	state =3D REG_GET_MASK(r, SENSOR_TEMP2_PLLX_TEMP_MASK);
> +	seq_printf(s, " PLLX(%d) ", translate_temp(state));
> +	state =3D REG_GET_MASK(r, SENSOR_TEMP2_MEM_TEMP_MASK);
> +	seq_printf(s, " MEM(%d)\n", translate_temp(state));

Isn't this something that the thermal core support already exports via
some interface?

> +static int soctherm_debug_init(struct platform_device *pdev)
> +{
> +	struct dentry *tegra_soctherm_root;
> +
> +	tegra_soctherm_root =3D debugfs_create_dir("tegra_soctherm", NULL);

You should check for potential failure here, otherwise you might end up
in a situation where you create the soctherm files in the debugfs root,
which is almost certainly not what you want.

> +	debugfs_create_file("regs", 0644, tegra_soctherm_root,
> +			    pdev, &regs_fops);
> +
> +	return 0;
> +}
> +#else
> +static inline int soctherm_debug_init(struct platform_device *pdev)
> +{ return 0; }
> +#endif
> +
>  int tegra_soctherm_probe(struct platform_device *pdev,
>  			 struct tegra_tsensor *tsensors,
>  			 const struct tegra_tsensor_group **ttgs,
> @@ -154,6 +276,10 @@ int tegra_soctherm_probe(struct platform_device *pde=
v,
>  	if (!tegra)
>  		return -ENOMEM;
> =20
> +	dev_set_drvdata(&pdev->dev, tegra);
> +
> +	tegra->tsensors =3D tsensors;
> +
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	tegra->regs =3D devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(tegra->regs))
> @@ -243,6 +369,8 @@ int tegra_soctherm_probe(struct platform_device *pdev,
>  		tegra->thermctl_tzs[ttgs[i]->id] =3D tz;
>  	}
> =20
> +	soctherm_debug_init(pdev);

If you never check and don't care about the return value, I suggest
making the soctherm_debugfs_init() function return void. You should
still check for errors within the function to make sure you're not
doing anything you shouldn't, but you can silently ignore errors if
you don't care, or perhaps give an indication as to what failed with
a dev_warn() or similar.

Thierry

--a1QUDc0q7S3U7/Jg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWlmqSAAoJEN0jrNd/PrOhQbUP/1oqaod/Dphez5B5nhop4lHi
A2qik9FSVVy8nZtNWPpQJU0AFGzeSGBHP6775xdhbmaKkHCjA4uSEfUYGIL3uc8U
P38MWPcgJXnQcP5rdVKQAJMr6SjQIbDvRQ6+YHgNVkPiIvPJLJyfrYrVCahFRIgL
Kd928k9WfWzKAU9+QpP4VdU7W9S5TIxrHjvGWd9AzVsaPPxS+fKMZoNlccwZXAHv
gdvUkOc8PN1Lic8LSGATZOR1pgIxoDSJdEWHiQz6RYi028MhLgXq8IcthO4+HgZ2
DFUPIE8AoliAyXMatCKSDgctyyrbm/IMspwZfdLqcM7HyIwon/uvHy3ykGk2PEH1
R3R4wPBV357H0e7pjPk31IYSOLdiEr/o7SnxIMdj8jvkyQRio5MnN8vFyjgt9Ni8
KPfCpFV2UZji11BvJ6NDJg3nw5fdvBdEl12tepr889PNUQBhPR+l7YUGfTSrT0WD
304BkJj7YD/2QwrBpCKeDotvj5f8IwjXmudBqh5+KPujZLD7DZn8OEHtU31ScwuE
kULjJSGOCJkRi/1oomHyl/4XCMX1mDY7Jk4Ev2K4M1aZiPxA/uGfmxN5bbJsxtAt
wLC1t4dY/eEZvlGQzjbPScHOy5A8p6+qXERTrnmF2D+bnsnN6BL95gPm8vVflrIC
ovdlKXxV9Po0FaItBNkm
=EZEZ
-----END PGP SIGNATURE-----

--a1QUDc0q7S3U7/Jg--
