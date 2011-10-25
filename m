From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: Add device-tree support for TrimSlice board
Date: Tue, 25 Oct 2011 09:55:10 +0200
Message-ID: <CAOesGMjGGQEgWTwGAEM=TxB0f6HQYMhJbcPxcqU-TzXW+9wPDQ@mail.gmail.com>
References: <1319450467-11819-1-git-send-email-swarren@nvidia.com>
	<5320972.AGvAdFqRz5@ax5200p>
	<74CDBE0F657A3D45AFBB94109FB122FF173E1B4171@HQMAIL01.nvidia.com>
	<20111025055238.GA30358@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111025055238.GA30358-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 25, 2011 at 7:52 AM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> * Stephen Warren wrote:
>> Marc Dietrich wrote at Monday, October 24, 2011 3:28 PM:
>> > On Monday 24 October 2011 12:01:07 Stephen Warren wrote:
>> > > * Add device-tree file for TrimSlice
>> > > * Add that to the list of .dts files to build
>> > > * Update board-dt.c to recognize TrimSlice board name
>> > >
>> > > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> > > ---
>> > > =A0arch/arm/boot/dts/tegra-trimslice.dts | =A0 38
>> > > +++++++++++++++++++++++++++++++++ arch/arm/mach-tegra/Makefile.b=
oot =A0 =A0 |
>> > > =A01 +
>> > > =A0arch/arm/mach-tegra/board-dt.c =A0 =A0 =A0 =A0| =A0 =A03 ++
>> > > =A03 files changed, 42 insertions(+), 0 deletions(-)
>> > > =A0create mode 100644 arch/arm/boot/dts/tegra-trimslice.dts
>> >
>> > doesn't this also require to add something like
>> >
>> > obj-${CONFIG_MACH_TEGRA_DT} +=3D board-trimslice-pinmux.o
>> >
>> > to the Makefile?
>>
>> Yes, definitely. I've fixed this up locally; I hope to repost soon.
>
> Can it please be obj-$(CONFIG_MACH_TEGRA_DT) instead? I think both Ru=
ssell
> and Olof agreed[0] to use parens instead of braces, even though the c=
urrent
> practice is to copy what previous boards did.

Ah yeah, I forgot to clean that up for 3.2, I'll post a patch shortly.
Braces are nonstandard, and will continue to proliferate if left in
there.


-Olof
