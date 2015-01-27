From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 04/11] ARM: tegra: Set spi-max-frequency property to
 flash node
Date: Tue, 27 Jan 2015 09:48:43 -0700
Message-ID: <54C7C16B.2080003@wwwdotorg.org>
References: <1421338359-27467-1-git-send-email-tomeu.vizoso@collabora.com> <1421338359-27467-5-git-send-email-tomeu.vizoso@collabora.com> <54B7F84A.6020906@wwwdotorg.org> <CAAObsKDx_W23OTL2RE4xxgXL-rtp3npkBtx6qMHV1j8ZXmo1rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAObsKDx_W23OTL2RE4xxgXL-rtp3npkBtx6qMHV1j8ZXmo1rw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/27/2015 04:13 AM, Tomeu Vizoso wrote:
> On 15 January 2015 at 18:26, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 01/15/2015 09:12 AM, Tomeu Vizoso wrote:
>>>
>>> To silence a warning on Nyan boards.
>>>
>>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>>> ---
>>>    arch/arm/boot/dts/tegra124-nyan-big.dts | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts
>>> b/arch/arm/boot/dts/tegra124-nyan-big.dts
>>> index 9a9cffe..94c7ba9 100644
>>> --- a/arch/arm/boot/dts/tegra124-nyan-big.dts
>>> +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
>>> @@ -1660,6 +1660,7 @@
>>>
>>>                  flash@0 {
>>>                          compatible = "winbond,w25q32dw";
>>> +                       spi-max-frequency = <25000000>;
>>
>>
>> This property already exists in the SPI controller. Isn't the max frequency
>> supposed to inherit from there? If so, shouldn't the code not warn when such
>> inheritance happens, i.e. it'd be better to fix the code?
>
> I don't think it's supposed to fall back to the controller's max freq,
> as each device has its own maximum frequency that it can support and
> it's not related to what the master supports.

If the controller-specific frequency property isn't ever used, we should 
remove it. No point carrying cruft that looks like it does something but 
doesn't.

Logically, each device's max frequency certainly should be influenced by 
all of the controller, board, and device max frequency. Those should all 
impose a cap on the speed used. I'd expect this to be expressed in DT as 
a single property in each device where the user has calculated that max 
for the device, with the option to have all the devices fall back to the 
"default" provided at the controller/bus level if the device imposes a 
cap that's no lower.
