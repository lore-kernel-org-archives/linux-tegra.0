From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v5] dmaengine: tegra-apb: Support per-burst residue
 granularity
Date: Thu, 25 Jul 2019 15:56:13 +0530
Message-ID: <20190725102613.GT12733@vkoul-mobl.Dlink>
References: <20190705150519.18171-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190705150519.18171-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Ben Dooks <ben.dooks@codethink.co.uk>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05-07-19, 18:05, Dmitry Osipenko wrote:
> Tegra's APB DMA engine updates words counter after each transferred burst
> of data, hence it can report transfer's residual with more fidelity which
> may be required in cases like audio playback. In particular this fixes
> audio stuttering during playback in a chromium web browser. The patch is
> based on the original work that was made by Ben Dooks and a patch from
> downstream kernel. It was tested on Tegra20 and Tegra30 devices.

Applied, thanks

-- 
~Vinod
