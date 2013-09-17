From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] iommu/tegra: Print phys_addr_t using %pa
Date: Tue, 17 Sep 2013 11:29:28 -0700
Message-ID: <CAOesGMiWzYEeNA-6yAxSjZ1X4amvz8=mm2UdeSLY6W+FDL7Rfg@mail.gmail.com>
References: <1379405971-2693-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379405971-2693-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, iommu-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 17, 2013 at 1:19 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> When enabling LPAE on ARM, phys_addr_t becomes 64 bits wide and printing
> a variable of that type using a simple %x format specifier causes the
> compiler to complain. Change the format specifier to %pa, which is used
> specifically for variables of type phys_addr_t.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

> Olof has been sending patches to fix up similar issues, but I couldn't
> find one that fixes these warnings. If Olof sent a patch for this and I
> missed it, please ignore.

Nope, I hadn't seen these ones since I was only looking at
multi_v7_defconfig at the time, and these are only enabled with
tegra_defconfig at the moment.


-Olof
