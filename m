From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v7 1/4] ARM: dts: tegra: Remove usage of deprecated skeleton.dtsi
Date: Mon, 9 Jul 2018 17:59:17 +0200
Message-ID: <CAJKOXPeQVXWwE=aeZ32WMkJ4BCMs8rTM2RTbfJnNdkJ14z089Q@mail.gmail.com>
References: <1527144833-24285-1-git-send-email-krzk@kernel.org> <20180709152758.GD18353@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180709152758.GD18353@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>
List-Id: linux-tegra@vger.kernel.org

On 9 July 2018 at 17:27, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Thu, May 24, 2018 at 08:53:50AM +0200, Krzysztof Kozlowski wrote:
>> Remove the usage of skeleton.dtsi because it was deprecated since commit
>> 9c0da3cc61f1 ("ARM: dts: explicitly mark skeleton.dtsi as deprecated").
>> It also allows later to fix DTC warnings for missing unit name in
>> /memory nodes.
>>
>> The /chosen and /aliases nodes are added only when dependent DTSes do
>> not define them.  Compiled DTB is the same as before this commit.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Reviewed-by: Stefan Agner <stefan@agner.ch>
>>
>> ---
>>
>> Changes since v6:
>> 1. Add Stefan's reviewed-by tag.
>>
>> Changes since v5:
>> 1. New patch, split with skeleton.dtsi removal (suggested by Stefan).
>> ---
>>  arch/arm/boot/dts/tegra114.dtsi       |  8 ++++++--
>>  arch/arm/boot/dts/tegra124.dtsi       |  6 ++++--
>>  arch/arm/boot/dts/tegra20.dtsi        | 11 +++++++++--
>>  arch/arm/boot/dts/tegra30-apalis.dtsi |  4 ++++
>>  arch/arm/boot/dts/tegra30.dtsi        | 11 +++++++++--
>>  5 files changed, 32 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
>> index 0e4a13295d8a..27ef515e5640 100644
>> --- a/arch/arm/boot/dts/tegra114.dtsi
>> +++ b/arch/arm/boot/dts/tegra114.dtsi
>> @@ -5,11 +5,15 @@
>>  #include <dt-bindings/pinctrl/pinctrl-tegra.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>
>> -#include "skeleton.dtsi"
>> -
>>  / {
>>       compatible = "nvidia,tegra114";
>>       interrupt-parent = <&lic>;
>> +     #address-cells = <1>;
>> +     #size-cells = <1>;
>> +
>> +     memory {
>> +             device_type = "memory";
>> +     };
>>
>>       host1x@50000000 {
>>               compatible = "nvidia,tegra114-host1x", "simple-bus";
>> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
>> index 174092bfac90..951feea784af 100644
>> --- a/arch/arm/boot/dts/tegra124.dtsi
>> +++ b/arch/arm/boot/dts/tegra124.dtsi
>> @@ -7,14 +7,16 @@
>>  #include <dt-bindings/reset/tegra124-car.h>
>>  #include <dt-bindings/thermal/tegra124-soctherm.h>
>>
>> -#include "skeleton.dtsi"
>> -
>>  / {
>>       compatible = "nvidia,tegra124";
>>       interrupt-parent = <&lic>;
>>       #address-cells = <2>;
>>       #size-cells = <2>;
>>
>> +     memory {
>> +             device_type = "memory";
>> +     };
>> +
>>       pcie@1003000 {
>>               compatible = "nvidia,tegra124-pcie";
>>               device_type = "pci";
>> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
>> index 0a7136462a1a..88dd1afb5877 100644
>> --- a/arch/arm/boot/dts/tegra20.dtsi
>> +++ b/arch/arm/boot/dts/tegra20.dtsi
>> @@ -4,11 +4,18 @@
>>  #include <dt-bindings/pinctrl/pinctrl-tegra.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>
>> -#include "skeleton.dtsi"
>> -
>>  / {
>>       compatible = "nvidia,tegra20";
>>       interrupt-parent = <&lic>;
>> +     #address-cells = <1>;
>> +     #size-cells = <1>;
>> +
>> +     chosen { };
>> +     aliases { };
>> +
>> +     memory {
>> +             device_type = "memory";
>> +     };
>>
>>       iram@40000000 {
>>               compatible = "mmio-sram";
> Any idea why Tegra20 here and Tegra30 below get empty chosen and aliases
> nodes while Tegra114 and Tegra124 don't?

I double checked... and it is my mistake. Previously I thought that
the board DTS do not define them therefore removal of skeleton.dtsi
would affect them. However now I see that it is not aliases and chosen
are everywhere.

I'll send v8.

Best regards,
Krzysztof
