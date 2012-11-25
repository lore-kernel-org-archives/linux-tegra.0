From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: xf86-video-tegra or xf86-video-modesetting?
Date: Sun, 25 Nov 2012 12:45:07 +0100
Message-ID: <CAOMqctTQGzhu3gU5hdJWKOCU0Dyk1vxCjE918PMa7aR+o1pTiQ@mail.gmail.com>
References: <20121124210916.GB27042@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121124210916.GB27042-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello,

On 24 November 2012 22:09, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:

> However, that has all the usual drawbacks of a fork so I thought maybe
> it would be better to write some code to xf86-video-modesetting to add
> GPU-specific acceleration on top. Such code could be leveraged by other
> drivers as well and all of them could share a common base for the
> functionality provided through the standard DRM IOCTLs.
>
> That approach has some disadvantages of its own, like the potential
> bloat if many GPUs do the same. It would also be a bit of a step back
> to the old monolithic days of X.
>

You can always make the tegra part a submodule if you think putting it
into the driver directly is too monolithic.

Thanks

Michal
