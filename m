Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC8FC433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Nov 2021 22:54:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235927AbhK2W5c (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 17:57:32 -0500
Received: from foss.arm.com ([217.140.110.172]:50360 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235385AbhK2W5E (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 17:57:04 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4375C1063;
        Mon, 29 Nov 2021 14:53:44 -0800 (PST)
Received: from [10.57.34.182] (unknown [10.57.34.182])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8E633F5A1;
        Mon, 29 Nov 2021 14:53:42 -0800 (PST)
Message-ID: <8ea071d7-a8ff-813a-6268-7445dbbf0c1a@arm.com>
Date:   Mon, 29 Nov 2021 22:53:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/2] arm64: tegra: Describe Tegra234 CPU hierarchy
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>
References: <20211112131904.3683428-1-thierry.reding@gmail.com>
 <20211112131904.3683428-2-thierry.reding@gmail.com>
 <YaVAxNiU2O7kWXoQ@robh.at.kernel.org>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <YaVAxNiU2O7kWXoQ@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2021-11-29 21:06, Rob Herring wrote:
> On Fri, Nov 12, 2021 at 02:19:04PM +0100, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> The NVIDIA Tegra234 SoC has 3 clusters of 4 Cortex-A78AE CPU cores each,
>> for a total of 12 CPUs. Each CPU has 64 KiB instruction and data caches
>> with each cluster having an additional 256 KiB unified L2 cache and a 2
>> MiB L3 cache.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 365 ++++++++++++++++++++++-
>>   1 file changed, 363 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>> index 104e5fdd5f8a..db24f48edc9f 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>> @@ -736,12 +736,373 @@ cpus {
>>   		#address-cells = <1>;
>>   		#size-cells = <0>;
>>   
>> -		cpu@0 {
>> +		cpu0_0: cpu@0 {
>> +			compatible = "arm,cortex-a78";
>>   			device_type = "cpu";
>> -			reg = <0x000>;
>> +			reg = <0x00000>;
>>   
>>   			enable-method = "psci";
>> +
> 
>> +			i-cache-size = <65536>;
>> +			i-cache-line-size = <64>;
>> +			i-cache-sets = <256>;
>> +			d-cache-size = <65536>;
>> +			d-cache-line-size = <64>;
>> +			d-cache-sets = <256>;
> 
> Isn't all this discoverable?

No. The required parameters for cache maintenance by set/way are 
discoverable from the CTR, and if you're particularly lucky they might 
even happen to reflect the underlying physical cache structures, but 
there's absolutely no guarantee of that, and there definitely exist 
cases where they don't.

[...]
>> +	pmu {
>> +		compatible = "arm,armv8-pmuv3";

Oh, I'd missed this - per the current state of things, we should really 
have a proper compatible for the PMU as well.

(Suggestions for ways to improve the current state of things for better 
forward- and backward- compatibility welcome - I started having a mad 
idea about autogenerating a PMU name from the CPU compatible if the 
generic PMU compatible is present, but I'm not sure that's realistic).

Robin.

>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
>> +		status = "okay";
> 
> That's the default.
> 
>>   	};
>>   
>>   	psci {
>> -- 
>> 2.33.1
>>
>>
