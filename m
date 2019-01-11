From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] ASoC: core: Fix deferral of machine drivers
Date: Fri, 11 Jan 2019 08:43:24 +0000
Message-ID: <96f2e729-8ec2-44ee-448c-255c07c068b9@nvidia.com>
References: <1546968494-22993-1-git-send-email-jonathanh@nvidia.com>
 <20190109183605.GH10405@sirena.org.uk>
 <44a64e6e-c9ec-8eba-60fe-eda092250d82@nvidia.com>
 <20190110164835.GF9541@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110164835.GF9541@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Marcel Ziswiler <marcel@ziswiler.com>, Matthias Reichl <hias@horus.com>
List-Id: linux-tegra@vger.kernel.org


On 10/01/2019 16:48, Mark Brown wrote:
> On Thu, Jan 10, 2019 at 12:13:36PM +0000, Jon Hunter wrote:
>> On 09/01/2019 18:36, Mark Brown wrote:
>>> On Tue, Jan 08, 2019 at 05:28:14PM +0000, Jon Hunter wrote:
> 
>>>> -	struct snd_soc_dai_link_component *platform;
>>>> +	struct snd_soc_dai_link_component platform;
> 
>>> This breaks the build for the SCU cards (and we needs a little rebase
>>> against another fix I just merged, though I did do that when applying).
> 
>> Sorry I still don't see the build break, can you point me to it?
> 
> I'd need to find your patch again and fix the rebase issue.  It was
> assigning a pointer to a platform IIRC.

Sorry I still don't see it. Happen to recall the config you were using
to build? I tried enabling the various SH soundcards (which I believe
the SCU card is under).

Jon

-- 
nvpublic
