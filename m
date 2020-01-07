From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 0/9] NVIDIA Tegra I2C driver fixes and improvements
Date: Tue, 7 Jan 2020 19:39:27 +0300
Message-ID: <c830befd-ac96-04ca-4338-1ca33f0674c3@gmail.com>
References: <20200106010423.5890-1-digetx@gmail.com>
 <20200107123837.GE1964183@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200107123837.GE1964183@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello Thierry,

07.01.2020 15:38, Thierry Reding пишет:
> On Mon, Jan 06, 2020 at 04:04:14AM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This patchset adds support for atomic transfers which are required for
>> shutting down machine properly. Secondly, a (not)suspending I2C and some
>> other things are fixed/improved by this small series as well. Please review
>> and apply, thanks in advance!
>>
>> Changelog:
>>
>> v3: The "Prevent interrupt triggering after transfer timeout" and "Support
>>     atomic transfers" patches got extra very minor improvements. The
>>     completion now is passed directly to tegra_i2c_poll_completion_timeout(),
>>     for consistency.
>>
>>     Added two new patches that firm up DMA transfer handling:
>>
>>       i2c: tegra: Always terminate DMA transfer
>>       i2c: tegra: Check DMA completion status in addition to left time
>>
>> v2: The series is renamed from "Tegra I2C: Support atomic transfers and
>>     correct suspend/resume" to "NVIDIA Tegra I2C driver fixes and
>>     improvements" because it now contains some more various changes.
>>
>>     New patches in v2:
>>
>>       i2c: tegra: Correct unwinding order on driver's probe error
>>       i2c: tegra: Prevent interrupt triggering after transfer timeout
>>       i2c: tegra: Use relaxed versions of readl/writel
>>
>>     The "Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN" got an
>>     improved wording for the code's comment to I2C_PIO_MODE_PREFERRED_LEN.
>>
>>     The "Support atomic transfers" also got some very minor tuning, like
>>     s/in_interrupt()/i2c_dev->is_curr_atomic_xfer/ in dvc_writel() that was
>>     missed in v1.
>>
>> v1: The "i2c: tegra: Support atomic transfers" previously was sent out as
>>     a separate patch, but later I spotted that suspend/resume doesn't
>>     work properly. The "i2c: tegra: Fix suspending in active runtime PM
>>     state" patch depends on the atomic patch because there is a need to
>>     active IRQ-safe mode for the runtime PM by both patches.
>>
>>     I fixed a missed doc-comment of the newly added "is_curr_atomic_xfer"
>>     structure field and added additional comment that explains why IRQ needs
>>     to be disabled for the atomic transfer in the "Support atomic transfers"
>>     patch.
>>
>>     Lastly, I added a minor "i2c: tegra: Rename .." patch that helps to
>>     follow driver's code.
>>
>> Dmitry Osipenko (9):
>>   i2c: tegra: Fix suspending in active runtime PM state
>>   i2c: tegra: Properly disable runtime PM on driver's probe error
>>   i2c: tegra: Prevent interrupt triggering after transfer timeout
>>   i2c: tegra: Support atomic transfers
>>   i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN
>>   i2c: tegra: Use relaxed versions of readl/writel
>>   clk: tegra: Fix double-free in tegra_clk_init()
>>   i2c: tegra: Always terminate DMA transfer
>>   i2c: tegra: Check DMA completion status in addition to left time
>>
>>  drivers/clk/tegra/clk.c        |   4 +-
>>  drivers/i2c/busses/i2c-tegra.c | 216 ++++++++++++++++++++++-----------
>>  2 files changed, 147 insertions(+), 73 deletions(-)
> 
> I'm still a bit on the fence about that second patch because I don't
> think force-suspend is the right thing to do.

Technically the force-suspend does absolutely the right thing. That's
what other drivers do, including some of the Tegra drivers. Personally
I'm feeling confident that it should be correct. Of course it would be
better to get a confirmation, unfortunately Rafael didn't answer
anything yet. We can always make another patch if it will turn out that
something is wrong.

> You should probably split the clk subsystem patch out of this series so
> that it can be picked up into the clk tree (or I can pick it up into the
> Tegra tree).

I made a mistake during rebase and didn't notice that, the clk patch is
already applied to the clk tree by Stephen Boyd. I'll fix the rebase and
send out v4, thanks!

> Other than that, I ran this through the testfarm and didn't see any
> regressions:
> 
>     Test results:
>       13 builds: 13 pass, 0 fail
>       11 boots:  11 pass, 0 fail
>       38 tests:  38 pass, 0 fail
> 
>     Linux version: 5.5.0-rc5-g258d134300af
>     Boards tested: tegra20-ventana, tegra30-cardhu-a04, tegra124-jetson-tk1,
>                    tegra186-p2771-0000, tegra194-p2972-0000,
>                    tegra210-p2371-2180
> 
> I'll reply to the individual patches with a Tested-by for patchwork to
> pick up.

Thanks!
