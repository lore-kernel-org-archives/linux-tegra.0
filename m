From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Tue, 16 Oct 2012 16:18:58 +0800
Message-ID: <1350375538.2332.31.camel@markz-hp6200>
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

Hi, 

I've made this drm driver worked on Tegra 3(LVDS and HDMI both).
But the code that Thierry
hosts(git://gitorious.org/thierryreding/linux.git) doesn't work
directly. If you build and run it, you'll get a white blank screen on
Tegra 3. I didn't find the root cause but I think this is not caused by
drm driver itself(maybe the PCIE codes?). The main symptom is: some
regulators can't be inited all the time. I tried to build drm driver as
kernel module, after kernel booted, modprobe the drm driver, and you'll
find there are a lot of error prints like this:

=========================================================
[   21.383529] reg-fixed-voltage 1.regulator: Failed to find supply vin
[   21.390299] reg-fixed-voltage 1.regulator: Failed to register
regulator: -517
[   21.397645] platform 1.regulator: Driver reg-fixed-voltage requests
probe deferral
[   21.405604] platform 2.regulator: Driver reg-fixed-voltage requests
probe deferral
=========================================================

So what I did is, fetched a copy of 1015 upstream codes, copy the drm
driver into it, then it worked on Tegra 3. One thing need to be noticed
is, to make the HDMI working, we also need to fix a minor problem:
change the type of variable "output_rate" in function
"tegra30_pll_round_rate" from "unsigned long" to "u64". Otherwise the
variable overflows which clock rate calculating. I'll send a patch about
this next. 

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
