From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH V3 01/20] dt-bindings: clock: tegra124-dfll: Update DFLL
 binding for PWM regulator
Date: Wed, 19 Dec 2018 15:04:49 +0800
Message-ID: <4e0cc6a8-02cf-0590-ec5c-d11412168219@nvidia.com>
References: <20181218091232.23532-1-josephl@nvidia.com>
 <20181218091232.23532-2-josephl@nvidia.com> <20181218151934.GA10127@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181218151934.GA10127@bogus>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 12/18/18 11:19 PM, Rob Herring wrote:
> On Tue, Dec 18, 2018 at 05:12:13PM +0800, Joseph Lo wrote:
>> From: Peter De Schrijver <pdeschrijver@nvidia.com>
>>
>> Add new properties to configure the DFLL PWM regulator support.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>> *V3:
>>   - no change
>> *V2:
>>   - update the binding strings and descriptions for
>>   nvidia,pwm-tristate-microvolts
>>   nvidia,pwm-min-microvolts
>>   nvidia,pwm-voltage-step-microvolts
>> ---
>>   .../bindings/clock/nvidia,tegra124-dfll.txt   | 79 ++++++++++++++++++-
>>   1 file changed, 77 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>> index dff236f524a7..38e8cc8c70a8 100644
>> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>> @@ -8,7 +8,6 @@ the fast CPU cluster. It consists of a free-running voltage controlled
>>   oscillator connected to the CPU voltage rail (VDD_CPU), and a closed loop
>>   control module that will automatically adjust the VDD_CPU voltage by
>>   communicating with an off-chip PMIC either via an I2C bus or via PWM signals.
>> -Currently only the I2C mode is supported by these bindings.
>>   
>>   Required properties:
>>   - compatible : should be "nvidia,tegra124-dfll"
>> @@ -45,10 +44,31 @@ Required properties for the control loop parameters:
>>   Optional properties for the control loop parameters:
>>   - nvidia,cg-scale: Boolean value, see the field DFLL_PARAMS_CG_SCALE in the TRM.
>>   
>> +Optional properties for mode selection:
>> +- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
>> +
>>   Required properties for I2C mode:
>>   - nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mode.
>>   
>> -Example:
>> +Required properties for PWM mode:
>> +- nvidia,pwm-period: period of PWM square wave in microseconds.
> 
> Needs unit suffix.
> 

Hi Rob,

Thanks for reviewing these DT binding patches, will fix it.

Joseph
