From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] sound/soc/tegra: tegra_max98090: Invert headphone by GPIO
 flag
Date: Wed, 24 Feb 2016 09:45:41 -0700
Message-ID: <56CDDE35.1010408@wwwdotorg.org>
References: <56CB6624.6030600@wwwdotorg.org>
 <1456247985-5563-1-git-send-email-sctincman@gmail.com>
 <1456247985-5563-2-git-send-email-sctincman@gmail.com>
 <56CC9860.2060003@wwwdotorg.org> <56CDDD82.7040402@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56CDDD82.7040402-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/24/2016 09:42 AM, Jonathan Tinkham wrote:
> On 02/23/2016 10:35 AM, Stephen Warren wrote:
>> On 02/23/2016 10:19 AM, Jonathan Tinkham wrote:
>>
>> > Subject: sound/soc/tegra: tegra_max98090: Invert headphone by GPIO
>> > flag
>>
>> Mark has mentioned quite a few times that this patch subject is
>> incorrect. ASoC patch subjects should start with "ASoC: ". You can see
>> this by running:
>>
>> git log -- sound/soc/tegra/
>>
>> I'd suggest the following:
>>
>> AsoC: tegra_max98090: honor headphone detect GPIO polarity
>>
> My apologies, I finally grok what he was saying. Thank you.
>>> Set the invert property for the headphone jack depending on the GPIO
>>> flag in the
>>> device-tree. This is similar to what is done for tegra_rt5640.
>>>
>>
>>> diff --git a/sound/soc/tegra/tegra_max98090.c
>>> b/sound/soc/tegra/tegra_max98090.c
>>
>>> @@ -155,6 +156,7 @@ static int tegra_max98090_asoc_init(struct
>>> snd_soc_pcm_runtime *rtd)
>>> ARRAY_SIZE(tegra_max98090_hp_jack_pins));
>>>
>>>           tegra_max98090_hp_jack_gpio.gpio = machine->gpio_hp_det;
>>> +        tegra_max98090_hp_jack_gpio.invert =
>>> (machine->gpio_hp_det_flags & OF_GPIO_ACTIVE_LOW);
>>
>> Did you run checkpatch? It should complain about > 80 columns, and I
>> suspect about the unnecessary brackets around that expression. In
>> fact, checkpatch indicates quite a few other warnings and errors.
>>
>> The logic in this patch looks OK. Do the relevant DT files all have
>> the correct GPIO flags already? That'd be nice!
>
> The only board is the venice2, which doesn't have a 'nvidia,hp-det-gpio'
> entry at all (how did this even work before?)

I mean: Is ACTIVE_LOW/ACTIVE_HIGH flag in the existing 
nvidia,hp-det-gpios already correctly set?
