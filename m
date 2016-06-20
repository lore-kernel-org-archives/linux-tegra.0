From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 03/13] dt-bindings: drm/tegra: Update DPAUX
 documentation
Date: Mon, 20 Jun 2016 09:02:44 +0100
Message-ID: <5767A324.5020305@nvidia.com>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-4-git-send-email-jonathanh@nvidia.com>
 <20160617161306.GD27475@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160617161306.GD27475-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 17/06/16 17:13, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Fri, Jun 17, 2016 at 01:03:37PM +0100, Jon Hunter wrote:
>> Update the DPAUX compatibility string information for Tegra124, Tegra132
>> and Tegra210. For Tegra210 an additional clock, 'sor-safe' is also
>> required for DPAUX and so add this clock information as well.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt    | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> index a3bd8c050c4e..361a472eac4b 100644
>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> @@ -226,9 +226,9 @@ of the following host1x client modules:
>>    - nvidia,dpaux: phandle to a DispayPort AUX interface
>>  
>>  - dpaux: DisplayPort AUX interface
>> -  - compatible: For Tegra124, must contain "nvidia,tegra124-dpaux".  Otherwise,
>> -    must contain '"nvidia,<chip>-dpaux", "nvidia,tegra124-dpaux"', where
>> -    <chip> is tegra132.
>> +  - compatible : Should contain one of the following:
>> +    - "nvidia,tegra124-dpaux": for Tegra124 and Tegra132
>> +    - "nvidia,tegra210-dpaux": for Tegra210
>>    - reg: Physical base address and length of the controller's registers.
>>    - interrupts: The interrupt outputs from the controller.
>>    - clocks: Must contain an entry for each entry in clock-names.
>> @@ -236,6 +236,7 @@ of the following host1x client modules:
>>    - clock-names: Must include the following entries:
>>      - dpaux: clock input for the DPAUX hardware
>>      - parent: reference clock
>> +    - sor-safe: additional clock input for the DPAUX hardware on Tegra210
> 
> It might be worth calling this simply "safe" because that's the
> contextual role of the clock, whereas sor-safe is the system name of the
> clock.

Yes that is fine with me.

Jon

-- 
nvpublic
