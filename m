From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: paz00: add support for the embedded controller
Date: Tue, 25 Oct 2011 09:16:54 +0200
Message-ID: <CAOesGMgs97awtrKXd=Ek9R62pWMVDtKcxXAx9Xb5_P6wa6wdpg@mail.gmail.com>
References: <cover.1319313019.git.marvin24@gmx.de>
	<b5f0dc6e7996a21d4493f8e7765e322fe6d8b7ef.1319313020.git.marvin24@gmx.de>
	<74CDBE0F657A3D45AFBB94109FB122FF173E1B4187@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173E1B4187-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 25, 2011 at 7:06 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Marc Dietrich wrote at Saturday, October 22, 2011 2:17 PM:
>> This adds support for the embedded controller known as NVEC. The driver
>> lives currently in the staging tree and we aim to promote it one level
>> higher in the near future.
>>
>> The NVEC driver uses the I2C resources of the master controller for now
>> until slave support is added to the i2c-tegra driver.
>
> I'm in two minds about this:
>
> The fact that the nvec driver accesses the I2C HW directly is a hack; that
> should all happen in the I2C driver, and the nvec code should /just/ handle
> the protocol to talk to the microcontroller.
>
> To that end, we're starting to bring on some more engineers internally who
> will aim to upstream more of our downstream kernel. Part of this includes
> upstreaming the I2C slave support in a more palatable fashion. I know those
> engineers are keen in general to get started, but I can't yet estimate a
> timescale for when this particular change will be ready.
>
> That said, I'm not sure that I want to block progress on getting nvec
> and the AC100 support going. Olof, do you have any input here? Thanks.

Yeah, let's not hold up ac100 based on not-yet-ready code, especially
since the driver is in staging. If the i2c slave driver could be done
in time to be there before nvec graduates from staging, that would
probably be ideal.

That being said, let's do it reasonably clean -- Marc, if you guys are
up for trying to define device-tree bindings for this that would be
awesome, and move to that for driver probing. That avoids adding an
include/linux/platform_data header file.


-Olof
