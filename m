From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] mfd: tps6586x: Handle interrupts on suspend
Date: Wed, 24 Oct 2018 11:49:46 +0100
Message-ID: <72b80285-d6ff-9cb9-3bcd-bb3d92006323@nvidia.com>
References: <1539955373-13735-1-git-send-email-jonathanh@nvidia.com>
 <20181022095257.GD4014@ulmo> <366ad7c3-85e2-3526-1c0b-6d2fbde4c552@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <366ad7c3-85e2-3526-1c0b-6d2fbde4c552@gmail.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 22/10/2018 12:19, Dmitry Osipenko wrote:
> On 10/22/18 12:52 PM, Thierry Reding wrote:
>> On Fri, Oct 19, 2018 at 02:22:53PM +0100, Jon Hunter wrote:
>>> From: Jonathan Hunter <jonathanh@nvidia.com>
>>>
>>> The tps6586x driver creates an irqchip that is used by its various child
>>> devices for managing interrupts. The tps6586x-rtc device is one of its
>>> children that uses the tps6586x irqchip. When using the tps6586x-rtc as
>>> a wake-up device from suspend, the following is seen:
>>>
>>>  PM: Syncing filesystems ... done.
>>>  Freezing user space processes ... (elapsed 0.001 seconds) done.
>>>  OOM killer disabled.
>>>  Freezing remaining freezable tasks ... (elapsed 0.000 seconds) done.
>>>  Disabling non-boot CPUs ...
>>>  Entering suspend state LP1
>>>  Enabling non-boot CPUs ...
>>>  CPU1 is up
>>>  tps6586x 3-0034: failed to read interrupt status
>>>  tps6586x 3-0034: failed to read interrupt status
>>>
>>> The reason why the tps6586x interrupt status cannot be read is because
>>> the tps6586x interrupt is not masked during suspend and when the
>>> tps6586x-rtc interrupt occurs, to wake-up the device, the interrupt is
>>> seen before the i2c controller has been resumed in order to read the
>>> tps6586x interrupt status.
>>>
>>> The tps6586x-rtc driver sets it's interrupt as a wake-up source during
>>> suspend, which gets propagated to the parent tps6586x interrupt.
>>> However, the tps6586x-rtc driver cannot disable it's interrupt during
>>> suspend otherwise we would never be woken up and so the tps6586x must
>>> disable it's interrupt instead.
>>>
>>> Prevent the tps6586x interrupt handler from executing on exiting suspend
>>> before the i2c controller has been resumed by disabling the tps6586x
>>> interrupt on entering suspend and re-enabling it on resuming from
>>> suspend.
>>>
>>> Cc: stable@vger.kernel.org
>>>
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>> ---
>>>  drivers/mfd/tps6586x.c | 24 ++++++++++++++++++++++++
>>>  1 file changed, 24 insertions(+)
>>
>> So does this mean that the SPI interrupt for the PMIC can still be a
>> wakeup source even if it is masked? This is slightly odd because now
>> you're saying that this does work while it doesn't work for the RTC
>> interrupt. So is this an implementation quirk of the LIC/GIC on Tegra
>> which doesn't extend to the TPS6586x? Or am I missing something?
> 
> What is the expected behaviour of IRQ disabling? Should it disable wakeup ability or only mask IRQ handling?

I believe only mask the interrupt. However, the caveat here could be if
the parent interrupt controller actually supports wake-up. For Tegra it
is the LIC that handles the wake-up.

> Couple months ago disabling of IRQ was disabling the wakeup, now something has been changed in kernel and wakeup isn't getting disabled. So either there was a bug before that was fixed or there is a bug now.

Are you sure you were disabling the PMIC host interrupt? If you disable
the RTC interrupt in the PMIC's RTC driver, then this will prevent the
wake-up from occurring because you are masking the interrupt within the
PMIC and so it will never generate an interrupt to the host.

Cheers
Jon

-- 
nvpublic
