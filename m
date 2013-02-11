From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V2] MAINTAINERS: add keyword "tegra" to Tegra section
Date: Mon, 11 Feb 2013 10:04:33 -0800
Message-ID: <1360605873.2028.30.camel@joe-AO722>
References: <1360605099-7088-1-git-send-email-swarren@wwwdotorg.org>
	 <1360605395.2028.28.camel@joe-AO722> <511931E8.3080802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <511931E8.3080802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 2013-02-11 at 11:01 -0700, Stephen Warren wrote:
> On 02/11/2013 10:56 AM, Joe Perches wrote:
> > On Mon, 2013-02-11 at 10:51 -0700, Stephen Warren wrote:
> >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> The intent is to ensure that all Tegra-related patches are sent to the
> >> linux-tegra@ mailing list, so people can keep up-to-date on all misc
> >> driver changes.
> >>
> >> Doing this with a keyword is far simpler and more compact than listing
> >> all Tegra-related drivers, even if wildcards were used.
> >>
> >> Words such as integrate or integrator are common. Ensure the character
> >> right before "tegra" isn't a-z (case-insensitive), to make sure the
> >> keyword doesn't match those.
> >>
> >> Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
> >> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >>  MAINTAINERS |    4 +---
> >>  1 file changed, 1 insertion(+), 3 deletions(-)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index b98c89b..10e9b31 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -7829,9 +7829,7 @@ L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >>  Q:	http://patchwork.ozlabs.org/project/linux-tegra/list/
> >>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
> >>  S:	Supported
> >> -F:	arch/arm/mach-tegra
> >> -F:	arch/arm/boot/dts/tegra*
> >> -F:	arch/arm/configs/tegra_defconfig
> >> +K:	(?i)[^a-z]tegra
> >>  
> >>  TEHUTI ETHERNET DRIVER
> >>  M:	Andy Gospodarek <andy-QlMahl40kYEqcZcGjlUOXw@public.gmane.org>
> > 
> > It's probably not a good idea to remove
> > any of the F: lines as there are files
> > that could get modified in those paths
> > without any tegra word in the patch.
> 
> At least for those F: lines that exist already and are removed above,
> the keyword will match their filename, so there's no issue here.
> 

Not every use of get_maintainers is by patch.

./scripts/get_maintainer.pl -f arch/arm/mach-tegra

wouldn't match anything.
