From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra: Add CPU and PSCI nodes for NVIDIA Tegra210
 platforms
Date: Tue, 28 Mar 2017 16:37:36 +0100
Message-ID: <29312056-accf-cd4b-b0c2-d02fc085cb60@arm.com>
References: <1490701718-16571-1-git-send-email-jonathanh@nvidia.com>
 <bf527c4b-f17c-bfcf-e7fa-dab64b131996@arm.com>
 <e3ab2e09-ee32-96e2-b0c8-f7def668bf31@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e3ab2e09-ee32-96e2-b0c8-f7def668bf31-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>, Vagrant Cascadian <vagrant-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



On 28/03/17 16:32, Jon Hunter wrote:
> 
> On 28/03/17 15:55, Sudeep Holla wrote:
>> On 28/03/17 12:48, Jon Hunter wrote:
>>> Add the CPU and PSCI nodes for the NVIDIA Tegra210 platforms so that
>>> all CPUs can be enabled on boot. This assumes that the PSCI firmware
>>> has been loaded during the initial bootstrap on the device before the
>>> kernel starts (which is typically the case for these platforms). The
>>> PSCI firmware version is set to v0.2 which aligns with the current
>>> shipping version for Tegra.
>>>
>>> Reported-by: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 23 +++++++++++++++++++++++
>>>  arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi | 24 ++++++++++++++++++++++++
>>>  2 files changed, 47 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
>>> index 906fb836d241..de1696c28140 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
>>> @@ -296,6 +296,29 @@
>>>  		};
>>>  	};
>>>  
>>> +	cpus {
>>> +		cpu@0 {
>>> +			enable-method = "psci";
>>
>> Is some firmware expected to populate other required properties ?
>>
>> If yes, why not populate everything in the firmware ?
>>
>> If no, how does it even boot secondaries without the "reg" property
>> that usually contains MPIDR.
> 
> Please see 'arch/arm64/boot/dts/nvidia/tegra210.dtsi' which has these
> fields. So far we have been populating the psci information at the board
> level and so I have kept with that here and so the above is just the
> delta. Maybe the $subject could be a little clearer!

Sorry for the noise, I traversed files/headers upwards and missed
the innermost tegra210.dtsi :(

-- 
Regards,
Sudeep
