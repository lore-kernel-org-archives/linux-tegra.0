From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [alsa-devel] Tegra ASoC, multiple boards, platform data, and
	conditionals in machine driver
Date: Mon, 11 Apr 2011 08:27:51 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0493EB3B8D@HQMAIL01.nvidia.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF0493EB3A50@HQMAIL01.nvidia.com>
 <20110409023057.GA3792@opensource.wolfsonmicro.com>
 <74CDBE0F657A3D45AFBB94109FB122FF0493EB3B5B@HQMAIL01.nvidia.com>
 <BANLkTikQhe1+ufvZWFKU1DT+XCS9=xE0Xw@mail.gmail.com>
 <20110411015809.GA23214@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110411015809.GA23214-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "Erik Gilling (konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org)" <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark Brown wrote at Sunday, April 10, 2011 7:58 PM:
> On Sun, Apr 10, 2011 at 11:18:17AM -0700, Olof Johansson wrote:
> 
> > built. It also makes it harder to maintain a multiplatform kernel if
> > configuration data is pulled in at build time instead of runtime (i.e.
> > headers vs platform_data or similar).
> 
> Note that whatever option is chosen the configuration should be pulled
> in at runtime, it's purely a question of where the data table goes - do
> you pass the full thing through platform datra or do you just pass the
> machine type.

Well, I was thinking of eliminating platform data completely; the
selection of the correct ASoC machine driver would be based on the
name of the platform device, and the machine driver would use
machine_is_*() to determine any machine-specific actions/data. So yes,
at run-time, but not using runtime-determined data *tables* at all.

Olof Johansson wrote at Sunday, April 10, 2011 12:18 PM:
> 
> On Sat, Apr 9, 2011 at 7:52 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > Colin, Erik, Olof,
> >
> > Do you have any objections to moving arch/arm/mach-tegra/board-*.h and
> > gpio-names.h into arch/arch/mach-tegra/include/mach so that the audio
> > driver source can include those headers simply?
> >
> > See the thread below for background.
> 
> I would prefer to use platform_data and export the information through
> there.
> 
> I know ASoC is in some sense an exception to the rule, but in general
> there should be no need for any code outside of arch/arm/mach-tegra to
> have to know anything about the board it is running on, drivers should
> be generic enough.

In the ASoC case, the whole point of the driver is to be for a
specific board, or perhaps set of related/similar boards. This includes
defining which CPU DMA engine and which audio codec to hook up. So there
isn't really a possibility of being more generic.

> Some other platforms use a lot of shared header
> files between platform code and drivers, and I have always found that
> to be very awkward to follow when reading code, especially if the same
> constants are defined in multiple places depending on what board is
> built.

The whole point of having the ASoC driver include the platform's
headers was to avoid defining the same GPIO constants in multiple places.

> It also makes it harder to maintain a multiplatform kernel if
> configuration data is pulled in at build time instead of runtime (i.e.
> headers vs platform_data or similar).

That's true. I was thinking this through in more detail last night, and
did realize that if the ASoC driver includes <mach/board-harmony.h>, then
defining what <mach/> means in a multi-SoC kernel is going to be
problematic.

Perhaps the best approach is to:

* Keep a single machine driver (at least for Tegra+WM8903; as Mark noted,
  attempting to share any wider doesn't make sense)

* Rename the driver e.g. tegra_wm8903.c rather than harmony.c since it'll
  be more generic. Rename the platform data structure and header likewise.

* Expand the platform data structure used by that driver to add anything
  necessary for Seaboard and derivatives.

* Expand the driver to handle optional/missing GPIO definitions in the
  platform data (i.e. Harmony/Ventana will fill in int/ext_mic_en, and
  other boards will set it to -1. Only Kaen will fill in hp_mute GPIO,
  etc.)

That way, we can still avoid a proliferation in the number of platform
headers, platform data types, and ASoC machine drivers.

Does that sound like a plan?

Thanks.

-- 
nvpublic
