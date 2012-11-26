From: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: xf86-video-tegra or xf86-video-modesetting?
Date: Sun, 25 Nov 2012 21:51:46 -0500
Message-ID: <CADnq5_P1D7mwL6iYYbJSEBt8Ub5ejQmsMbupMNUU74d5==+gTw@mail.gmail.com>
References: <20121124210916.GB27042@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121124210916.GB27042-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Nov 24, 2012 at 4:09 PM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> going into Linux 3.8 and NVIDIA posting initial patches
> for 2D acceleration on top of it, I've been looking at the various ways
> how this can best be leveraged.
>
> The most obvious choice would be to start work on an xf86-video-tegra
> driver that uses the code currently in the works to implement the EXA
> callbacks that allow some of the rendering to be offloaded to the GPU.
> The way I would go about this is to fork xf86-video-modesetting, do some
> rebranding and add the various bits required to offload rendering.
>
> However, that has all the usual drawbacks of a fork so I thought maybe
> it would be better to write some code to xf86-video-modesetting to add
> GPU-specific acceleration on top. Such code could be leveraged by other
> drivers as well and all of them could share a common base for the
> functionality provided through the standard DRM IOCTLs.
>
> That approach has some disadvantages of its own, like the potential
> bloat if many GPUs do the same. It would also be a bit of a step back
> to the old monolithic days of X.

Just fork and fill in your own GPU specific bits.  Most accel stuff
ends up being very GPU specific.

Alex
