From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: Re: [PATCH v2 00/37] ARM: dts: tegra: colibri_t20: major revamp incl. eval board support
Date: Wed, 26 Sep 2018 18:52:27 +0200
Message-ID: <8DE81AAE-BF2A-45F5-B638-CAAA9AA5AFCF@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com> <20180926145646.GG12980@ulmo>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180926145646.GG12980@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry


On September 26, 2018 4:56:46 PM GMT+02:00, Thierry Reding <thierry.reding@gmail.com> wrote:
>On Sun, Sep 02, 2018 at 12:08:29PM +0200, Marcel Ziswiler wrote:
>> This series is a major overhaul and adds support for the Colibri
>> Evaluation Board device tree.
>> 
>> Changes in v2:
>> - Fix commit message which was mixed up between "[PATCH 03/31] ARM:
>>   tegra: colibri_t20: iris: annotate i2c busses" and "[PATCH 04/31]
>ARM:
>>   tegra: colibri_t20: iris: add missing aliases".
>> - Also replace underscores in node names with dashes.
>> - Also reflect this change in the Iris device tree.
>> - Also reflect this change in the device tree bindings documentation.
>> - New patch as suggested by Rob.
>> - New patch.
>> - Get rid of fake clocks simple bus as suggested by Rob.
>> - Updated evaluation board device tree with all applicable previous
>>   fixes.
>> - Also reflect this addition in the device tree bindings
>documentation.
>> 
>> Marcel Ziswiler (37):
>>   ARM: tegra: colibri_t20: move aliases from module to carrier board
>>   ARM: tegra: colibri_t20: iris: integrate i2c real time clock
>support
>>   ARM: tegra: colibri_t20: iris: add missing aliases
>>   ARM: tegra: colibri_t20: iris: annotate i2c busses
>>   ARM: tegra: colibri_t20: add local-mac-address property
>>   ARM: tegra: colibri_t20: reorder host1x/hdmi properties
>>   ARM: tegra: colibri_t20: iris: use no-1-8-v
>>   ARM: tegra: colibri_t20: regulator clean-up
>>   ARM: tegra: colibri_t20: add missing regulators
>>   ARM: tegra: colibri_t20: annotate usb ehci instances
>>   ARM: tegra: colibri_t20: remove phy-reset-gpio from controller node
>>   ARM: tegra: colibri_t20: indentation/line-feed/white-space clean-up
>>   ARM: tegra: colibri_t20: update sound nvidia,model
>>   ARM: tegra: colibri_t20: pinmux clean-up
>>   ARM: tegra: colibri_t20: add missing pinmux
>>   ARM: tegra: colibri_t20: iris: display controller rgb panel support
>>   ARM: tegra: colibri_t20: iris: annotate uarts
>>   ARM: tegra: colibri_t20: iris: add uart-c
>>   ARM: tegra: colibri_t20: use high speed uart driver
>>   ARM: tegra: colibri_t20: iris: add gpio wakeup key
>>   ARM: tegra: colibri_t20: iris: add dr_mode property
>>   ARM: tegra: colibri_t20: annotate/rename lm95245 temperature sensor
>>   ARM: tegra: colibri_t20: add i2c-thermtrip
>>   ARM: tegra: colibri_t20: add gpio hog to unreset usb ethernet chip
>>   ARM: tegra: colibri_t20: add gpio hogs for gmi_wr_n buffers
>>   ARM: tegra: colibri_t20: annotate/move sd card detect
>>   ARM: tegra: colibri_t20: add compatibility comment
>>   ARM: tegra: colibri_t20: simplify model and compatible properties
>>   ARM: tegra: colibri_t20: iris: simplify model and compatible
>>     properties
>>   ARM: tegra: colibri_t20: iris: add colibri ssp support
>>   ARM: tegra: colibri_t20: drop module level model and compatible
>>   ARM: tegra: colibri_t20: rename i2c_ddc to hdmi_ddc
>>   ARM: tegra: colibri_t20: iris: drop unused i2c_ddc label
>>   ARM: tegra: colibri_t20: rename tps6586x@34 and drop unused pmic
>label
>>   ARM: tegra: colibri_t20: get rid of fake clocks simple bus
>>   ARM: tegra: colibri_t20: rename ac97 label to tegra_ac97
>>   ARM: tegra: colibri_t20: add eval board device tree
>> 
>>  Documentation/devicetree/bindings/arm/tegra.txt |   5 +-
>>  arch/arm/boot/dts/Makefile                      |   1 +
>>  arch/arm/boot/dts/tegra20-colibri-eval-v3.dts   | 262 ++++++++++
>>  arch/arm/boot/dts/tegra20-colibri-iris.dts      | 200 ++++++--
>>  arch/arm/boot/dts/tegra20-colibri.dtsi          | 655
>++++++++++++++++--------
>>  5 files changed, 866 insertions(+), 257 deletions(-)
>>  create mode 100644 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
>
>Applied, thanks. All of these series together have got to be some kind
>of a record.

Thank you very much!

Yeah, sorry about that. With the downstream L4T R16.5 based stuff with its 3.1.10 kernel definitely becoming obsolete, more and more of our customers switch to using mainline based stuff. After all we are still selling hundred thousands of those modules every year and hope to continue to do so many more years.

BTW: Rob's latest feedback will make it into another few patches I guess. Keep tuned...

>Thierry

Cheers

Marcel
