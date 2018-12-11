From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH v5 0/3] Fixes for Tegra soctherm
Date: Tue, 11 Dec 2018 13:54:38 +0800
Message-ID: <7c82b0cc-9d96-2d94-3428-ad75a0600fd8@nvidia.com>
References: <1543816523-10525-1-git-send-email-wni@nvidia.com>
 <56fd1fc8-f70f-2d86-6a05-799a7bd0ff7e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56fd1fc8-f70f-2d86-6a05-799a7bd0ff7e@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, rui.zhang@intel.com, edubezval@gmail.com
Cc: thierry.reding@gmail.com, linux-tegra@vger.kernel.org, srikars@nvidia.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Rui & Eduardo,
It looks no more comments on this version, could you please take this
serial?

Thanks.
Wei.

On 5/12/2018 4:31 PM, Wei Ni wrote:
> Hi,
> Does there have any comments on this serial?
> 
> Thanks.
> Wei.
> 
> On 3/12/2018 1:55 PM, Wei Ni wrote:
>> This series fixed some issues for Tegra soctherm
>>
>> Main changes from v4:
>> 1. fixed for the parsing sensor id.
>> 2. keep warning for missing critical trips.
>>
>> Main changes from v3:
>> 1. updated codes for parsing sensor id, per Thierry's comments
>>
>> Main changes from v2:
>> 1. add codes to parse sensor id to avoid registration
>> failure.
>>
>> Main changes from v1:
>> 1. Acked by Thierry Reding <treding@nvidia.com> for the patch
>> "thermal: tegra: fix memory allocation".
>> 2. Print out the sensor name when register failed.
>> 2. Remove patch "thermal: tegra: fix coverity defect"
>>
>> Wei Ni (3):
>>   thermal: tegra: remove unnecessary warnings
>>   thermal: tegra: fix memory allocation
>>   thermal: tegra: parse sensor id before sensor register
>>
>>  drivers/thermal/tegra/soctherm.c | 51 ++++++++++++++++++++++++++++++++++++----
>>  1 file changed, 46 insertions(+), 5 deletions(-)
>>
