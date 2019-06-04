From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v1] dmaengine: tegra-apb: Error out if DMA_PREP_INTERRUPT
 flag is unset
Date: Tue, 4 Jun 2019 17:46:16 +0530
Message-ID: <20190604121616.GX15118@vkoul-mobl>
References: <20190529214355.15339-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190529214355.15339-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Ben Dooks <ben.dooks@codethink.co.uk>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 30-05-19, 00:43, Dmitry Osipenko wrote:
> Apparently driver was never tested with DMA_PREP_INTERRUPT flag being
> unset since it completely disables interrupt handling instead of skipping
> the callbacks invocations, hence putting channel into unusable state.
> 
> The flag is always set by all of kernel drivers that use APB DMA, so let's
> error out in otherwise case for consistency. It won't be difficult to
> support that case properly if ever will be needed.

Applied, thanks

-- 
~Vinod
