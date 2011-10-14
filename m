From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: select AUTO_ZRELADDR by default
Date: Fri, 14 Oct 2011 10:58:35 -0700
Message-ID: <CAOesGMhm_dD=9dyMWQRfH5AXH4AE42+4ckNwhnMUGaBJEHsumg@mail.gmail.com>
References: <1317172068-14872-1-git-send-email-pdeschrijver@nvidia.com>
	<20111014071500.GP21648@n2100.arm.linux.org.uk>
	<74CDBE0F657A3D45AFBB94109FB122FF173BE1A260@HQMAIL01.nvidia.com>
	<201110141729.41515.arnd@arndb.de>
	<74CDBE0F657A3D45AFBB94109FB122FF173BE1A283@HQMAIL01.nvidia.com>
	<alpine.LFD.2.02.1110141348270.17040@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.02.1110141348270.17040-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Fri, Oct 14, 2011 at 10:53 AM, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org> wrot=
e:

> As I explained yesterday, I'm working on more cleanups that involve
> reworking the dependencies around ZBOOTROM, AUTO_ZRELADDR and friends=
,
> and removing zreladdr for all platforms. =A0So please do not come up =
with
> Tegra specific hacks to fix this up. =A0So for the time being I'd sim=
ply
> suggest using the minimal fix i.e.:
>
> =A0 =A0 =A0 =A0select AUTO_ZRELADDR if !ZBOOT_ROM
>
> And eventually this will disappear entirely in favor of a single glob=
al
> config option which is not platform dependent.

Odd, I'm not seeing any mention of the above on the list (especially
not posted yesterday), but that sounds good to me.

We've dropped the patch for now, if t30 needs it we can update the
defconfig when the time comes, and wait for your cleanup for the rest.


-Olof
