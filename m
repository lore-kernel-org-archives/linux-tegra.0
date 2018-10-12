From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V2 1/5] dt-bindings: usb: xhci-tegra: Add power-domain
 details
Date: Fri, 12 Oct 2018 08:36:11 +0100
Message-ID: <57da6e07-1f21-5ebd-7708-c606ee33e8fa@nvidia.com>
References: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
 <1538143910-24400-2-git-send-email-jonathanh@nvidia.com>
 <20181011164952.GC7393@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181011164952.GC7393@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-tegra@vger.kernel.org


On 11/10/18 17:49, Thierry Reding wrote:
> On Fri, Sep 28, 2018 at 03:11:46PM +0100, Jon Hunter wrote:
>> Add details for power-domains to the Tegra xHCI bindings so that
>> generic power-domains can be used for inconjunction with the xHCI
>> driver.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>  Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
>> index 3eee9e505400..4156c3e181c5 100644
>> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
>> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
>> @@ -59,6 +59,14 @@ For Tegra210:
>>  - avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
>>  - dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
>>  - hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8 V.
>> +- power-domains: A list of PM domain specifiers that reference each power-domain
>> +  used by the xHCI controller. This list must comprise of a specifier for the
>> +  XUSBA and XUSBC power-domains. See ../power/power_domain.txt and
>> +  ../arm/tegra/nvidia,tegra20-pmc.txt for details.
>> +- power-domain-names: A list of names that represent each of the specifiers in
>> +  the 'power-domains' property. Must include 'xusb_ss' and 'xusb_host' which
> 
> Total bike-shed comment: maybe call these "superspeed" and "host" or
> something. The xusb_ prefix is kind of redundent because of the context.
> On the other hand, those are the names by which the power partitions are
> referred to, so either way:

I choose these names because they align with what we already have for
clocks ...

- clock-names: Must include the following entries:
   - xusb_host
   - xusb_host_src
   - xusb_falcon_src
   - xusb_ss
   - xusb_ss_src
   - xusb_ss_div2
   - xusb_hs_src
   - xusb_fs_src
   - pll_u_480m
   - clk_m
   - pll_e

However, I don't have a strong preference.

> Acked-by: Thierry Reding <treding@nvidia.com>

Thanks!
Jon

-- 
nvpublic
