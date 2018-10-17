From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] i2c: tegra: Remove suspend-resume
Date: Wed, 17 Oct 2018 17:30:15 +0300
Message-ID: <47eaced9-761d-b8d0-2f43-41bf3dd050cc@gmail.com>
References: <20180513211347.7187-1-digetx@gmail.com>
 <c1b73435-48f0-b445-568f-3c8942878123@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c1b73435-48f0-b445-568f-3c8942878123@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Thierry Reding <thierry.reding@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 10/17/18 4:59 PM, Jon Hunter wrote:
> 
> On 13/05/2018 22:13, Dmitry Osipenko wrote:
>> Nothing prevents I2C clients to access I2C while Tegra's driver is being
>> suspended, this results in -EBUSY error returned to the clients and that
>> may have unfortunate consequences. In particular this causes problems
>> for the TPS6586x MFD driver which emits hundreds of "failed to read
>> interrupt status" error messages on resume from suspend. This happens if
>> TPS6586X is used to wake system from suspend by the expired RTC alarm
>> timer because TPS6586X is an I2C device driver and its IRQ handler reads
>> the status register while Tegra's I2C driver is suspended, i.e. just after
>> kernel enabled IRQ's during of resume-from-suspend process.
> 
> I have been looking at the above issue with the tps6586x because I am
> seeing delays on resume caused by this driver on the stable branches. I
> understand that this patch was dropped for stable, but looking at the
> specific issue with the tps6586x I am curious why the tps6586x driver
> was not fixed because it appears to me that the issue largely resides
> with that driver and any other device that uses the tps6586x is
> susceptible to it. I was able to fix the tps6586x driver by doing the
> following and I am interested in your thoughts ...
> 
> Subject: [PATCH] mfd: tps6586x: Handle interrupts on suspend
> 
> The tps6586x device is registered as an irqchip and the tps6586x-rtc
> interrupt is one of it's interrupt sources. When using the tps6586x-rtc
> as a wake-up device from suspend, the following is seen:
> 
>  PM: Syncing filesystems ... done.
>  Freezing user space processes ... (elapsed 0.001 seconds) done.
>  OOM killer disabled.
>  Freezing remaining freezable tasks ... (elapsed 0.000 seconds) done.
>  Disabling non-boot CPUs ...
>  Entering suspend state LP1
>  Enabling non-boot CPUs ...
>  CPU1 is up
>  tps6586x 3-0034: failed to read interrupt status
>  tps6586x 3-0034: failed to read interrupt status
> 
> The reason why the tps6586x interrupt status cannot be read is because
> the tps6586x interrupt is not masked during suspend and when the
> tps6586x-rtc interrupt occurs, to wake-up the device, the interrupt is
> seen before the i2c controller has been resumed in order to read the
> tps6586x interrupt status.
> 
> The tps6586x-rtc driver sets it's interrupt as a wake-up source during
> suspend, which gets propagated to the parent tps6586x interrupt.
> However, the tps6586x-rtc driver cannot disable it's interrupt during
> suspend otherwise we would never be woken up and so the tps6586x must
> disable it's interrupt instead.
> 
> Fix this by disabling the tps6586x interrupt on entering suspend and
> re-enabling it on resuming from suspend.

Looks like it should work, but I vaguely recalling that something didn't work after disabling of IRQ on suspend. Maybe wakeup was getting disabled, but seems it is working fine now. Patch is good to me if you're going to propose it for backporting, but you should test that it works properly with all of stable kernels.

I just found this [0], seems your patch need to address the same review comment.

[0] https://lkml.org/lkml/2011/3/29/18
