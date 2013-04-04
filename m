From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 00/12] Tegra114 clockframework
Date: Thu, 4 Apr 2013 20:52:06 +0300
Message-ID: <20130404175206.GD18519@tbergstrom-lnx.Nvidia.com>
References: <1360931849-7090-1-git-send-email-pdeschrijver@nvidia.com>
 <5123C6E7.9070407@wwwdotorg.org>
 <20130219185034.27993.86892@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130219185034.27993.86892@quantum>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Mike,

> Quoting Stephen Warren (2013-02-19 10:39:35)
> > On 02/15/2013 05:36 AM, Peter De Schrijver wrote:
> > > This is the seventh version of the Tegra114 clockframework. It is based on the
> > > for-next branch of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git and
> > > http://www.spinics.net/lists/arm-kernel/msg220452.html.
> > 
> > Mike,
> > 
> > I think it'd be prudent to take this series through the Tegra tree again
> > for 3.10; patch 11 needs to go in as part of the series due to internal
> > dependencies, and I'm slightly worried that other Tegra DT changes might
> > conflict with that patch (if only for context). Taking this series (and
> > any other Tegra clk driver changes for 3.10) through the Tegra tree
> > could resolve that easily. Do you have a problem with that?
> > 
> 
> I was thinking the same thing.  I'll make time to review these now that
> 3.8 is out.
> 

I posted v9 of this yesterday (http://www.spinics.net/lists/linux-tegra/msg10891.html)
and posted a small binding doc update today 
'[PATCH v9b 10/14] ARM: tegra: Define Tegra114 CAR binding'. Can you ack these so
Stephen can take them in the Tegra tree?

Thanks!

Peter.
