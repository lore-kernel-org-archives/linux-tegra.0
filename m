From: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] resource: Add device-managed
 request/release_resource()
Date: Fri, 1 Aug 2014 09:58:03 -0400
Message-ID: <20140801135803.GD21624@htj.dyndns.org>
References: <1406895311-18869-1-git-send-email-thierry.reding@gmail.com>
 <20140801125522.GC21624@htj.dyndns.org>
 <20140801135540.GA373@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140801135540.GA373-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 01, 2014 at 03:55:42PM +0200, Thierry Reding wrote:
> On Fri, Aug 01, 2014 at 08:55:22AM -0400, Tejun Heo wrote:
> > On Fri, Aug 01, 2014 at 02:15:10PM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > 
> > > Provide device-managed implementations of the request_resource() and
> > > release_resource() functions. Upon failure to request a resource, the
> > > new devm_request_resource() function will output an error message for
> > > consistent error reporting.
> > > 
> > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > Acked-by: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > 
> > But please also update Documentation/driver-model/devres.txt.
> 
> The patch already contains the below hunk. Do you expect anything more
> to be added to that file?

Oops, I missed that.  All look fine to me.

Thanks.

-- 
tejun
