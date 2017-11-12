From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 1/5] ARM: tegra: Add device tree node to describe IRAM
Date: Sun, 12 Nov 2017 19:28:06 +0300
Message-ID: <ba975656-359d-c46e-a6a6-7ca81d00ce56@gmail.com>
References: <cover.1508448293.git.digetx@gmail.com>
 <8ce696bc2b4b1808f6c7f7a967a3dacd954d2a4e.1508448293.git.digetx@gmail.com>
 <ffa5f1d0-f156-0bc3-6adb-bb55a0a855c4@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <ffa5f1d0-f156-0bc3-6adb-bb55a0a855c4@mleia.com>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Vladimir Zapolskiy <vz@mleia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 11.11.2017 17:18, Vladimir Zapolskiy wrote:
> Hi Dmitry,
> 
> On 10/20/2017 12:34 AM, Dmitry Osipenko wrote:
>> From: Vladimir Zapolskiy <vz@mleia.com>
>>
>> All Tegra SoCs contain 256KiB IRAM, which is used to store CPU resume code
>> and by hardware engines like a video decoder.
>>
>> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> 
> Please add also your own closing "Signed-off-by" tag, please reference
> to "Developer's Certificate of Origin 1.1", point (c), it is found in
> Documentation/process/submitting-patches.rst
> 

Indeed, thanks!

>> ---
>>  arch/arm/boot/dts/tegra114.dtsi | 8 ++++++++
>>  arch/arm/boot/dts/tegra124.dtsi | 8 ++++++++
>>  arch/arm/boot/dts/tegra20.dtsi  | 8 ++++++++
>>  arch/arm/boot/dts/tegra30.dtsi  | 8 ++++++++
> 
> My assumption is that Thierry would prefer to get 4 separate patches,
> one for each platform, please split the patch.
> 

Thierry, would you?

> Also thanks for your time and your efforts applied to push my occasional
> change, please feel free to take your own authorship for 3 out of 4 patches.
> 

Okay.

>>  4 files changed, 32 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
>> index 8932ea3afd5f..13f6087790c8 100644
>> --- a/arch/arm/boot/dts/tegra114.dtsi
>> +++ b/arch/arm/boot/dts/tegra114.dtsi
>> @@ -10,6 +10,14 @@
>>  	compatible = "nvidia,tegra114";
>>  	interrupt-parent = <&lic>;
>>  
>> +	iram@40000000 {
>> +		compatible = "mmio-sram";
> 
> Unfortunately Thierry hasn't yet replied, but my assumption is that
> the list of compatibles should be extended with one more SoC specific
> value like
> 
> 	compatible = "nvidia,tegra114-sysram", "mmio-sram";
> 
> I'm not sure, if Tegra maintainers want to see a new compatible
> described in Documentation/devicetree/bindings.
> 

The custom compatible string shouldn't be needed. AFAIK, IRAM doesn't have any
exposed controls, so just a generic "mmio-sram" suits well here.

>> +		reg = <0x40000000 0x40000>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0 0x40000000 0x40000>;
>> +	};
>> +
>>  	host1x@50000000 {
>>  		compatible = "nvidia,tegra114-host1x", "simple-bus";
>>  		reg = <0x50000000 0x00028000>;
>> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
>> index 8baf00b89efb..a3585ed82646 100644
>> --- a/arch/arm/boot/dts/tegra124.dtsi
>> +++ b/arch/arm/boot/dts/tegra124.dtsi
> 
> The considerations from above are applicable to the rest of
> the touched platforms.
