From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 2/3] ARM: Tegra: Device Tree Support: Add i2c devices
Date: Thu, 12 May 2011 06:47:24 +0200
Message-ID: <BANLkTinvDRDfdGawFBb=OE8DqG_DW7L6qQ@mail.gmail.com>
References: <20110511231905.10362.12844.stgit@riker> <20110511232659.10362.45811.stgit@riker>
 <74CDBE0F657A3D45AFBB94109FB122FF04986AA2C5@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04986AA2C5-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, May 12, 2011 at 6:34 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> John Bonesio wrote at Wednesday, May 11, 2011 5:27 PM:
>> This patch initializes i2c controller devices in board-dt.c. The i2c=
 controller
>> is added to tegra250.dtsi so later on-board i2c devices can be found=
 and
>> initialized based on the device tree information.
>>...
>> diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/bo=
ard-dt.c
>>...
>> +#include <linux/i2c.h>
>> +#include <linux/i2c-tegra.h>
>
> I don't think those headers are needed now the platform data isn't se=
t up here.
>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c=
-tegra.c
>>...
>> @@ -598,6 +609,7 @@ static int tegra_i2c_probe(struct platform_devic=
e *pdev)
>> =A0 =A0 =A0 i2c_dev->adapter.algo =3D &tegra_i2c_algo;
>> =A0 =A0 =A0 i2c_dev->adapter.dev.parent =3D &pdev->dev;
>> =A0 =A0 =A0 i2c_dev->adapter.nr =3D pdev->id;
>> + =A0 =A0 i2c_dev->adapter.dev.of_node =3D of_node_get(pdev->dev.of_=
node);
>
> It seems like users of this of_node (i.e. the probe function) could j=
ust
> access pdev->dev.of_node directly (since pdev is already passed in)
> rather than storing a copy here. At least, sdhci-tegra.c works that w=
ay.
> Still, this isn't a big deal, I think.

Actually, using of_node_get() here is the right thing since it
increases the reference count on the of_node.  However, the patch
should also do an of_node_put() in the remove hook, or in the .probe
error path.

>
>> @@ -605,6 +617,8 @@ static int tegra_i2c_probe(struct platform_devic=
e *pdev)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_free_irq;
>> =A0 =A0 =A0 }
>>
>> + =A0 =A0 of_i2c_register_devices(&i2c_dev->adapter);
>> +
>
> I would have expected that to be performed inside the core I2C code,
> probably inside i2c_add_numbered_adapter? Still, it looks like the
> other I2C controllers don't already work that way, so this is probabl=
y
> more a suggestion for future cleanup than something to be addressed i=
n
> this patch.

This may move into core code in the future, but for the moment the
drivers need to call it explicitly.

g.
