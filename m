From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH V1 07/10] thermal: tegra: add thermtrip function
Date: Fri, 15 Jan 2016 17:07:42 +0800
Message-ID: <5698B6DE.4000200@nvidia.com>
References: <1452672033-432-1-git-send-email-wni@nvidia.com> <20160113154818.GG2588@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160113154818.GG2588@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: rui.zhang@intel.com, mikko.perttunen@kapsi.fi, swarren@wwwdotorg.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 2016=E5=B9=B401=E6=9C=8813=E6=97=A5 23:48, Thierry Reding wrote:
> * PGP Signed by an unknown key
>=20
> On Wed, Jan 13, 2016 at 04:00:33PM +0800, Wei Ni wrote:
> [...]
>> diff --git a/drivers/thermal/tegra/tegra_soctherm.c b/drivers/therma=
l/tegra/tegra_soctherm.c
> [...]
>> +/**
>> + * enforce_temp_range() - check and enforce temperature range [min,=
 max]
>> + * @trip_temp: the trip temperature to check
>> + *
>> + * Checks and enforces the permitted temperature range that SOC_THE=
RM
>> + * HW can support This is
>> + * done while taking care of precision.
>> + *
>> + * Return: The precision adjusted capped temperature in millicelsiu=
s.
>> + */
>> +static int enforce_temp_range(struct device *dev, int trip_temp)
>> +{
>> +	int temp;
>> +
>> +	temp =3D clamp_val(trip_temp, min_low_temp, max_high_temp);
>> +	if (temp !=3D trip_temp)
>> +		dev_info(dev, "soctherm: trip temp %d forced to %d\n",
>> +			 trip_temp, temp);
>=20
> I prefer unabbreviated text in log messages, especially non-debug
> messages, so something like this would be more appropriate in my
> opinion:
>=20
> 	"soctherm: trip temperature %d forced to %d\n"

Sure, will change it.

>=20
>> +/**
>> + * tegra_soctherm_thermtrip() - configure thermal shutdown from DT =
data
>> + * @dev: struct device * of the SOC_THERM instance
>> + *
>> + * Configure the SOC_THERM "THERMTRIP" feature, using data from DT.
>> + * After it's been configured, THERMTRIP will take action when the
>> + * configured SoC thermal sensor group reaches a certain temperatur=
e.
>> + *
>> + * SOC_THERM registers are in the VDD_SOC voltage domain.  This mea=
ns
>> + * that SOC_THERM THERMTRIP programming does not survive an LP0/SC7
>> + * transition, unless this driver has been modified to save those
>> + * registers before entering SC7 and restore them upon exiting SC7.
>> + *
>> + * Return: 0 upon success, or a negative error code on failure.
>> + * "Success" does not mean that thermtrip was enabled; it could als=
o
>> + * mean that no "thermtrip" node was found in DT.  THERMTRIP has be=
en
>> + * enabled successfully when a message similar to this one appears =
on
>> + * the serial console: "thermtrip: will shut down when sensor group
>> + * XXX reaches YYYYYY millidegrees C"
>> + */
>> +static int tegra_soctherm_thermtrip(struct device *dev)
>> +{
>> +	struct tegra_soctherm *ts =3D dev_get_drvdata(dev);
>> +	const struct tegra_tsensor_group **ttgs =3D  ts->sensor_groups;
>=20
> Extra space after '=3D'.

Will fix it.

>=20
>> +	struct device_node *dn;
>=20
> np would be a more idiomatic variable name for struct device_node *.
>=20
>> +	int i;
>=20
> This can be unsigned int.

Yes, will fix it and other same items.

>=20
>> +
>> +	dn =3D of_find_node_by_name(dev->of_node, "hw-trips");
>> +	if (!dn) {
>> +		dev_info(dev, "thermtrip: no DT node - not enabling\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	for (i =3D 0; i < TEGRA124_SOCTHERM_SENSOR_NUM; ++i) {
>=20
> Should this not be parameterized based on the number of groups an SoC
> generation actually supports? It might be the same on Tegra210 and
> Tegra124, but might just as well change in the next generation, so th=
is
> seems odd.

Yes, I will use num_sensor_groups to handle it.

>=20
>> +		const struct tegra_tsensor_group *sg =3D ttgs[i];
>> +		struct device_node *sgdn;
>> +		u32 temperature;
>> +		int r;
>> +
>> +		sgdn =3D of_find_node_by_name(dn, sg->name);
>> +		if (!sgdn) {
>> +			dev_info(dev,
>> +				 "thermtrip: %s: skip due to no configuration\n",
>> +				 sg->name);
>=20
> Perhaps: "thermtrip: %s: no configuration found, skipping\n"?

Got it.

>=20
>> +			continue;
>> +		}
>> +
>> +		r =3D of_property_read_u32(sgdn, "therm-temp", &temperature);
>> +		if (r) {
>> +			dev_err(dev,
>> +				"thermtrip: %s: missing temperature property\n",
>=20
> "missing shutdown temperature"? Or "shutdown-temperature property not
> found"?

Will change it.

>=20
>>  #ifdef CONFIG_DEBUG_FS
>> +static const struct tegra_tsensor_group *find_sensor_group_by_id(
>> +						struct tegra_soctherm *ts,
>> +						int id)
>=20
> That's an odd way to wrap lines. A more idiomatic way would be:
>=20
> 	static const struct tegra_tsensor_group *
> 	find_sensor_group_by_id(struct tegra_soctherm *ts, int id)

Hmm, yes, I didn't notice it, will fix it.

>=20
> Also struct tegra_tsensor.id is u8, perhaps id should be u8 here as
> well.
>=20
>> +{
>> +	int i;
>=20
> Can be unsigned int.
>=20
>> +
>> +	if ((id < 0) || (id > TEGRA124_SOCTHERM_SENSOR_NUM))
>=20
> If you make id u8, there's no need for the first check.
>=20
>> +static int thermtrip_read(struct platform_device *pdev,
>> +			  int id, u32 *temp)
>=20
> Same comment about the id parameter.
>=20
>> +{
>> +	struct tegra_soctherm *ts =3D platform_get_drvdata(pdev);
>> +	const struct tegra_tsensor_group *sg;
>> +	u32 state;
>> +	int r;
>=20
> r is used to store the return value of readl(), so it should be u32.
>=20
>> +
>> +	sg =3D find_sensor_group_by_id(ts, id);
>> +	if (IS_ERR(sg)) {
>> +		dev_err(&pdev->dev, "Read thermtrip failed\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	r =3D readl(ts->regs + THERMCTL_THERMTRIP_CTL);
>> +	state =3D REG_GET_MASK(r, sg->thermtrip_threshold_mask);
>> +	state *=3D sg->thresh_grain;
>> +	*temp =3D state;
>> +
>> +	return 0;
>> +}
>> +
>> +static int thermtrip_write(struct platform_device *pdev,
>> +			   int id, int temp)
>=20
> u8 id?
>=20
>> +{
>> +	struct tegra_soctherm *ts =3D platform_get_drvdata(pdev);
>> +	const struct tegra_tsensor_group *sg;
>> +	u32 state;
>> +	int r;
>=20
> I'd lean towards adding another variable, say "err" to store the retu=
rn
> value from functions and make that int. Then you can make r a u32 sin=
ce
> it stores the result of a 32-bit register read.

Yes, you are right, will fix it.

>=20
> [...]
>>  static int regs_show(struct seq_file *s, void *data)
>>  {
>>  	struct platform_device *pdev =3D s->private;
>>  	struct tegra_soctherm *ts =3D platform_get_drvdata(pdev);
>>  	struct tegra_tsensor *tsensors =3D ts->tsensors;
>> +	const struct tegra_tsensor_group **ttgs =3D ts->sensor_groups;
>>  	u32 r, state;
>>  	int i;
>> =20
>> @@ -229,6 +466,17 @@ static int regs_show(struct seq_file *s, void *=
data)
>>  	state =3D REG_GET_MASK(r, SENSOR_TEMP2_MEM_TEMP_MASK);
>>  	seq_printf(s, " MEM(%d)\n", translate_temp(state));
>> =20
>> +	r =3D readl(ts->regs + THERMCTL_THERMTRIP_CTL);
>> +	state =3D REG_GET_MASK(r, ttgs[0]->thermtrip_any_en_mask);
>> +	seq_printf(s, "ThermTRIP ANY En(%d)\n", state);
>=20
> The spelling here is inconsistent with the other text in this file.
> Could this be rewritten to use a more consistent style that might at =
the
> same time be easier to parse? I'm thinking something like a list of
> "key: value" strings. Or, like I said earlier, maybe split this up in=
to
> more files to make it less complicated to read.

Sorry, what's the consistent type you mean?
The "ThermTRIP ANY En" is the bit THERMTRIP_ANY_EN_MASK of register
THERMCTL_THERMTRIP_CTL. How about "Thermtrip Any En"?
Since there have many registers, it's not good to split them into more =
files. As
I showed it in previous email, this file is decode form, it's easy to r=
ead and
check the HW status/registers.

>=20
>> +	for (i =3D 0; i < TEGRA124_SOCTHERM_SENSOR_NUM; i++) {
>> +		state =3D REG_GET_MASK(r, ttgs[i]->thermtrip_enable_mask);
>> +		seq_printf(s, "     %s En(%d) ", ttgs[i]->name, state);
>> +		state =3D REG_GET_MASK(r, ttgs[i]->thermtrip_threshold_mask);
>> +		state *=3D ttgs[i]->thresh_grain;
>> +		seq_printf(s, "Thresh(%d)\n", state);
>> +	}
>> +
>>  	return 0;
>>  }
>> =20
>> @@ -251,6 +499,12 @@ static int soctherm_debug_init(struct platform_=
device *pdev)
>>  	tegra_soctherm_root =3D debugfs_create_dir("tegra_soctherm", NULL)=
;
>>  	debugfs_create_file("regs", 0644, tegra_soctherm_root,
>>  			    pdev, &regs_fops);
>> +	debugfs_create_file("cpu_thermtrip", S_IRUGO | S_IWUSR,
>> +			    tegra_soctherm_root, pdev, &cpu_thermtrip_fops);
>> +	debugfs_create_file("gpu_thermtrip", S_IRUGO | S_IWUSR,
>> +			    tegra_soctherm_root, pdev, &gpu_thermtrip_fops);
>> +	debugfs_create_file("pll_thermtrip", S_IRUGO | S_IWUSR,
>> +			    tegra_soctherm_root, pdev, &pll_thermtrip_fops);
>=20
> Perhaps create a subdirectory named "thermtrip" and add "cpu", "gpu" =
and
> "pll" files in it for better grouping?

Ok, will do it.

>=20
> Thierry
>=20
> * Unknown Key
> * 0x7F3EB3A1
>=20
