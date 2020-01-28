From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v1 3/5] dt-binding: tegra: Add VI and CSI bindings
Date: Tue, 28 Jan 2020 13:04:09 -0800
Message-ID: <00e429fa-05aa-e95d-05a4-e5a1be739796@nvidia.com>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-4-git-send-email-skomatineni@nvidia.com>
 <ee1e61bc-918d-8f9c-592d-f9e63322a1c0@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ee1e61bc-918d-8f9c-592d-f9e63322a1c0-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Helen Koike <helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 1/28/20 12:32 PM, Helen Koike wrote:
> External email: Use caution opening links or attachments
>
>
> Hi,
>
> On 1/28/20 4:23 PM, Sowjanya Komatineni wrote:
>> Tegra contains VI controller which can support up to 6 MIPI CSI
>> camera sensors.
>>
>> Each Tegra CSI port from CSI unit can be one-to-one mapper to
>> VI channel and can capture from an external camera sensor or
>> from built-in test pattern generator.
>>
>> This patch adds dt-bindings for Tegra VI and CSI.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   .../bindings/display/tegra/nvidia,tegra20-host1x.txt           | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> index 9999255ac5b6..47cd6532b7d3 100644
>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> @@ -40,7 +40,7 @@ of the following host1x client modules:
>>
>>     Required properties:
>>     - compatible: "nvidia,tegra<chip>-vi"
>> -  - reg: Physical base address and length of the controller's registers.
>> +  - reg: Physical base address and length of the controller registers.
>>     - interrupts: The interrupt outputs from the controller.
>>     - clocks: Must contain one entry, for the module clock.
>>       See ../clocks/clock-bindings.txt for details.
>> @@ -49,6 +49,14 @@ of the following host1x client modules:
>>     - reset-names: Must include the following entries:
>>       - vi
>>
>> +- csi: mipi csi interface to vi
>> +
>> +  Required properties:
>> +  - compatible: "nvidia,tegra<chip>-csi"
>> +  - reg: Physical base address and length of the controller registers.
>> +  - clocks: Must contain entries csi, cilab, cilcd, cile clocks.
>> +    See ../clocks/clock-bindings.txt for details.
>> +
> I think it would be nice to add an example, in the Example section at the end of this file, same as other modules do.
>
> Regards,
> Helen
Thanks Helen. Will add in v2.
>
>>   - epp: encoder pre-processor
>>
>>     Required properties:
>>
