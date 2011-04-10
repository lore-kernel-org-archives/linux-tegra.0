From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: Tegra ASoC, multiple boards, platform data, and conditionals in
 machine driver
Date: Sun, 10 Apr 2011 11:18:17 -0700
Message-ID: <BANLkTikQhe1+ufvZWFKU1DT+XCS9=xE0Xw@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF0493EB3A50@HQMAIL01.nvidia.com>
	<20110409023057.GA3792@opensource.wolfsonmicro.com>
	<74CDBE0F657A3D45AFBB94109FB122FF0493EB3B5B@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0493EB3B5B-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "Erik Gilling (konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org)" <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Sat, Apr 9, 2011 at 7:52 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Colin, Erik, Olof,
>
> Do you have any objections to moving arch/arm/mach-tegra/board-*.h and
> gpio-names.h into arch/arch/mach-tegra/include/mach so that the audio
> driver source can include those headers simply?
>
> See the thread below for background.

I would prefer to use platform_data and export the information through there.

I know ASoC is in some sense an exception to the rule, but in general
there should be no need for any code outside of arch/arm/mach-tegra to
have to know anything about the board it is running on, drivers should
be generic enough. Some other platforms use a lot of shared header
files between platform code and drivers, and I have always found that
to be very awkward to follow when reading code, especially if the same
constants are defined in multiple places depending on what board is
built. It also makes it harder to maintain a multiplatform kernel if
configuration data is pulled in at build time instead of runtime (i.e.
headers vs platform_data or similar).

 In other words, I would prefer option (b) above.


-Olof
