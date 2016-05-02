From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/1] pinctrl: tegra: avoid parked_reg and parked_bank
Date: Mon, 2 May 2016 23:29:57 +0530
Message-ID: <5727959D.2020005@nvidia.com>
References: <1462199330-1536-1-git-send-email-ldewangan@nvidia.com> <57276D4E.2020204@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <57276D4E.2020204@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>, linus.walleij@linaro.org, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Monday 02 May 2016 08:37 PM, Rhyland Klein wrote:
> On 5/2/2016 10:28 AM, Laxman Dewangan wrote:
>> NVIDIA's Tegra210 support the park bit to make pinmux configuration
>> enable/disable. If parked bit is 1 then configuration does not apply
>> and if it is 0 then pinmux configuration applies. This is to support
>> to avoid any glitch in pinmux configurations.
>>
>> The parked bit is part of mux register and mux bank and hence it is
>> not required to have member for the parked_reg and parked bank very
>> similar to other bit field of the same register.
>>
>> Remove the need of the parked register and parked bank and get whether
>> parked function supported or not by parked_bit.
>>
>> This is to make the parked bit handling same as other fields of mux
>> registers.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>> ---
>>   drivers/pinctrl/tegra/pinctrl-tegra.c    | 8 ++++----
>>   drivers/pinctrl/tegra/pinctrl-tegra.h    | 6 +-----
>>   drivers/pinctrl/tegra/pinctrl-tegra114.c | 4 ++--
>>   drivers/pinctrl/tegra/pinctrl-tegra124.c | 4 ++--
>>   drivers/pinctrl/tegra/pinctrl-tegra20.c  | 4 ++--
>>   drivers/pinctrl/tegra/pinctrl-tegra210.c | 4 +---
>>   drivers/pinctrl/tegra/pinctrl-tegra30.c  | 4 ++--
>>   7 files changed, 14 insertions(+), 20 deletions(-)
>>
> These drivers are generated (with the exception of Tegra20) by the
> tegra-pinmux-scripts hosted at :
> https://github.com/NVIDIA/tegra-pinmux-scripts.git. Did you generate a
> patch there so that the changes to pinctrl-tegra[114|124|210|30].c are
> consistent there? If not you probably should.
No, this is manual editing. Let me create patch on script to generate 
pinctrl-tegra[114|124|210|30].c as what this patch created manually.


