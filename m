From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V1 07/10] thermal: tegra: add thermtrip function
Date: Wed, 13 Jan 2016 16:48:18 +0100
Message-ID: <20160113154818.GG2588@ulmo>
References: <1452672033-432-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eVzOFob/8UvintSX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452672033-432-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: rui.zhang@intel.com, mikko.perttunen@kapsi.fi, swarren@wwwdotorg.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--eVzOFob/8UvintSX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2016 at 04:00:33PM +0800, Wei Ni wrote:
[...]
> diff --git a/drivers/thermal/tegra/tegra_soctherm.c b/drivers/thermal/teg=
ra/tegra_soctherm.c
[...]
> +/**
> + * enforce_temp_range() - check and enforce temperature range [min, max]
> + * @trip_temp: the trip temperature to check
> + *
> + * Checks and enforces the permitted temperature range that SOC_THERM
> + * HW can support This is
> + * done while taking care of precision.
> + *
> + * Return: The precision adjusted capped temperature in millicelsius.
> + */
> +static int enforce_temp_range(struct device *dev, int trip_temp)
> +{
> +	int temp;
> +
> +	temp =3D clamp_val(trip_temp, min_low_temp, max_high_temp);
> +	if (temp !=3D trip_temp)
> +		dev_info(dev, "soctherm: trip temp %d forced to %d\n",
> +			 trip_temp, temp);

I prefer unabbreviated text in log messages, especially non-debug
messages, so something like this would be more appropriate in my
opinion:

	"soctherm: trip temperature %d forced to %d\n"

> +/**
> + * tegra_soctherm_thermtrip() - configure thermal shutdown from DT data
> + * @dev: struct device * of the SOC_THERM instance
> + *
> + * Configure the SOC_THERM "THERMTRIP" feature, using data from DT.
> + * After it's been configured, THERMTRIP will take action when the
> + * configured SoC thermal sensor group reaches a certain temperature.
> + *
> + * SOC_THERM registers are in the VDD_SOC voltage domain.  This means
> + * that SOC_THERM THERMTRIP programming does not survive an LP0/SC7
> + * transition, unless this driver has been modified to save those
> + * registers before entering SC7 and restore them upon exiting SC7.
> + *
> + * Return: 0 upon success, or a negative error code on failure.
> + * "Success" does not mean that thermtrip was enabled; it could also
> + * mean that no "thermtrip" node was found in DT.  THERMTRIP has been
> + * enabled successfully when a message similar to this one appears on
> + * the serial console: "thermtrip: will shut down when sensor group
> + * XXX reaches YYYYYY millidegrees C"
> + */
> +static int tegra_soctherm_thermtrip(struct device *dev)
> +{
> +	struct tegra_soctherm *ts =3D dev_get_drvdata(dev);
> +	const struct tegra_tsensor_group **ttgs =3D  ts->sensor_groups;

Extra space after '=3D'.

> +	struct device_node *dn;

np would be a more idiomatic variable name for struct device_node *.

> +	int i;

This can be unsigned int.

> +
> +	dn =3D of_find_node_by_name(dev->of_node, "hw-trips");
> +	if (!dn) {
> +		dev_info(dev, "thermtrip: no DT node - not enabling\n");
> +		return -ENODEV;
> +	}
> +
> +	for (i =3D 0; i < TEGRA124_SOCTHERM_SENSOR_NUM; ++i) {

Should this not be parameterized based on the number of groups an SoC
generation actually supports? It might be the same on Tegra210 and
Tegra124, but might just as well change in the next generation, so this
seems odd.

> +		const struct tegra_tsensor_group *sg =3D ttgs[i];
> +		struct device_node *sgdn;
> +		u32 temperature;
> +		int r;
> +
> +		sgdn =3D of_find_node_by_name(dn, sg->name);
> +		if (!sgdn) {
> +			dev_info(dev,
> +				 "thermtrip: %s: skip due to no configuration\n",
> +				 sg->name);

Perhaps: "thermtrip: %s: no configuration found, skipping\n"?

> +			continue;
> +		}
> +
> +		r =3D of_property_read_u32(sgdn, "therm-temp", &temperature);
> +		if (r) {
> +			dev_err(dev,
> +				"thermtrip: %s: missing temperature property\n",

"missing shutdown temperature"? Or "shutdown-temperature property not
found"?

>  #ifdef CONFIG_DEBUG_FS
> +static const struct tegra_tsensor_group *find_sensor_group_by_id(
> +						struct tegra_soctherm *ts,
> +						int id)

That's an odd way to wrap lines. A more idiomatic way would be:

	static const struct tegra_tsensor_group *
	find_sensor_group_by_id(struct tegra_soctherm *ts, int id)

Also struct tegra_tsensor.id is u8, perhaps id should be u8 here as
well.

> +{
> +	int i;

Can be unsigned int.

> +
> +	if ((id < 0) || (id > TEGRA124_SOCTHERM_SENSOR_NUM))

If you make id u8, there's no need for the first check.

> +static int thermtrip_read(struct platform_device *pdev,
> +			  int id, u32 *temp)

Same comment about the id parameter.

> +{
> +	struct tegra_soctherm *ts =3D platform_get_drvdata(pdev);
> +	const struct tegra_tsensor_group *sg;
> +	u32 state;
> +	int r;

r is used to store the return value of readl(), so it should be u32.

> +
> +	sg =3D find_sensor_group_by_id(ts, id);
> +	if (IS_ERR(sg)) {
> +		dev_err(&pdev->dev, "Read thermtrip failed\n");
> +		return -EINVAL;
> +	}
> +
> +	r =3D readl(ts->regs + THERMCTL_THERMTRIP_CTL);
> +	state =3D REG_GET_MASK(r, sg->thermtrip_threshold_mask);
> +	state *=3D sg->thresh_grain;
> +	*temp =3D state;
> +
> +	return 0;
> +}
> +
> +static int thermtrip_write(struct platform_device *pdev,
> +			   int id, int temp)

u8 id?

> +{
> +	struct tegra_soctherm *ts =3D platform_get_drvdata(pdev);
> +	const struct tegra_tsensor_group *sg;
> +	u32 state;
> +	int r;

I'd lean towards adding another variable, say "err" to store the return
value from functions and make that int. Then you can make r a u32 since
it stores the result of a 32-bit register read.

[...]
>  static int regs_show(struct seq_file *s, void *data)
>  {
>  	struct platform_device *pdev =3D s->private;
>  	struct tegra_soctherm *ts =3D platform_get_drvdata(pdev);
>  	struct tegra_tsensor *tsensors =3D ts->tsensors;
> +	const struct tegra_tsensor_group **ttgs =3D ts->sensor_groups;
>  	u32 r, state;
>  	int i;
> =20
> @@ -229,6 +466,17 @@ static int regs_show(struct seq_file *s, void *data)
>  	state =3D REG_GET_MASK(r, SENSOR_TEMP2_MEM_TEMP_MASK);
>  	seq_printf(s, " MEM(%d)\n", translate_temp(state));
> =20
> +	r =3D readl(ts->regs + THERMCTL_THERMTRIP_CTL);
> +	state =3D REG_GET_MASK(r, ttgs[0]->thermtrip_any_en_mask);
> +	seq_printf(s, "ThermTRIP ANY En(%d)\n", state);

The spelling here is inconsistent with the other text in this file.
Could this be rewritten to use a more consistent style that might at the
same time be easier to parse? I'm thinking something like a list of
"key: value" strings. Or, like I said earlier, maybe split this up into
more files to make it less complicated to read.

> +	for (i =3D 0; i < TEGRA124_SOCTHERM_SENSOR_NUM; i++) {
> +		state =3D REG_GET_MASK(r, ttgs[i]->thermtrip_enable_mask);
> +		seq_printf(s, "     %s En(%d) ", ttgs[i]->name, state);
> +		state =3D REG_GET_MASK(r, ttgs[i]->thermtrip_threshold_mask);
> +		state *=3D ttgs[i]->thresh_grain;
> +		seq_printf(s, "Thresh(%d)\n", state);
> +	}
> +
>  	return 0;
>  }
> =20
> @@ -251,6 +499,12 @@ static int soctherm_debug_init(struct platform_devic=
e *pdev)
>  	tegra_soctherm_root =3D debugfs_create_dir("tegra_soctherm", NULL);
>  	debugfs_create_file("regs", 0644, tegra_soctherm_root,
>  			    pdev, &regs_fops);
> +	debugfs_create_file("cpu_thermtrip", S_IRUGO | S_IWUSR,
> +			    tegra_soctherm_root, pdev, &cpu_thermtrip_fops);
> +	debugfs_create_file("gpu_thermtrip", S_IRUGO | S_IWUSR,
> +			    tegra_soctherm_root, pdev, &gpu_thermtrip_fops);
> +	debugfs_create_file("pll_thermtrip", S_IRUGO | S_IWUSR,
> +			    tegra_soctherm_root, pdev, &pll_thermtrip_fops);

Perhaps create a subdirectory named "thermtrip" and add "cpu", "gpu" and
"pll" files in it for better grouping?

Thierry

--eVzOFob/8UvintSX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWlnG/AAoJEN0jrNd/PrOhf3EP/jtYxGM+HFkKi8IIAIhD816q
vWy//5Ie6QAptCsgGXYqaUTthzlla5GsMTFNq6k4TK/i+e6MpmVBOcckj9nvg5NM
D2VSdp4LqtGgd+ziA+55Q8zPqN9skdVpiU8wGdTkgR/j6K63my4F8yz4HVwdUFTG
C3r8A5UZiwWYnHim29m+R4cD8uYDw92u0Fz3mPaGX4JVuAI+g3Sb8JjwGDgc/PfI
GdnTWneivKIRDZ1lqxbx982aeDLNr/ZuVlBXjzOezOVaSo8LZ4sbZwAH22F9ofUm
sFmHvP6xK7KLvuuiBmWh5ioF/2jEA2/+z5+NMR6ns0JLVcwQ6beeuCWMM3POix70
EdW1qhnQi/+WyD4Entio7T9saGhgTburu2XkJtUjzYOp2mTOgXB4V0jeNcyKpvas
iXJlGBfluhlbkBRNTzQ+mmhRano3pNUuBZVUUIPQQT4xsocnBo4NpAW+MAwI27eG
wpJ9tCibWu+D9cvKiUSlguJL+DcVQ5pL9mWDyL08H/eXnqYas7ClLzML9iaQNOZ3
EagRflEulX24YSQlEkH1qXSoMo3JIdZMWDstzOXCsJwaNR2+4cnzHyOydc64vdOI
XOYNsKD6i7ywGNU0WHvxVtN8oNPHJTEQIleu+e8BsCvVKjpg2Va9bP6/gMURubNT
cbWr98zFiOvCn17NT4W/
=HI7z
-----END PGP SIGNATURE-----

--eVzOFob/8UvintSX--
