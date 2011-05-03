From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv2 4/4] ARM: tegra: irq: Add tegra_eoi
Date: Tue, 3 May 2011 11:41:41 -0700
Message-ID: <BANLkTi=a26_A7yAAfkQd5NSxbR+reQCZ1g@mail.gmail.com>
References: <1304284213-11950-5-git-send-email-ccross@android.com>
	<1304288854-11011-1-git-send-email-ccross@android.com>
	<1304414973.27863.2.camel@e102144-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1304414973.27863.2.camel-SGELLbQ0bobZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: lakml <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, May 3, 2011 at 2:29 AM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote=
:
> Hi Colin,
>
> On Sun, 2011-05-01 at 23:27 +0100, Colin Cross wrote:
>> Implement irq_eoi to allow the GIC irq chip flow controller to
>> be changed to fasteoi.
>>
>> Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
>> ---
>> v2: Add tegra_eoi without removing tegra_ack, patch can now be
>> =A0 =A0 merged safely before Will Deacon's gic fasteoi patch
>>
>> =A0arch/arm/mach-tegra/irq.c | =A0 =A09 +++++++++
>> =A01 files changed, 9 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-tegra/irq.c b/arch/arm/mach-tegra/irq.c
>> index da17491..4956c3c 100644
>> --- a/arch/arm/mach-tegra/irq.c
>> +++ b/arch/arm/mach-tegra/irq.c
>> @@ -95,6 +95,14 @@ static void tegra_ack(struct irq_data *d)
>> =A0 =A0 =A0 =A0 tegra_irq_write_mask(d->irq, ICTLR_CPU_IEP_FIR_CLR);
>> =A0}
>>
>> +static void tegra_eoi(struct irq_data *d)
>> +{
>> + =A0 =A0 =A0 if (d->irq < FIRST_LEGACY_IRQ)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>> +
>> + =A0 =A0 =A0 tegra_irq_write_mask(d->irq, ICTLR_CPU_IEP_FIR_CLR);
>> +}
>> +
>> =A0static int tegra_retrigger(struct irq_data *d)
>> =A0{
>> =A0 =A0 =A0 =A0 if (d->irq < FIRST_LEGACY_IRQ)
>> @@ -116,6 +124,7 @@ void __init tegra_init_irq(void)
>> =A0 =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 =A0 gic_arch_extn.irq_ack =3D tegra_ack;
>> + =A0 =A0 =A0 gic_arch_extn.irq_eoi =3D tegra_eoi;
>> =A0 =A0 =A0 =A0 gic_arch_extn.irq_mask =3D tegra_mask;
>> =A0 =A0 =A0 =A0 gic_arch_extn.irq_unmask =3D tegra_unmask;
>> =A0 =A0 =A0 =A0 gic_arch_extn.irq_retrigger =3D tegra_retrigger;
>> --
>> 1.7.4.1
>
> Just the job!
>
> Acked-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
>
> Thanks,
>
> Will
>
>

What is your plan for merging the fasteoi patches?  If you are
planning to put them in 2.6.40, can you pull these patches into your
tree?  I don't have any other Tegra changes planned for 2.6.40, so
they shouldn't cause conflicts later.
