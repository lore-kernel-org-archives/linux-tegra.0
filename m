From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH v1 04/12] of: Add bindings of gpu hw throttle for Tegra
 soctherm
Date: Tue, 19 Feb 2019 14:34:49 +0800
Message-ID: <739a8c81-ee0a-999e-0508-6aa1fba768b7@nvidia.com>
References: <1545118484-23641-1-git-send-email-wni@nvidia.com>
 <1545118484-23641-6-git-send-email-wni@nvidia.com>
 <20190218203314.GB12911@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218203314.GB12911@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: thierry.reding@gmail.com, daniel.lezcano@linaro.org, edubezval@gmail.com, linux-tegra@vger.kernel.org, rui.zhang@intel.com, srikars@nvidia.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 19/2/2019 4:33 AM, Rob Herring wrote:
> On Tue, Dec 18, 2018 at 03:34:36PM +0800, Wei Ni wrote:
>> Add "nvidia,gpu-throt-level" property to set gpu hw
>> throttle level.
>>
>> Signed-off-by: Wei Ni <wni@nvidia.com>
>> ---
>>  .../bindings/thermal/nvidia,tegra124-soctherm.txt  | 17 +++++++++++++++--
>>  include/dt-bindings/thermal/tegra124-soctherm.h    | 22 ++++++++++++++++++----
>>  2 files changed, 33 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt
>> index ab66d6feab4b..cf6d0be56b7a 100644
>> --- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt
>> +++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt
>> @@ -52,6 +52,15 @@ Required properties :
>>          Must set as following values:
>>          TEGRA_SOCTHERM_THROT_LEVEL_LOW, TEGRA_SOCTHERM_THROT_LEVEL_MED
>>          TEGRA_SOCTHERM_THROT_LEVEL_HIGH, TEGRA_SOCTHERM_THROT_LEVEL_NONE
>> +      - nvidia,gpu-throt-level: This property is for Tegra124 and Tegra210.
> 
> Also, why not just use percents like nvidia,cpu-throt-percent?

Hi Rob,
We have to use "-level" for gpu throttle, can't use percents. It's
designed by hardware.
BTW, for the cpu-throt, it use "-level" for t132, and use "-percent" for
t124 and t210.

Thanks.
Wei.

> 
>> +        It is the level of pulse skippers, which used to throttle clock
>> +        frequencies. It indicates gpu clock throttling depth and can be
>> +        programmed to any of the following values which represent a throttling
>> +        percentage:
>> +        TEGRA_SOCTHERM_THROT_LEVEL_NONE (0%)
>> +        TEGRA_SOCTHERM_THROT_LEVEL_LOW (50%),
>> +        TEGRA_SOCTHERM_THROT_LEVEL_MED (75%),
>> +        TEGRA_SOCTHERM_THROT_LEVEL_HIGH (85%).
>>        - #cooling-cells: Should be 1. This cooling device only support on/off state.
>>          See ./thermal.txt for a description of this property.
