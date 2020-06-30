From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: Re: [PATCH v4 11/23] ASoC: simple-card: Loop over all children
 for 'mclk-fs'
Date: Tue, 30 Jun 2020 17:26:32 +0530
Message-ID: <8b264575-08e7-64c5-fd7c-3109a0a36ce8@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-12-git-send-email-spujar@nvidia.com>
 <875zba1y28.wl-kuninori.morimoto.gx@renesas.com>
 <58000bd3-861c-bbc2-75e1-128cf0199a76@nvidia.com>
 <87lfk5z4ov.wl-kuninori.morimoto.gx@renesas.com>
 <b33d5a1b-ecd5-3618-4894-c3ab0f4b077d@nvidia.com>
 <20200630105532.GG5272@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200630105532.GG5272@sirena.org.uk>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: spujar@nvidia.com, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com, nwartikar@nvidia.com, swarren@nvidia.com, nicoleotsuka@gmail.com
List-Id: linux-tegra@vger.kernel.org



On 6/30/2020 4:25 PM, Mark Brown wrote:
> On Tue, Jun 30, 2020 at 09:53:13AM +0530, Sameer Pujar wrote:
>> On 6/30/2020 7:38 AM, Kuninori Morimoto wrote:
>>> External email: Use caution opening links or attachments
>>>>>> +     if (cpu != codec)
>>>>>> +             of_property_read_u32(codec, prop, &props->mclk_fs);
>> Sorry if I was not clear before.
> I agree with Moromito-san that the new code (especially the above bit)
> is very confusing, I'm not sure how the reader is supposed to figure out
> what the purpose of the check is or how the CPU could ever be the CODEC.
>
>> simple_parse_mclk_fs() is used by both simple_dai_link_of_dpcm() and
>> simple_dai_link_of(). To make the same API work for both the cases, I had to
>> use (A) in DPCM function. Now (B) does not get used for
>> simple_dai_link_of_dpcm(), but will get used by simple_dai_link_of().
>> If it is simpler I will just avoid 'cpu != codec' check and keep the
>> function simple_parse_mclk_fs() as it is.
> That'd definitely be simpler, or supporting this with a CPU node as
> well.

OK. I will keep it simple.
