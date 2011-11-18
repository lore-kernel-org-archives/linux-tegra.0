From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 03/10] arm/tegra: prepare clock code for multiple tegra
 variants
Date: Fri, 18 Nov 2011 13:38:27 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1740D74F95@HQMAIL01.nvidia.com>
References: <1321546766-26770-1-git-send-email-pdeschrijver@nvidia.com>
	<1321546766-26770-4-git-send-email-pdeschrijver@nvidia.com>
	<20111118190649.GB31678@quad.lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF1740D74F48@HQMAIL01.nvidia.com>
 <CAOesGMix=CG5s8Ux_fiLKmSqdoVJgm5skm2MBrHg3YrNCyHaUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMix=CG5s8Ux_fiLKmSqdoVJgm5skm2MBrHg3YrNCyHaUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Friday, November 18, 2011 2:25 PM:
> On Fri, Nov 18, 2011 at 12:18 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>=
 wrote:
> > Olof Johansson wrote at Friday, November 18, 2011 12:07 PM:
> >> On Thu, Nov 17, 2011 at 06:19:17PM +0200, Peter De Schrijver wrote=
:
=2E..
> >> > =A0void tegra_sdmmc_tap_delay(struct clk *c, int delay)
=2E..
> > I vote just rip this function out altogether.
> >
> > It isn't used in mainline, chromeos-2.6.38, chromeos-3.0, nor our i=
nternal
> > 2.6.36 or 2.6.39 kernels.
=2E..
>=20
> Actually, it used on some of the chromeos platforms, in particular fo=
r...

Oh yes, you're right. I'd grep'd for tegra2_sdmmc_tap_delay instead of
tegra_sdmmc_tap_delay, and saw hits in the clock code so didn't figure =
I'd
grep'd for the wrong thing.

--=20
nvpublic
