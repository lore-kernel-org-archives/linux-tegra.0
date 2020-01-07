From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 4/9] i2c: tegra: Support atomic transfers
Date: Tue, 7 Jan 2020 12:39:04 +0000
Message-ID: <bd38201cb9e742c295ed6d4f278289cc@HQMAIL105.nvidia.com>
References: <20200106010423.5890-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106010423.5890-5-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 06 Jan 2020 04:04:18 +0300, Dmitry Osipenko wrote:
> System shutdown may happen with interrupts being disabled and in this case
> I2C core rejects transfers if atomic transfer isn't supported by driver.
> 
> There were several occurrences where I found my Nexus 7 completely
> discharged despite of being turned off and then one day I spotted this in
> the log:
> 
>  reboot: Power down
>  ------------[ cut here ]------------
>  WARNING: CPU: 0 PID: 1 at drivers/i2c/i2c-core.h:40 i2c_transfer+0x95/0x9c
>  No atomic I2C transfer handler for 'i2c-1'
>  Modules linked in: tegra30_devfreq
>  CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted 5.4.0-next-20191202-00120-gf7ecd80fb803-dirty #3195
>  Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>  [<c010e4b5>] (unwind_backtrace) from [<c010a0fd>] (show_stack+0x11/0x14)
>  [<c010a0fd>] (show_stack) from [<c09995e5>] (dump_stack+0x85/0x94)
>  [<c09995e5>] (dump_stack) from [<c011f3d1>] (__warn+0xc1/0xc4)
>  [<c011f3d1>] (__warn) from [<c011f691>] (warn_slowpath_fmt+0x61/0x78)
>  [<c011f691>] (warn_slowpath_fmt) from [<c069a8dd>] (i2c_transfer+0x95/0x9c)
>  [<c069a8dd>] (i2c_transfer) from [<c05667f1>] (regmap_i2c_read+0x4d/0x6c)
>  [<c05667f1>] (regmap_i2c_read) from [<c0563601>] (_regmap_raw_read+0x99/0x1cc)
>  [<c0563601>] (_regmap_raw_read) from [<c0563757>] (_regmap_bus_read+0x23/0x38)
>  [<c0563757>] (_regmap_bus_read) from [<c056293d>] (_regmap_read+0x3d/0xfc)
>  [<c056293d>] (_regmap_read) from [<c0562d3b>] (_regmap_update_bits+0x87/0xc4)
>  [<c0562d3b>] (_regmap_update_bits) from [<c0563add>] (regmap_update_bits_base+0x39/0x50)
>  [<c0563add>] (regmap_update_bits_base) from [<c056fd39>] (max77620_pm_power_off+0x29/0x2c)
>  [<c056fd39>] (max77620_pm_power_off) from [<c013bbdd>] (__do_sys_reboot+0xe9/0x170)
>  [<c013bbdd>] (__do_sys_reboot) from [<c0101001>] (ret_fast_syscall+0x1/0x28)
>  Exception stack(0xde907fa8 to 0xde907ff0)
>  7fa0:                   00000000 00000000 fee1dead 28121969 4321fedc 00000000
>  7fc0: 00000000 00000000 00000000 00000058 00000000 00000000 00000000 00000000
>  7fe0: 0045adf0 bed9abb8 004444a0 b6c666d0
>  ---[ end trace bdd18f87595b1a5e ]---
> 
> The atomic transferring is implemented by enforcing PIO mode for the
> transfer and by polling interrupt status until transfer is completed or
> failed.
> 
> Now system shuts down properly every time.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 84 ++++++++++++++++++++++++++++------
>  1 file changed, 69 insertions(+), 15 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
