From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 3/3] ASoC: soc-core: fix platform name
 vs. of_node assignement
Date: Tue, 8 Jan 2019 10:50:18 +0000
Message-ID: <b5164c93-8be8-1c3d-9415-c895da6ad622@nvidia.com>
References: <20181018111829.27056-1-marcel@ziswiler.com>
 <20181018111829.27056-4-marcel@ziswiler.com>
 <e25a7463-9ce0-d7f9-e77b-2bbaab2e0b25@nvidia.com>
 <20181021112301.GC8554@sirena.org.uk>
 <20181218174040.k7u26vnnoplllnwb@camel2.lan>
 <952471da-b355-6471-6c19-5120d6704f81@nvidia.com>
 <87lg3vuc7p.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <87lg3vuc7p.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Matthias Reichl <hias@horus.com>, Mark Brown <broonie@kernel.org>, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Kuninori,

On 08/01/2019 02:25, Kuninori Morimoto wrote:
> 
> Hi Jon
> 
>> I have been looking at this again recently. I see this issue occurring
>> all the time when the sound drivers are built as kernel modules and
>> probing the sound card is deferred until the codec driver has been loaded.
>>
>> Commit daecf46ee0e5 ("ASoC: soc-core: use snd_soc_dai_link_component for
>> platform") appears to introduce the problem because now we allocate the
>> 'snd_soc_dai_link_component' structure for the platform we attempt to
>> register the soundcard but we never clear the freed pointer on failure.
>> Therefore, we only actually allocate it the first time. There is no easy
>> way to clear this pointer for the memory allocated because this is done
>> before the dai-links have been added to the list of dai-links for the
>> soundcard.
>>
>> I don't see an easy solution that will be 100% robust unless you do opt
>> for copying all the dai-link info from the platform (but this is
>> probably not a trivial fix).
>>
>> Do you envision a fix any time soon, or should we be updating all the
>> machine drivers to populate the platform snd_soc_dai_link_component so
>> that it is handled by the machine drivers are not the core?
> 
> Thank you for pointing it.
> Indeed it is mess.
> I think coping info is nice idea,
> but it is not easy so far, and it uses much memory...
> 
> I didn't test this, but can below patch solve your issue ?

I will give it a try and let you know.

> I think same issue happen on codec side too, so it cares it too.
> 
> ---------------
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 8ec1de8..49ac5a8 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -985,6 +985,10 @@ struct snd_soc_dai_link {
>  	/* Do not create a PCM for this DAI link (Backend link) */
>  	unsigned int ignore:1;
>  
> +	/* allocated dai_link_comonent. These should be removed in the future */
> +	unsigned int allocated_platform:1;
> +	unsigned int allocated_codecs:1;
> +

You should add a comment here to state that these should not be modified
by the machine driver and are private to the sound core.

>  	struct list_head list; /* DAI link list of the soc card */
>  	struct snd_soc_dobj dobj; /* For topology */
>  };
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 0462b3e..49ccea3 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1023,6 +1023,25 @@ static void soc_remove_dai_links(struct snd_soc_card *card)
>  	}
>  }
>  
> +static void snd_soc_init_dai_link_component(struct snd_soc_card *card)
> +{
> +	struct snd_soc_dai_link *dai_link;
> +	int i;
> +
> +	/*
> +	 * FIXME
> +	 *
> +	 * this function should be removed in the future
> +	 */
> +	for_each_card_prelinks(card, i, dai_link) {
> +		/* see snd_soc_init_platform */
> +		if (dai_link->allocated_platform)
> +			dai_link->platform = NULL;
> +		if (dai_link->allocated_codecs)
> +			dai_link->codecs = NULL;
> +	}
> +}
> +

It is still a little fragile because there is nothing to prevent a
machine driver doing the wrong thing and setting these when they should
not.

>  static int snd_soc_init_platform(struct snd_soc_card *card,
>  				 struct snd_soc_dai_link *dai_link)
>  {
> @@ -1042,6 +1061,8 @@ static int snd_soc_init_platform(struct snd_soc_card *card,
>  			return -ENOMEM;
>  
>  		dai_link->platform	= platform;
> +		dai_link->allocated_platform	= 1;
> +
>  		platform->name		= dai_link->platform_name;
>  		platform->of_node	= dai_link->platform_of_node;
>  		platform->dai_name	= NULL;
> @@ -1069,6 +1090,8 @@ static int snd_soc_init_multicodec(struct snd_soc_card *card,
>  		if (!dai_link->codecs)
>  			return -ENOMEM;
>  
> +		dai_link->allocated_codecs = 1;
> +
>  		dai_link->codecs[0].name = dai_link->codec_name;
>  		dai_link->codecs[0].of_node = dai_link->codec_of_node;
>  		dai_link->codecs[0].dai_name = dai_link->codec_dai_name;
> @@ -2739,6 +2762,8 @@ int snd_soc_register_card(struct snd_soc_card *card)
>  	if (!card->name || !card->dev)
>  		return -EINVAL;
>  
> +	snd_soc_init_dai_link_component(card);
> +
>  	for_each_card_prelinks(card, i, link) {
>  
>  		ret = soc_init_dai_link(card, link);
I still question if the platform link component needs to be allocated
and why it cannot be in the DAI link structure? If it was static, then ...

1. If the dai_link->platform_name or dai_link->platform_of_node are
   populated and the platform->name/of_node are not populated then use
   platform_name/of_node as the platform->name/of_node.

2. If the dai_link->platform_name or dai_link->platform_of_node are not
   populated and the platform->name/of_node are populated then there is
   nothing to do, just use platform->name/of_node.

3. If the dai_link->platform_name or dai_link->platform_of_node are
   populated and the platform->name/of_node are populated then WARN and
   default to the platform_name/of_node as the platform->name/of_node.

Could this work?

Cheers
Jon

-- 
nvpublic
