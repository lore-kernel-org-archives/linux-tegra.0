From: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: xf86-video-tegra or xf86-video-modesetting?
Date: Mon, 26 Nov 2012 19:51:55 -0500
Message-ID: <CADnq5_PoVL2VE56qO7fJQjcS1SGYJAre6OLuG1BnxOi5PdAYCg@mail.gmail.com>
References: <20121124210916.GB27042@avionic-0098.adnet.avionic-design.de>
	<1353797672.1479.17.camel@tellur>
	<20121125133759.GA30264@avionic-0098.adnet.avionic-design.de>
	<CADnq5_PwR1P6HDZSD-UeoaKUdQzFhK3cdQ4jhEWtR9Lgb-P2hQ@mail.gmail.com>
	<50B3F7C7.6040602@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B3F7C7.6040602-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 26, 2012 at 6:14 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 11/26/2012 07:01 AM, Alex Deucher wrote:
>> On Sun, Nov 25, 2012 at 8:37 AM, Thierry Reding
>> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> ...
>>> With the common base that could be shared I meant all the modesetting
>>> code and framebuffer setup that xf86-video-modesetting already does.
>>> I've been wanting to add support for planes as well, which comes with
>>> another set of standard IOCTLs in DRM.
>>>
>>> Rewriting all of that in different drivers doesn't seem very desirable
>>> to me and sounds like a lot of wasted effort. And that's not couting the
>>> maintenance burden to keep up with the latest changes in the generic
>>> modesetting driver.
>>>
>>
>> You don't really end up rewriting it, most people just copy the
>> modesetting driver, change the name, and start adding acceleration; in
>> which case, the work is already done.  Also, the generic code doesn't
>> change much.  Based on other ddxes, you rarely have to change the
>> modesetting and framebuffer code.  Most of the work ends up being the
>> device specific acceleration and memory management code.
>> Also, depending on what hardware is available, I'm not sure
>> traditional 2D engines will gain much over shadowfb other than hw
>> accelerated buffer swaps for GL.  In my opinion something like glamor
>> is the best bet for mapping legacy X APIs on to modern GL hw.
>
> Rather than have every driver cut/paste the modesetting code, can't the
> modesetting core of the DDX be pulled out into a utility library or
> similar, so that it can just be compiled/linked into all the DDXs
> without actually duplicating the code? That way there's no code
> duplication, but each DDX can still be flexible about all the
> HW-specific code without making a monolithic DDX.
>

If someone has the time to look into it further, it could probably be
done.  I'm not sure there would be much to share at the end however.

Alex
