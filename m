From: Misha Komarovskiy <zombah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: tegra: paz00: configure power off
Date: Sat, 12 Mar 2016 17:47:39 +0300
Message-ID: <CANLc0-ZrPcX01YA9LRRNW5BuqUnbQngOWGOtVqtddzppKzuwvA@mail.gmail.com>
References: <1457730000-11868-1-git-send-email-zombah@gmail.com> <2473480.r8zbktHrhX@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2473480.r8zbktHrhX@fb07-iapwap2>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Marc,

On Sat, Mar 12, 2016 at 4:34 PM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
> Hi Micha,
>
> Am Samstag, 12. M=C3=A4rz 2016, 00:00:00 CET schrieb Misha Komarovski=
y:
>> Add DT property to tell the regulator that it should provide
>> the pm_power_off() implementation. This fix "shutdown" issue
>> on this device.
>>
>> Signed-off-by: Misha Komarovskiy <zombah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>
>> Tested on current mainline version, ac100 models 116 and 117,
>> successful rate of "shutdown" increased from 10% to 90%.
>>
>>  arch/arm/boot/dts/tegra20-paz00.dts | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts
>> b/arch/arm/boot/dts/tegra20-paz00.dts index ed7e100..c82e3ae 100644
>> --- a/arch/arm/boot/dts/tegra20-paz00.dts
>> +++ b/arch/arm/boot/dts/tegra20-paz00.dts
>> @@ -316,6 +316,8 @@
>>                       #gpio-cells =3D <2>;
>>                       gpio-controller;
>>
>> +                     ti,system-power-controller;
>> +
>>                       sys-supply =3D <&p5valw_reg>;
>>                       vin-sm0-supply =3D <&sys_reg>;
>>                       vin-sm1-supply =3D <&sys_reg>;
>
> I think this is the wrong fix. The power_off hook is already occupied=
 by nvec.
> So either the tps or nvec is responsible for shutting down the system=
=2E AFAIR,
> nvec has some hard wired connection to the tps for doing this, so in =
the end,
> it will shut down (but I can't find it now in the schematics). See pa=
z00-
> diag.c in the original sources on how the system is beeing shut down.
>
> In any case, we can only have one power_off handler. Either via tps o=
r nvec,
> not both.

Currently shutdown work very poor, lucky if i have one clean shutdown
of ten tries. With power_off handler by tps driver i have eight clean
shutdowns of ten tries.

Now it is possible to boot paz00 without nvec at all, in comparison to
downstream
kernels.
If such solution acceptable, i can test with disabled nvec power_off
hadler and compare results.

>
> Marc



--=20
Best Regards,
Misha Komarovskiy
zombahatgmaildotcom
