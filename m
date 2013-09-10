From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/2] Documentation: dt: hwmon: add OF document for
 LM90
Date: Tue, 10 Sep 2013 12:25:23 +0800
Message-ID: <522E9F33.3010004@nvidia.com>
References: <1378722552-10357-1-git-send-email-wni@nvidia.com> <1378722552-10357-3-git-send-email-wni@nvidia.com> <522DA86B.6000603@roeck-us.net> <522E4854.1050800@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <522E4854.1050800-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org" <lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/10/2013 06:14 AM, Stephen Warren wrote:
> On 09/09/2013 04:52 AM, Guenter Roeck wrote:
>> On 09/09/2013 03:29 AM, Wei Ni wrote:
>>> Add OF document for LM90 in Documentation/devicetree/.
> 
>>> diff --git a/Documentation/devicetree/bindings/hwmon/lm90.txt
> 
>>> +* LM90 series thermometer.
>>> +
>>> +Required node properties:
>>> +- compatible: manufacture and chip name, one of
>>
>> manufacturer
>>
>>> +        "<manufacture>,adm1032"
> ...
>>> +        "<manufacture>,sa56004"
>>
>> Shouldn't the manufacturers be listed explicitly ?
> 
> Yes, and they must all be present in
> Documentation/devicetree/bindings/vendor-prefixes.txt.

Oh, got it, I will update it, thanks.

> 
>>> +Example LM90 node:
>>> +
>>> +temp-sensor {
>>> +    compatible = "onnn,nct1008";
>>> +    reg = <0x4c>;
>>> +    vcc-supply = <&palmas_ldo6_reg>;
>>> +    interrupt-parent = <&gpio>;
>>
>> List above as optional property.
> 
> I believe it's common not to document this, since it's implicitly
> supported as part of any node that is an interrupt source.
> 
