From: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Subject: Re: [PATCH] drm: do not use device name as a format string
Date: Sun, 6 Dec 2015 11:16:32 +0100
Message-ID: <56640B00.7040100@m4x.org>
References: <1447869498-13277-1-git-send-email-nicolas.iooss_linux@m4x.org>
 <5662B24E.4090202@m4x.org> <20151206093559.GT10243@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151206093559.GT10243-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Terje_Bergstr=c3=b6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/06/2015 10:35 AM, Daniel Vetter wrote:
>> On 11/18/2015 06:58 PM, Nicolas Iooss wrote:
>>> drm_dev_set_unique() formats its parameter using kvasprintf() but many
>>> of its callers directly pass dev_name(dev) as printf format string,
>>> without any format parameter.  This can cause some issues when the
>>> device name contains '%' characters.
>>>
>>> To avoid any potential issue, always use "%s" when using
>>> drm_dev_set_unique() with dev_name().
> 
> Not sure this is worth it really, normally people don't place % characters
> into their device names, ever. And if they do it'll blow up. There's also
> no security issue here since userspace can't set this name.
> 
> If the maintainers of the affected drivers don't want this I won't merge
> this patch.

Actually I had the same opinion before I began to add __printf
attributes and "%s" in several places in the kernel to make
-Wformat-security useful.  This led me to discover some funny issues
like the one fixed by commit 3958b79266b1 ("configfs: fix kernel
infoleak through user-controlled format string",
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=3958b79266b14729edd61daf9dfb84de45f4ec6d
).  The patch I sent is in fact a very small step towards making
-Wformat-security useful again to detect "real" issues.

Of course, if you do not feel it is worth it and believe that dev_name
is fully controlled by trusted sources which will never introduce any %
character, I understand your will of not merging my patch.

Regards,
Nicolas
