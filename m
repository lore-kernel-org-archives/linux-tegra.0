From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v10 12/15] memory: tegra: Introduce Tegra30 EMC driver
Date: Fri, 15 Nov 2019 16:17:43 +0300
Message-ID: <01141234-b0c2-63a9-1c81-b7ec3b44fb6d@gmail.com>
References: <20190811210043.20122-1-digetx@gmail.com>
 <20190811210043.20122-13-digetx@gmail.com>
 <41ab3704-46e4-696d-2577-9d0a35ed2861@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <41ab3704-46e4-696d-2577-9d0a35ed2861@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

15.11.2019 15:54, Jon Hunter пишет:
> 
> On 11/08/2019 22:00, Dmitry Osipenko wrote:
>> Introduce driver for the External Memory Controller (EMC) found on Tegra30
>> chips, it controls the external DRAM on the board. The purpose of this
>> driver is to program memory timing for external memory on the EMC clock
>> rate change.
>>
>> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/memory/tegra/Kconfig       |   10 +
>>  drivers/memory/tegra/Makefile      |    1 +
>>  drivers/memory/tegra/mc.c          |    9 +-
>>  drivers/memory/tegra/mc.h          |   30 +-
>>  drivers/memory/tegra/tegra30-emc.c | 1232 ++++++++++++++++++++++++++++
>>  drivers/memory/tegra/tegra30.c     |   42 +
>>  include/soc/tegra/mc.h             |    2 +-
>>  7 files changed, 1311 insertions(+), 15 deletions(-)
>>  create mode 100644 drivers/memory/tegra/tegra30-emc.c
> 
> This patch is causing the following crash on Tegra30-cardhu-a04 on
> entering suspend ...
> 
> [   58.320034] 8<--- cut here ---
> [   58.323166] Unable to handle kernel NULL pointer dereference at virtual address 0000004c
> [   58.331262] pgd = 62bca252
> [   58.334028] [0000004c] *pgd=00000000
> [   58.337615] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> [   58.342927] Modules linked in: brcmfmac brcmutil
> [   58.347559] CPU: 1 PID: 689 Comm: rtcwake Tainted: G        W         5.4.0-rc6-next-20191108 #1
> [   58.356343] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> [   58.362620] PC is at tegra_emc_suspend+0x4/0x50
> [   58.367161] LR is at dpm_run_callback+0x38/0x1d4
> [   58.371778] pc : [<c07a9ce0>]    lr : [<c05c2a2c>]    psr: a0000113
> [   58.378042] sp : ee3afd98  ip : 00000000  fp : 00000000
> [   58.383265] r10: c1077e1c  r9 : ef254c54  r8 : c1077de4
> [   58.388488] r7 : c0d1d3e4  r6 : ef254c10  r5 : 00000002  r4 : c05b5e28
> [   58.395013] r3 : c07a9cdc  r2 : 00000000  r1 : c0bbadc4  r0 : ef254c10
> [   58.401542] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [   58.408677] Control: 10c5387d  Table: adcf804a  DAC: 00000051
> [   58.414423] Process rtcwake (pid: 689, stack limit = 0x8afb9f6f)
> [   58.420429] Stack: (0xee3afd98 to 0xee3b0000)
> [   58.424787] fd80:                                                       ef254c10 c110c438
> [   58.432969] fda0: 00000000 00000002 c1077de4 ef254c54 c1077e1c c05c30fc 00000000 ef254ca8
> [   58.441150] fdc0: ef254c10 c1077de4 c110c438 c1077de4 c05c3560 c1077e1c 00000000 c05c5730
> [   58.449330] fde0: 00000002 c10c3648 c10d3df0 00000000 00000002 00000003 c1004e48 00000004
> [   58.457511] fe00: ede68100 edf50210 00475228 c05c6030 c10d3dbc 00000000 00000003 c017d16c
> [   58.465693] fe20: c10c889c 00000004 ede68100 edf50210 00475228 c0181404 c0cbbba4 ee3afe5c
> [   58.473873] fe40: c10c889c e8e19516 ee3afe5c c1004e48 00000000 00000003 c10c889c 00000004
> [   58.482054] fe60: ede68100 edf50210 00475228 c017dd18 00000008 e8e19516 00000cc0 00000003
> [   58.490234] fe80: c0cbeff4 00000003 c10d3dd0 c017c088 00000004 edf50200 00000000 00000000
> [   58.498415] fea0: ede68100 ee3aff78 edf50210 c02fcfe4 00000000 00000000 c1004e48 c02fceec
> [   58.506602] fec0: 00476438 ee3aff78 00000000 00476438 00000004 c027a3f0 00000055 00000cc0
> [   58.514791] fee0: 00000477 00477000 edcf8010 edcf8010 00000000 00000000 00000000 00000000
> [   58.522981] ff00: ffefe1dc eff2b394 00000000 e8e19516 00000001 ee3affb0 ef2bb700 edf2a200
> [   58.531166] ff20: 0047743c 00000817 eddd5ad0 e8e19516 edf2a240 00000004 edc53e40 00476438
> [   58.539352] ff40: ee3aff78 00000000 00476438 00000004 00475228 c027b99c 00000000 00000000
> [   58.547542] ff60: c1004e48 edc53e40 00000000 00000000 edc53e40 c027bc3c 00000000 00000000
> [   58.555732] ff80: 00001008 e8e19516 0000006c 00476438 00475228 00000004 c0101204 ee3ae000
> [   58.563922] ffa0: 00000004 c0101000 0000006c 00476438 00000004 00476438 00000004 00000000
> [   58.572107] ffc0: 0000006c 00476438 00475228 00000004 00000004 00000004 0046278c 00475228
> [   58.580294] ffe0: 00000004 be9db9b8 b6eb3c0b b6e3e206 600f0030 00000004 00000000 00000000
> [   58.588491] [<c07a9ce0>] (tegra_emc_suspend) from [<c110c438>] (0xc110c438)
> [   58.595466] Code: e7c4321f e5c4304c e8bd8010 e5902040 (e5d2304c) 
> [   58.601656] ---[ end trace 8d7d1a7fb898a1d0 ]---
> [   88.142888] ------------[ cut here ]------------

Oh, right. I never tried to suspend without memory timings being defined
in DT.

Jon, thank you very much for the report. I'll make a patch to fix that
problem.
