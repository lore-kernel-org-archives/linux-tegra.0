From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/4] iommu: Add gfp parameter to iommu_ops::map
Date: Tue, 4 Jun 2019 14:24:42 -0700
Message-ID: <CAF6AEGuk8GkbZ_XZJg6Gbpng+BaKjVHQ9M-6nGW0pi+h_Nh3Hw@mail.gmail.com>
References: <20190506185207.31069-1-tmurphy@arista.com>
	<20190506185207.31069-2-tmurphy@arista.com>
	<33a1e3c1-1906-9e45-d060-e7998424973b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <33a1e3c1-1906-9e45-d060-e7998424973b-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gerald Schaefer <gerald.schaefer-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tom Murphy <tmurphy-nzgTgzXrdUbQT0dZR+AlfA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, murphyt7-/Zw1syy4LHg@public.gmane.orglis
List-Id: linux-tegra@vger.kernel.org

On Tue, Jun 4, 2019 at 11:11 AM Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org> wrote:
>
> On 06/05/2019 19:52, Tom Murphy wrote:
> > Add a gfp_t parameter to the iommu_ops::map function.
> > Remove the needless locking in the AMD iommu driver.
> >
> > The iommu_ops::map function (or the iommu_map function which calls it)
> > was always supposed to be sleepable (according to Joerg's comment in
> > this thread: https://lore.kernel.org/patchwork/patch/977520/ ) and so
> > should probably have had a "might_sleep()" since it was written. However
> > currently the dma-iommu api can call iommu_map in an atomic context,
> > which it shouldn't do. This doesn't cause any problems because any iommu
> > driver which uses the dma-iommu api uses gfp_atomic in it's
> > iommu_ops::map function. But doing this wastes the memory allocators
> > atomic pools.
>
> Hmm, in some cases iommu_ops::unmap may need to allocate as well,
> primarily if it needs to split a hugepage mapping. Should we pass flags
> through there as well, or are we prepared to assume that that case will
> happen rarely enough that it's fair to just assume GFP_ATOMIC? It won't
> happen for DMA ops, but it's conceivable that other users such as GPU
> drivers might make partial unmaps, and I doubt we could totally rule out
> the wackiest ones doing so from non-sleeping contexts.
>

jfyi, today we (well, drm/msm) only unmap entire buffers, so assuming
there isn't any coelescense of adjacent buffers that happen to form a
hugepage on ::map(), we are probably ok on ::unmap()..

we do always only call ::map or ::unmap under sleepable conditions.

btw, would it be simpler to just make gfp_t a domain a attribute?
That seems like it would be less churn, but maybe I'm overlooking
something.

BR,
-R
