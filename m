From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra124: pmu support
Date: Mon, 15 Jun 2015 10:59:39 -0600
Message-ID: <557F047B.6090801@wwwdotorg.org>
References: <1434169283-19512-1-git-send-email-khuey@kylehuey.com> <557F012D.5040509@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <557F012D.5040509-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kyle Huey <me-OhBmq/TcCDJWk0Htik3J/w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyle Huey <khuey-OhBmq/TcCDJWk0Htik3J/w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/15/2015 10:45 AM, Jon Hunter wrote:
> Adding linux-tegra ML ...

Oh, still none of the Tegra maintainers are CC'd. scripts/get_maintainer.pl.

> On 13/06/15 05:21, Kyle Huey wrote:
>> This patch modifies the device tree for tegra124 based devices to enable the Cortex A15 PMU.  The interrupt numbers are taken from NVIDIA TRM DP-06905-001_v03p.  This patch was tested on a Jetson TK1.
>>
>> Signed-off-by: Kyle Huey <khuey-OhBmq/TcCDJWk0Htik3J/w@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/tegra124.dtsi | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi

>> +	pmu {
>> +		compatible = "arm,cortex-a15-pmu";
>> +		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
>> +	};
>> +
>>   	timer@0,60005000 {

This looks like it's sorted in the wrong location. Nodes are currently 
grouped by those with reg property (sorted by reg) and those without a 
reg property (sorted alphabetically).
