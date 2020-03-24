From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v5 5/9] dt-binding: tegra: Add VI and CSI bindings
Date: Tue, 24 Mar 2020 14:16:16 -0700
Message-ID: <b461690f-4e8d-6050-a7cb-fd8148a120de@nvidia.com>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-6-git-send-email-skomatineni@nvidia.com>
 <2256dc66-f3f9-3400-85e9-0641729b1316@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <2256dc66-f3f9-3400-85e9-0641729b1316@gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 3/24/20 12:20 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 23.03.2020 20:52, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Tegra contains VI controller which can support up to 6 MIPI CSI
>> camera sensors.
>>
>> Each Tegra CSI port from CSI unit can be one-to-one mapper to
>> VI channel and can capture from an external camera sensor or
>> from built-in test pattern generator.
>>
>> This patch adds dt-bindings for Tegra VI and CSI.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   .../display/tegra/nvidia,tegra20-host1x.txt        | 67 ++++++++++++++=
+++-----
>>   1 file changed, 54 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-host1x.txt
>> index 9999255..9421569 100644
>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hos=
t1x.txt
>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hos=
t1x.txt
>> @@ -40,14 +40,25 @@ of the following host1x client modules:
>>
>>     Required properties:
>>     - compatible: "nvidia,tegra<chip>-vi"
>> -  - reg: Physical base address and length of the controller's registers=
.
>> +  - reg: Physical base address and length of the controller registers.
>>     - interrupts: The interrupt outputs from the controller.
>> -  - clocks: Must contain one entry, for the module clock.
>> +  - clocks: Must contain an entry for the module clock "vi"
>>       See ../clocks/clock-bindings.txt for details.
>> -  - resets: Must contain an entry for each entry in reset-names.
>> -    See ../reset/reset.txt for details.
>> -  - reset-names: Must include the following entries:
>> -    - vi
> This should be a wrong change because ARM32 Tegra SoCs do not use power
> domain.

Will update tegra20-host1x.txt to specify power-domains for Tegra210+=20
and to keep reset properties for prior Tegra210.

>> +  - power-domains: Must include venc powergate node as vi is in VE part=
ition.
