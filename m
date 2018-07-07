From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] gpu: host1x: Skip IOMMU initialization if firewall is enabled
Date: Sat, 07 Jul 2018 14:07:01 +0300
Message-ID: <1530965.U9eOrqsrov@dimapc>
References: <20180519010710.11693-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180519010710.11693-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Saturday, 19 May 2018 04:07:10 MSK Dmitry Osipenko wrote:
> Host1x's CDMA can't access the command buffers if IOMMU and Host1x
> firewall are enabled in the kernels config because firewall doesn't map
> the copied buffer into IOVA space. Fix this by skipping IOMMU
> initialization if firewall is enabled as firewall merges sparse cmdbufs
> into a single contiguous buffer and hence IOMMU isn't needed in this case.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Thierry, please consider applying this patch.
