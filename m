From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] Revert "ASoC: tegra: Allow 24bit and 32bit samples"
Date: Fri, 31 Jan 2020 18:38:54 +0300
Message-ID: <2bb53d7d-2d36-e16e-5858-24360b19f936@gmail.com>
References: <20200131091901.13014-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200131091901.13014-1-jonathanh@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

31.01.2020 12:19, Jon Hunter пишет:
> Commit f3ee99087c8ca0ecfdd549ef5a94f557c42d5428 ("ASoC: tegra: Allow
> 24bit and 32bit samples") added 24-bit and 32-bit support for to the
> Tegra30 I2S driver. However, there are two additional commits that are
> also needed to get 24-bit and 32-bit support to work correctly. These
> commits are not yet applied because there are still some review comments
> that need to be addressed. With only this change applied, 24-bit and
> 32-bit support is advertised by the I2S driver, but it does not work and
> the audio is distorted. Therefore, revert this patch for now until the
> other changes are also ready.
> 
> Furthermore, a clock issue with 24-bit support has been identified with
> this change and so if we revert this now, we can also fix that in the
> updated version.
> 
> Cc: stable@vger.kernel.org
> 
> Reported-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Thanks, Jon!

Tested-by: Dmitry Osipenko <digetx@gmail.com>

Ben, looking forward to have 24bit working in 5.7 :)
