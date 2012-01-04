From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 8/9] arm/tegra: seaboard: add EMC table to device tree
Date: Wed, 4 Jan 2012 15:55:15 -0800
Message-ID: <CAOesGMhROzwyqMS89Nq0m6KRLNTbrkFrH9pUe6tfPR8gKTU+QA@mail.gmail.com>
References: <1324599468-12845-1-git-send-email-olof@lixom.net>
	<1324599468-12845-9-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF17761F1590@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17761F1590-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 4, 2012 at 3:51 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> Olof Johansson wrote at Thursday, December 22, 2011 5:18 PM:
>> Timings for the T25 version of seaboard, only one memory manufacture=
r
>> and timing table (two speeds).
>
> There exist Seaboards with Tegra20 rather than Tegra25. Should we:
> * Rename tegra-seaboard.dts to tegra-seaboard.dtsi
> * Create tegra-seaboard-t20.dts and tegra-seaboard-t25.dts which incl=
ude
> =A0tegra-seaboard.dtsi, and add the EMC tables to the Tegra25 version=
 only?

Honestly, T20 seaboards are deprecated around here, we've been
replacing all we have with T25 models and keeping T20 support around
is a pain. I'd rather just ignore them if we can.

> Are the timings for true Seaboard and the Springbank variant identica=
l?

I don't know, Springbank is a mostly nvidia-internal spin that I
haven't used much. I was of that impression though, since we have
never picked up any new specific support for it, it just runs with
seaboard code.


-Olof
