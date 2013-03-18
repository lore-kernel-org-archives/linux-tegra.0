From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 8/9] usb: host: ehci-tegra: fix PHY error handling
Date: Mon, 18 Mar 2013 09:08:18 -0700
Message-ID: <20130318160818.GF3887@kroah.com>
References: <1363338730-14581-1-git-send-email-balbi@ti.com>
 <1363338730-14581-9-git-send-email-balbi@ti.com>
 <51438EA8.1060301@wwwdotorg.org>
 <20130318080245.GI17135@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130318080245.GI17135-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 18, 2013 at 10:02:45AM +0200, Felipe Balbi wrote:
> Hi,
> 
> On Fri, Mar 15, 2013 at 03:12:08PM -0600, Stephen Warren wrote:
> > On 03/15/2013 03:12 AM, Felipe Balbi wrote:
> > > PHY layer no longer returns NULL, we must
> > > switch from IS_ERR_OR_NULL() to IS_ERR().
> > 
> > This change will definitely conflict with some Tegra EHCI/USB-PHY
> > changes that Venu plans to submit very soon, for 3.10. This is relevant
> 
> but this is such a small change that, even if it conflicts, resolution
> will be trivial.
> 
> > since we'd previously discussed you ack'ing Venu's patches, and my
> > applying them to the Tegra tree, due to dependencies between the Tegra
> > device tree files and his USB changes.
> > 
> > To resolve this, we can do the following:
> > 
> > 1) I will create a tiny topic branch containing just the Tegra DT
> > changes that must happen before the USB driver changes. This can be
> > based on v3.9-rc1 or similar, and be entirely self-contained.
> > 
> > 2) You can merge that topic branch into your USB tree, so that the
> > changes are present there.
> > 
> > 3) I will merge that topic branch into the Tegra tree.
> > 
> > (2) and (3) are both needed so that the exact same commit ID is present
> > in each of our branches. It's needed in yours as a pre-cursor to Venu's
> > changes. It's needed in Tegra's because I still hope to activate usage
> > of the C pre-processor on the Tegra DT files, and that needs to build on
> > top of the same DT change of Venu's that you also need.
> > 
> > 4) Once you've done that, you can take Venu's USB patches through your
> > USB tree rather than my applying them to the Tegra tree. This will allow
> > you to resolve any conflicts between your changes and Venu's changes
> > entirely within your branch simply by applying the patches one after the
> > other. Nice and simple, and just like any other USB change.
> > 
> > However, this goes against your statement that you "don't accept pull
> > requests". Perhaps you can make an exception for this case?
> 
> Greg won't like seeing merges from my pull request and I kinda agree
> with him. We can sort out the conflicts later.
> 
> Greg ?

Ick, what a mess.  If you need to take patches for the Tegra stuff this
way, I guess it can work out.  I'll defer to you as to how you want to
handle it.

greg k-h
