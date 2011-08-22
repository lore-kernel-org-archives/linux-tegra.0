From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [RFC PATCH v2 00/13] arm/tegra: Initialize GPIO & pinmux from DT
Date: Mon, 22 Aug 2011 15:56:55 -0700
Message-ID: <CAOesGMhGb1-sOaBU4oaa_8-1triS01tOmseJqYyCm849feLhXg@mail.gmail.com>
References: <1313440100-17131-1-git-send-email-swarren@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04B24A3687@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04B24A3687-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 22, 2011 at 12:56 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> Stephen Warren wrote at Monday, August 15, 2011 2:28 PM:
>> ...
>> This patch modifies Tegra's device tree support to remove the depend=
ency
>> on harmony_pinmux_init(), thus making it completely board-independen=
t.
>
> I had the good fortune of meeting Grant at LinuxCon last week and tal=
ked
> through this patchset a little (thanks!)
>
> The message I got from Grant was that the patches are basically OK. H=
e
> did have a couple of concerns:
>
> * Does this cause the compiled DTB to blow up in size.
>
> The DTB goes from ~3-4K to ~8-9K with these patches added. While that
> is a large % increase, Grant said that as an absolute value, that siz=
e
> shouldn't be an issue.

Agreed, especially if compared with the size of the current in-kernel t=
able.

> * There's lots of repetition in the .dts representation; can this be =
improved?
>
[...]
> meaningless-name { // typically would just use the pin name
> =A0 =A0pins =3D "ld0", "ld1", "ld2", ...;
> =A0 =A0nvidia,function =3D "displaya";
> =A0 =A0nvidia,pull-down;
> };

That sounds quite close to what I was thinking about earlier (with
s/meaningless-name/displaya/ in the above example).

> * We also briefly discussed that dtc could be modified to support sym=
bolic
> constants, so we could use named integers for the function names (per=
haps
> pin names too). I'll look into how easy it is to modify dtc for this.

That'd be useful, I think -- there's still the whole issue of the same
pin function being at different mux locations on different pin groups,
so an integer representation might not work.

> I'll look into implementing these enhancements, and others discussed =
in
> this email thread, and repost.

Cool.


-Olof
