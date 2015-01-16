From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v2 03/11] ARM: tegra: Set the sound card model that
 alsaucm expects
Date: Fri, 16 Jan 2015 10:01:27 +0100
Message-ID: <CAAObsKBKnU_wBaxNFN-buz71qL-te4s6bqrrnxao_N-TwBVkAQ@mail.gmail.com>
References: <1421338359-27467-1-git-send-email-tomeu.vizoso@collabora.com>
 <1421338359-27467-4-git-send-email-tomeu.vizoso@collabora.com>
 <54B7F757.5060002@wwwdotorg.org> <CAAObsKCad9O_=TUQrF7fVbBvjDTmfJsLPgr+EasCyhvY+xhdHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAObsKCad9O_=TUQrF7fVbBvjDTmfJsLPgr+EasCyhvY+xhdHg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 16 January 2015 at 09:50, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
> On 15 January 2015 at 18:22, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 01/15/2015 09:12 AM, Tomeu Vizoso wrote:
>>>
>>> Patches are on its way to add a config file to alsaucm for the Nyan
>>> boards. Use the same card ID that alsaucm will expect.
>>>
>>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>>> ---
>>>   arch/arm/boot/dts/tegra124-nyan-big.dts | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts
>>> b/arch/arm/boot/dts/tegra124-nyan-big.dts
>>> index 43e58a4..9a9cffe 100644
>>> --- a/arch/arm/boot/dts/tegra124-nyan-big.dts
>>> +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
>>> @@ -1976,9 +1976,9 @@
>>>         };
>>>
>>>         sound {
>>> -               compatible = "nvidia,tegra-audio-max98090-nyan-big",
>>> +               compatible = "nvidia,tegra-audio-max98090-nyan",
>>>                              "nvidia,tegra-audio-max98090";
>>
>>
>> If all the boards that are derived from Nyan truly have identical audio HW
>> (or at least any differences can be described by this binding), then it
>> seems fine to add "nvidia,tegra-audio-max98090-nyan" to the compatible
>> value.
>
>
>
>> However, I don't see a reason to remove the board-specific compatible value
>> "nvidia,tegra-audio-max98090-nyan-big"; we should always include all the
>> values that are relevant.
>
> Ok.

Oh, actually, my intention was to move the whole sound node to the
nyan dtsi, as there isn't anything specific to the blaze regarding
sound.

Regards,

Tomeu

>>> -               nvidia,model = "Acer Chromebook 13";
>>> +               nvidia,model = "GoogleNyan";
>>
>>
>> Why not just name the UCM config file after the ASoC card name that's
>> already in use? Perhaps it's not likely to be unique enough though:-(
>
> Yeah, that would be A13, which isn't terribly useful.
>
> Regards,
>
> Tomeu
>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
