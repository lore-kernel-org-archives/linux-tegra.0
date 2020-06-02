From: Jerry Snitselaar <jsnitsel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
Date: Tue, 2 Jun 2020 14:17:16 -0700
Message-ID: <20200602211716.mcwacflxvh7kycya__2151.38931978203$1591132663$gmane$org@cantor>
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200529221623.qc6twmpzryh7nkvb@cantor>
 <20200601104240.7f5xhz7gooqhaq4n@cantor>
 <47711845-98ee-95b8-aa95-423a36ed9741@linux.intel.com>
 <20200602000236.j4m3jvluzdhjngdc@cantor>
 <20200602142312.GJ14598@8bytes.org>
 <20200602163806.o5dpj2tpemwdzyiw@cantor>
Reply-To: Jerry Snitselaar <jsnitsel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200602163806.o5dpj2tpemwdzyiw@cantor>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Lu Baolu <baolu.lu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Gerald Schaefer <gerald.schaefer-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jean-Philippe Brucker <jean-philippe-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue Jun 02 20, Jerry Snitselaar wrote:
>On Tue Jun 02 20, Joerg Roedel wrote:
>>Hi Jerry,
>>
>>On Mon, Jun 01, 2020 at 05:02:36PM -0700, Jerry Snitselaar wrote:
>>>
>>>Yeah, that will solve the panic.
>>>
>>
>>If you still see the kdump faults, can you please try with the attached
>>diff? I was not able to reproduce them in my setup.
>>
>>Regards,
>>
>>	Joerg
>>
>
>I have another hp proliant server now, and reproduced. I will have the
>patch below tested shortly. Minor change, I switched group->domain to
>domain since group isn't an argument, and *data being passed in comes
>from group->domain anyways.
>

Looks like it solves problem for both the epyc system, and the hp proliant
server,

>>diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>>index b5ea203f6c68..5a6d509f72b6 100644
>>--- a/drivers/iommu/iommu.c
>>+++ b/drivers/iommu/iommu.c
>>@@ -1680,8 +1680,12 @@ static void probe_alloc_default_domain(struct bus_type *bus,
>>static int iommu_group_do_dma_attach(struct device *dev, void *data)
>>{
>>	struct iommu_domain *domain = data;
>>+	int ret = 0;
>>
>>-	return __iommu_attach_device(domain, dev);
>>+	if (!iommu_is_attach_deferred(group->domain, dev))
>>+		ret = __iommu_attach_device(group->domain, dev);
>>+
>>+	return ret;
>>}
>>
>>static int __iommu_group_dma_attach(struct iommu_group *group)
>>_______________________________________________
>>iommu mailing list
>>iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
>>https://lists.linuxfoundation.org/mailman/listinfo/iommu
>>
