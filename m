From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] ASoC: core: Fix deferral of machine drivers
Date: Thu, 10 Jan 2019 12:13:36 +0000
Message-ID: <44a64e6e-c9ec-8eba-60fe-eda092250d82@nvidia.com>
References: <1546968494-22993-1-git-send-email-jonathanh@nvidia.com>
 <20190109183605.GH10405@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190109183605.GH10405@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Marcel Ziswiler <marcel@ziswiler.com>, Matthias Reichl <hias@horus.com>
List-Id: linux-tegra@vger.kernel.org


On 09/01/2019 18:36, Mark Brown wrote:
> On Tue, Jan 08, 2019 at 05:28:14PM +0000, Jon Hunter wrote:
> 
>> --- a/include/sound/soc.h
>> +++ b/include/sound/soc.h
>> @@ -925,7 +925,7 @@ struct snd_soc_dai_link {
>>  	 */
>>  	const char *platform_name;
>>  	struct device_node *platform_of_node;
>> -	struct snd_soc_dai_link_component *platform;
>> +	struct snd_soc_dai_link_component platform;
>>  
>>  	int id;	/* optional ID for machine driver link identification */
>>  
> 
> This breaks the build for the SCU cards (and we needs a little rebase
> against another fix I just merged, though I did do that when applying).

Sorry I still don't see the build break, can you point me to it?

> I do think that this is going to be the safest thing to do for v5.0, it
> can always be reverted later on when it's not needed but it seems clear
> that a better fix is going to be way too invasive for the -rcs.  Can you
> respin and retest please?

Yes will do. I do wonder if we should be concerned about
snd_soc_init_multicodec() as well? Looks like it could have a different
problem if a machine driver already allocated the memory for the codec
link component.

Cheers
Jon

-- 
nvpublic
