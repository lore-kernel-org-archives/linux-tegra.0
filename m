From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] USB: ehci-tegra: fix inefficient copy of
 unaligned buffers
Date: Fri, 24 Apr 2015 08:31:29 +0200
Message-ID: <20150424063129.GA320@localhost>
References: <1429798012-21916-1-git-send-email-johan@kernel.org>
 <1429798012-21916-3-git-send-email-johan@kernel.org>
 <553956DA.2090300@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <553956DA.2090300-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Apr 23, 2015 at 02:32:26PM -0600, Stephen Warren wrote:
> On 04/23/2015 08:06 AM, Johan Hovold wrote:
> > Make sure only to copy any actual data rather than the whole buffer,
> > when releasing the temporary buffer used for unaligned non-isochronous
> > transfers.
> >
> > Compile-tested only.
> 
> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> (Tested a USB network device attached to Jetson TK1, with a large 
> download, and ping packets of various sizes from another host)

Thanks for testing, Stephen!

Johan
