From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 9/9] arm/tegra: emc: device tree support
Date: Wed, 4 Jan 2012 16:35:21 -0800
Message-ID: <CAOesGMgq7g9-CEiC0E-hWKeLpGXSQ76bQ94-pkCaZYnRk+B+NQ@mail.gmail.com>
References: <1324599468-12845-1-git-send-email-olof@lixom.net>
	<1324599468-12845-10-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF17761F15B3@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17761F15B3-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 4, 2012 at 4:27 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> Olof Johansson wrote at Thursday, December 22, 2011 5:18 PM:
>> Add device tree support to the emc driver, filling in the platform d=
ata
>> based on the DT bindings.
>
>> diff --git a/arch/arm/mach-tegra/apbio.c b/arch/arm/mach-tegra/apbio=
=2Ec
> ...
>> =A0out_fail:
>> =A0 =A0 =A0 mutex_unlock(&tegra_apb_dma_lock);
>> - =A0 =A0 return true;
>> + =A0 =A0 return false;
>
> There's the Easter egg;-)

Yep, will move.

>
>> diff --git a/arch/arm/mach-tegra/tegra2_emc.c b/arch/arm/mach-tegra/=
tegra2_emc.c
>
>> +#ifdef CONFIG_OF
>> +static struct device_node *tegra_emc_ramcode_devnode(struct device_=
node *np)
>> +{
>> + =A0 =A0 struct device_node *iter;
>> + =A0 =A0 u32 reg;
>> +
>> + =A0 =A0 for_each_child_of_node(np, iter) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!of_property_read_u32(np, "nvidia,ram-=
code", &reg))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>
> I think that test is inverted; it returns 0 on success.

D'oh, thanks.

>
>> +static struct tegra_emc_pdata *tegra_emc_dt_parse_pdata(
>> + =A0 =A0 =A0 =A0 =A0 =A0 struct platform_device *pdev)
> ...
>> + =A0 =A0 pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KER=
NEL);
>> + =A0 =A0 pdata->tables =3D devm_kzalloc(&pdev->dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
sizeof(struct tegra_emc_table) * num_tables,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
GFP_KERNEL);
>
> May as well use sizeof(*pdata->tables) there too for consistency?

Sure, can change it.

>
>> +
>> + =A0 =A0 i =3D 0;
>> + =A0 =A0 for_each_child_of_node(tnp, iter) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 u32 prop;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D of_property_read_u32(iter, "clock-=
frequency", &prop);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (ret) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "no cl=
ock-frequency in %s\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iter->full=
_name);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>
> Not goto out?

If there's ever another child-node added by someone (by mistake or
otherwise), this would start to fail. I'd rather try to survive it and
just not use the malformed entries.

>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 pdata->tables[i].rate =3D prop;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D of_property_read_u32_array(iter, "=
nvidia,emc-registers",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0pdata->tables[i].regs,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0TEGRA_EMC_NUM_REGS);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (ret) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "malformed=
 emc-registers property in %s\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iter->full=
_name);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 i++;
>> + =A0 =A0 }
>> + =A0 =A0 pdata->num_tables =3D i;
>
> Or here, "if (i !=3D num_tables) error"?

Same, I'd rather try to use what we got.


>> +
>> +out:
>> + =A0 =A0 of_node_put(tnp);
>> + =A0 =A0 return pdata;
>> +}
>
> +static struct tegra_emc_pdata __devinit *tegra_emc_fill_pdata(struct=
 platform_device *pdev)
> +{
> ...
> + =A0 =A0 =A0 pdata->tables[0].rate =3D clk_get_rate(c);
> ...
> + =A0 =A0 =A0 dev_info(&pdev->dev, "no tables provided, using setting=
s for %ld kHz\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pdata->tables[0].rate / 2000);
>
> Is that right; I'm not sure if the /2 should be applied to what's sto=
red
> in .rate, or to the EMC clock value from clk_get_rate(). Similarly, i=
s
> the DT frequency the /2 version; there's no /2 in the DT parsing, but=
 I
> think I expect there to be.

The EMC clock is 2x the memory speed (on T20), so the above will print
out the actual speed of memory, not of the EMC block. The DT binding
is based on the EMC clock. I guess that could be considered
inconsistent, I can update the message to clarify.


-Olof
