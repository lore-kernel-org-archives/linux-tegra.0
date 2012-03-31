From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 14/17] ASoC: tegra: add tegra30-ahub driver
Date: Sat, 31 Mar 2012 21:14:34 +0100
Message-ID: <20120331201433.GL5012@opensource.wolfsonmicro.com>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
 <1333148852-17806-15-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sCNd3Ivk/oijKKf1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1333148852-17806-15-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--sCNd3Ivk/oijKKf1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 30, 2012 at 05:07:29PM -0600, Stephen Warren wrote:

> +int tegra30_ahub_is_probed(void)
> +{
> +	return probed;
> +}
> +EXPORT_SYMBOL(tegra30_ahub_is_probed);

This looks like a fairly clear sign that this should be a CODEC driver,
or possibly the DMA driver - if nothing else even if you didn't change
anything else about the implementation it'd ensure that you didn't need
to open code this probe checking.

All your EXPORT_SYMBOLs should really be EXPORT_SYMBOL_GPL as you're
using the ASoC APIs.

> +/*
> + * clk_apbif isn't required for a theoretical I2S<->I2S configuration where
> + * no PCM data is read from or sent to memory. However, that's an unlikely
> + * use-case, and not something the rest of the driver supports right now, so
> + * we'll just treat the two clocks as one for now.

I rather suspect you'll find your system architects view that as a
resonable use case for things like voice calls where the audio for the
call would go from the baseband to the CODEC or bluetooth without going
into main memory.  Of course many CODECs can take this path directly
allowing the CPU to be powered off so...

--sCNd3Ivk/oijKKf1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPd2WjAAoJEBus8iNuMP3d3U8P/2ybI6OiI49wMM/K7TdPTi+y
ThDjf3yQmn7vuOu9lgHMdob465Gt769IBu4KammyEIf5H7h4FJjiA6KelILOB/zp
5KltMstkPimUe4YqaAVsV+myRGaNomRQllhytA2SluhSEuO9ZtJXgmSvPzV9R688
r7Rf+dHudRZaKLluttft1yZN2kBsArK6HCw7dWxl9zy8t+KpFNCAm3RkWpCOrr1Z
UYbda5Qor2etS/PHTCRSka7XrIVxCkQUox0XqbQZuEZc3HjJO8MfF2uzH2ySu3rU
Wb5TfbFYx6VrcK+8MtsWbS5Jj6O+CZ9QCi05h2X7K0XfuuPd9vWZI3RTalZU1uws
IriNh+dg9hlREo9QCpUQNtNadbvvidq87y8fqxMGgXNg5WWespHuoVEZKIWQDn2R
VRPsTyPQcDPl3Gzj9Ok45dKoms2g9zEyfYuqq5q+aOArkFs+CEd2QnEHqUdMCmXm
x/mDuQNY6YZqeMMu0WBGx4/ZtMHaGODO+6ZVTNbLeHMCrVuO2Mx5xibMfzXSYoiM
ADF3puMIgvKhhJUyr6b/AC/zZLbizpwgypfC7Mp1cDCrYs5+FVBRyi5lqxSV4xdr
CL6EptytLtCbiioG6+ohYzH75nvGmAB4VWwQt8POgYQpSVDu/zdgusw9GVsxaBfL
LAt1uWnm7gtB+3PQ7tq8
=7SHi
-----END PGP SIGNATURE-----

--sCNd3Ivk/oijKKf1--
