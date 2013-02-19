From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 1/3] power_supply: Define Binding for supplied-nodes
Date: Tue, 19 Feb 2013 13:00:45 -0500
Message-ID: <5123BDCD.20908@nvidia.com>
References: <1360971416-30717-1-git-send-email-rklein@nvidia.com>
 <1360971416-30717-2-git-send-email-rklein@nvidia.com>
 <20130216223804.GF1741@lizard.sbx05280.losalca.wayport.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130216223804.GF1741-SAfYLu58TvsKrcn4e17nTyIbA2bwYUBrKwcig+XE9tjR7s880joybQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "Rajanikanth H.V" <rajanikanth.hv-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 2/16/2013 5:38 PM, Anton Vorontsov wrote:
> On Fri, Feb 15, 2013 at 06:36:54PM -0500, Rhyland Klein wrote:
>> This property is meant to be used in device nodes which represent
>> power_supply devices that wish to provide a list of supplies to
>> which they provide power. A common case is a AC Charger with
>> the batteries it powers.
>>
>> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   .../bindings/power_supply/power_supply.txt         |   17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/power_supply/power_supply.txt
>>
>> diff --git a/Documentation/devicetree/bindings/power_supply/power_supply.txt b/Documentation/devicetree/bindings/power_supply/power_supply.txt
>> new file mode 100644
>> index 0000000..1c58d4ff
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power_supply/power_supply.txt
>> @@ -0,0 +1,17 @@
>> +Power Supply Core Support
>> +
>> +Optional Properties:
>> + - power-supply,supplied-nodes : This property is added to a supply
>> +   in order to specify the list of supplicant devices directly by their
>> +   phandles.
> "supplied nodes" sounds confusing (doesn't reflect direction), IMO. I'd
> rather call it power-supply,supplied-to = <&some_battery>;
>
> But... I'm recalling there was a similar discussion not that long ago, and
> Arnd came up with the idea that supplied-to is not fully in spirit of DT,
> and proposed his view of proper bindings. Please find the discussion here:
>
>    http://lkml.org/lkml/2012/9/14/104
>
> Thanks,
>
> Anton
Ahhh, I missed that when I glanced around. I think this does make more 
sense. This sounds like it would entail adding some amount of complexity 
to the power_supply subsystem, namely, being able to register 
"supplied-to" devices with "suppliers". Is that something that has been 
looked into yet? If not I might see how it plays out.

Thanks for the pointer!

-rhyland

-- 
nvpublic
