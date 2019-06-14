From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 01/10] iommu/exynos: convert to SPDX license tags
Date: Fri, 14 Jun 2019 08:28:42 +0200
Message-ID: <CAJKOXPfU+nB-_K3ZP9XBFp5bfk-ZvbfSEW96LD4MbtkyWfQZHg@mail.gmail.com>
References: <20190613162703.986-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613162703.986-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: joro@8bytes.org, Marek Szyprowski <m.szyprowski@samsung.com>, kgene@kernel.org, will.deacon@arm.com, robin.murphy@arm.com, agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com, heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 13 Jun 2019 at 18:27, Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> Updates license to use SPDX-License-Identifier.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/iommu/exynos-iommu.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Splitting this per driver is too much... it is not necessary. Such
changes should be done in one patch per subsystem.

Best regards,
Krzysztof
