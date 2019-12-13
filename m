From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/3] i2c: tegra: Support atomic transfers
Date: Fri, 13 Dec 2019 18:25:35 +0300
Message-ID: <840b678e-de92-1564-1739-c15ca8dd5766@gmail.com>
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-2-digetx@gmail.com> <20191213151208.GC222809@ulmo>
 <5a2a9cef-f4ed-c5a4-1f35-c89c3b5106a6@gmail.com>
 <20191213152017.GA293199@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191213152017.GA293199@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

13.12.2019 18:20, Thierry Reding пишет:
> On Fri, Dec 13, 2019 at 06:15:12PM +0300, Dmitry Osipenko wrote:
>> 13.12.2019 18:12, Thierry Reding пишет:
>>> On Fri, Dec 13, 2019 at 02:34:26AM +0300, Dmitry Osipenko wrote:
>>>> System shutdown may happen with interrupts being disabled and in this case
>>>> I2C core rejects transfers if atomic transfer isn't supported by driver.
>>>>
>>>> There were several occurrences where I found my Nexus 7 completely
>>>> discharged despite of being turned off and then one day I spotted this in
>>>> the log:
>>>>
>>>>  reboot: Power down
>>>>  ------------[ cut here ]------------
>>>>  WARNING: CPU: 0 PID: 1 at drivers/i2c/i2c-core.h:40 i2c_transfer+0x95/0x9c
>>>>  No atomic I2C transfer handler for 'i2c-1'
>>>>  Modules linked in: tegra30_devfreq
>>>>  CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted 5.4.0-next-20191202-00120-gf7ecd80fb803-dirty #3195
>>>>  Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>>>>  [<c010e4b5>] (unwind_backtrace) from [<c010a0fd>] (show_stack+0x11/0x14)
>>>>  [<c010a0fd>] (show_stack) from [<c09995e5>] (dump_stack+0x85/0x94)
>>>>  [<c09995e5>] (dump_stack) from [<c011f3d1>] (__warn+0xc1/0xc4)
>>>>  [<c011f3d1>] (__warn) from [<c011f691>] (warn_slowpath_fmt+0x61/0x78)
>>>>  [<c011f691>] (warn_slowpath_fmt) from [<c069a8dd>] (i2c_transfer+0x95/0x9c)
>>>>  [<c069a8dd>] (i2c_transfer) from [<c05667f1>] (regmap_i2c_read+0x4d/0x6c)
>>>>  [<c05667f1>] (regmap_i2c_read) from [<c0563601>] (_regmap_raw_read+0x99/0x1cc)
>>>>  [<c0563601>] (_regmap_raw_read) from [<c0563757>] (_regmap_bus_read+0x23/0x38)
>>>>  [<c0563757>] (_regmap_bus_read) from [<c056293d>] (_regmap_read+0x3d/0xfc)
>>>>  [<c056293d>] (_regmap_read) from [<c0562d3b>] (_regmap_update_bits+0x87/0xc4)
>>>>  [<c0562d3b>] (_regmap_update_bits) from [<c0563add>] (regmap_update_bits_base+0x39/0x50)
>>>>  [<c0563add>] (regmap_update_bits_base) from [<c056fd39>] (max77620_pm_power_off+0x29/0x2c)
>>>>  [<c056fd39>] (max77620_pm_power_off) from [<c013bbdd>] (__do_sys_reboot+0xe9/0x170)
>>>>  [<c013bbdd>] (__do_sys_reboot) from [<c0101001>] (ret_fast_syscall+0x1/0x28)
>>>>  Exception stack(0xde907fa8 to 0xde907ff0)
>>>>  7fa0:                   00000000 00000000 fee1dead 28121969 4321fedc 00000000
>>>>  7fc0: 00000000 00000000 00000000 00000058 00000000 00000000 00000000 00000000
>>>>  7fe0: 0045adf0 bed9abb8 004444a0 b6c666d0
>>>>  ---[ end trace bdd18f87595b1a5e ]---
>>>>
>>>> The atomic transferring is implemented by enforcing PIO mode for the
>>>> transfer and by polling interrupt status until transfer is completed or
>>>> failed.
>>>>
>>>> Now system shuts down properly every time.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/i2c/busses/i2c-tegra.c | 95 +++++++++++++++++++++++++++++++---
>>>>  1 file changed, 88 insertions(+), 7 deletions(-)
>>>
>>> I ran this on the test farm and the results are all green, so:
>>>
>>> Tested-by: Thierry Reding <treding@nvidia.com>
>>>
>>
>> Thanks!
>>
>> Does the farm test board's shut down by verifying the
>> hardware's power state?
> 
> No, that's not something we test. I was primarily running this to make
> sure we don't regress anywhere else.

Verifying basics is also good :) Thanks again!
