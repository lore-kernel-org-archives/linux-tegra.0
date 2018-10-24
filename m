From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] mfd: tps6586x: Handle interrupts on suspend
Date: Wed, 24 Oct 2018 11:41:28 +0100
Message-ID: <38d9adb7-8a1a-3169-5401-f353a190f9c7@nvidia.com>
References: <1539955373-13735-1-git-send-email-jonathanh@nvidia.com>
 <20181022095257.GD4014@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181022095257.GD4014@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 22/10/2018 10:52, Thierry Reding wrote:
> On Fri, Oct 19, 2018 at 02:22:53PM +0100, Jon Hunter wrote:
>> From: Jonathan Hunter <jonathanh@nvidia.com>
>>
>> The tps6586x driver creates an irqchip that is used by its various child
>> devices for managing interrupts. The tps6586x-rtc device is one of its
>> children that uses the tps6586x irqchip. When using the tps6586x-rtc as
>> a wake-up device from suspend, the following is seen:
>>
>>  PM: Syncing filesystems ... done.
>>  Freezing user space processes ... (elapsed 0.001 seconds) done.
>>  OOM killer disabled.
>>  Freezing remaining freezable tasks ... (elapsed 0.000 seconds) done.
>>  Disabling non-boot CPUs ...
>>  Entering suspend state LP1
>>  Enabling non-boot CPUs ...
>>  CPU1 is up
>>  tps6586x 3-0034: failed to read interrupt status
>>  tps6586x 3-0034: failed to read interrupt status
>>
>> The reason why the tps6586x interrupt status cannot be read is because
>> the tps6586x interrupt is not masked during suspend and when the
>> tps6586x-rtc interrupt occurs, to wake-up the device, the interrupt is
>> seen before the i2c controller has been resumed in order to read the
>> tps6586x interrupt status.
>>
>> The tps6586x-rtc driver sets it's interrupt as a wake-up source during
>> suspend, which gets propagated to the parent tps6586x interrupt.
>> However, the tps6586x-rtc driver cannot disable it's interrupt during
>> suspend otherwise we would never be woken up and so the tps6586x must
>> disable it's interrupt instead.
>>
>> Prevent the tps6586x interrupt handler from executing on exiting suspend
>> before the i2c controller has been resumed by disabling the tps6586x
>> interrupt on entering suspend and re-enabling it on resuming from
>> suspend.
>>
>> Cc: stable@vger.kernel.org
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>  drivers/mfd/tps6586x.c | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
> 
> So does this mean that the SPI interrupt for the PMIC can still be a
> wakeup source even if it is masked? This is slightly odd because now
> you're saying that this does work while it doesn't work for the RTC
> interrupt. So is this an implementation quirk of the LIC/GIC on Tegra
> which doesn't extend to the TPS6586x? Or am I missing something?

No it is not a quirk for the Tegra LIC/GIC, it is purely an issue with
the PMIC driver and this issue could occur on other platforms not just
Tegra.

During suspend, we want the PMIC's host interrupt to be masked in the
LIC/GIC level, but the wake-up for this interrupt to be enabled in the
LIC. Currently, the wake-up is enabled in the LIC, but the interrupt is
not being masked in the LIC/GIC which is the problem.

If the RTC interrupt within the PMIC is disabled, then the PMIC
generates no interrupt to the host (ie. Tegra) on an alarm. The PMIC
interrupt controller only has an interrupt mask for the various
interrupt sources within the PMIC. Therefore, if the RTC is
enabled/in-use we should never mask its interrupt within the PMIC.

Once the PMIC has been suspended, then it makes sense to disable its
interrupt, because it cannot be service until it has been resumed,
implying that I2C controller (ie. its parent) has also been resumed.

Cheers
Jon

-- 
nvpublic
