From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 03/10] ASoC: tegra: add Tegra210 based DMIC driver
Date: Mon, 24 Feb 2020 11:28:57 +0000
Message-ID: <47f94534-e997-d56c-5793-ae832fb2add4@nvidia.com>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-4-git-send-email-spujar@nvidia.com>
 <20200221130005.GD5546@sirena.org.uk>
 <316ce0d5-318d-0533-ef06-bd7e8672f893@nvidia.com>
 <20200221165535.GG5546@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200221165535.GG5546@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com, digetx@gmail.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com
List-Id: linux-tegra@vger.kernel.org


On 21/02/2020 16:55, Mark Brown wrote:
> On Fri, Feb 21, 2020 at 02:31:05PM +0000, Jon Hunter wrote:
>> On 21/02/2020 13:00, Mark Brown wrote:
> 
>>>> +	srate = params_rate(params);
>>>> +	if (dmic->srate_override)
>>>> +		srate = dmic->srate_override;
> 
>>> How does this work for userspace?  If we just ignore the sample rate we
>>> were asked for I'd expect that the application would get upset.
> 
>> Tegra has a hardware sample rate converter (though driver not yet
>> upstream or part of this initial series) and if using the sample-rate
>> converter, then the actual rate captured by the DMIC interface could be
>> different from the resulting sample-rate.
> 
> The ideal thing in a component model would be to represent those sample
> rate convertors directly to usrspace so the routing and rewriting is
> explicit.

I assume that it would be OK for the sample rate converter itself to
expose mixer controls to configure its input and output rates so the
user could configure as needed?

>> So we want a way to indicate to the DMIC it is capturing at rate X,
>> while the resulting sample-rate is Y.
> 
>> I am not sure if there is a better way to do this? Ideally, the DMIC
>> would query the rate from the upstream MUX it is connected to, but I am
>> not sure if there is a way to do that. So right now it is a manual
>> process and the user has to configure these which are not ideal.
> 
> Is there any *need* for these to be user configurable?  What's normally
> happening at the minute is that either the external DAIs are fixed
> configuration and the DSP just converts everything or there's no format
> conversion done and things get passed through.

I can see that in most cases there are a finite set of configurations
that the end user may use. However, we would like to make the
configuration flexible as possible and this also allow us to test lots
of different configurations for verification purposes as well.

So a typical scenario would be ...

DMIC --> SRC --> DMA

Where SRC is the sample-rate converter. Now, the DMICs support upto
48kHz and although it maybe unlikely that someone would want to up
convert to say 96kHz, it is possible we can do this with the SRC.

So if the user executes arecord with '-r 96000', the DMIC hw_params
would return an error as this is not supported. So today we override
this. However, the best solution would be to allow the user the set the
input of the SRC and then if the DMIC output is routed via the SRC use
the SRC input rate instead of the actual rate seen/specified by the
user. So like you said in your other mail, if we could propagate the
rate information that would be ideal.

Jon

-- 
nvpublic
