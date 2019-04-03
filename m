From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] drm/tegra: gem: Fix CPU-cache maintenance for BO's
 allocated using get_pages()
Date: Wed, 3 Apr 2019 13:47:51 +0300
Message-ID: <f0f0a6f0-62e9-3410-d244-f0716263311a@gmail.com>
References: <20190306225519.4538-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306225519.4538-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

07.03.2019 1:55, Dmitry Osipenko пишет:
> The allocated pages need to be invalidated in CPU caches. On ARM32 the
> DMA_BIDIRECTIONAL flag only ensures that data is written-back to DRAM and
> the data stays in CPU cache lines. While the DMA_FROM_DEVICE flag ensures
> that the corresponding CPU cache lines are getting invalidated and nothing
> more, that's exactly what is needed for a newly allocated pages.
> 
> This fixes randomly failing rendercheck tests on Tegra30 using the
> Opentegra driver for tests that use small-sized pixmaps (10x10 and less,
> i.e. 1-2 memory pages) because apparently CPU reads out stale data from
> caches and/or that data is getting evicted to DRAM at the time of HW job
> execution.
> 
> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Thierry, please don't forget about this patch.
