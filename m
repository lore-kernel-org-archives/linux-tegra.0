From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] Input: tegra-kbc - add device tree bindings
Date: Mon, 2 Jan 2012 01:16:13 -0700
Message-ID: <20120102081613.GA18381@ponder.secretlab.ca>
References: <1325053170-6984-1-git-send-email-olof@lixom.net>
 <1325053170-6984-2-git-send-email-olof@lixom.net>
 <20111228064832.GA29273@core.coreip.homeip.net>
 <74CDBE0F657A3D45AFBB94109FB122FF17755DC8CE@HQMAIL01.nvidia.com>
 <20111229092308.GA3397@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111229092308.GA3397-WlK9ik9hQGAhIp7JRqBPierSzoNAToWh@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 29, 2011 at 01:23:08AM -0800, Dmitry Torokhov wrote:
> On Wed, Dec 28, 2011 at 10:00:06PM -0800, Stephen Warren wrote:
> > Dmitry Torokhov wrote at Tuesday, December 27, 2011 11:49 PM:
> > > On Tue, Dec 27, 2011 at 10:19:29PM -0800, Olof Johansson wrote:
> > > > This adds a simple device tree binding to the tegra keyboard controller.
> > ...
> > > > +	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> > > 
> > > Error handling is missing. I also dislike devm_* facilities as it causes
> > > inconsistencies in the way we handle releasing of resources: some of
> > > them will be released automatically while others need t be released
> > > manually. I prefer having consistent model.
> > 
> > I have to say that I also disagree here. Weren't the devm_* function
> > specifically added to allow people not to write all the error-handling
> > code themselves.
> 
> I guess they were. Unfortunately they also introduce inconsistency in
> the way resources are tracked and freed since some of them support
> devm_* facilities while others don't. I might be OK with drivers that
> use one model for all resources but this patch was mixing the two.
> 
> devm_* facilities are also not free; you are saving on error handling
> code but pay with memory footprint required to implement tracking.

FWIW, I agree with Olof and Stephen.  The devm_* functions are a good thing
and I strongly encourage driver authors to use them.  The cost in memory
footprint is pretty negligible, but making it easier for driver authors to
get things right is huge.

g.
