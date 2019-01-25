From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH 1/6] dt-bindings: timer: add Tegra210 timer
Date: Fri, 25 Jan 2019 11:23:11 +0800
Message-ID: <285bd3f7-e1c0-0767-6381-4b1d748bd6db@nvidia.com>
References: <20190107032810.13522-1-josephl@nvidia.com>
 <20190107032810.13522-2-josephl@nvidia.com>
 <a5fec080-d388-5362-7f44-b50f7d7e1adf@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a5fec080-d388-5362-7f44-b50f7d7e1adf@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Hi Jon,

Thanks for reviewing.

On 1/24/19 6:30 PM, Jon Hunter wrote:
> 
> On 07/01/2019 03:28, Joseph Lo wrote:
>> The Tegra210 timer provides fourteen 29-bit timer counters and one 32-bit
>> timestamp counter. The TMRs run at either a fixed 1 MHz clock rate derived
>> from the oscillator clock (TMR0-TMR9) or directly at the oscillator clock
>> (TMR10-TMR13). Each TMR can be programmed to generate one-shot periodic,
>> or watchdog interrupts.
>>
>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   .../bindings/timer/nvidia,tegra210-timer.txt  | 25 +++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.txt
>>
>> diff --git a/Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.txt b/Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.txt
>> new file mode 100644
>> index 000000000000..ba511220a669
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.txt
>> @@ -0,0 +1,25 @@
>> +NVIDIA Tegra210 timer
>> +
>> +The Tegra210 timer provides fourteen 29-bit timer counters and one 32-bit
>> +timestamp counter. The TMRs run at either a fixed 1 MHz clock rate derived
>> +from the oscillator clock (TMR0-TMR9) or directly at the oscillator clock
>> +(TMR10-TMR13). Each TMR can be programmed to generate one-shot, periodic,
>> +or watchdog interrupts.
>> +
>> +Required properties:
>> +- compatible : "nvidia,tegra210-timer".
>> +- reg : Specifies base physical address and size of the registers.
>> +- interrupts : A list of 4 interrupts; one per each of TMR10 through TMR13.
> 
> Why do we only add the interrupts for TMR10 - TMR13? What about the others?
> 

The others (TMR0-TMR9) are occupied for other usages. TMR5 is occupied 
for the watchdog timer in the upstream kernel. And others (still in 
TMR0-TMR9) are occupied for different usages in our downstream kernel.

And notice that only TMR10-TMR13 are running at the oscillator clock 
(clk_m). With the Tegra210 timer driver, we introduce in this series, 
which only replace the clock event device function that was originally 
owned by the arch timer (armv8 timer) and it also running at the 
oscillator clock. The sched_timer still owns by the arch timer. So the 
timer resolution will be the same. That's why we choose TMR10-TMR13 as 
the timer for Tegra210.

Thanks,
Joseph
