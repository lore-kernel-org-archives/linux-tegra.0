From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH v1] i2c: tegra: Remove suspend-resume
Date: Mon, 14 May 2018 17:51:58 +0530
Message-ID: <d83fc1f7-d5e5-4211-1cd8-babcabdd9c4b@nvidia.com>
References: <20180513211347.7187-1-digetx@gmail.com>
 <20180514115933.GH18312@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180514115933.GH18312@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Jonathan Hunter <jonathanh@nvidia.com>, Shardar Shariff Md <smohammed@nvidia.com>, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On Monday 14 May 2018 05:29 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Mon, May 14, 2018 at 12:13:47AM +0300, Dmitry Osipenko wrote:
>> Nothing prevents I2C clients to access I2C while Tegra's driver is being
>> suspended, this results in -EBUSY error returned to the clients and that
>> may have unfortunate consequences. In particular this causes problems
>> for the TPS6586x MFD driver which emits hundreds of "failed to read
>> interrupt status" error messages on resume from suspend. This happens if
>> TPS6586X is used to wake system from suspend by the expired RTC alarm
>> timer because TPS6586X is an I2C device driver and its IRQ handler reads
>> the status register while Tegra's I2C driver is suspended, i.e. just after
>> kernel enabled IRQ's during of resume-from-suspend process.
>>
>> Note that the removed tegra_i2c_resume() invoked tegra_i2c_init() which
>> performs HW reset. That seems was also not entirely correct because moving
>> tegra_i2c_resume to an earlier stage of resume-from-suspend process causes
>> I2C transfer to fail in the case of TPS6586X. It is fine to remove the
>> HW-reinitialization for now because it should be only needed in a case of
>> using lowest power-mode during suspend, which upstream kernel doesn't
>> support.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> Cc: <stable@vger.kernel.org>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 33 ---------------------------------
>>   1 file changed, 33 deletions(-)
> Shardar, Laxman, any thoughts on this? The is_suspended thing looks to
> me like a workaround of some sort that may not be needed if clients have
> proper suspend/resume implementations. Even without suspend/resume
> support in client drivers, the driver core should resume devices in the
> right order (I2C adapter before any of the clients), so I don't see any
> cases where the is_suspended logic would be useful.
>

Our I2C driver is based on the interrupt. So we have converted the 
suspend/resume to suspend_noirq and reseume_noirq so that we will not 
allow the transfer when system interrupt disabled in downstream.
           SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend, 
tegra_i2c_resume)

In shutdown path, where interrupt disabled and still need i2c, we use 
the bit-bang method via GPIO for i2c transfer.
