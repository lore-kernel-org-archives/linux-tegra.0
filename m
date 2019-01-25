From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2] ALSA: hda/tegra: enable clock during probe
Date: Fri, 25 Jan 2019 13:15:22 +0000
Message-ID: <2575909c-635e-3c79-23f7-7f638fdd8fc0@nvidia.com>
References: <1548414418-5785-1-git-send-email-spujar@nvidia.com>
 <ae87a09f-2922-9a9d-3ad3-e9abe7fb20c2@nvidia.com>
 <c18a8c49-8696-318d-50c8-d5c6a0a5a7d2@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c18a8c49-8696-318d-50c8-d5c6a0a5a7d2@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Cc: thierry.reding@gmail.com, rlokhande@nvidia.com, sharadg@nvidia.com, mkumard@nvidia.com, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 25/01/2019 12:19, Sameer Pujar wrote:
>=20
> On 1/25/2019 5:12 PM, Jon Hunter wrote:
>> On 25/01/2019 11:06, Sameer Pujar wrote:
>>> If CONFIG_PM is disabled or runtime PM calls are forbidden, the clocks
>>> will not be ON. This could cause issue during probe, where hda init
>>> setup is done. This patch enables clocks unconditionally during probe.
>>>
>>> Along with above, follwoing changes are done.
>>> =C2=A0=C2=A0 * enable runtime PM before exiting from probe work. This h=
elps to
>>> avoid
>>> =C2=A0=C2=A0=C2=A0=C2=A0 usage of pm_runtime_get_sync/pm_runtime_put() =
in probe work.
>>> =C2=A0=C2=A0 * hda_tegra_disable_clocks() is moved out of CONFIG_PM_SLE=
EP check.
>>> =C2=A0=C2=A0 * runtime PM callbacks moved out of CONFIG_PM check
>>>
>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>> Reviewed-by: Ravindra Lokhande <rlokhande@nvidia.com>
>>> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
>>> ---
>>> =C2=A0 sound/pci/hda/hda_tegra.c | 26 +++++++++++++++++---------
>>> =C2=A0 1 file changed, 17 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
>>> index c8d18dc..ba6175f 100644
>>> --- a/sound/pci/hda/hda_tegra.c
>>> +++ b/sound/pci/hda/hda_tegra.c
>>> @@ -219,7 +219,6 @@ static int hda_tegra_enable_clocks(struct
>>> hda_tegra *data)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;
>>> =C2=A0 }
>>> =C2=A0 -#ifdef CONFIG_PM_SLEEP
>>> =C2=A0 static void hda_tegra_disable_clocks(struct hda_tegra *data)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(data->hda2hdmi_clk=
);
>>> @@ -227,6 +226,7 @@ static void hda_tegra_disable_clocks(struct
>>> hda_tegra *data)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(data->hda_clk);
>>> =C2=A0 }
>>> =C2=A0 +#ifdef CONFIG_PM_SLEEP
>>> =C2=A0 /*
>>> =C2=A0=C2=A0 * power management
>>> =C2=A0=C2=A0 */
>>> @@ -257,7 +257,6 @@ static int hda_tegra_resume(struct device *dev)
>>> =C2=A0 }
>>> =C2=A0 #endif /* CONFIG_PM_SLEEP */
>>> =C2=A0 -#ifdef CONFIG_PM
>>> =C2=A0 static int hda_tegra_runtime_suspend(struct device *dev)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_card *card =3D dev_get_drvdat=
a(dev);
>>> @@ -283,7 +282,7 @@ static int hda_tegra_runtime_resume(struct device
>>> *dev)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int rc;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D hda_tegra_enable_clocks(hd=
a);
>>> -=C2=A0=C2=A0=C2=A0 if (rc !=3D 0)
>>> +=C2=A0=C2=A0=C2=A0 if (rc)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (chip && chip->running) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hda_tegra_init(h=
da);
>>> @@ -292,7 +291,6 @@ static int hda_tegra_runtime_resume(struct device
>>> *dev)
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>> -#endif /* CONFIG_PM */
>>> =C2=A0 =C2=A0 static const struct dev_pm_ops hda_tegra_pm =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SET_SYSTEM_SLEEP_PM_OPS(hda_tegra_suspen=
d, hda_tegra_resume)
>>> @@ -551,9 +549,9 @@ static int hda_tegra_probe(struct platform_device
>>> *pdev)
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_set_drvdata(&pdev->dev, card)=
;
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 pm_runtime_enable(hda->dev);
>>> -=C2=A0=C2=A0=C2=A0 if (!azx_has_pm_runtime(chip))
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_forbid(hda->dev)=
;
>>> +=C2=A0=C2=A0=C2=A0 err =3D hda_tegra_enable_clocks(hda);
>>> +=C2=A0=C2=A0=C2=A0 if (err)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_free;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 schedule_work(&hda->probe_work);
>>> =C2=A0 @@ -571,7 +569,6 @@ static void hda_tegra_probe_work(struct
>>> work_struct *work)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct platform_device *pdev =3D to_plat=
form_device(hda->dev);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err;
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 pm_runtime_get_sync(hda->dev);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D hda_tegra_first_init(chip, pdev)=
;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err < 0)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_free;
>>> @@ -592,8 +589,15 @@ static void hda_tegra_probe_work(struct
>>> work_struct *work)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chip->running =3D 1;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_hda_set_power_save(&chip->bus, power=
_save * 1000);
>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* set device state as active */
>>> +=C2=A0=C2=A0=C2=A0 if (pm_runtime_set_active(hda->dev) < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_free;
>>> +=C2=A0=C2=A0=C2=A0 /* enable runtime PM */
>>> +=C2=A0=C2=A0=C2=A0 pm_runtime_enable(hda->dev);
>>> +=C2=A0=C2=A0=C2=A0 if (!azx_has_pm_runtime(chip))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_forbid(hda->dev)=
;
>>> +
>>> =C2=A0=C2=A0 out_free:
>>> -=C2=A0=C2=A0=C2=A0 pm_runtime_put(hda->dev);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return; /* no error return from async pr=
obe */
>>> =C2=A0 }
>>> =C2=A0 @@ -603,6 +607,10 @@ static int hda_tegra_remove(struct
>>> platform_device *pdev)
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D snd_card_free(dev_get_drv=
data(&pdev->dev));
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_disable(&pdev->dev);
>>> +=C2=A0=C2=A0=C2=A0 if (!pm_runtime_status_suspended(&pdev->dev)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hda_tegra_runtime_suspend(&=
pdev->dev);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_set_suspended(&p=
dev->dev);
>>> +=C2=A0=C2=A0=C2=A0 }
>> I think that we need to be consistent in the above with what is done in
>> the probe. If in the probe we call hda_tegra_enable_clocks(), then here
>> we should call hda_tegra_disable_clocks(). However, my preference is
>> still to all hda_tegra_runtime_resume() in probe and then leave the
>> above as-is. Let's see what everyone else thinks.
> Though it is good to have the handling at a single place, it is slightly
> confusing to call
> runtime_resume() in probe. When runtime PM is not yet enabled, why call
> something that is related
> to it(not logically but intuitively)!

I still don't think that it is confusing, the name of the function is
called hda_tegra_runtime_resume and does what is says on the tin (ie.
resumes the device at runtime).

Furthermore, I think it is completely logical that if pm-runtime is not
enabled, we manually call it. The benefit is that we have single
function for resuming the device for all circumstances.

Cheers
Jon

--=20
nvpublic
