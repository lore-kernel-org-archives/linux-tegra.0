From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH 1/2] arm64: tegra: Add pinmux for PWM-based DFLL support
 on Shield platform
Date: Tue, 2 Apr 2019 11:06:36 +0800
Message-ID: <2c7c9268-0b95-fa49-294b-155a9499741e@nvidia.com>
References: <20190322071111.32432-1-josephl@nvidia.com>
 <20190322095244.GF28640@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190322095244.GF28640@ulmo>
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
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 3/22/19 5:52 PM, Thierry Reding wrote:
> On Fri, Mar 22, 2019 at 03:11:10PM +0800, Joseph Lo wrote:
>> Add pinmux for PWM-based DFLL support on Shield platform.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
> 
> There's been some discussion recently about moving away from programming
> pinmux in the kernel because it isn't always safe to do that. The idea
> is that early boot firmware (typically cboot) will already have set up
> the pinmux, so there's no need to do it again in the kernel.
> 
> These look like you're going to change this pin to/from tristate at
> runtime, so perhaps that's the kind of thing that we're okay with?
> 
> Adding Stephen for visibility.

Gentle ping.

Thanks,
Joseph

> 
> Thierry
> 
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
>> index 88a4b9333d84..c668f16c8574 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
>> @@ -1318,6 +1318,20 @@
>>   				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
>>   			};
>>   		};
>> +
>> +		dvfs_pwm_active_state: dvfs_pwm_active {
>> +			dvfs_pwm_pbb1 {
>> +				nvidia,pins = "dvfs_pwm_pbb1";
>> +				nvidia,tristate = <TEGRA_PIN_DISABLE>;
>> +			};
>> +		};
>> +
>> +		dvfs_pwm_inactive_state: dvfs_pwm_inactive {
>> +			dvfs_pwm_pbb1 {
>> +				nvidia,pins = "dvfs_pwm_pbb1";
>> +				nvidia,tristate = <TEGRA_PIN_ENABLE>;
>> +			};
>> +		};
>>   	};
>>   
>>   	serial@70006000 {
>> -- 
>> 2.21.0
>>
