From: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 22/22] Revert "iommu/tegra: gart: Do not register with
 bus"
Date: Tue, 30 May 2017 11:21:23 +0200
Message-ID: <20170530092123.GB2818@8bytes.org>
References: <cover.1495498184.git.digetx@gmail.com>
 <781477cf9ac61301e639f71236d65a8b31586827.1495498184.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <781477cf9ac61301e639f71236d65a8b31586827.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 23, 2017 at 03:16:33AM +0300, Dmitry Osipenko wrote:
> The GART driver was disabled because it was picked by as an IOMMU provider
> for the DRM driver on Tegra20, which is not the purpose of the GART. Now
> DRM driver avoids to use IOMMU on Tegra20, so the GART driver can be
> re-enabled. Potentially there are interesting use cases of the GART for
> Tegra20, like mmap'ing of a fallback memory allocation and using its GART
> aperture for an accelerated graphics operation.
> 
> This reverts commit c7e3ca515e784a82223f447b79eb2090bdb91378.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/iommu/tegra-gart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

	Acked-by: Joerg Roedel <jroedel-l3A5Bk7waGM@public.gmane.org>
