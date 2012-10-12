From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Fri, 12 Oct 2012 09:20:12 +0800
Message-ID: <1350004812.3186.31.camel@markz-hp6200>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de>
Reply-To: markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121011200705.GB27599-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thank you for your hard work, Thierry!

We're looking forward to your final merged drm driver and hope we can
get it into 3.8.

Mark
On Fri, 2012-10-12 at 04:07 +0800, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> Hi,
> 
> I've finally managed to get HDMI working on Tegra20. Unfortunately the
> xf86-video-modesetting driver doesn't work on top of it yet, but I think
> that's a different error somewhere else and I'm still trying to figure
> out what exactly is going wrong. However, a framebuffer console can be
> run on top of it, as does a small test program that I've written for
> testing.
> 
> The branch that contains all of this is the tegra/next branch on my
> personal Linux kernel tree on gitorious[0]. Some other things are
> included as well, such as the latest PCIe driver, an experimental draft
> of a NAND driver (loosely based on the U-Boot driver by Jim Lin and
> Simon Glass) as well as various fixes and hacks. Some of it is probably
> also junk that I'll throw away at some point. The branch isn't very
> clean, but it should work well enough for anybody who wants to give it a
> try.
> 
> My plan was to get LVDS and HDMI to work on Tegra20 with CMA for GEM
> object allocations before submitting for mainline inclusion. Since all
> of these are now working I will clean up the branch, provide a branch
> with only the DRM bits into a separate branch and submit the patches for
> review, with the hope of getting them included in 3.8. A lot of the HDMI
> work has been contributed by NVIDIA's Mark Zhang, who is also busy (and
> apparently very close to) getting Tegra30 support working. If he can
> make it work, Tegra30 support can be included as well.
> 
> All of that said, I invite everyone with access to Tegra hardware to
> give the DRM driver a spin and report back if you encounter any
> problems. Feel free to also drop a note on success.
> 
> Thierry
> 
> [0]: git://gitorious.org/thierryreding/linux.git
> 
> * Unknown Key
> * 0x7F3EB3A1
