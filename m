From: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: xf86-video-tegra or xf86-video-modesetting?
Date: Mon, 26 Nov 2012 09:01:26 -0500
Message-ID: <CADnq5_PwR1P6HDZSD-UeoaKUdQzFhK3cdQ4jhEWtR9Lgb-P2hQ@mail.gmail.com>
References: <20121124210916.GB27042@avionic-0098.adnet.avionic-design.de>
	<1353797672.1479.17.camel@tellur>
	<20121125133759.GA30264@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121125133759.GA30264-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Nov 25, 2012 at 8:37 AM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> On Sat, Nov 24, 2012 at 11:54:32PM +0100, Lucas Stach wrote:
>> Am Samstag, den 24.11.2012, 22:09 +0100 schrieb Thierry Reding:
>> > Hi,
>> >
>> > With tegra-drm going into Linux 3.8 and NVIDIA posting initial patches
>> > for 2D acceleration on top of it, I've been looking at the various ways
>> > how this can best be leveraged.
>> >
>> > The most obvious choice would be to start work on an xf86-video-tegra
>> > driver that uses the code currently in the works to implement the EXA
>> > callbacks that allow some of the rendering to be offloaded to the GPU.
>> > The way I would go about this is to fork xf86-video-modesetting, do some
>> > rebranding and add the various bits required to offload rendering.
>> >
>> As much as I dislike to say this, but forking the modesetting driver to
>> bring in the Tegra specific 2D accel might be the best way to go for
>> now. Especially looking at the very limited resources available to
>> tegradrm development and NVIDIAs expressed desire to do as few changes
>> as possible to their downstream work.
>
> So true. But I'm not sure if it's a good excuse to not do things the
> right way, even if it ends up being more work. If the general situation
> can be improved then I think it's worth the effort.
>
>> > However, that has all the usual drawbacks of a fork so I thought maybe
>> > it would be better to write some code to xf86-video-modesetting to add
>> > GPU-specific acceleration on top. Such code could be leveraged by other
>> > drivers as well and all of them could share a common base for the
>> > functionality provided through the standard DRM IOCTLs.
>> >
>> We don't have any standard DRM IOCTLs for doing acceleration today. The
>> single fact that we are stitching together command streams in userspace
>> for execution by the GPU renders a common interface unusable. We don't
>> even have a common interface to allocate GPU resources suitable for
>> acceleration: the dumb IOCTLs are only guaranteed to give you a buffer
>> the display engine can scan out from, nothing in there let's you set up
>> more fancy things like tiling etc, which might be needed to operate on
>> the buffer with other engines in some way.
>
> With the common base that could be shared I meant all the modesetting
> code and framebuffer setup that xf86-video-modesetting already does.
> I've been wanting to add support for planes as well, which comes with
> another set of standard IOCTLs in DRM.
>
> Rewriting all of that in different drivers doesn't seem very desirable
> to me and sounds like a lot of wasted effort. And that's not couting the
> maintenance burden to keep up with the latest changes in the generic
> modesetting driver.
>

You don't really end up rewriting it, most people just copy the
modesetting driver, change the name, and start adding acceleration; in
which case, the work is already done.  Also, the generic code doesn't
change much.  Based on other ddxes, you rarely have to change the
modesetting and framebuffer code.  Most of the work ends up being the
device specific acceleration and memory management code.
Also, depending on what hardware is available, I'm not sure
traditional 2D engines will gain much over shadowfb other than hw
accelerated buffer swaps for GL.  In my opinion something like glamor
is the best bet for mapping legacy X APIs on to modern GL hw.

Alex
