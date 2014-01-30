From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 0/6] efuse driver for Tegra
Date: Thu, 30 Jan 2014 11:45:49 +0200
Message-ID: <20140130094549.GD26588@tbergstrom-lnx.Nvidia.com>
References: <1390952176-30402-1-git-send-email-pdeschrijver@nvidia.com>
 <CAP=VYLpJT1T2RGuK73TXhSYn-K+ZrLx9FuhQe+hVXYGnfoOBcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAP=VYLpJT1T2RGuK73TXhSYn-K+ZrLx9FuhQe+hVXYGnfoOBcQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 29, 2014 at 04:00:27PM +0100, Paul Gortmaker wrote:
> On Tue, Jan 28, 2014 at 6:36 PM, Peter De Schrijver
> <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > This driver allows userspace to read the raw efuse data. Its userspace
> > interface is modelled after the sunxi_sid driver which provides similar
> > functionality for some Allwinner SoCs. It has been tested on
> > Tegra20 (ventana), Tegra30 (beaverboard) and Tegra114 (dalmore).
> >
> > Changes since v1:
> >
> > * Add documentation for sysfs interface
> > * Cleanup messages
> >
> > Changes since v2:
> >
> > * Incorporate early fuse code
> > * Remove module support
> > * Make driver always build when Tegra platform is selected
> 
> Given the above, you should be able to remove #include <linux/module.h>
> and MODULE_DEVICE_TABLE, etc.

Indeed. Thanks for noticing!

Cheers,

Peter.
