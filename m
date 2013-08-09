From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 3/3] Documentation: dt: hwmon: add OF document for
 lm90
Date: Fri, 09 Aug 2013 10:35:50 -0600
Message-ID: <52051A66.1010001@wwwdotorg.org>
References: <1375944991-29182-1-git-send-email-wni@nvidia.com> <1375944991-29182-4-git-send-email-wni@nvidia.com> <5203D757.8000208@wwwdotorg.org> <520487C7.5080901@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <520487C7.5080901-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matthew Longnecker <MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org" <lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/09/2013 12:10 AM, Wei Ni wrote:
> On 08/09/2013 01:37 AM, Stephen Warren wrote:
>> On 08/08/2013 12:56 AM, Wei Ni wrote:
>>> Add OF document for lm90 in Documentation/devicetree/.
>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/lm90.txt b/Documentation/devicetree/bindings/hwmon/lm90.txt

>>> +- interrupts: lm90 can support interrupt mode, you can set interrupt here.
>>
>> You might want to mention that a single entry ("specifier") is expected
>> in the list.
> 
> Sorry, I didn't get your point, could you explain more?

In general, a device may have more than one interrupt output. Hence in
general, the interrupts property is a list of 1 or more interrupt
specifiers. In this case, that list should be a single entry. The
binding should state this. how about:

----------
Optional properties:
interrupts: Contains a single interrupt specifier which describes the
LM90 XXXX output. See interrupt-controller/interrupts.txt for the format.
----------

(where you'd replace XXXX with the pin/signal name from the datasheet).
