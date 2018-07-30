From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 2/4] ASoC: tegra: Add a TDM configuration callback
Date: Mon, 30 Jul 2018 15:15:27 +0100
Message-ID: <6b9fb98e-eb55-8b19-5c73-403064cb7b3a@nvidia.com>
References: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
 <20180727125931.9794-3-jorge.sanjuan@codethink.co.uk>
 <2392df6f-12bc-74fe-ec0f-50dbb7b9a33a@nvidia.com>
 <20180730101800.GF5789@sirena.org.uk>
 <2a91268d-351b-d342-42bd-8ffbf33a316e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2a91268d-351b-d342-42bd-8ffbf33a316e@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>, lgirdwood@gmail.com, thierry.reding@gmail.com, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel@lists.codethink.co.uk
List-Id: linux-tegra@vger.kernel.org


On 30/07/18 15:04, Jon Hunter wrote:
> I still do not like configuring the fsync width in this function. The
> fsync width needs to be configured for both DSP modes and normal I2S
> modes and so it seems it would be more appropriate to do this in the
> hw_params function for this driver.

That said, it does not look like this current driver ever programs the
fsync width for normal I2S mode (which I thought was necessary as we do
in other Tegra I2S drivers). So I will check on this and confirm.

Jon

-- 
nvpublic
