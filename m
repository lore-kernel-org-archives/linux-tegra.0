From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] [RFC] ARM: IOMMU: Tegra20: iommu_ops for GART
 driver
Date: Sat, 17 Dec 2011 02:15:09 +0100
Message-ID: <20111217.031509.550537371548178833.hdoyu@nvidia.com>
References: <1323954690-7000-1-git-send-email-hdoyu@nvidia.com><1323954690-7000-2-git-send-email-hdoyu@nvidia.com><20111216154331.GD29877@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111216154331.GD29877-5C7GfCeVMHo@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "joerg.roedel-5C7GfCeVMHo@public.gmane.org" <joerg.roedel-5C7GfCeVMHo@public.gmane.org>
Cc: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org" <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Joerg, Thank you for your quick review.

From: Joerg Roedel <joerg.roedel-5C7GfCeVMHo@public.gmane.org>
Subject: Re: [PATCH v2 1/2] [RFC] ARM: IOMMU: Tegra20: iommu_ops for GART driver
Date: Fri, 16 Dec 2011 16:43:31 +0100
Message-ID: <20111216154331.GD29877-5C7GfCeVMHo@public.gmane.org>

> On Thu, Dec 15, 2011 at 03:11:29PM +0200, Hiroshi DOYU wrote:
> > Tegra 20 IOMMU H/W, GART (Graphics Address Relocation Table). This
> > patch implements struct iommu_ops for GART for the upper IOMMU API.
> > 
> > This H/W module supports only single virtual address space(domain),
> > and manages a single level 1-to-1 mapping H/W translation page table.
> > 
> > Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/iommu/Kconfig      |   11 +
> >  drivers/iommu/Makefile     |    1 +
> >  drivers/iommu/tegra-gart.c |  451 ++++++++++++++++++++++++++++++++++++++++++++
> 
> The code looks good in general.

Thanks.

> I think we need to extend the IOMMU-API
> a little bit to better support GART IOMMUs. A user of the IOMMU-API
> should be able to get the information about the iova-base and size of
> the aperture for example. These extensions will be beneficial for
> porting other GART-like driver to the IOMMU-API too.

is it similar to how ".pgsize_bitmap" is passed?

> 
> 
> 	Joerg
> 
> -- 
> AMD Operating System Research Center
> 
> Advanced Micro Devices GmbH Einsteinring 24 85609 Dornach
> General Managers: Alberto Bozzo, Andrew Bowd
> Registration: Dornach, Landkr. Muenchen; Registerger. Muenchen, HRB Nr. 43632
> 
