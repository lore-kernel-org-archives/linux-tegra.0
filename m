From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: multi_v7: copy most options from tegra_defconfig
Date: Sun, 22 Dec 2013 12:05:49 -0800
Message-ID: <20131222200549.GA11575@quad.lixom.net>
References: <1387569848-16563-1-git-send-email-swarren@wwwdotorg.org>
 <CAOesGMh4PkdTh8EP1WS9-_5cVe1NWuNQPbkskk7hJhtbBEPWBg@mail.gmail.com>
 <52B4A7E9.9090900@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52B4A7E9.9090900-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 20, 2013 at 01:26:17PM -0700, Stephen Warren wrote:
> On 12/20/2013 01:16 PM, Olof Johansson wrote:
> > On Fri, Dec 20, 2013 at 12:04 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> 
> >> +CONFIG_EXT2_FS=y
> >> +CONFIG_EXT2_FS_XATTR=y
> >> +CONFIG_EXT2_FS_POSIX_ACL=y
> >> +CONFIG_EXT2_FS_SECURITY=y
> >> +CONFIG_EXT3_FS=y
> >> +CONFIG_EXT3_FS_POSIX_ACL=y
> >> +CONFIG_EXT3_FS_SECURITY=y
> > 
> > I think it makes sense to just enable EXT4_USE_FOR_EXT23 instead.
> 
> It looks like that's the default if EXT2_FS/EXT3_FS aren't enabled. I'll
> go test that out.
> 
> >>  CONFIG_EXT4_FS=y
> >> +CONFIG_VFAT_FS=y
> >>  CONFIG_TMPFS=y
> >> +CONFIG_SQUASHFS=y
> >> +CONFIG_SQUASHFS_LZO=y
> >> +CONFIG_SQUASHFS_XZ=y
> >>  CONFIG_NFS_FS=y
> >>  CONFIG_NFS_V3_ACL=y
> >>  CONFIG_NFS_V4=y
> >>  CONFIG_ROOT_NFS=y
> >>  CONFIG_PRINTK_TIME=y
> >>  CONFIG_DEBUG_FS=y
> >> -CONFIG_DEBUG_KERNEL=y
> > 
> > Why are you disabling DEBUG_KERNEL?
> 
> It's not disabled, it ends up getting selected by something else, so
> doesn't appear in the defconfig.

Ok, fair enough. Applied.


-Olof
