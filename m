From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 2/4] ASoC: tegra: Add a TDM configuration callback
Date: Mon, 30 Jul 2018 15:04:46 +0100
Message-ID: <2a91268d-351b-d342-42bd-8ffbf33a316e@nvidia.com>
References: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
 <20180727125931.9794-3-jorge.sanjuan@codethink.co.uk>
 <2392df6f-12bc-74fe-ec0f-50dbb7b9a33a@nvidia.com>
 <20180730101800.GF5789@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730101800.GF5789@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>, lgirdwood@gmail.com, thierry.reding@gmail.com, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel@lists.codethink.co.uk
List-Id: linux-tegra@vger.kernel.org


On 30/07/18 11:18, Mark Brown wrote:
> On Mon, Jul 30, 2018 at 10:31:16AM +0100, Jon Hunter wrote:
> 
>> It can be quite common for the fsync-width for DSP modes to be a single clock and so 
>> I am not sure that is makes sense to set this here always to the slot width. It maybe
>> worth considering add a DT property for specifying the fsync width.
> 
> DSP modes only care about the rising edge of the LRCLK, the pulse can be
> any width without causing interoperability problems.

OK, thanks I was not able to find a spec that defines this, but I saw a
lot of codecs use a single bit clock width. So then equally making the
default '1' should also be fine.

I still do not like configuring the fsync width in this function. The
fsync width needs to be configured for both DSP modes and normal I2S
modes and so it seems it would be more appropriate to do this in the
hw_params function for this driver.

Cheers
Jon

-- 
nvpublic
