From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v6 04/10] arm/tegra: prepare early init for multiple tegra variants
Date: Thu, 8 Dec 2011 10:29:43 -0800
Message-ID: <CAMbhsRTD1rQBY7Sn2km=XsUYsHMdqQqZSKu4agc0GB6+QE79fA@mail.gmail.com>
References: <1323348254-29072-1-git-send-email-pdeschrijver@nvidia.com>
	<1323348254-29072-5-git-send-email-pdeschrijver@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF1750B77A7E@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF1750B77A7E-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 8, 2011 at 9:57 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> Peter De Schrijver wrote at Thursday, December 08, 2011 5:44 AM:
>> This patch splits the early init code in a common and a tegra20 spec=
ific part.
>> L2 cache initialization is generalized and discovers the cache assoc=
iativity
>> at runtime. Also use arm_pm_restart instead of arm_arch_reset and re=
set the
>> the system using the PMC reset feature rather then the CAR system re=
set.
>
> This one really should be at least 3 separate patches:
> * s/tegra_init_early/tegra20_init_early/ in machine descriptions
> * Switch reset mechanism from CAR to PMC
> * tegra_init_cache modifications
> * Not sure if all the ifdef additions go in the above, or if some sho=
uld be
> =A0separate?
>
> Still, I think it's probably OK to go in as it is even if it isn't op=
timal.

Please at least split out the reset change.  Does using the PMC reset
instead of the CAR reset still result in a warm reset, or does it
change to a cold reset?
