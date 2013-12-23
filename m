From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: multi_v7: copy most options from tegra_defconfig
Date: Mon, 23 Dec 2013 09:37:18 -0800
Message-ID: <CAOesGMj-nvMZhoX4fCe-mf0pBS27=EsS0o2bX7MgmZzjWhYVzQ@mail.gmail.com>
References: <1387569848-16563-1-git-send-email-swarren@wwwdotorg.org>
	<CAOesGMh4PkdTh8EP1WS9-_5cVe1NWuNQPbkskk7hJhtbBEPWBg@mail.gmail.com>
	<52B4A7E9.9090900@wwwdotorg.org>
	<20131222200549.GA11575@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131222200549.GA11575-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Dec 22, 2013 at 12:05 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Fri, Dec 20, 2013 at 01:26:17PM -0700, Stephen Warren wrote:
>> On 12/20/2013 01:16 PM, Olof Johansson wrote:
>> > On Fri, Dec 20, 2013 at 12:04 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>
>> >> +CONFIG_EXT2_FS=y
>> >> +CONFIG_EXT2_FS_XATTR=y
>> >> +CONFIG_EXT2_FS_POSIX_ACL=y
>> >> +CONFIG_EXT2_FS_SECURITY=y
>> >> +CONFIG_EXT3_FS=y
>> >> +CONFIG_EXT3_FS_POSIX_ACL=y
>> >> +CONFIG_EXT3_FS_SECURITY=y
>> >
>> > I think it makes sense to just enable EXT4_USE_FOR_EXT23 instead.
>>
>> It looks like that's the default if EXT2_FS/EXT3_FS aren't enabled. I'll
>> go test that out.
>>
>> >>  CONFIG_EXT4_FS=y
>> >> +CONFIG_VFAT_FS=y
>> >>  CONFIG_TMPFS=y
>> >> +CONFIG_SQUASHFS=y
>> >> +CONFIG_SQUASHFS_LZO=y
>> >> +CONFIG_SQUASHFS_XZ=y
>> >>  CONFIG_NFS_FS=y
>> >>  CONFIG_NFS_V3_ACL=y
>> >>  CONFIG_NFS_V4=y
>> >>  CONFIG_ROOT_NFS=y
>> >>  CONFIG_PRINTK_TIME=y
>> >>  CONFIG_DEBUG_FS=y
>> >> -CONFIG_DEBUG_KERNEL=y
>> >
>> > Why are you disabling DEBUG_KERNEL?
>>
>> It's not disabled, it ends up getting selected by something else, so
>> doesn't appear in the defconfig.
>
> Ok, fair enough. Applied.

Actually, this one ended up getting messy. We've had
multi_v7_defconfig updates in several branches so this doesn't apply
cleanly anywhere.

I'll apply it on top of for-next where the various branches are
merged. It means we'll have to merge it late. Not a big deal, but
please help me remember it in case it for some reason gets lost in the
shuffle.


-Olof
