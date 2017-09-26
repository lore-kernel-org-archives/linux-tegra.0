From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 2/3] ARM: dts: tegra20: Add DMA phandle to 'fuse' node
Date: Tue, 26 Sep 2017 22:25:29 +0100
Message-ID: <ce5c5242-8530-4b0e-dd2d-0a9ef1ac005e@nvidia.com>
References: <27dadd0335aac71c9d4d613c33a6a1d0a285afa4.1506378772.git.digetx@gmail.com>
 <8268404736bd3c254f8516109465bb8db4739c33.1506378772.git.digetx@gmail.com>
 <c0776324-95e9-9e4c-00ac-a415cb1cd9e3@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c0776324-95e9-9e4c-00ac-a415cb1cd9e3-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 26/09/17 21:54, Jon Hunter wrote:
> 
> On 25/09/17 23:35, Dmitry Osipenko wrote:
>> Currently efuse driver requests DMA channel from an arbitrary DMA device,
>> it is not a problem since there is only one DMA provider for Tegra20 yet,
>> but it will become troublesome once another provider would be added.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/tegra20.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
>> index fb485a5e63d7..f1579c9a7ef4 100644
>> --- a/arch/arm/boot/dts/tegra20.dtsi
>> +++ b/arch/arm/boot/dts/tegra20.dtsi
>> @@ -600,6 +600,8 @@
>>  		clock-names = "fuse";
>>  		resets = <&tegra_car 39>;
>>  		reset-names = "fuse";
>> +		dmas = <&apbdma 0>;
>> +		dma-names = "fuse";
>>  	};
>>  
>>  	pcie@80003000 {
>>
> 
> Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Actually, request-id '0' is a valid request. Does this work ok?

Cheers
Jon

-- 
nvpublic
