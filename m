From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 01/19] dt-bindings: clock: tegra124-dfll: Update DFLL
 binding for PWM regulator
Date: Tue, 11 Dec 2018 11:52:04 +0000
Message-ID: <7c5f6f34-43ba-e696-5cbc-2bd4d5303d91@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-2-josephl@nvidia.com>
 <af1211f0-dda0-bdde-f320-03e54f82d7e1@nvidia.com>
 <20181211091514.GA29064@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181211091514.GA29064@pdeschrijver-desktop.Nvidia.com>
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
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 11/12/2018 09:15, Peter De Schrijver wrote:
> On Fri, Dec 07, 2018 at 01:41:57PM +0000, Jon Hunter wrote:
>>
>> On 04/12/2018 09:25, Joseph Lo wrote:
>>> From: Peter De Schrijver <pdeschrijver@nvidia.com>
>>>
>>> Add new properties to configure the DFLL PWM regulator support. Also
>>> add an example and make the I2C clock only required when I2C support is
>>> used.
>>>
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>> ---
>>>  .../bindings/clock/nvidia,tegra124-dfll.txt   | 73 ++++++++++++++++++-
>>>  1 file changed, 71 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>>> index dff236f524a7..8c97600d2bad 100644
>>> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>>> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>>> @@ -8,7 +8,6 @@ the fast CPU cluster. It consists of a free-running voltage controlled
>>>  oscillator connected to the CPU voltage rail (VDD_CPU), and a closed loop
>>>  control module that will automatically adjust the VDD_CPU voltage by
>>>  communicating with an off-chip PMIC either via an I2C bus or via PWM signals.
>>> -Currently only the I2C mode is supported by these bindings.
>>>  
>>>  Required properties:
>>>  - compatible : should be "nvidia,tegra124-dfll"
>>> @@ -45,10 +44,28 @@ Required properties for the control loop parameters:
>>>  Optional properties for the control loop parameters:
>>>  - nvidia,cg-scale: Boolean value, see the field DFLL_PARAMS_CG_SCALE in the TRM.
>>>  
>>> +Optional properties for mode selection:
>>> +- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
>>> +
>>>  Required properties for I2C mode:
>>>  - nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mode.
>>>  
>>> -Example:
>>> +Required properties for PWM mode:
>>> +- nvidia,pwm-period: period of PWM square wave in microseconds.
>>> +- nvidia,init-uv: Regulator voltage in micro volts when PWM control is disabled.
>>
>> Maybe consider 'pwm-inactive-voltage-microvolt'.
>>
> 
> Inactive is not very accurate. The OVR regulator will output
> nvidia,align-offset-uv when the PWM input is driven low but will output
> nvidia,init-uv when the PWM input is in tristate mode.

Maybe but I really don't find 'nvidia,align-offset-uv' and
'nvidia,init-uv' very descriptive either. We need to make sure that the
names and description make it clear what these are and where they come
from to anyone reading that documentation that has never laid eyes on
this before.

Sounds like the align-offset-uv is the minimum voltage when PWM is
active/enabled and init-uv is the default voltage the regulator outputs
when PWM control is disabled. Would the following be any better ...

- nvidia,pwm-tristate-microvolts: Regulator voltage in micro volts when
  PWM control is disabled and the PWM output is tristated. Note that
  this voltage is configured in hardware, typically via a resistor
  divider.
- nvidia,pwm-min-microvolts: Regulator voltage in micro volts when PWM
  control is enabled and PWM output is low. Hence, this is the minimum
  output voltage that the regulator supports when PWM control is
  enabled.

Jon

-- 
nvpublic
