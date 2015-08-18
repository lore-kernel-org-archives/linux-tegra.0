From: Vaishali Thakkar <vthakkar1994@gmail.com>
Subject: Re: [PATCH] ASoC: tegra: Convert to managed resources
Date: Tue, 18 Aug 2015 17:26:37 +0530
Message-ID: <CAK-LDbLj-rFtuA+=oRg52vS21HYkvZA95RpDo_h8zEBLNk7kdg@mail.gmail.com>
References: <20150813072920.GA17181@localhost>
	<CAAVeFuKT1st8E1fxcDM5CV_OzUcTmvFw8UuU5oh15J1PiFJ0vA@mail.gmail.com>
	<CAK-LDbJwfuqU6ekRudms=YfjVxWf1BOREBwCnCh4v-YWY9hA_w@mail.gmail.com>
	<CAAVeFuKTm6xnYP-YMjKGL-bP8a9QHv0+vdRLdmaAPULr=2GKgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuKTm6xnYP-YMjKGL-bP8a9QHv0+vdRLdmaAPULr=2GKgg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 18, 2015 at 12:48 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Mon, Aug 17, 2015 at 6:32 PM, Vaishali Thakkar
> <vthakkar1994@gmail.com> wrote:
>> On Mon, Aug 17, 2015 at 12:47 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
>>> On Thu, Aug 13, 2015 at 4:29 PM, Vaishali Thakkar
>>> <vthakkar1994@gmail.com> wrote:
>>>> Use managed resource functions devm_clk_put and
>>>> devm_snd_soc_register_component to simplify error handling.
>>>>
>>>> To be compatible with the change various gotos are replaced
>>>> with direct returns, and unneeded labels are dropped.
>>>>
>>>> Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>
>>>> ---
>>>>  sound/soc/tegra/tegra20_spdif.c | 37 +++++++++++++------------------------
>>>>  1 file changed, 13 insertions(+), 24 deletions(-)
>>>>
>>>> diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
>>>> index 9141477..f69b2e4 100644
>>>> --- a/sound/soc/tegra/tegra20_spdif.c
>>>> +++ b/sound/soc/tegra/tegra20_spdif.c
>>>> @@ -273,45 +273,40 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
>>>>                              GFP_KERNEL);
>>>>         if (!spdif) {
>>>>                 dev_err(&pdev->dev, "Can't allocate tegra20_spdif\n");
>>>> -               ret = -ENOMEM;
>>>> -               goto err;
>>>> +               return -ENOMEM;
>>>>         }
>>>>         dev_set_drvdata(&pdev->dev, spdif);
>>>>
>>>> -       spdif->clk_spdif_out = clk_get(&pdev->dev, "spdif_out");
>>>> +       spdif->clk_spdif_out = devm_clk_get(&pdev->dev, "spdif_out");
>>>>         if (IS_ERR(spdif->clk_spdif_out)) {
>>>>                 pr_err("Can't retrieve spdif clock\n");
>>>>                 ret = PTR_ERR(spdif->clk_spdif_out);
>>>> -               goto err;
>>>> +               return ret;
>>>
>>> Maybe do "return PTR_ERR(spdif->clk_spdif_out);" for consistency with
>>> the other error cases of this function?
>>>
>>>>         }
>>>>
>>>>         mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>>         if (!mem) {
>>>>                 dev_err(&pdev->dev, "No memory resource\n");
>>>> -               ret = -ENODEV;
>>>> -               goto err_clk_put;
>>>> +               return -ENODEV;
>>>>         }
>>>>
>>>>         dmareq = platform_get_resource(pdev, IORESOURCE_DMA, 0);
>>>>         if (!dmareq) {
>>>>                 dev_err(&pdev->dev, "No DMA resource\n");
>>>> -               ret = -ENODEV;
>>>> -               goto err_clk_put;
>>>> +               return -ENODEV;
>>>>         }
>>>>
>>>>         memregion = devm_request_mem_region(&pdev->dev, mem->start,
>>>>                                             resource_size(mem), DRV_NAME);
>>>>         if (!memregion) {
>>>>                 dev_err(&pdev->dev, "Memory region already claimed\n");
>>>> -               ret = -EBUSY;
>>>> -               goto err_clk_put;
>>>> +               return -EBUSY;
>>>>         }
>>>>
>>>>         regs = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
>>>>         if (!regs) {
>>>>                 dev_err(&pdev->dev, "ioremap failed\n");
>>>> -               ret = -ENOMEM;
>>>> -               goto err_clk_put;
>>>> +               return -ENOMEM;
>>>>         }
>>>>
>>>>         spdif->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
>>>> @@ -319,7 +314,7 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
>>>>         if (IS_ERR(spdif->regmap)) {
>>>>                 dev_err(&pdev->dev, "regmap init failed\n");
>>>>                 ret = PTR_ERR(spdif->regmap);
>>>> -               goto err_clk_put;
>>>> +               return ret;
>>>
>>> Same here.
>>
>> Actually people prefer to write this way when they are calling PTR_ERR
>> more than one time for the same value. But as for this file at both places
>> we are calling PTR_ERR for different values, may be we can directly call
>> it in return.
>
> Ok, I don't feel too strongly about this, so your call.
>
>>
>>>>         }
>>>>
>>>>         spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
>>>> @@ -334,8 +329,9 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
>>>>                         goto err_pm_disable;
>>>>         }
>>>>
>>>> -       ret = snd_soc_register_component(&pdev->dev, &tegra20_spdif_component,
>>>> -                                  &tegra20_spdif_dai, 1);
>>>> +       ret = devm_snd_soc_register_component(&pdev->dev,
>>>> +                                             &tegra20_spdif_component,
>>>> +                                             &tegra20_spdif_dai, 1);
>>>>         if (ret) {
>>>>                 dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
>>>>                 ret = -ENOMEM;
>>>> @@ -345,21 +341,17 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
>>>>         ret = tegra_pcm_platform_register(&pdev->dev);
>>>>         if (ret) {
>>>>                 dev_err(&pdev->dev, "Could not register PCM: %d\n", ret);
>>>> -               goto err_unregister_component;
>>>> +               return ret;
>>>
>>> In the previous code, PM cleanup was also performed after the
>>> component was unregistered. If you return directly, this is not
>>> performed anymore - I think you should "goto err_suspend;" here.
>>> This will change the ordering of cleanup operations though - e.g.
>>> snd_soc_unregister_component() will now be called *after* PM cleanup.
>>> Are things still working ok after this? (I suppose they do considering
>>> how simple the PM ops are, but it might be worth testing).
>>
>> I think you are right. I missed that. But now thing is , this patch is already
>> applied here:
>> https://git.kernel.org/cgit/linux/kernel/git/broonie/sound.git/commit/?h=topic/tegra
>
> Ah, that will teach me to check my patches queue more often. :(
>
>>
>> I am not sure if now I can change version 2 with the changes you suggested
>> or not. Although I will not be able to test it  after changing 'goto
>> err_suspend'
>> as I don't have hardware but may be someone else can test it.
>
> I think you can send a fixup patch since Mark already merged this one,
> this is an error code path (which by definition should not be taken
> too often), and there should not be any resulting breakage.

Yes. As per the discussion with Mark, I am sending a patch reverting
the change of component part.

Thanks for your review.

-- 
Vaishali
