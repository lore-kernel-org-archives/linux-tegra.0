From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: Re: [PATCH 0/9] Bringing Asus TF300T support to mainline
Date: Thu, 20 Jul 2017 17:07:30 +0200
Message-ID: <20170720150730.s26awulb345ecwgk@qmqm.qmqm.pl>
References: <cover.1500510157.git.mirq-linux@rere.qmqm.pl>
 <a4149270-561a-4190-4c4e-c164bd91446e@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a4149270-561a-4190-4c4e-c164bd91446e-/1wQRMveznE@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 20, 2017 at 10:48:31AM +0300, Mikko Perttunen wrote:
> On 20.07.2017 03:29, Micha³ Miros³aw wrote:
> > Here is a suprisingly small set of patches that enable Asus TF300T tablet
> > to boot and have all cores available. TF300T is one of a consumer devices
> > based on NVidia's Cardhu reference tablet.
> 
> This is very cool! How did you debug it, or did it work on the first try? :)
> I have a TF201 myself, probably quite similar to this, might be worth a try.

Unfortunatelly it worked only after about 300 compile-upload-boot cycles. ;-)
I hacked an early console using bootloader framebuffer. The code for it is
a spaghetti monster, but if you would like to try it, I can add a patch.

> > This series is an arch-dependent part. TF parts were extracted from ASUS's
> > GPL code dump.  The rest being driver code - a work in progress - is
> > available in branch tf300t at:
> > 
> >         https://rere.qmqm.pl/git/linux

> This URL doesn't work for me at least in the browser, but
> https://rere.qmqm.pl/git/?p=linux;a=summary works.
[...]

Ah, I should have been more precise: the url is for git clone (read-only).

Best Regards,
Micha³ Miros³aw
