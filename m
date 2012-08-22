From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Binding together tegradrm & nvhost
Date: Wed, 22 Aug 2012 10:29:21 +0800
Message-ID: <1345602561.13182.6.camel@markz-desktop>
References: <50323513.3090606@nvidia.com>
	 <20120820131800.GA13785@avionic-0098.mockup.avionic-design.de>
	 <1345527561.31608.152.camel@markz-desktop>
	 <20120821054256.GA5325@avionic-0098.mockup.avionic-design.de>
	 <1345529761.31608.169.camel@markz-desktop>
	 <20120821145709.GA701@avionic-0098.mockup.avionic-design.de>
Reply-To: <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120821145709.GA701-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2012-08-21 at 22:57 +0800, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Tue, Aug 21, 2012 at 02:16:01PM +0800, Mark Zhang wrote:
> > On Tue, 2012-08-21 at 13:42 +0800, Thierry Reding wrote:
> > > > Old Signed by an unknown key
> > > 
> > > On Tue, Aug 21, 2012 at 01:39:21PM +0800, Mark Zhang wrote:
> > > > On Mon, 2012-08-20 at 21:18 +0800, Thierry Reding wrote:
> > > > > I have a new patch series that takes care of these two steps. Mark sent
> > > > > some patches for Tegra30 and HDMI on top of the older series that I need
> > > > > to merge with what I have. Maybe I'll decide to send the series out
> > > > > without the patches merged, depending on how much time I'll get or how
> > > > > much effort it requires. I had hoped the next series would have working
> > > > > HDMI support, which is why I waited.
> > > > 
> > > > OK. So I'm going to pause the patch writing right now and wait for your
> > > > codes to be published on linux-tegra. Regardless of whether my patches
> > > > be merged into yours, I'll provide patches for the version which you
> > > > send to maillist in the near future.
> > > 
> > > Let me see if I can upload my patches to the repository on gitorious.
> > > I'm not sure when exactly I find time to merge your patches, and I don't
> > > want to hold you up.
> > > 
> > 
> > All right, thank you. Let us know when you finish uploading.
> > By the way, any updates from freedesktop?
> 
> Finally the upload is done. You can find my latest work in the next
> branch of the following repository:
> 
> 	git://gitorious.org/linux-tegra-drm/linux-tegra-drm.git
> 
> It's down to two patches and based on next-20120820. Eventually I was
> going to maybe split it up a bit to separate at least the hunks for
> arch/ (Stephen will probably want this anyway) and maybe also some
> functionality like HDMI support.
> 
> Mark: If you find the time it'd be great if you could rebase your
> patches on top of that branch. I think for a first submission to
> mainline some things probably need to be cleaned up and the history
> should probably be clean, so we may want to squash some of the patches
> that you sent into the existing ones. For now it's probably best if you
> continue your work on top of this.
> 

Yes, I can rebase my works on top of yours.
Besides, I want to say that let's use this repository before the
repository in freedesktop created. And push our changes to it at the
first time, in that way, we can keep track of both's progresses and
avoid duplicate works.

Mark
> Thierry
> 
> * Unknown Key
> * 0x7F3EB3A1
