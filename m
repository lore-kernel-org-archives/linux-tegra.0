From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 2/6] misc: fuse: Add efuse driver for Tegra
Date: Thu, 19 Dec 2013 11:43:40 -0800
Message-ID: <20131219194340.GB1443@kroah.com>
References: <1387468474-26521-1-git-send-email-pdeschrijver@nvidia.com>
 <1387468474-26521-3-git-send-email-pdeschrijver@nvidia.com>
 <20131219175931.GA18004@kroah.com>
 <52B346E1.2030508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52B346E1.2030508-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 19, 2013 at 12:20:01PM -0700, Stephen Warren wrote:
> On 12/19/2013 10:59 AM, Greg KH wrote:
> > On Thu, Dec 19, 2013 at 05:54:30PM +0200, Peter De Schrijver wrote:
> 
> >> +	pr_info("Tegra Revision: %s SKU: %d CPU Process: %d Core Process: %d\n",
> >> +		tegra_revision_name[sku_info->revision],
> >> +		sku_info->sku_id, sku_info->cpu_process_id,
> >> +		sku_info->core_process_id);
> > 
> > Why pollute the kernel log with this type of thing?  Who really needs
> > it?
> 
> We already print this; I guess this series is just moving where that
> happens. It has proved useful to me in the past so I know which chip rev
> I'm using, but I guess if this all gets exported to sysfs somewhere else
> in this series, I could just go read those files in the future...

I don't see this being exported anywhere else, or at least, if it is, it
sure isn't being documented...

greg k-h
