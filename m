From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] i2c/tegra: I2C driver uses the suspend_noirq/resume_noirq
Date: Thu, 11 Aug 2011 13:51:08 -0700
Message-ID: <CAMbhsRR2+bhpjhGfUSt9M5tDk1EW2d70yC-tZy27zEgVqtkfSg@mail.gmail.com>
References: <1312586102-27907-1-git-send-email-swarren@nvidia.com>
	<CAMbhsRScgMaTZ2e3a__OgOrrA6HN9_dkGuuNGaEfP+iqRdjyNQ@mail.gmail.com>
	<20110806084805.GA18098@sirena.org.uk>
	<74CDBE0F657A3D45AFBB94109FB122FF04AEA24CC8@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04AEA24CC8-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 11, 2011 at 12:35 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> Mark Brown wrote at Saturday, August 06, 2011 2:48 AM:
>> On Fri, Aug 05, 2011 at 09:33:31PM -0700, Colin Cross wrote:
> ...
>> > NAK - moving the suspend order around is not the correct way to so=
lve
>> > this. =A0If wm8903 needs to talk to the i2c bus in its suspend han=
dler,
>> > it needs to be child device on the i2c bus. =A0suspend_noirq is fo=
r
>>
>> WM8903 is an I2C device. =A0The problem is that it's suspended as pa=
rt of
>> the ASoC suspend since the audio subsystem is composed of multiple
>> devices that all need to work together coherently. =A0I did start do=
ing
>> some stuff to bodge around this like we do on probe but there are en=
ough
>> system wide problems with this that it didn't seem worth the complex=
ity
>> when the existing workarounds are so straightforward.
>
> Colin, given Mark's explanation, are you OK with the patch now?

It's still not the right way to handle this, are you going to mark
every I2C controller as suspend_noirq?  What happens when you find an
I2C controller that needs its irq on to suspend?  These are the kinds
of hacks we've been asked not to do in ARM, so I'd like to see a
response from the I2C maintainers.
