From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: select AUTO_ZRELADDR by default
Date: Thu, 22 Sep 2011 20:58:00 +0300
Message-ID: <20110922175800.GC21166@tbergstrom-lnx.Nvidia.com>
References: <1316698045-23190-1-git-send-email-pdeschrijver@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1739554CB9@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF1739554CB9-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 22, 2011 at 06:26:36PM +0200, Stephen Warren wrote:
> Peter De Schrijver wrote at Thursday, September 22, 2011 7:27 AM:
> > This patch causes the kernel uncompressor to determine the physical address
> > of the SDRAM at runtime. This allows the kernel to boot on both tegra2 and
> > tegra3 even though SDRAM is at different physical addresses on both SoCs.
> 
> Since this deals with Tegra, it should be mailed to/cc the Tegra
> Maintainers and mailing list too (I've done that here). get_maintainer.pl
> will no doubt list the main linux-kernel mailing list too.
> 
> > Change-Id: I91857a590946bbc54168c04bea3a5bd576d87824
> 
> And the internal Change-Id lines should be stripped for upstream
> submissions.
> 

Auw indeed. I did it for the previous round, but I really need to write a
script to do this :)

Cheers,

Peter.
