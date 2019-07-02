From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3] dmaengine: tegra-apb: Support per-burst residue
 granularity
Date: Tue, 2 Jul 2019 12:25:17 +0300
Message-ID: <8b4fbdb5-c6fa-6481-4894-6c2c77c23195@gmail.com>
References: <20190627194728.8948-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190627194728.8948-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

27.06.2019 22:47, Dmitry Osipenko пишет:
> Tegra's APB DMA engine updates words counter after each transferred burst
> of data, hence it can report transfer's residual with more fidelity which
> may be required in cases like audio playback. In particular this fixes
> audio stuttering during playback in a chromium web browser. The patch is
> based on the original work that was made by Ben Dooks and a patch from
> downstream kernel. It was tested on Tegra20 and Tegra30 devices.
> 
> Link: https://lore.kernel.org/lkml/20190424162348.23692-1-ben.dooks@codethink.co.uk/
> Link: https://nv-tegra.nvidia.com/gitweb/?p=linux-4.4.git;a=commit;h=c7bba40c6846fbf3eaad35c4472dcc7d8bbc02e5
> Inspired-by: Ben Dooks <ben.dooks@codethink.co.uk>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> 
> Changelog:
> 
> v3:  Added workaround for a hardware design shortcoming that results
>      in a words counter wraparound before end-of-transfer bit is set
>      in a cyclic mode.
> 
> v2:  Addressed review comments made by Jon Hunter to v1. We won't try
>      to get words count if dma_desc is on free list as it will result
>      in a NULL dereference because this case wasn't handled properly.
> 
>      The residual value is now updated properly, avoiding potential
>      integer overflow by adding the "bytes" to the "bytes_transferred"
>      instead of the subtraction.

Is there still any chance to get this into 5.3? Will be very nice! Jon / Vinod ?
