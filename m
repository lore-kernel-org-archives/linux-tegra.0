From: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
Date: Tue, 26 May 2020 13:34:45 -0700
Message-ID: <CALAqxLVmomdKJCwh=e-PX+8-seDX0RXA81FzmG4sEyJmbXBh9A@mail.gmail.com>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
 <20200228025700.GA856087@builder> <20200514193249.GE279327@builder.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200514193249.GE279327-Y7zrm0MriT3hXIiyNabO3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, May 14, 2020 at 12:34 PM <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> On Thu 27 Feb 18:57 PST 2020, Bjorn Andersson wrote:
>
> Rob, Will, we're reaching the point where upstream has enough
> functionality that this is becoming a critical issue for us.
>
> E.g. Lenovo Yoga C630 is lacking this and a single dts patch to boot
> mainline with display, GPU, WiFi and audio working and the story is
> similar on several devboards.
>
> As previously described, the only thing I want is the stream mapping
> related to the display controller in place, either with the CB with
> translation disabled or possibly with a way to specify the framebuffer
> region (although this turns out to mess things up in the display
> driver...)
>
> I did pick this up again recently and concluded that by omitting the
> streams for the USB controllers causes an instability issue seen on one
> of the controller to disappear. So I would prefer if we somehow could
> have a mechanism to only pick the display streams and the context
> allocation for this.
>
>
> Can you please share some pointers/insights/wishes for how we can
> conclude on this subject?

Ping? I just wanted to follow up on this discussion as this small
series is crucial for booting mainline on the Dragonboard 845c
devboard. It would be really valuable to be able to get some solution
upstream so we can test mainline w/o adding additional patches.

The rest of the db845c series has been moving forward smoothly, but
this set seems to be very stuck with no visible progress since Dec.

Are there any pointers for what folks would prefer to see?

thanks
-john
