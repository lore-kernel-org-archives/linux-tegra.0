From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: tegra: Unify tegra{20,30,114}_init_early()
Date: Sun, 10 Feb 2013 22:16:14 +0100
Message-ID: <1828614.u7HcYf891a@ax5200p>
References: <1360308574-19658-1-git-send-email-hdoyu@nvidia.com> <2499199.srlLvkihNZ@ax5200p> <51180121.6040803@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51180121.6040803-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sunday 10 February 2013 13:20:49 Stephen Warren wrote:
> 1On 02/10/2013 10:28 AM, Marc Dietrich wrote:
> > On Friday 08 February 2013 10:09:10 Stephen Warren wrote:
> >> On 02/08/2013 05:29 AM, Marc Dietrich wrote:
> >>> Hiroshi,
> >>> 
> >>> Am Freitag, 8. Februar 2013, 09:29:31 schrieb Hiroshi Doyu:
> >>>> Refactored tegra{20,30,114}_init_early() so that we have the unified
> >>>> tegra_init_early().
> 
> ...
> 
> >>> are these ifdefs really needed? Multisoc kernels will enable them all
> >>> anyway and there is a case structure which protects the assignments.
> >>> Also
> >>> the hotplug functions are very tiny, so there shouldn't be a big loss.
> >> 
> >> The files that contain/implement those functions are separate for each
> >> SoC and only included in the build when the individual SoCs are enabled.
> >> 
> >> While multi-platform SoCs do make sense for distros, we also very
> >> specifically want to support the case where only Tegra, and only a
> >> single Tegra SoC, is enabled, hence this separation.
> > 
> > Huh? so tegra_defconfig is not supported?
> > 
> > grep "TEGRA_.*_SOC" tegra_defconfig:
> > 
> > CONFIG_ARCH_TEGRA_2x_SOC=y
> > CONFIG_ARCH_TEGRA_3x_SOC=y
> 
> I don't understand the question.
> 
> But to be clear. There are now 3 variants of Tegra supported. (Tegra20,
> Tegra30, Tegra114). We want to be able to build a minimal-size kernel
> (e.g. for embedded applications) that supports just one, any combination
> of two, or all three Tegra variants.

ah, ok - I just skipped the "also" in your sentence above. But still, the 
#ifdefs look strange to me and save only a few byte of code. Just me few 
cents.

Marc
