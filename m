From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 3/7] ASoC: tegra: i2s: Add support for
 more than 2 channels
Date: Fri, 25 Oct 2019 08:48:13 +0100
Message-ID: <549a97c6-ff73-abe0-7c2b-7f29f975e259@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-4-ben.dooks@codethink.co.uk>
 <2eef499e-d9d4-732a-ddd6-8d307d8cb08d@nvidia.com>
 <20191024191846.GJ46373@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20191024191846.GJ46373@sirena.co.uk>
Content-Language: en-US
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Thierry Reding <thierry.reding@gmail.com>, Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 24/10/2019 20:18, Mark Brown wrote:
> On Thu, Oct 24, 2019 at 05:12:21PM +0100, Jon Hunter wrote:
>> On 18/10/2019 16:48, Ben Dooks wrote:
> 
>>> @@ -90,10 +92,12 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>>>  		TEGRA30_I2S_CTRL_LRCK_MASK;
>>>  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>>>  	case SND_SOC_DAIFMT_DSP_A:
>>> +		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
> 
>> Sorry, I just saw the feedback on the previous iteration. I don't think
>> we want to set the polarity but based upon the format that is passed ...
> 
> The polarity should be set based on the the inversion flags in the
> format, normally both DSP modes trigger on the rising edge of the LRCLK.
> The difference is if there's a delay before the first data bit or not.

Yes. Sorry I realise my email was not clear and when I meant format, I
was referring to the bits in the format mask part of the format. In the
example, I shared we use the inversion bits for the determining the
polarity. There was an old version of one of our drivers where we had
done this incorrectly.

Cheers
Jon

-- 
nvpublic
