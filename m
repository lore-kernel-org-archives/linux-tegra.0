From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 5/9] ASoC: tegra: add Tegra210 based AHUB
 driver
Date: Fri, 24 Jan 2020 09:09:09 +0530
Message-ID: <d160fa01-27d0-6290-cb16-07d159d6fbb2@nvidia.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-6-git-send-email-spujar@nvidia.com>
 <5ed7482e-e874-9e11-c84e-7418e4b5162e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5ed7482e-e874-9e11-c84e-7418e4b5162e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 1/24/2020 6:48 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 20.01.2020 17:23, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> [snip]
>> +static int tegra_ahub_get_value_enum(struct snd_kcontrol *kctl,
>> +                                  struct snd_ctl_elem_value *uctl)
>> +{
>> +     struct snd_soc_component *cmpnt =3D snd_soc_dapm_kcontrol_componen=
t(kctl);
>> +     struct tegra_ahub *ahub =3D snd_soc_component_get_drvdata(cmpnt);
>> +     struct soc_enum *e =3D (struct soc_enum *)kctl->private_value;
>> +     unsigned int reg, i, bit_pos =3D 0;
>> +
>> +     /*
>> +      * Find the bit position of current MUX input.
>> +      * If nothing is set, position would be 0 and it corresponds to 'N=
one'.
>> +      */
>> +     for (i =3D 0; i < ahub->soc_data->reg_count; i++) {
>> +             unsigned int reg_val;
>> +
>> +             reg =3D e->reg + (TEGRA210_XBAR_PART1_RX * i);
>> +             snd_soc_component_read(cmpnt, reg, &reg_val);
>> +             reg_val &=3D ahub->soc_data->mask[i];
>> +
>> +             if (reg_val) {
>> +                     bit_pos =3D ffs(reg_val) +
>> +                               (8 * cmpnt->val_bytes * i);
> Multiplication takes precedence, braces are not needed. Same for all
> other occurrences in the code.
>
> [snip]
>> +                     break;
>> +             }
>> +     }
>> +
>> +     /* Find index related to the item in array *_ahub_mux_texts[] */
>> +     for (i =3D 0; i < e->items; i++) {
>> +             if (bit_pos =3D=3D e->values[i]) {
>> +                     uctl->value.enumerated.item[0] =3D i;
>> +                     break;
>> +             }
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_ahub_put_value_enum(struct snd_kcontrol *kctl,
>> +                                  struct snd_ctl_elem_value *uctl)
>> +{
>> +     struct snd_soc_component *cmpnt =3D snd_soc_dapm_kcontrol_componen=
t(kctl);
>> +     struct tegra_ahub *ahub =3D snd_soc_component_get_drvdata(cmpnt);
>> +     struct snd_soc_dapm_context *dapm =3D snd_soc_dapm_kcontrol_dapm(k=
ctl);
>> +     struct soc_enum *e =3D (struct soc_enum *)kctl->private_value;
>> +     struct snd_soc_dapm_update update[TEGRA_XBAR_UPDATE_MAX_REG] =3D {=
 };
> Shouldn't this be {0} to make array zero'ed?

Isn't it the same with empty braces?
>
> [snip]
>> +static int tegra_ahub_probe(struct platform_device *pdev)
>> +{
>> +     const struct of_device_id *match;
>> +     struct tegra_ahub *ahub;
>> +     struct tegra_ahub_soc_data *soc_data;
>> +     void __iomem *regs;
>> +     struct resource *res;
>> +     int ret;
>> +
>> +     match =3D of_match_device(tegra_ahub_of_match, &pdev->dev);
>> +     if (!match) {
>> +             dev_err(&pdev->dev, "error: no device match found\n");
>> +             return -ENODEV;
>> +     }
>> +
>> +     soc_data =3D (struct tegra_ahub_soc_data *)match->data;
> soc_data =3D device_get_match_data(&pdev->dev);

will update
>> +     ahub =3D devm_kcalloc(&pdev->dev, 1, sizeof(*ahub), GFP_KERNEL);
>> +     if (!ahub)
>> +             return -ENOMEM;
>> +
>> +     ahub->soc_data =3D soc_data;
>> +
>> +     platform_set_drvdata(pdev, ahub);
>> +
>> +     ahub->clk =3D devm_clk_get(&pdev->dev, "ahub");
>> +     if (IS_ERR(ahub->clk)) {
>> +             dev_err(&pdev->dev, "can't retrieve AHUB clock\n");
>> +             return PTR_ERR(ahub->clk);
>> +     }
>> +
>> +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +
>> +     regs =3D devm_ioremap_resource(&pdev->dev, res);
>> +     if (IS_ERR(regs))
>> +             return PTR_ERR(regs);
> regs =3D devm_platform_ioremap_resource(pdev, 0);

will update
