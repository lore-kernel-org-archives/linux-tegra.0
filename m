From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: Tegra ASoC, multiple boards, platform data, and conditionals in
 machine driver
Date: Sat, 9 Apr 2011 11:30:59 +0900
Message-ID: <20110409023057.GA3792@opensource.wolfsonmicro.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF0493EB3A50@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0493EB3A50-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 08, 2011 at 12:43:37PM -0700, Stephen Warren wrote:

> That said, I noticed that all(?) the other machine drivers simply use
> hard-coded GPIO numbers (sometimes defined locally, probably sometimes from
> machine header files), rather than having the values passed in through
> platform_data. This eliminates the need for platform_data structures etc.
> Is this simply a legacy because ASoC machine drivers weren't able to be
> first-class platform_devices, or is this still an acceptable style?

Partly due to the historical reasons, partly due to the fact that unless
you actually have multiple boards based off the same design with
different data there's no point in bouncing the data through platform
data as there's only one possible answer - the hard coding also includes
the connections between the devices, the clocking arrangements and so
on.

> Seaboard has a couple of derivatives which are very similar, but do have
> some differences in the audio path and elsewhere. In the ChromeOS kernel,
> we have a single ASoC machine driver covering Seaboard and two derivatives,
> with conditional code. I've placed an example at the end of this mail. Do
> you have a preference for having separate files for each machine without the
> conditional code v.s. a single machine driver with a lot of conditional code?
> If we go the conditional route, it might even be possible to merge the
> Harmony and Seaboard machine drivers into one.

If the machines are very similar merging the driver is good.  Your code
looked like a good example of where merging is helpful.
