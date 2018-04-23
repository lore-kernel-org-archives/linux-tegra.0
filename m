From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] gpu: drm: tegra: Adding new typedef vm_fault_t
Date: Mon, 23 Apr 2018 03:54:09 -0700
Message-ID: <20180423105409.GC2308@bombadil.infradead.org>
References: <20180417134755.GA30291@jordon-HP-15-Notebook-PC>
 <20180418082439.GA4646@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180418082439.GA4646@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Souptick Joarder <jrdr.linux@gmail.com>, airlied@linux.ie, jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 18, 2018 at 10:24:39AM +0200, Thierry Reding wrote:
> > @@ -437,20 +436,7 @@ static int tegra_bo_fault(struct vm_fault *vmf)
> >  	offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> >  	page = bo->pages[offset];
> > 
> > -	err = vm_insert_page(vma, vmf->address, page);
> > -	switch (err) {
> > -	case -EAGAIN:
> > -	case 0:
> > -	case -ERESTARTSYS:
> > -	case -EINTR:
> > -	case -EBUSY:
> > -		return VM_FAULT_NOPAGE;
> > -
> > -	case -ENOMEM:
> > -		return VM_FAULT_OOM;
> > -	}
> > -
> > -	return VM_FAULT_SIGBUS;
> > +	return vmf_insert_page(vma, vmf->address, page);
> >  }
> 
> This new function returns VM_FAULT_NOPAGE only for 0 and -EBUSY, whereas
> we used to return VM_FAULT_NOPAGE for -EAGAIN, -ERESTARTSYS and -EINTR
> as well. Was this previously wrong?

Not so much wrong as unnecessary.  vm_insert_page() can't return -EAGAIN,
-ERESTARTSYS or -EINTR.
