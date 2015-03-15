From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: l2c: Maintain CPU endianness for early resume
 function
Date: Sun, 15 Mar 2015 22:06:11 +0300
Message-ID: <5505D823.7020501@gmail.com>
References: <1421757420-20983-1-git-send-email-digetx@gmail.com> <20150311101845.GL19577@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150311101845.GL19577-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

11.03.2015 13:18, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Tue, Jan 20, 2015 at 03:36:55PM +0300, Dmitry Osipenko wrote:
>> In big endian CPU mode l2x0_saved_regs structure stores registers va=
lues in BE
>> format. In order to maintain BE CPU mode, these values and immediate=
 constants
>> must be converted back to LE format before writing them to cache con=
troller.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   arch/arm/mm/l2c-l2x0-resume.S | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>
> Hi Russell,
>
> Did you get a chance yet to review this patch? It's a dependency for
> enabling big-endian support on Tegra. As such, I wonder if you would =
be
> willing to ack it, so that I can take it through the Tegra tree along
> with the rest of the patches.
>
> If you prefer to take it through the ARM tree, that's fine, too. In t=
hat
> case would you be able to provide a stable branch that I can merge in=
to
> the Tegra tree to resolve the dependency?
>
> Thanks,
> Thierry
>
>> diff --git a/arch/arm/mm/l2c-l2x0-resume.S b/arch/arm/mm/l2c-l2x0-re=
sume.S
>> index fda415e..9f99c7e 100644
>> --- a/arch/arm/mm/l2c-l2x0-resume.S
>> +++ b/arch/arm/mm/l2c-l2x0-resume.S
>> @@ -30,6 +30,15 @@ ENTRY(l2c310_early_resume)
>>   	teq	r1, #0
>>   	reteq	lr
>>
>> +	@ Reverse for big endian kernel
>> +ARM_BE8(rev	r2, r2)
>> +ARM_BE8(rev	r3, r3)
>> +ARM_BE8(rev	r4, r4)
>> +ARM_BE8(rev	r5, r5)
>> +ARM_BE8(rev	r6, r6)
>> +ARM_BE8(rev	r7, r7)
>> +ARM_BE8(rev	r8, r8)
>> +
>>   	@ The prefetch and power control registers are revision dependent
>>   	@ and can be written whether or not the L2 cache is enabled
>>   	ldr	r0, [r1, #L2X0_CACHE_ID]
>> @@ -51,6 +60,7 @@ ENTRY(l2c310_early_resume)
>>
>>   	str	r2, [r1, #L2X0_AUX_CTRL]
>>   	mov	r9, #L2X0_CTRL_EN
>> +ARM_BE8(rev	r9, r9)
>>   	str	r9, [r1, #L2X0_CTRL]
>>   	ret	lr
>>   ENDPROC(l2c310_early_resume)
>> --
>> 2.2.1
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

This patch missed register reverse for "ldr". Please hold it, I'll send=
 v3.

--=20
Dmitry
