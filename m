From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v5 1/3] ARM: dts: tegra: Remove skeleton.dtsi and fix DTC
 warnings for /memory
Date: Wed, 23 May 2018 10:57:34 +0200
Message-ID: <ba8102983f2ab29601e36b6b6c2ca28a@agner.ch>
References: <1526543103-21668-1-git-send-email-krzk@kernel.org>
 <cbcc6f929d2bd912c11530391d03cdf3@agner.ch>
 <CAJKOXPeOg7Xjx0qr2qZ0dLs56HFD=1=gbGh8VPeS+PgQm6QQZg@mail.gmail.com>
 <f762464c796fa1976c1ec6fde6869add@agner.ch>
 <CAJKOXPdwVNtDCiow-cYFdgeUVO5UuEtgmrdmHi2SvHeoZfPupg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPdwVNtDCiow-cYFdgeUVO5UuEtgmrdmHi2SvHeoZfPupg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Lucas Stach <dev@lynxeye.de>
List-Id: linux-tegra@vger.kernel.org

On 23.05.2018 10:34, Krzysztof Kozlowski wrote:
> On Wed, May 23, 2018 at 10:22 AM, Stefan Agner <stefan@agner.ch> wrote:
>> On 23.05.2018 09:05, Krzysztof Kozlowski wrote:
>>> On Thu, May 17, 2018 at 1:39 PM, Stefan Agner <stefan@agner.ch> wrote:
>>>> On 17.05.2018 09:45, Krzysztof Kozlowski wrote:
>>>> Could we not add
>>>>
>>>>         memory { device_type = "memory"; };
>>>>
>>>> in the SoC level device trees?
>>>>
>>>> This would save device_type in all other instances.
>>>>
>>>> That is also how it is done in other places, e.g.
>>>> arch/arm/boot/dts/imx6qdl.dtsi
>>>
>>> Not really because the unit address will not match between different
>>> boards. The imx6qdl, as I see, has the same issue:
>>>  - imx6qdl.dtsi defines "memory" node
>>>  - imx6dl-apf6dev.dts includes the previous and defines "memory@10000000"
>>>
>>> This is wrong - two memory nodes.
>>>
>>
>> Hm I see. We could add
>>
>> memory@0 { device_type = "memory"; };
>>
>> Since the reg property is specified in the board level device tree it
>> would be still fine?
>>
>> Or probably better to provide a complete spec with length zero:
>>
>> memory@0 {
>>         device_type = "memory";
>>         reg = <0x0 0x0>;
>> };
>>
>> Even some boards do that and assume that boot loader will fill it
>> correctly, so that should be fine.
> 
> That could be the solution although tegra30-apalis.dtsi is a problem
> here. For Tegra 114, 124 and 20 it would work fine - all boards from
> given SoC have the same address of memory (0x0 or 0x80000000). However
> for Tegra30 the Apalis did not have any memory reg before so I am not
> sure what should be used. I added 0x0. The other Tegra30 boards have
> memory@80000000.

The start address of memory is not something a board can decide on: That
is hard wired in the SoC...

In the Tegra 3 case the start address of main memory is 0x80000000.

So

	memory@80000000 {
		reg = <0x80000000 0x0>;
	};


Should be fine.

Or you can use 0x40000000 (1GiB) since that is the smallest
configuration Toradex sells currently.


	memory@80000000 {
		reg = <0x80000000 0x40000000>;
	};

Sorry for the hassle and thanks for fixing this!

--
Stefan
