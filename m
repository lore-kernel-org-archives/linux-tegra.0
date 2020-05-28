From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] [v2] spi: tegra20-slink: Fix runtime PM imbalance on error
Date: Thu, 28 May 2020 14:07:55 +0100
Message-ID: <159067126729.55053.1525159932135385920.b4-ty@kernel.org>
References: <20200523122909.25247-1-dinghao.liu@zju.edu.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200523122909.25247-1-dinghao.liu@zju.edu.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: kjlu@umn.edu, Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, linux-spi@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sat, 23 May 2020 20:29:09 +0800, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: tegra20-slink: Fix runtime PM imbalance on error
      commit: faedcc17ad183acfa5d74758ebc4f21aef341f11

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
