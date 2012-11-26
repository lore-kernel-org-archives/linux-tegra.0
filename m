From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: xf86-video-tegra or xf86-video-modesetting?
Date: Mon, 26 Nov 2012 17:45:38 +1000
Message-ID: <CAPM=9tzfjtUVC5PrRLA3Y659ausf1j=uXp-zfMZFUXz-ir67FA@mail.gmail.com>
References: <20121124210916.GB27042@avionic-0098.adnet.avionic-design.de>
	<CADnq5_P1D7mwL6iYYbJSEBt8Ub5ejQmsMbupMNUU74d5==+gTw@mail.gmail.com>
	<20121126073234.GA17600@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121126073234.GA17600-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 26, 2012 at 5:32 PM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> On Sun, Nov 25, 2012 at 09:51:46PM -0500, Alex Deucher wrote:
>> On Sat, Nov 24, 2012 at 4:09 PM, Thierry Reding
>> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
>> > going into Linux 3.8 and NVIDIA posting initial patches
>> > for 2D acceleration on top of it, I've been looking at the various ways
>> > how this can best be leveraged.
>> >
>> > The most obvious choice would be to start work on an xf86-video-tegra
>> > driver that uses the code currently in the works to implement the EXA
>> > callbacks that allow some of the rendering to be offloaded to the GPU.
>> > The way I would go about this is to fork xf86-video-modesetting, do some
>> > rebranding and add the various bits required to offload rendering.
>> >
>> > However, that has all the usual drawbacks of a fork so I thought maybe
>> > it would be better to write some code to xf86-video-modesetting to add
>> > GPU-specific acceleration on top. Such code could be leveraged by other
>> > drivers as well and all of them could share a common base for the
>> > functionality provided through the standard DRM IOCTLs.
>> >
>> > That approach has some disadvantages of its own, like the potential
>> > bloat if many GPUs do the same. It would also be a bit of a step back
>> > to the old monolithic days of X.
>>
>> Just fork and fill in your own GPU specific bits.  Most accel stuff
>> ends up being very GPU specific.
>
> That doesn't exclude the alternative that I described. Maybe I didn't
> express what I had in mind very clearly. What I propose is to add some
> code to the modesetting driver that would allow GPU-specific code to be
> called if matching hardware is detected (perhaps as stupidly as looking
> at the DRM driver name/version). Such code could perhaps be called from
> the DDX' .ScreenInit and call the GPU-specific function to register an
> EXA driver.
>
> That would allow a large body of code (modesetting, VT switching, ...)
> to be shared among a number of drivers instead of duplicating the code
> for each one and having to keep merging updates from the modesetting
> driver as it evolves. So the GPU-specific acceleration would just sit on
> top of the existing code and only be activated on specific hardware.
> What I'm *not* proposing is to create an abstraction layer for
> acceleration.
>

vmware kinda did something like that initially with modesetting, it
was a bit messier, it would be nice though to just plug in stuff like
glamor and things, but you still need to deal with pixmap allocation
on a per-gpu basis.

I'd rather make the modesetting code into a library, either separate
or in the X server, but i've also investigated that and found it was
too much effort for me at the time also.

Dave.
