From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 06/11] thermal: tegra: add a debugfs to show registers
Date: Mon, 25 Jan 2016 13:51:10 +0800
Message-ID: <56A5B7CE.8040300@nvidia.com>
References: <1453111437-12401-1-git-send-email-wni@nvidia.com> <20160121145033.GC32301@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160121145033.GC32301@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2016=E5=B9=B401=E6=9C=8821=E6=97=A5 22:50, Thierry Reding wrote:
> * PGP Signed by an unknown key
>=20
> On Mon, Jan 18, 2016 at 06:03:57PM +0800, Wei Ni wrote:
> [...]
>> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegr=
a/soctherm.c
> [...]
>> +static void soctherm_debug_init(struct platform_device *pdev)
>> +{
>> +	struct tegra_soctherm *tegra =3D platform_get_drvdata(pdev);
>> +	struct dentry *root, *file;
>> +
>> +	root =3D debugfs_create_dir("tegra_soctherm", NULL);
>=20
> Perhaps leave away the tegra_ prefix here? It's kind of redundant.

Ok, will remove the prefix.

>=20
>> +	if (!root) {
>> +		dev_err(&pdev->dev, "failed to create debugfs directory\n");
>> +		return;
>> +	}
>> +
>> +	tegra->debugfs_dir =3D root;
>> +
>> +	file =3D debugfs_create_file("regs", 0644, root, pdev, &regs_fops)=
;
>=20
> Can we call this something different, please? "summary" would be a
> better name, in my opinion.

How about to change to "reg_contents"

>=20
>> +	if (!file)
>> +		dev_err(&pdev->dev, "failed to create debugfs file\n");
>> +}
>> +#else
>> +static inline void soctherm_debug_init(struct platform_device *pdev=
)
>> +{ return 0; }
>=20
> Please follow the regular CodingStyle here, too:

Got it, will fix it.

>=20
> 	...
> 	{
> 		return 0;
> 	}
>=20
>> @@ -178,6 +309,10 @@ static int tegra_soctherm_probe(struct platform=
_device *pdev)
>>  	if (!tegra)
>>  		return -ENOMEM;
>> =20
>> +	dev_set_drvdata(&pdev->dev, tegra);
>> +
>> +	tegra->soc =3D soc;
>=20
> This looks odd here. Does this perhaps belong in one of the previous
> patches?

Sorry, I made a mistake when I rebased these patches.
Will fix it.

>=20
> Thierry
>=20
> * Unknown Key
> * 0x7F3EB3A1
>=20
