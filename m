From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Remove redundant change to the CPSR in headsmp.S
Date: Tue, 13 Sep 2011 18:46:48 -0700
Message-ID: <CAMbhsRSoSYhuqPC+SmCNk4dseok0vs02su0kihKNqXGpCvUvSg@mail.gmail.com>
References: <1315411253-17559-1-git-send-email-dave.martin@linaro.org>
	<20110912165222.GE2020@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110912165222.GE2020-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 12, 2011 at 9:52 AM, Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> w=
rote:
> Colin, can you comment on this?
>
> On Wed, Sep 07, 2011 at 05:00:53PM +0100, Dave Martin wrote:
>> At secondary_startup, the MSR CPSR_cxsf, #0xd3 is not compatible
>> with Thumb-2 and also unmasks asynchronous aborts (CPSR.A bit
>> forced to zero -- this is probably unintentional).
>>
>> Any remotely sane bootloader should be putting each secondary CPU
>> in the appropriate state _before_ entering the kernel anyway.
>> Otherwise, disabling interrupts on entry to the kernel isn't going
>> to fix it.
>>
>> Therefore this patch just removes the MSR instruction.
>>
>> Signed-off-by: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>
>> I make assumptions about the bootloader in this patch. =A0If someone=
 with
>> Tegra knowledge can please comment and/or test, that would be much
>> appreciated, thanks.
>>
>> =A0arch/arm/mach-tegra/headsmp.S | =A0 =A01 -
>> =A01 files changed, 0 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-tegra/headsmp.S b/arch/arm/mach-tegra/hea=
dsmp.S
>> index b5349b2..6ec4790 100644
>> --- a/arch/arm/mach-tegra/headsmp.S
>> +++ b/arch/arm/mach-tegra/headsmp.S
>> @@ -48,7 +48,6 @@ ENTRY(v7_invalidate_l1)
>> =A0ENDPROC(v7_invalidate_l1)
>>
>> =A0ENTRY(tegra_secondary_startup)
>> - =A0 =A0 msr =A0 =A0 cpsr_fsxc, #0xd3
>> =A0 =A0 =A0 =A0 =A0bl =A0 =A0 =A0v7_invalidate_l1
>> =A0 =A0 =A0 mrc =A0 =A0 p15, 0, r0, c0, c0, 5
>> =A0 =A0 =A0 =A0 =A0and =A0r0, r0, #15
>
> My rationale here is that the CPU boots straight into the
> correct mode -- if there is any boot code before we get here,
> then it should already have established the correct mode, otherwise
> we're likely to get problems which "MSR" by itself isn't going to
> fix -- such as stray interrupts for example.
>
> If that feels unsafe however, we should still to be able to write
>
> =A0 =A0 =A0 =A0cpsid =A0 aif, #SVC_MODE
>
> (which is the compact v6/v7-compatible way to set all the interrupt
> mask bits and get into a specific mode)

Tegra boots with one cpu enabled, and the other in reset.  The cpu
needs to be initialized from scratch by the kernel.  Does cpsid aif,
#SVC_MODE compile to the same instruction as the msr instruction?
