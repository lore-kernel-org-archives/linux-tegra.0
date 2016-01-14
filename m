From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1 05/10] thermal: tegra: add sysfs to dump registers
Date: Thu, 14 Jan 2016 19:01:33 +0800
Message-ID: <5697800D.7060207@nvidia.com>
References: <1452672007-330-1-git-send-email-wni@nvidia.com> <20160113151740.GE2588@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160113151740.GE2588@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2016=E5=B9=B401=E6=9C=8813=E6=97=A5 23:17, Thierry Reding wrote:
> * PGP Signed by an unknown key
>=20
> On Wed, Jan 13, 2016 at 04:00:07PM +0800, Wei Ni wrote:
>> Add sysfs interface to dump registers for debug.
>=20
> You're adding a debugfs interface here, not sysfs.

Oh, sorry, should be debugfs.

>=20
>> diff --git a/drivers/thermal/tegra/tegra_soctherm.c b/drivers/therma=
l/tegra/tegra_soctherm.c
> [...]
>> +#ifdef CONFIG_DEBUG_FS
>> +static int regs_show(struct seq_file *s, void *data)
>> +{
>> +	struct platform_device *pdev =3D s->private;
>> +	struct tegra_soctherm *ts =3D platform_get_drvdata(pdev);
>> +	struct tegra_tsensor *tsensors =3D ts->tsensors;
>> +	u32 r, state;
>> +	int i;
>> +
>> +	seq_puts(s, "-----TSENSE (convert HW)-----\n");
>> +
>> +	for (i =3D 0; tsensors[i].name; i++) {
>> +		r =3D readl(ts->regs + tsensors[i].base + SENSOR_CONFIG1);
>> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG1_TEMP_ENABLE);
>> +		if (!state)
>> +			continue;
>> +
>> +		seq_printf(s, "%s: ", tsensors[i].name);
>> +
>> +		seq_printf(s, "En(%d) ", state);
>> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG1_TIDDQ_EN_MASK);
>> +		seq_printf(s, "tiddq(%d) ", state);
>> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG1_TEN_COUNT_MASK);
>> +		seq_printf(s, "ten_count(%d) ", state);
>> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG1_TSAMPLE_MASK);
>> +		seq_printf(s, "tsample(%d) ", state + 1);
>> +
>> +		r =3D readl(ts->regs + tsensors[i].base + SENSOR_STATUS1);
>> +		state =3D REG_GET_MASK(r, SENSOR_STATUS1_TEMP_VALID_MASK);
>> +		seq_printf(s, "Temp(%d/", state);
>> +		state =3D REG_GET_MASK(r, SENSOR_STATUS1_TEMP_MASK);
>> +		seq_printf(s, "%d) ", translate_temp(state));
>> +
>> +		r =3D readl(ts->regs + tsensors[i].base + SENSOR_STATUS0);
>> +		state =3D REG_GET_MASK(r, SENSOR_STATUS0_VALID_MASK);
>> +		seq_printf(s, "Capture(%d/", state);
>> +		state =3D REG_GET_MASK(r, SENSOR_STATUS0_CAPTURE_MASK);
>> +		seq_printf(s, "%d) ", state);
>> +
>> +		r =3D readl(ts->regs + tsensors[i].base + SENSOR_CONFIG0);
>> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG0_STOP);
>> +		seq_printf(s, "Stop(%d) ", state);
>> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG0_TALL_MASK);
>> +		seq_printf(s, "Tall(%d) ", state);
>> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG0_TCALC_OVER);
>> +		seq_printf(s, "Over(%d/", state);
>> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG0_OVER);
>> +		seq_printf(s, "%d/", state);
>> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG0_CPTR_OVER);
>> +		seq_printf(s, "%d) ", state);
>> +
>> +		r =3D readl(ts->regs + tsensors[i].base + SENSOR_CONFIG2);
>> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG2_THERMA_MASK);
>> +		seq_printf(s, "Therm_A/B(%d/", state);
>> +		state =3D REG_GET_MASK(r, SENSOR_CONFIG2_THERMB_MASK);
>> +		seq_printf(s, "%d)\n", (s16)state);
>> +	}
>=20
> This isn't really a register dump, it's a decoded form of the registe=
r
> contents. I think it'd be better to either provide a debugfs file wit=
h
> the raw register contents, perhaps with register name and offset, or =
a
> decoded version. Or both.

Yes, you are right, it's a decoded form of register contents.

>=20
>> +
>> +	r =3D readl(ts->regs + SENSOR_PDIV);
>> +	seq_printf(s, "PDIV: 0x%x\n", r);
>> +
>> +	r =3D readl(ts->regs + SENSOR_HOTSPOT_OFF);
>> +	seq_printf(s, "HOTSPOT: 0x%x\n", r);
>> +
>> +	seq_puts(s, "\n");
>> +	seq_puts(s, "-----SOC_THERM-----\n");
>=20
> I don't think these separators are any good. debugfs files are
> essentially for free, so if you have logical separation of the conten=
t,
> as indicated by the separator here, a better option would be to make
> these separate files.

This is the decoded form. To make it more readable, I add this separato=
rs, and I
will add more contents which should belong to it.
This debugfs file is something like:
root@tegra-ubuntu:/sys/kernel/debug/tegra_soctherm# cat regs
-----TSENSE (convert HW)-----
cpu0: En(1) tiddq(1) ten_count(1) tsample(120) Temp(1/26500) Capture(1/=
8471)
Stop(0) Tall(16300) Over(0/0/0) Therm_A/B(1683/-1687)
cpu1: En(1) tiddq(1) ten_count(1) tsample(120) Temp(1/25500) Capture(1/=
8653)
Stop(0) Tall(16300) Over(0/0/0) Therm_A/B(1800/-1850)
cpu2: En(1) tiddq(1) ten_count(1) tsample(120) Temp(1/28000) Capture(1/=
8386)
Stop(0) Tall(16300) Over(0/0/0) Therm_A/B(1709/-1693)
cpu3: En(1) tiddq(1) ten_count(1) tsample(120) Temp(1/26500) Capture(1/=
8402)
Stop(0) Tall(16300) Over(0/0/0) Therm_A/B(1732/-1723)
mem0: En(1) tiddq(1) ten_count(1) tsample(120) Temp(1/27000) Capture(1/=
8552)
Stop(0) Tall(16300) Over(0/0/0) Therm_A/B(1670/-1689)
mem1: En(1) tiddq(1) ten_count(1) tsample(120) Temp(1/25500) Capture(1/=
8691)
Stop(0) Tall(16300) Over(0/0/0) Therm_A/B(1911/-1976)
gpu: En(1) tiddq(1) ten_count(1) tsample(120) Temp(0/0) Capture(0/0) St=
op(0)
Tall(16300) Over(0/0/0) Therm_A/B(1714/-1730)
pllx: En(1) tiddq(1) ten_count(1) tsample(120) Temp(1/26500) Capture(1/=
8465)
Stop(0) Tall(16300) Over(0/0/0) Therm_A/B(1644/-1645)
PDIV: 0x8888
HOTSPOT: 0xa0500

-----SOC_THERM-----
Temperatures: CPU(28000)  GPU(29000)  PLLX(26500)  MEM(27000)

>=20
>> +	r =3D readl(ts->regs + SENSOR_TEMP1);
>> +	state =3D REG_GET_MASK(r, SENSOR_TEMP1_CPU_TEMP_MASK);
>> +	seq_printf(s, "Temperatures: CPU(%d) ", translate_temp(state));
>> +	state =3D REG_GET_MASK(r, SENSOR_TEMP1_GPU_TEMP_MASK);
>> +	seq_printf(s, " GPU(%d) ", translate_temp(state));
>> +	r =3D readl(ts->regs + SENSOR_TEMP2);
>> +	state =3D REG_GET_MASK(r, SENSOR_TEMP2_PLLX_TEMP_MASK);
>> +	seq_printf(s, " PLLX(%d) ", translate_temp(state));
>> +	state =3D REG_GET_MASK(r, SENSOR_TEMP2_MEM_TEMP_MASK);
>> +	seq_printf(s, " MEM(%d)\n", translate_temp(state));
>=20
> Isn't this something that the thermal core support already exports vi=
a
> some interface?

Hmm, yes, I add them to here so that we can check all HW information in
this file.

>=20
>> +static int soctherm_debug_init(struct platform_device *pdev)
>> +{
>> +	struct dentry *tegra_soctherm_root;
>> +
>> +	tegra_soctherm_root =3D debugfs_create_dir("tegra_soctherm", NULL)=
;
>=20
> You should check for potential failure here, otherwise you might end =
up
> in a situation where you create the soctherm files in the debugfs roo=
t,
> which is almost certainly not what you want.

Yes, you are right, will check the return value.

>=20
>> +	debugfs_create_file("regs", 0644, tegra_soctherm_root,
>> +			    pdev, &regs_fops);
>> +
>> +	return 0;
>> +}
>> +#else
>> +static inline int soctherm_debug_init(struct platform_device *pdev)
>> +{ return 0; }
>> +#endif
>> +
>>  int tegra_soctherm_probe(struct platform_device *pdev,
>>  			 struct tegra_tsensor *tsensors,
>>  			 const struct tegra_tsensor_group **ttgs,
>> @@ -154,6 +276,10 @@ int tegra_soctherm_probe(struct platform_device=
 *pdev,
>>  	if (!tegra)
>>  		return -ENOMEM;
>> =20
>> +	dev_set_drvdata(&pdev->dev, tegra);
>> +
>> +	tegra->tsensors =3D tsensors;
>> +
>>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>  	tegra->regs =3D devm_ioremap_resource(&pdev->dev, res);
>>  	if (IS_ERR(tegra->regs))
>> @@ -243,6 +369,8 @@ int tegra_soctherm_probe(struct platform_device =
*pdev,
>>  		tegra->thermctl_tzs[ttgs[i]->id] =3D tz;
>>  	}
>> =20
>> +	soctherm_debug_init(pdev);
>=20
> If you never check and don't care about the return value, I suggest
> making the soctherm_debugfs_init() function return void. You should
> still check for errors within the function to make sure you're not
> doing anything you shouldn't, but you can silently ignore errors if
> you don't care, or perhaps give an indication as to what failed with
> a dev_warn() or similar.

Yes, you are right, I will change to return void.

>=20
> Thierry
>=20
> * Unknown Key
> * 0x7F3EB3A1
>=20
