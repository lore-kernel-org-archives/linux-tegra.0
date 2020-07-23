From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] change slave occurence to secondary everywhere
Date: Thu, 23 Jul 2020 19:06:18 +0200
Message-ID: <20200723170618.GA2835510@kroah.com>
References: <20200723151511.22193-1-bharadwaj.rohit8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200723151511.22193-1-bharadwaj.rohit8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rohit K Bharadwaj <bharadwaj.rohit8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: marvin24-Mmb7MZpHnFY@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 23, 2020 at 08:45:13PM +0530, Rohit K Bharadwaj wrote:
> changed usage of slave (deprecated) to secondary
> 
> Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/staging/nvec/nvec.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Odd subject line, you should follow the other patches for this driver:
	staging: nvec: one_line_description_here

Also, you need to version your patches, this was v2, right?  Put below
the --- line what you changed for each version.

v3?

thanks,

greg k-h
