From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: select AUTO_ZRELADDR by default
Date: Fri, 14 Oct 2011 18:27:53 +0200
Message-ID: <201110141827.53906.arnd@arndb.de>
References: <1317172068-14872-1-git-send-email-pdeschrijver@nvidia.com> <201110141729.41515.arnd@arndb.de> <74CDBE0F657A3D45AFBB94109FB122FF173BE1A283@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A283-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 14 October 2011, Stephen Warren wrote:
> Arnd Bergmann wrote at Friday, October 14, 2011 9:30 AM:
> ...
> > You mention that tegra30 will require AUTO_ZRELADDR.
> 
> Well, just to be clear, here's the situation I think:
> 
> Tegra20's SDRAM starts at physical address 0.
> 
> Tegra30's SDRAM starts at physical address 2G.
> 
> To support that, we could either:
> 
> a) Introduce a new Kconfig variable for Tegra30, make T20/T30 mutually
> exclusive, and update arch/arm/mach-tegra/Makefile.boot to set zreladdr
> etc. based on the new Tegra30 config variable too. Then, there's no need
> for AUTO_ZRELADDR anywhere.
> 
> b) Have no new config variable, build a unified T20/T30 kernel, leave
> Makefile.boot untouched, and rely on using AUTO_ZRELADDR for Tegra30 to
> account for the different SDRAM physical addresses.

Ok, thanks for the explanation, that makes it much clearer. For
completeness, you could also do both of the above and make T20/T30 mutually
exclusive unless AUTO_ZRELADDR is set. That might be more complex than
necessary, I don't know.

	Arnd
