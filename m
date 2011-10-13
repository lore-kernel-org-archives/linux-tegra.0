From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v9 0/3] Add support for tegra2 based ventana board
Date: Thu, 13 Oct 2011 16:07:07 +0300
Message-ID: <20111013130707.GM1001@tbergstrom-lnx.Nvidia.com>
References: <1318420387-6802-1-git-send-email-pdeschrijver@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE19D81@HQMAIL01.nvidia.com>
 <20111012223643.GA5368@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111012223643.GA5368-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 13, 2011 at 12:36:43AM +0200, Olof Johansson wrote:
> On Wed, Oct 12, 2011 at 08:56:47AM -0700, Stephen Warren wrote:
> > pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org wrote at Wednesday, October 12, 2011 5:53 AM:
> > > This patch set adds support for the tegra2 based ventana development board.
> > > 
> > > Boot tested on ventana.
> > > 
> > > Uses a table based approach to select the correct init function.
> > > 
> > > Provoke kernel warning when no suitable pinmux table can be found.
> > 
> > Whole series:
> > 
> > Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > Thanks for following up on my picky comments:-)
> 
> Yes, thanks Peter.
> 
> Applied to for-3.2/features. I had to do some fixups since I applied it
> on top of some of Stephen's changes for gpio/pinmux, so please verify
> that I did the fixups correctly.

I just booted your tree on ventana. Works fine! Thanks!

Peter.
