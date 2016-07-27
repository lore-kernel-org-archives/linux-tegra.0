From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: Re: Flicker with fb on Jetson TK1
Date: Tue, 26 Jul 2016 18:03:07 -0700
Message-ID: <20160727010307.GA20706@jirafa.cyrius.com>
References: <20160725020234.GA25839@jirafa.cyrius.com>
 <20160725142151.GP21170@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160725142151.GP21170-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

* Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [2016-07-25 16:21]:
> What version of X do you use? Recent versions, I think starting with
> 1.18, the modesetting driver is built-in and is what you should use with
> Tegra (and on top of an DRM/KMS driver, really).
> 
> The problem with fbdev is that it doesn't do double-buffering and hence
> you can often see the kind of tearing as in the video. The modesetting
> driver (which is also available as xf86-video-modesetting pre-1.18) can
> do double-buffering (and I think will do by default), hence removing
> the cause of such tearing.
> 
> Can you try running the test with the modesetting driver and report if
> you're still experiencing the issue?

This is with 1.18.4.  The Xorg.log suggests that glx, modesetting,
fbdev, fbdevhw and glamoregl were loaded (although glamor
initialization failed).  Modesetting is used according to the log.

I'm not very familiar with the graphics subsystem, so I'd appreciate
it if someone could take a look at the log:
http://www.cyrius.com/tmp/tk1/Xorg.0.log

-- 
Martin Michlmayr
http://www.cyrius.com/
