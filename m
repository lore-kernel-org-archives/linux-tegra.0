From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 0/4] ARM: tegra: Automatic UART selection for earlyprintk
Date: Thu, 5 Jan 2012 14:03:28 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17761F180C@HQMAIL01.nvidia.com>
References: <1325629520-23018-1-git-send-email-swarren@nvidia.com>
	<CAD=FV=X8p5RXKc0CW4KYzmoCw7tkOrahD2tnqKfXqqRR6MEAJQ@mail.gmail.com>
 <CAD=FV=WE51BbXdkQ9zjVCR_vjuHR5qn0YR+RteL-Q30bZ59BCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=WE51BbXdkQ9zjVCR_vjuHR5qn0YR+RteL-Q30bZ59BCA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Doug Anderson wrote at Wednesday, January 04, 2012 4:48 PM:
=2E..
> 2. I'm slightly concerned about cramming stuff into IRAM, since
> =A0 =A0I don't have a good concept of what IRAM adresses are used whe=
n.
> =A0 =A0When I grep for IRAM users in our kernel, I see
> =A0 =A0TEGRA_AVP_RESUME_ADDR is using the base of IRAM. =A0We're not =
going
> =A0 =A0to be hosing suspend/resume or anything else with this CL, are=
 we?
> =A0 =A0In the very least, I'd perfer to see a #define for the '0x100'=
 and
> =A0 =A0the '0x55415254' so that we can correlate the constants in
> =A0 =A0uncompress.h and debug-macro.S

I discussed this with a few people, and it sounds like it's safe to use
IRAM for this. However, I did discover a few other uses of IRAM too, in
our downstream kernels anyway, so I'll certainly create arch/arm/mach-
tegra/include/mach/irammap.h that provides defines for all the IRAM
offsets, what they're used for, and when.

--=20
nvpublic
