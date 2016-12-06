From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 0/8] Host1x IOMMU support + VIC support
Date: Tue, 6 Dec 2016 08:14:50 +0100
Message-ID: <20161206071450.uedxvvtcxbkwsoza@phenom.ffwll.local>
References: <20161110182345.31777-1-mperttunen@nvidia.com>
 <20161205195131.GF22918@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161205195131.GF22918-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 05, 2016 at 08:51:31PM +0100, Thierry Reding wrote:
> On Thu, Nov 10, 2016 at 08:23:37PM +0200, Mikko Perttunen wrote:
> > This series adds IOMMU support to Host1x and TegraDRM
> > and adds support for the VIC host1x client so that
> > host1x can be tested on modern Tegra platforms.
> > It depends on the previous fix series. The whole thing
> > (modulo patch order) is available as a git repository at
> > git://github.com/cyndis/linux.git; branch vic-v1.
> > 
> > IO memory management is organized such that there are
> > two domains: the host1x domain and the tegradrm domain.
> > The host1x domain is used by the host1x engine and
> > contains the host1x CDMA and pushbuffers for submitted
> > jobs.
> > 
> > The tegradrm domain is shared by all host1x units and
> > contains GEM objects and memory allocated by the
> > separate tegra_drm_alloc function. This function is
> > currently used to allocate space for firmware blobs
> > in the tegradrm domain.
> > 
> > A userspace test case for VIC can be found at
> > https://github.com/cyndis/drm/tree/work/tegra.
> > The testcase is in tests/tegra and is called submit_vic.
> > The in-kernel firewall is not implemented for VIC;
> > therefore, IOMMU must be enabled for the test to pass.
> > 
> > Tested with Jetson TX1 (T210). Probably works also
> > with Jetson TK1 (T124). Note that due to hardware changes
> > the testcase also needs to be changed to run properly
> > on T124.
> 
> What's the scope of the changes required for Tegra124? If we add the
> kernel bits for Tegra124 we should also have a userspace test program to
> exercise it.

Please note that just a test program is not really enough to add more uabi
(and VIC support here maybe classifies at that, no idea how this all
works). Aka does mesa run, and for the vic stuff, does some libva/libvdpau
open source implementation run on this?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
