From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: usbfs: check cpu address range before remap
Date: Fri, 4 Oct 2019 14:21:57 +0200
Message-ID: <20191004122157.GA422178@kroah.com>
References: <1567585051-1354-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1567585051-1354-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: stern@rowland.harvard.edu, dmitry.torokhov@gmail.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Sep 04, 2019 at 01:47:31PM +0530, Nagarjuna Kristam wrote:
> In usbfs mmap, usb_alloc_coherent is used to allocate memory.
> This Memory is then remapped to user space memory using remap_pfn_range.
> remap_pfn_range needs phy address of memory, for which virt_to_phy API
> is used. This API works only if memory is allocated using kmalloc. But
> usb_alloc_coherent can allocate memory in vmalloc range and this causes
> wrong remap of user memory.
> 
> Check if address returned by usb_alloc_coherent failed in vmalloc range
> and if yes, use remap_vmalloc_range API, else use remap_pfn_range to remap
> address to user space.
> 
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/usb/core/devio.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index a945ad7..20999de 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -250,7 +250,12 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
>  	usbm->vma_use_count = 1;
>  	INIT_LIST_HEAD(&usbm->memlist);
>  
> -	if (remap_pfn_range(vma, vma->vm_start,
> +	if (is_vmalloc_addr(usbm->mem)) {
> +		if (remap_vmalloc_range(vma, usbm->mem, 0) < 0) {
> +			dec_usb_memory_use_count(usbm, &usbm->vma_use_count);
> +			return -EAGAIN;
> +		}
> +	} else if (remap_pfn_range(vma, vma->vm_start,
>  			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
>  			size, vma->vm_page_prot) < 0) {
>  		dec_usb_memory_use_count(usbm, &usbm->vma_use_count);
> -- 
> 2.7.4
> 

With the recent dma changes, is this patch still needed and correct?

thanks,

greg k-h
