From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: Applied "ASoC: simple-card: Fix configuration of DAI format" to
 the asoc tree
Date: Thu, 23 May 2019 09:54:25 +0100
Message-ID: <51ce00db-05ce-ba66-f1be-74c800f6daed@nvidia.com>
References: <20190521203241.B277E1126D1B@debutante.sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521203241.B277E1126D1B@debutante.sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: linux-tegra@vger.kernel.org

Hi Mark,

On 21/05/2019 21:32, Mark Brown wrote:
> The patch
> 
>    ASoC: simple-card: Fix configuration of DAI format
> 
> has been applied to the asoc tree at
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.  
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 
> From 069d037aea98ffa64c26d4b1dc958fb8f39f5c2b Mon Sep 17 00:00:00 2001
> From: Jon Hunter <jonathanh@nvidia.com>
> Date: Thu, 16 May 2019 18:51:26 +0100
> Subject: [PATCH] ASoC: simple-card: Fix configuration of DAI format
> 
> When configuring a codec to be both bit-clock and frame-master, it was
> found that the codec was always configured as bit-clock and frame-slave.
> Looking at the simple_dai_link_of() function there appears to be two
> problems with the configuration of the DAI format, which are ...
> 
> 1. The function asoc_simple_parse_daifmt() is called before the function
>    asoc_simple_parse_codec() and this means that the device-tree node
>    for the codec has not been parsed yet, which is needed by the
>    function asoc_simple_parse_daifmt() to determine who is the codec.
> 2. The phandle passed to asoc_simple_parse_daifmt() is the phandle to
>    the 'codec' node and not the phandle of the actual codec defined by
>    the 'sound-dai' property under the 'codec' node.
> 
> Fix the above by moving the call to asoc_simple_parse_daifmt() after the
> the call to asoc_simple_parse_codec() and pass the phandle for the codec
> to asoc_simple_parse_daifmt().
Please can you drop this patch?

Per some offline review with Morimoto-san, it turns out that the actual
issue resided in my DT (which was incorrect) and not the simple-card
machine driver.

In my DT I incorrectly had ...

sound {
	compatible = "simple-audio-card";

	...
=>	simple-audio-card,bitclock-master = <&codec>;
=>	simple-audio-card,frame-master = <&codec>;
	...

	simple-audio-card,cpu {
		sound-dai = <&xxx>;
	};

	simple-audio-card,codec {
=>		sound-dai = <&codec>;
	};
};

But I should have had ...

sound {
	compatible = "simple-audio-card";

	...
=>	simple-audio-card,bitclock-master = <&codec>;
=>	simple-audio-card,frame-master = <&codec>;
	...

	simple-audio-card,cpu {
		sound-dai = <&xxx>;
	};

=>	codec: simple-audio-card,codec {	/* simple-card wants here */
		sound-dai = <&xxx>;		/* not here */
	};
};

Thanks to Morimoto-san for correcting me!

Cheers
Jon

-- 
nvpublic
