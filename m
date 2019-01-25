From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 1/6] dt-bindings: timer: add Tegra210 timer
Date: Fri, 25 Jan 2019 12:06:47 +0000
Message-ID: <709e24fa-02e1-96ea-2b20-acf150caff00@nvidia.com>
References: <20190107032810.13522-1-josephl@nvidia.com>
 <20190107032810.13522-2-josephl@nvidia.com>
 <a5fec080-d388-5362-7f44-b50f7d7e1adf@nvidia.com>
 <285bd3f7-e1c0-0767-6381-4b1d748bd6db@nvidia.com>
 <381f94c0-6c19-0f5b-df06-91353455a4c0@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <381f94c0-6c19-0f5b-df06-91353455a4c0@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 25/01/2019 12:01, Jon Hunter wrote:
>=20
> On 25/01/2019 03:23, Joseph Lo wrote:
>> Hi Jon,
>>
>> Thanks for reviewing.
>>
>> On 1/24/19 6:30 PM, Jon Hunter wrote:
>>>
>>> On 07/01/2019 03:28, Joseph Lo wrote:
>>>> The Tegra210 timer provides fourteen 29-bit timer counters and one
>>>> 32-bit
>>>> timestamp counter. The TMRs run at either a fixed 1 MHz clock rate
>>>> derived
>>>> from the oscillator clock (TMR0-TMR9) or directly at the oscillator
>>>> clock
>>>> (TMR10-TMR13). Each TMR can be programmed to generate one-shot periodi=
c,
>>>> or watchdog interrupts.
>>>>
>>>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Cc: devicetree@vger.kernel.org
>>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>>> ---
>>>> =C2=A0 .../bindings/timer/nvidia,tegra210-timer.txt=C2=A0 | 25 +++++++=
++++++++++++
>>>> =C2=A0 1 file changed, 25 insertions(+)
>>>> =C2=A0 create mode 100644
>>>> Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.txt
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.txt
>>>> b/Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.txt
>>>> new file mode 100644
>>>> index 000000000000..ba511220a669
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.tx=
t
>>>> @@ -0,0 +1,25 @@
>>>> +NVIDIA Tegra210 timer
>>>> +
>>>> +The Tegra210 timer provides fourteen 29-bit timer counters and one
>>>> 32-bit
>>>> +timestamp counter. The TMRs run at either a fixed 1 MHz clock rate
>>>> derived
>>>> +from the oscillator clock (TMR0-TMR9) or directly at the oscillator
>>>> clock
>>>> +(TMR10-TMR13). Each TMR can be programmed to generate one-shot,
>>>> periodic,
>>>> +or watchdog interrupts.
>>>> +
>>>> +Required properties:
>>>> +- compatible : "nvidia,tegra210-timer".
>>>> +- reg : Specifies base physical address and size of the registers.
>>>> +- interrupts : A list of 4 interrupts; one per each of TMR10 through
>>>> TMR13.
>>>
>>> Why do we only add the interrupts for TMR10 - TMR13? What about the
>>> others?
>>>
>>
>> The others (TMR0-TMR9) are occupied for other usages. TMR5 is occupied
>> for the watchdog timer in the upstream kernel. And others (still in
>> TMR0-TMR9) are occupied for different usages in our downstream kernel.
>=20
> Where is TMR5 reserved for the watchdog? I don't see this?

I see it now, it is hard-coded in the driver. I was looking at arm64 to
see where it is used.

Cheers
Jon

--=20
nvpublic
