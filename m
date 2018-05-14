From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] i2c: tegra: Remove suspend-resume
Date: Mon, 14 May 2018 16:03:50 +0300
Message-ID: <35bb3f47-2767-bc6c-62c0-b568f80a1cfb@gmail.com>
References: <20180513211347.7187-1-digetx@gmail.com>
 <20180514115933.GH18312@ulmo> <20180514121833.2hcpuwfjxmzi3rcx@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180514121833.2hcpuwfjxmzi3rcx@katana>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Shardar Shariff Md <smohammed@nvidia.com>, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 14.05.2018 15:18, Wolfram Sang wrote:
> On Mon, May 14, 2018 at 01:59:33PM +0200, Thierry Reding wrote:
>> On Mon, May 14, 2018 at 12:13:47AM +0300, Dmitry Osipenko wrote:
>>> Nothing prevents I2C clients to access I2C while Tegra's driver is being
>>> suspended, this results in -EBUSY error returned to the clients and that
>>> may have unfortunate consequences. In particular this causes problems
>>> for the TPS6586x MFD driver which emits hundreds of "failed to read
>>> interrupt status" error messages on resume from suspend. This happens if
>>> TPS6586X is used to wake system from suspend by the expired RTC alarm
>>> timer because TPS6586X is an I2C device driver and its IRQ handler reads
>>> the status register while Tegra's I2C driver is suspended, i.e. just after
>>> kernel enabled IRQ's during of resume-from-suspend process.
>>>
>>> Note that the removed tegra_i2c_resume() invoked tegra_i2c_init() which
>>> performs HW reset. That seems was also not entirely correct because moving
>>> tegra_i2c_resume to an earlier stage of resume-from-suspend process causes
>>> I2C transfer to fail in the case of TPS6586X. It is fine to remove the
>>> HW-reinitialization for now because it should be only needed in a case of
>>> using lowest power-mode during suspend, which upstream kernel doesn't
>>> support.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> Cc: <stable@vger.kernel.org>
>>> ---
>>>  drivers/i2c/busses/i2c-tegra.c | 33 ---------------------------------
>>>  1 file changed, 33 deletions(-)
>>
>> Shardar, Laxman, any thoughts on this? The is_suspended thing looks to
>> me like a workaround of some sort that may not be needed if clients have
>> proper suspend/resume implementations. Even without suspend/resume
>> support in client drivers, the driver core should resume devices in the
>> right order (I2C adapter before any of the clients), so I don't see any
>> cases where the is_suspended logic would be useful.
> 
> Thanks for this patch!
> 
> This is closely related to a discussion we started recently:
> 
> "I2C PM overhaul needed?" https://lkml.org/lkml/2018/5/4/329
> 
> And part of the outcome is that the I2C core should print a WARN if an
> I2C client tries to use I2C at suspend_noirq state or later. This is to
> remove logic like in this patch from all I2C host drivers and to make it
> more explicit that those I2C client drivers need their PM fixed.
> 

Thank you very much for pointing at the discussion. Indeed it should be nicer if
I2C core handled the buggy client drivers and the rest of related suspend/resume
issues instead of having each I2C BUS driver to do it on its own.
