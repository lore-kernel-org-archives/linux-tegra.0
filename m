From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v4 3/4] gpio/tegra: Convert to a platform device
Date: Thu, 13 Oct 2011 16:42:43 -0700
Message-ID: <CAOesGMhEL7qgUGP_t_rAueqUndhv=rBPG2eeQBffpfrri_nj4A@mail.gmail.com>
References: <1318371375-4083-1-git-send-email-swarren@nvidia.com>
	<1318371375-4083-3-git-send-email-swarren@nvidia.com>
	<20111012224131.GD25128@quad.lixom.net>
	<CACxGe6tf0Ly8AC-6xUeoMrVj3y0KHkrcgj87SerAaCAnNhfNqA@mail.gmail.com>
	<20111012231910.GA13960@quad.lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF173BE1A08D@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A08D-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 13, 2011 at 9:36 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Olof Johansson wrote at Wednesday, October 12, 2011 5:19 PM:
>> On Wed, Oct 12, 2011 at 05:03:24PM -0600, Grant Likely wrote:
>> > On Wed, Oct 12, 2011 at 4:41 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> w=
rote:
>> > > On Tue, Oct 11, 2011 at 04:16:14PM -0600, Stephen Warren wrote:
> ...
>> > > Otherwise, patch looks good. Due to dependencies between this, t=
he rest
>> > > of this patch series and the pinmux changes, I'll hold off on it=
 until
>> > > the dependencies land (i.e. target it for 3.3). We're cutting it=
 very close
>> > > to the merge window as it is, I'll start for-3.3 branches shortl=
y.
>> >
>> > Actually, see if you can get it in via the same tree as the pinmux
>> > changes. =A0Dependencies is not a reason to hold off from getting =
it
>> > into linux-next.
>>
>> Ok, the fixup is minimal, should be trivial to spot at git merge tim=
e.
>>
>> Stephen, do you want to respin yourself or should I do the __devinit
>> change when I apply?
>
> I'm happy for you to fix that up when you apply if you're happy doing=
 that.
>
> The same fixup applies to the pinmux patches too.

Thanks, applied (and pinmux patch fixed up). for-3.2/features was
rebased to roll in the pinmux change.


-Olof
