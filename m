From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 9/9] ASoC: tegra_sgtl5000: fix platform name vs.
 of_node assignement
Date: Wed, 17 Oct 2018 20:50:34 +0100
Message-ID: <ca23a9fd-2578-c4ae-7bc4-5e2d487fb1ca@nvidia.com>
References: <20181016104730.4598-1-marcel@ziswiler.com>
 <20181016104730.4598-10-marcel@ziswiler.com>
 <35848cb7-36ee-6698-ff17-7f0e73567914@nvidia.com>
 <1539786500.6233.58.camel@toradex.com> <20181017191633.GL24097@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181017191633.GL24097@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>, "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
List-Id: linux-tegra@vger.kernel.org


On 17/10/2018 20:16, Mark Brown wrote:
> On Wed, Oct 17, 2018 at 02:28:22PM +0000, Marcel Ziswiler wrote:
> 
>> Some questions:
> 
>> - How exactly are devm allocations supposed to work concerning probe
>> deferrals?
> 
> Probe deferrals are just normal probe errors, any devm_ allocated stuff
> gets unwound.
> 
>> - Does or should the platform get cleared during a probe deferral
>> cycle?
> 
>> - If so, why does that not work?
> 
> Is something writing to static data when it should be writing to
> dynamically allocated data?  That's what this sounds like, we shouldn't
> be modifying any static data and any data dynamically allocated during
> probe ought to be being discarded.

Marcel, it maybe worth looking at what happens in the 2nd call to
snd_soc_init_platform() following the probe deferral. Also pay attention
to the value of 'dai_link->platform_name' in snd_soc_init_platform() on
both 1st and 2nd call. Seems that on the 2nd time the function is called
the value is not NULL???

Cheers
Jon

-- 
nvpublic
