From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 0/8] Add tegra30 support for secondary cores
Date: Wed, 1 Feb 2012 12:10:10 +0200
Message-ID: <20120201101010.GN24948@tbergstrom-lnx.Nvidia.com>
References: <1328028051-24271-1-git-send-email-pdeschrijver@nvidia.com>
 <20120201083334.GM7399@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120201083334.GM7399-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 01, 2012 at 09:33:34AM +0100, Olof Johansson wrote:
> Hi,
> 
> On Tue, Jan 31, 2012 at 06:40:38PM +0200, Peter De Schrijver wrote:
> > This patchset introduces support for secondary cores on tegra30. It also
> > introduces some functions for the flowcontroller and adds basic support for
> > tegra30 powerdomains.
> 
> It would be very useful to get a quick recap of what has changed since
> previous versions in the cover email, if not detailed in the individual
> patches (which it doesn't seem to be).
> 

Oops. I forgot about that. 

Here it is:

Changes in v2:

* moved chip id reading to fuse.c and cleanup code
* don't set bit 1 of SB_CTRL on Tegra20
* removed unused variables in tegra_cpu_reset_handler_init()

Cheers,

Peter.
