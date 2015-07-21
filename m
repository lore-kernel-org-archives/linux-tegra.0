From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 3/4] of: Add NVIDIA Tegra VIC binding
Date: Tue, 21 Jul 2015 09:32:48 +0300
Message-ID: <55ADE790.9000403@nvidia.com>
References: <1437378869-10451-1-git-send-email-mperttunen@nvidia.com>	<1437378869-10451-4-git-send-email-mperttunen@nvidia.com> <CACvgo50X_mku2ha8Emi80j9ed+9Kn8SXpLk6ZDFxEKcjUAfCXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACvgo50X_mku2ha8Emi80j9ed+9Kn8SXpLk6ZDFxEKcjUAfCXw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/20/2015 08:20 PM, Emil Velikov wrote:
> Hi Mikko,
> 
> On 20 July 2015 at 08:54, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> This adds device tree binding documentation for the Video Image
>> Compositor (VIC) present on Tegra124 and newer SoC's.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/gpu/nvidia,tegra20-host1x.txt     | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
>> index 009f4bf..1328f3f 100644
>> --- a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
>> +++ b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
>> @@ -240,6 +240,21 @@ of the following host1x client modules:
>>      - dpaux
>>    - vdd-supply: phandle of a supply that powers the DisplayPort link
>>
>> +- vic: Video Image Compositor
>> +  - compatible: For Tegra124, must contain "nvidia,tegra124-vic".  Otherwise,
>> +    must contain '"nvidia,<chip>-vic", "nvidia,tegra124-vic"', where
>> +    <chip> is tegra132.
> Did you make a typo here, or is "tegra124" string really used to
> identify the tegra132 chips ?

The idea here is that the compatible string must either be
  "nvidia,tegra124-vic"
if the board is a Tegra124 chip. If it's not, the board must be a
Tegra132 (though we probably should add Tegra210 here too) it must be
  "nvidia,tegra132-vic", "nvidia,tegra124-vic"
to indicate that while the hardware is compatible with the Tegra124 VIC
(and thus can use the same driver and we don't need to update the
compatible list in the driver), it is actually the Tegra132 version in
case the driver needs to apply some quirks. Other Tegra bindings use the
same system.

> 
> Thanks
> Emil

Thanks,
Mikko
