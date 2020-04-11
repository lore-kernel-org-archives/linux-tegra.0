From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] phy: tegra: fix USB dependencies
Date: Sat, 11 Apr 2020 11:01:08 +0200
Message-ID: <CAK8P3a0Ktmt_9VLaQfm98ZzRnB9LnnjriHeJ+7O5aE=eMXk7oQ@mail.gmail.com>
References: <20200408200828.124139-1-arnd@arndb.de> <20200409132435.GA3263479@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200409132435.GA3263479@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Corentin Labbe <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Apr 9, 2020 at 3:24 PM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Wed, Apr 08, 2020 at 10:08:14PM +0200, Arnd Bergmann wrote:
> > Without CONFIG_USB_SUPPORT, we can get a couple of warnings for
> > missing dependencies:
> >
> > WARNING: unmet direct dependencies detected for USB_PHY
> >   Depends on [n]: USB_SUPPORT [=n]
> >   Selected by [m]:
> >   - PHY_TEGRA_XUSB [=m] && ARCH_TEGRA [=y]
> >
> > WARNING: unmet direct dependencies detected for USB_CONN_GPIO
> >   Depends on [n]: USB_SUPPORT [=n] && GPIOLIB [=y]
> >   Selected by [m]:
> >   - PHY_TEGRA_XUSB [=m] && ARCH_TEGRA [=y]
> >
> > Fixes: 6835bdc99580 ("phy: tegra: Select USB_PHY")
> > Fixes: f67213cee2b3 ("phy: tegra: xusb: Add usb-role-switch support")
> > Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > ---
> >  drivers/phy/tegra/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> I sent a similar patch a couple of days ago:
>
>         http://patchwork.ozlabs.org/patch/1263865/
>
> This should be applied by Greg on top of the PR that I sent for USB. I
> did get the semi-automated "we're in the merge window" reply from Greg,
> but I was under the impression that he still applied fixes during the
> merge window. It seems like he didn't pick this up yet, though.
>
> Greg, anything I should've done differently for you to notice this?

FWIW, your patch is correct, mine was wrong as I forgot the "select USB_COMMON".

       Arnd
