From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: NVIDIA Tegra DDX
Date: Mon, 10 Dec 2012 12:40:21 +0100
Message-ID: <2016185.oZ1QsIlQyO@fb07-iapwap2>
References: <20121210105627.GA7503@avionic-0098.adnet.avionic-design.de> <CAOMqctRAgO-ApTHiPVpcq69e3uE5Ec6N_jxz+wotgvjbhA1tmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMqctRAgO-ApTHiPVpcq69e3uE5Ec6N_jxz+wotgvjbhA1tmw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Montag, 10. Dezember 2012, 12:01:26 schrieb Michal Suchanek:
> On 10 December 2012 11:56, Thierry Reding
> 
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > Hi,
> > 
> > I've upload a rebranded and cleaned up version of xf86-video-tegra to a
> > repository on gitorious[0]. Don't get too excited, since this is really
> > just a fork of the modesetting driver with some unnecessary pieces such
> > as PCI support removed.
> > 
> > Aaron had some reservations about calling this xf86-video-tegra because
> > it will clash with the binary tegra_drv.so provided by NVIDIA. However I
> > couldn't come up with anything more creative. Distributions will have to
> > deal with this in some way or another anyway and there really isn't a
> > way of running both drivers on top of the same kernel currently, so I
> > decided not to care.
> 
> You cannot run both drivers on top of the same kernel but the X server
> could possibly load and probe both drivers in turn and keep the one
> that can work with the current kernel.

exactly, don't shift the burden to maintain two name identical drivers for the 
same hw to the distributions.

> Perhaps it could be named xf86-video-tegra-kms or something.

or opentegra (to make clear that this driver is not the closed source one). I 
know this is a bit fanciless but it fits better IMHO.

Marc
