From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH V6 01/21] irqchip: tegra: Do not disable COP IRQ during
 suspend
Date: Mon, 22 Jul 2019 09:21:21 -0700
Message-ID: <a2ecc3ad-b7e9-9398-d59b-c7d3fbbd10bb@nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-2-git-send-email-skomatineni@nvidia.com>
 <f6582e43-168e-1b7e-9db8-3d263bc3ba0d@gmail.com>
 <20c1d733-60f5-6375-c03c-639de5e41739@arm.com>
 <0bee8775-756f-adad-4597-8cad53017718@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0bee8775-756f-adad-4597-8cad53017718@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 7/22/19 3:57 AM, Dmitry Osipenko wrote:
> 22.07.2019 13:13, Marc Zyngier =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 22/07/2019 10:54, Dmitry Osipenko wrote:
>>> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> Tegra210 platforms use sc7 entry firmware to program Tegra LP0/SC7 ent=
ry
>>>> sequence and sc7 entry firmware is run from COP/BPMP-Lite.
>>>>
>>>> So, COP/BPMP-Lite still need IRQ function to finish SC7 suspend sequen=
ce
>>>> for Tegra210.
>>>>
>>>> This patch has fix for leaving the COP IRQ enabled for Tegra210 during
>>>> interrupt controller suspend operation.
>>>>
>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>   drivers/irqchip/irq-tegra.c | 20 ++++++++++++++++++--
>>>>   1 file changed, 18 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
>>>> index e1f771c72fc4..851f88cef508 100644
>>>> --- a/drivers/irqchip/irq-tegra.c
>>>> +++ b/drivers/irqchip/irq-tegra.c
>>>> @@ -44,6 +44,7 @@ static unsigned int num_ictlrs;
>>>>  =20
>>>>   struct tegra_ictlr_soc {
>>>>   	unsigned int num_ictlrs;
>>>> +	bool supports_sc7;
>>>>   };
>>>>  =20
>>>>   static const struct tegra_ictlr_soc tegra20_ictlr_soc =3D {
>>>> @@ -56,6 +57,7 @@ static const struct tegra_ictlr_soc tegra30_ictlr_so=
c =3D {
>>>>  =20
>>>>   static const struct tegra_ictlr_soc tegra210_ictlr_soc =3D {
>>>>   	.num_ictlrs =3D 6,
>>>> +	.supports_sc7 =3D true,
>>>>   };
>>>>  =20
>>>>   static const struct of_device_id ictlr_matches[] =3D {
>>>> @@ -67,6 +69,7 @@ static const struct of_device_id ictlr_matches[] =3D=
 {
>>>>  =20
>>>>   struct tegra_ictlr_info {
>>>>   	void __iomem *base[TEGRA_MAX_NUM_ICTLRS];
>>>> +	const struct tegra_ictlr_soc *soc;
>>>>   #ifdef CONFIG_PM_SLEEP
>>>>   	u32 cop_ier[TEGRA_MAX_NUM_ICTLRS];
>>>>   	u32 cop_iep[TEGRA_MAX_NUM_ICTLRS];
>>>> @@ -147,8 +150,20 @@ static int tegra_ictlr_suspend(void)
>>>>   		lic->cop_ier[i] =3D readl_relaxed(ictlr + ICTLR_COP_IER);
>>>>   		lic->cop_iep[i] =3D readl_relaxed(ictlr + ICTLR_COP_IEP_CLASS);
>>>>  =20
>>>> -		/* Disable COP interrupts */
>>>> -		writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
>>>> +		/*
>>>> +		 * AVP/COP/BPMP-Lite is the Tegra boot processor.
>>>> +		 *
>>>> +		 * Tegra210 system suspend flow uses sc7entry firmware which
>>>> +		 * is executed by COP/BPMP and it includes disabling COP IRQ,
>>>> +		 * clamping CPU rail, turning off VDD_CPU, and preparing the
>>>> +		 * system to go to SC7/LP0.
>>>> +		 *
>>>> +		 * COP/BPMP wakes up when COP IRQ is triggered and runs
>>>> +		 * sc7entry-firmware. So need to keep COP interrupt enabled.
>>>> +		 */
>>>> +		if (!lic->soc->supports_sc7)
>>>> +			/* Disable COP interrupts if SC7 is not supported */
>>> All Tegra SoCs support SC7, hence the 'supports_sc7' and the comment
>>> doesn't sound correct to me. Something like 'firmware_sc7' should suit
>>> better here.
>> If what you're saying is true, then the whole patch is wrong, and the
>> SC7 property should come from DT.
> It should be safe to assume that all of existing Tegra210 devices use
> the firmware for SC7, hence I wouldn't say that the patch is entirely
> wrong. To me it's not entirely correct.

Yes, all existing Tegra210 platforms uses sc7 entry firmware for SC7 and=20
AVP/COP IRQ need to be kept enabled as during suspend ATF triggers IRQ=20
to COP for SC7 entry fw execution.


>>>> +			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
>>> Secondly, I'm also not sure why COP interrupts need to be disabled for
>>> pre-T210 at all, since COP is unused. This looks to me like it was
>>> cut-n-pasted from downstream kernel without a good reason and could be
>>> simply removed.
>> Please verify that this is actually the case. Tegra-2 definitely needed
>> some level of poking, and I'm not keen on changing anything there until
>> you (or someone else) has verified it on actual HW (see e307cc8941fc).
> Tested on Tegra20 and Tegra30, LP1 suspend-resume works perfectly fine
> with all COP bits removed from the driver.
>
> AFAIK, the reason why downstream needed that disabling is that it uses
> proprietary firmware which is running on the COP and that firmware is
> usually a BLOB audio/video DEC-ENC driver which doesn't cleanup
> interrupts after itself. That firmware is not applicable for the
> upstream kernel, hence there is no need to care about it.
>
>> Joseph, can you please shed some light here?

SC7 entry flow uses 3rd party ATF (arm-trusted FW) blob which is the one th=
at actually loads SC7 entry firmware and triggers IRQ to AVP/COP which caus=
es COP to wakeup and run SC7 entry FW.

So when SC7 support is enabled, IRQ need to be kept enabled and when SC7 FW=
 starts execution, it will disable COP IRQ.
