From: Sjoerd Simons <sjoerd-FGvqe4uplSY@public.gmane.org>
Subject: Re: [5/5] ARM: tegra: jetson-tk1: enable GK20A GPU
Date: Thu, 25 Sep 2014 20:10:31 +0200
Message-ID: <1411668631.24948.9.camel@luon.net>
References: <1400491450-19223-6-git-send-email-acourbot@nvidia.com>
	 <20140925132717.GA13579@dusk.luon.net> <54243931.6050804@wwwdotorg.org>
	 <20140925164109.GA30382@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140925164109.GA30382@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 2014-09-25 at 18:41 +0200, Thierry Reding wrote:
> On Thu, Sep 25, 2014 at 09:48:01AM -0600, Stephen Warren wrote:
> > On 09/25/2014 07:27 AM, Sjoerd Simons wrote:
> > >Playing a bit with todays linux-next on my jetson, it seems this patch is
> > >still required for enabling the GPU. Is there anything blocking it (firmware
> > >not available yet in liux-firmware?)
> > 
> > I think initially I was waiting for the DRM patch "drm/nouvea: support for
> > probing platform devices" to be applied, but it looks like that's been
> > applied already, so only patches 4 and 5 in this series are still
> > outstanding.
> > 
> > Alex, wasn't there also some issue where the VPR register had to be
> > programmed, and if it wasn't there'd be a hang when the GPU registers were
> > touched? If we've added code to Nouveau/tegradrm to detect that and avoid
> > the problem, then I guess we can commit these last two patches for 3.19. A
> > resend after the 3.18 merge window might help.
> 
> A patch that programs VPR was merged into U-Boot (though I don't think
> it's made it into master yet).

Assuming you're talking about "ARM: tegra: Disable VPR",that has landed
in u-boot master and released as part of v2014.10-rc2 [0]

>  I'm not sure we can reasonably check for
> that in Nouveau, given that the register is somewhere completely
> unrelated. In fact I think the U-Boot patch was triggered by some
> discussion about how to solve this and it was decided that it shouldn't
> be done in the kernel, but U-Boot should set it up.
> 
> That said, perhaps one solution would be to make U-Boot enable the gk20a
> device if it's set up the VPR and disable it otherwise?

I guess in that case the vdd-supply should still be added to the dts
with u-boot toggling the status field of the node?


0: http://git.denx.de/?p=u-boot.git;a=commit;h=df3443dfa449ad02bef8ddf6e2c90a6fd9394fc9
-- 
Sjoerd Simons <sjoerd-FGvqe4uplSY@public.gmane.org>
