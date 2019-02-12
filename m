From: Mark Zhang <markz@nvidia.com>
Subject: Re: [PATCH v2 0/4] Add max77620 charging & low battery support
Date: Tue, 12 Feb 2019 12:38:11 +0800
Message-ID: <a43eb007-c984-a209-2b4e-6672807029aa@nvidia.com>
References: <20190129085531.32364-1-markz@nvidia.com>
 <20190207084836.GF4672@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207084836.GF4672@dell>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: blaws05@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 2/7/2019 4:48 PM, Lee Jones wrote:
> On Tue, 29 Jan 2019, Mark Zhang wrote:
> 
>> This patch set adds support for max77620 backup battery charging and
>> low battery monitoring.
>>
>> Changes in v2:
>> - Add devicetree binding documentation
>>
>> Mark Zhang (4):
>>   mfd: max77620: Add backup battery charger support
>>   mfd: max77620: add documentation for backup battery charging
>>   mfd: max77620: Add low battery monitor support
>>   mfd: max77620: add documentation for low battery monitoring
>>
>>  .../devicetree/bindings/mfd/max77620.txt      |  34 +++++
>>  drivers/mfd/max77620.c                        | 137 +++++++++++++++++-
> 
> All of this needs moving out to the correct subsystem.
> 
> drivers/power/supply/max77620-battery.c looks right.

Actually max77620 is not a power supply device. This patch set adds 2
features:
- Backup battery charger. The RTC in max77620 is supplied from a backup
battery and consumes 2.0uA when no other power sources are available. So
basically this is not a system battery charger, it's just for RTC.
- Low battery monitoring. This is for monitoring the system main battery
voltage, so max77620 can shutdown or reset the SoC accordingly. But I
think this doesn't conform the idea of "power supply" driver as well.

Mark
> 
>>  2 files changed, 170 insertions(+), 1 deletion(-)
> 
