From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v7 01/20] pinctrl: tegra: Add suspend and resume support
Date: Tue, 6 Aug 2019 14:54:18 -0700
Message-ID: <961ceece-f42a-b933-9184-97e9d30ea381@nvidia.com>
References: <1564607463-28802-1-git-send-email-skomatineni@nvidia.com>
 <1564607463-28802-2-git-send-email-skomatineni@nvidia.com>
 <6b1482f6-0578-f602-d8d1-541d86303ce2@gmail.com>
 <b45ca99a-188a-c695-3f3d-48d273808f9c@nvidia.com>
 <36351140-afd4-38c4-3722-4ee0894287fa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <36351140-afd4-38c4-3722-4ee0894287fa@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 8/6/19 10:59 AM, Dmitry Osipenko wrote:
> 05.08.2019 21:06, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 8/5/19 3:50 AM, Dmitry Osipenko wrote:
>>> 01.08.2019 0:10, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> This patch adds support for Tegra pinctrl driver suspend and resume.
>>>>
>>>> During suspend, context of all pinctrl registers are stored and
>>>> on resume they are all restored to have all the pinmux and pad
>>>> configuration for normal operation.
>>>>
>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>  =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra.c | 59
>>>> +++++++++++++++++++++++++++++++++++
>>>>  =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra.h |=C2=A0 3 ++
>>>>  =C2=A0 2 files changed, 62 insertions(+)
>>>>
>>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>> b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>> index 186ef98e7b2b..e3a237534281 100644
>>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>> @@ -631,6 +631,58 @@ static void
>>>> tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>  =C2=A0 }
>>>>  =C2=A0 +static size_t tegra_pinctrl_get_bank_size(struct device *dev,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int bank=
_id)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct platform_device *pdev =3D to_platform_devic=
e(dev);
>>>> +=C2=A0=C2=A0=C2=A0 struct resource *res;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM=
, bank_id);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return resource_size(res) / 4;
>>>> +}
>>>> +
>>>> +static int tegra_pinctrl_suspend(struct device *dev)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_pmx *pmx =3D dev_get_drvdata(dev);
>>>> +=C2=A0=C2=A0=C2=A0 u32 *backup_regs =3D pmx->backup_regs;
>>>> +=C2=A0=C2=A0=C2=A0 u32 *regs;
>>>> +=C2=A0=C2=A0=C2=A0 size_t bank_size;
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int i, k;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < pmx->nbanks; i++) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bank_size =3D tegra_pinctr=
l_get_bank_size(dev, i);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs =3D pmx->regs[i];
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (k =3D 0; k < bank_siz=
e; k++)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *b=
ackup_regs++ =3D readl_relaxed(regs++);
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return pinctrl_force_sleep(pmx->pctl);
>>>> +}
>>>> +
>>>> +static int tegra_pinctrl_resume(struct device *dev)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_pmx *pmx =3D dev_get_drvdata(dev);
>>>> +=C2=A0=C2=A0=C2=A0 u32 *backup_regs =3D pmx->backup_regs;
>>>> +=C2=A0=C2=A0=C2=A0 u32 *regs;
>>>> +=C2=A0=C2=A0=C2=A0 size_t bank_size;
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int i, k;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < pmx->nbanks; i++) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bank_size =3D tegra_pinctr=
l_get_bank_size(dev, i);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs =3D pmx->regs[i];
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (k =3D 0; k < bank_siz=
e; k++)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wr=
itel_relaxed(*backup_regs++, regs++);
>>>> +=C2=A0=C2=A0=C2=A0 }
>>> I'm now curious whether any kind of barrier is needed after the
>>> writings. The pmx_writel() doesn't insert a barrier after the write and
>>> seems it just misuses writel, which actually should be writel_relaxed()
>>> + barrier, IIUC.
>> pmx_writel uses writel and it has wmb before raw_write which complete
>> all writes initiated prior to this.
>>
>> By misusing writel, you mean to have barrier after register write?
> Yes, at least to me it doesn't make much sense for this driver to stall
> before the write. It's the pinctrl user which should be taking care
> about everything to be ready before making a change to the pinctrl's
> configuration.
>
>>> It's also not obvious whether PINCTRL HW has any kind of write-FIFO and
>>> thus maybe read-back + rmb() is needed in order ensure that writes are
>>> actually completed.
>> I believe adding write barrier wmb after writel_relaxed should be good
>> rather than doing readback + rmb
>>> The last thing which is not obvious is when the new configuration
>>> actually takes into effect, does it happen immediately or maybe some
>>> delay is needed?
>>>
>>> [snip]
>> Based on internal design there is no internal delay and it all depends
>> on APB rate that it takes to write to register.
>>
>> Pinmux value change to reflect internally might take couple of clock
>> cycles which is much faster than SW can read.
> Still not quite obvious if it's possible to have a case where some
> hardware is touched before necessary pinctrl change is fully completed
> and then to get into trouble because of it.

To be safer, will add write barrier after all writes in resume and also=20
will have separate patch for pmx_writel fix to use writel_relaxed=20
followed by write barrier.

Thanks

Sowjanya
