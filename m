From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3] Tegra: DT: add device tree binding doc for QSPI
Date: Mon, 26 Oct 2015 15:49:30 -0600
Message-ID: <562E9FEA.1080705@wwwdotorg.org>
References: <1445891676-3262-1-git-send-email-twarren@nvidia.com>
 <562E954B.5070604@wwwdotorg.org>
 <731fc53aa2d24edc93c2af43a7711657@HQMAIL104.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <731fc53aa2d24edc93c2af43a7711657-wO81nVYWzR66sJks/06JalaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org" <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "tomcwarren3959-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tomcwarren3959-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org" <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/26/2015 03:36 PM, Tom Warren wrote:
> Stephen Warren wrote at Monday, October 26, 2015 2:04 PM:
>> On 10/26/2015 02:34 PM, Tom Warren wrote:
>>> This patch adds the device tree binding doc for the Tegra QSPI
>>> controller on Tegra210.
>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/spi/nvidia,tegra210-qspi.txt
>>> b/Documentation/devicetree/bindings/spi/nvidia,tegra210-qspi.txt
>>
>>> +- clock-names : Must include the following entries:
>>> +  - qspi
>>> +- resets : Must contain an entry for each entry in reset-names.
>>> +  See ../reset/reset.txt for details.
>>> +- reset-names : Must include the following entries:
>>> +  - qspi
>>> +- clocks : Must contain an entry for each entry in clock-names.
>>> +  See ../clocks/clock-bindings.txt for details.
>>
>> Let's keep clocks and clock-names next to each-other in the doc. I don't know
>> why they aren't in the eixsting Tegra SPI doc.
 >
> OK. I assume 'clock-names', then 'clocks' since 'clocks' references clock-names.

That sounds correct.

>> With this issue fixed, this patch looks good to me.
>>
>> Note: I don't see the devicetree mailing list in the CC list. You should probably
>> replace the U-Boot mailing list with it.
 >
> I thought I had it, but may have dropped it. What exactly is the URL of the devicetree mailing list? devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org? or devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org?

devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

(See the "OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" in 
"MAINTAINERS", or the output of ./scripts/get_maintainers.pl)
