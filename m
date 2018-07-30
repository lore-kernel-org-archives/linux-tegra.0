From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 0/4] ASoC: Tegra30 TDM support
Date: Mon, 30 Jul 2018 18:22:08 +0100
Message-ID: <e7961b55c10610a7e137edee2995add9@codethink.co.uk>
References: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>
Cc: lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 2018-07-27 13:59, Jorge Sanjuan wrote:
> This patchset adds support for TDM audio on Tegra30 hardware.
> It adds the DAI's `set_tdm_slot` callback and enables a tegra
> pcm to have up to 8 channels.
> 
> It also includes support for other audio formats supported by
> the Tegra30 HW and fixes a broken macro needed for setting the
> TDM on the registers.
> 
> Based on Linux 4.18-rc3 tag.
> 
> Edward Cragg (4):
>   ASoC: tegra: i2s: Fix typo/broken macro
>   ASoC: tegra: Add a TDM configuration callback
>   ASoC: tegra: Allow 32-bit and 24-bit samples
>   ASoC: tegra: i2s: Add support for more than 2 channels
> 
>  sound/soc/tegra/tegra30_i2s.c | 72 
> ++++++++++++++++++++++++++++++++++++-------
>  sound/soc/tegra/tegra30_i2s.h |  2 +-
>  2 files changed, 62 insertions(+), 12 deletions(-)

Just as a note, Ed Cragg has moved on from Codethink and I've not
got a new address for him. We've been cleaning some of the work Ed,
Jorge, Terry and myself have been doing.

-- 
Ben
