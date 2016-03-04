From: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] AsoC: tegra_max98090: honor headphone detect GPIO
 polarity
Date: Fri, 4 Mar 2016 10:42:57 -0700
Message-ID: <56D9C921.7080802@gmail.com>
References: <56CC9860.2060003@wwwdotorg.org>
 <1456940623-1496-1-git-send-email-sctincman@gmail.com>
 <56D8845A.4050704@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D8845A.4050704-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dylan Reid <dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 03/03/2016 11:37 AM, Stephen Warren wrote:
> On 03/02/2016 10:43 AM, Jonathan Tinkham wrote:
>> Set the invert property for the headphone jack depending on the GPIO 
>> polarity
>> in the device-tree.
>>
>> Signed-off-by: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>
> I think this is an updatd version of a previous patch, so it should 
> say "[PATCH V2]" in the subject, and have a description of the changes 
> you made between the versions here, below the --- line.

Ah yes, my apologies. For the next version should I increment that to v3 
or v2 then?
>
>> diff --git a/sound/soc/tegra/tegra_max98090.c 
>> b/sound/soc/tegra/tegra_max98090.c
>> index 902da36..da4e8d1 100644
>> --- a/sound/soc/tegra/tegra_max98090.c
>> +++ b/sound/soc/tegra/tegra_max98090.c
>> @@ -42,6 +42,7 @@
>>   struct tegra_max98090 {
>>       struct tegra_asoc_utils_data util_data;
>>       int gpio_hp_det;
>> +    enum of_gpio_flags gpio_hp_det_flags;
>>       int gpio_mic_det;
>>   };
>>
>> @@ -155,6 +156,8 @@ static int tegra_max98090_asoc_init(struct 
>> snd_soc_pcm_runtime *rtd)
>> ARRAY_SIZE(tegra_max98090_hp_jack_pins));
>>
>>           tegra_max98090_hp_jack_gpio.gpio = machine->gpio_hp_det;
>> +        tegra_max98090_hp_jack_gpio.invert =
>> +            machine->gpio_hp_det_flags & OF_GPIO_ACTIVE_LOW;
>
> So now, this .invert flag is always set directly based on the GPIO 
> flags. That's good.
>
> I believe this means you should remove the .invert assignment from 
> static struct snd_soc_jack_gpio tegra_max98090_hp_jack_gpio too, since 
> it's always over-written, so doesn't need a default value.
>
> Question: Should we make the same change for DT property 
> nvidia,mic-det-gpios and value tegra_max98090_mic_jack_gpio.invert? 
> tegra124-nyan.dts currently says GPIO_ACTIVE_HIGH for both 
> hp-det-gpios and mic-det-gpios. I don't know if the DT is correct for 
> both of those (and hence making the same change for the mic-det-gpios 
> would break Nyan) or not.
Hmmm, it is indeed the same logic. I will implement and test on nyan.
