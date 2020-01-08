From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v7 13/21] ASoC: tegra: Use device managed resource APIs to
 get the clock
Date: Wed, 8 Jan 2020 10:56:23 +0530
Message-ID: <692ae1f9-ec01-f0e9-9b9a-a0eba3f32e44@nvidia.com>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
 <1578457515-3477-14-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1578457515-3477-14-git-send-email-skomatineni@nvidia.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 1/8/2020 9:55 AM, Sowjanya Komatineni wrote:
> tegra_asoc_utils uses clk_get() and clk_put() to get the clock
> and to free them explicitly.
>
> This patch updates it to use device managed resource API
> devm_clk_get() so the clock will be automatically released and freed
> when the device is unbound and removes tegra_asoc_utils_fini() as
> its no longer needed.
>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Reviewed-by: Sameer Pujar <spujar@nvidia.com>

> ---
>   sound/soc/tegra/tegra_alc5632.c    |  7 +------
>   sound/soc/tegra/tegra_asoc_utils.c | 34 +++++++---------------------------
>   sound/soc/tegra/tegra_asoc_utils.h |  1 -
>   sound/soc/tegra/tegra_max98090.c   | 22 ++++++----------------
>   sound/soc/tegra/tegra_rt5640.c     | 22 ++++++----------------
>   sound/soc/tegra/tegra_rt5677.c     |  7 +------
>   sound/soc/tegra/tegra_sgtl5000.c   |  7 +------
>   sound/soc/tegra/tegra_wm8753.c     | 22 ++++++----------------
>   sound/soc/tegra/tegra_wm8903.c     | 22 ++++++----------------
>   sound/soc/tegra/tegra_wm9712.c     |  8 ++------
>   sound/soc/tegra/trimslice.c        | 18 ++++--------------
>   11 files changed, 40 insertions(+), 130 deletions(-)
. . .
