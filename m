From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 14/21] ARM: tegra: clock: Refcount periph clock enables
Date: Sun, 20 Feb 2011 23:06:01 -0800
Message-ID: <AANLkTin5O-dbKhwkBmsZVYCJM=qg=QY=N1w4Zc++6qY4@mail.gmail.com>
References: <1298154371-5641-1-git-send-email-ccross@android.com>
	<1298154371-5641-16-git-send-email-ccross@android.com>
	<AANLkTin8AmjM2CWoNh54NmyV6=298bGzDUPO+j4LTrBj@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTin8AmjM2CWoNh54NmyV6=298bGzDUPO+j4LTrBj-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Feb 20, 2011 at 8:18 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> Hi,
>
> On Sat, Feb 19, 2011 at 2:26 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wro=
te:
>> Some peripheral clocks share enable bits. =A0Refcount the enables so
>> that calling clk_disable on one clock will not turn off another
>> clock.
>>
>> Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
>> ---
>> =A0arch/arm/mach-tegra/tegra2_clocks.c | =A0 35 ++++++++++++++++++++=
+++++++++------
>> =A01 files changed, 29 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-teg=
ra/tegra2_clocks.c
>> index 196c249..2734889 100644
>> --- a/arch/arm/mach-tegra/tegra2_clocks.c
>> +++ b/arch/arm/mach-tegra/tegra2_clocks.c
>> @@ -154,6 +154,12 @@ static void __iomem *reg_pmc_base =3D IO_ADDRES=
S(TEGRA_PMC_BASE);
>> =A0*/
>> =A0static DEFINE_SPINLOCK(clock_register_lock);
>>
>> +/*
>> + * Some peripheral clocks share an enable bit, so refcount the enab=
le bits
>> + * in registers CLK_ENABLE_L, CLK_ENABLE_H, and CLK_ENABLE_U
>> + */
>> +static int tegra_periph_clk_enable_refcount[3 * 32];
>
> Given that this is always locked when incrementing/decrementing,
> should it just be switched to an array of atomics instead?
No, the spinlock needs to be held between the increment/decrement and
test and the actual register write.  The spinlock release in the
enable function needs to be moved after the register write.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
