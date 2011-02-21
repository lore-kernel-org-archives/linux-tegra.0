From: Colin Cross <ccross@android.com>
Subject: Re: [PATCH v2 12/21] ARM: tegra: clock: Add shared bus clock type
Date: Sun, 20 Feb 2011 23:02:06 -0800
Message-ID: <AANLkTikcqYfC6crtwSUYvSH7dSOQZD8K+fCyOSCVMpnL@mail.gmail.com>
References: <1298154371-5641-1-git-send-email-ccross@android.com>
	<AANLkTinWQRmKhorYHQ2rHCArHN89go-2mYVAe5UUZVOV@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTinWQRmKhorYHQ2rHCArHN89go-2mYVAe5UUZVOV@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, konkers@android.com, sboyd@codeaurora.org, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Feb 20, 2011 at 8:15 PM, Olof Johansson <olof@lixom.net> wrote:
> Hi,
>
> On Sat, Feb 19, 2011 at 2:25 PM, Colin Cross <ccross@android.com> wro=
te:
>> Some clocks may have multiple downstream users that need to request =
a
>> higher clock rate. =A0Shared bus clocks provide a unique shared_bus_=
user
>> clock to each user. =A0The frequency of the bus is set to the highes=
t
>> enabled shared_bus_user clock, with a minimum value set by the
>> shared bus. =A0Drivers can use clk_enable and clk_disable to enable
>> or disable their requirement, and clk_set_rate to set the minimum ra=
te.
>>
>> Signed-off-by: Colin Cross <ccross@android.com>
>
> [...]
>> diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-teg=
ra/tegra2_clocks.c
>> index a1c86d8..dd53af3 100644
>> --- a/arch/arm/mach-tegra/tegra2_clocks.c
>> +++ b/arch/arm/mach-tegra/tegra2_clocks.c
> [...]
>
>> + =A0 =A0 =A0 c->u.shared_bus_user.rate =3D c->parent->max_rate;
>> + =A0 =A0 =A0 c->state =3D OFF;
>> +#ifdef CONFIG_DEBUG_FS
>> + =A0 =A0 =A0 c->set =3D 1;
>> +#endif
>> +
>> + =A0 =A0 =A0 spin_lock_irqsave(&c->parent->spinlock, flags);
>
>
> A later patch in the series removes the ifdef. Might as well remove i=
t
> here. Also, should be c->set =3D true, which that patch also does. :)
At this point in the series c->set is not defined for
CONFIG_DEBUG_FS=3Dn, so dropping the #ifdef would break bisection, and =
I
left the =3D 1 in for consistency.

> With that fixed:
>
> Acked-by: Olof Johansson <olof@lixom.net>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
