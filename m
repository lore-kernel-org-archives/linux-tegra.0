From: Bo Yan <byan@nvidia.com>
Subject: Re: [PATCH V2] arm64: tegra: add topology data for Tegra194 cpu
Date: Wed, 13 Feb 2019 08:24:29 -0800
Message-ID: <705dcfd2-0808-2c50-d73f-97050bf876f0@nvidia.com>
References: <20190131222517.GB13156@mithrandir>
 <1549928827-14006-1-git-send-email-byan@nvidia.com>
 <20190213081252.GA647@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213081252.GA647@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: jonathanh@nvidia.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

I agree, will update this patch with full paths replacing phandles.

On 2/13/19 12:12 AM, Thierry Reding wrote:
> On Mon, Feb 11, 2019 at 03:47:07PM -0800, Bo Yan wrote:
>> The xavier CPU architecture includes 8 CPU cores organized in
>> 4 clusters. Add cpu-map data for topology initialization, this
>> fixes the topology information in
>> /sys/devices/system/cpu/cpu[n]/topology
>>
>> Signed-off-by: Bo Yan <byan@nvidia.com>
>> ---
>> V2: remove cache nodes, add topology data only
>>
>>   arch/arm64/boot/dts/nvidia/tegra194.dtsi | 58 +++++++++++++++++++++++++++-----
>>   1 file changed, 50 insertions(+), 8 deletions(-)
> 
> This mostly looks good to me. One minor comment below.
> 
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
>> index 6dfa1ca..35e6e76 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
>> @@ -870,56 +870,98 @@
>>   		#address-cells = <1>;
>>   		#size-cells = <0>;
>>   
>> -		cpu@0 {
>> +		cpu-map {
>> +			cluster0 {
>> +				core0 {
>> +					cpu = <&cl0_0>;
> 
> I wonder if perhaps in this case it would be better to use the full path
> to refer to the phandle here. That way we can avoid the labels, which
> are somewhat cumbersome to write and the hierarchy, in my opinion, is a
> much more natural way to reference these.
> 
> What I'm suggesting would look roughly like this:
> 
> 		cpu-map {
> 			cluster0 {
> 				core0 {
> 					cpu = <&{/cpus/cpu@0}>;
> 				};
> 
> 				core1 {
> 					cpu = <&{/cpus/cpu@1}>;
> 				};
> 			};
> 
> 			cluster1 {
> 				core0 {
> 					cpu = <&{/cpus/cpu@2}>;
> 				};
> 
> 				core1 {
> 					cpu = <&{/cpus/cpu@3}>;
> 				};
> 			};
> 
> 			...
> 		};
> 
> That's slightly more characters, but I think it's much easier to read
> than the labels.
> 
> I don't feel very strongly about it, though, so feel free to keep this
> as-is if you prefer.
> 
> Thierry
> 
