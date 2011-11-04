From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 2/8] arm/tegra: prepare early init for multiple tegra variants
Date: Fri, 4 Nov 2011 08:09:42 -0700
Message-ID: <CAOesGMh7LqUtBkB5Dffr-bJSkC__V+55yLsp7KAYs-6oRAGMhA@mail.gmail.com>
References: <1320242948-21061-1-git-send-email-pdeschrijver@nvidia.com>
	<1320242948-21061-3-git-send-email-pdeschrijver@nvidia.com>
	<CAMbhsRSTcR8qgYESmM6OxkXeVeg6vS49woCe_OX6CY4pAj2g_A@mail.gmail.com>
	<20111103092116.GO13358@tbergstrom-lnx.Nvidia.com>
	<20111103100235.GK12913@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111103100235.GK12913-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 3, 2011 at 3:02 AM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Thu, Nov 03, 2011 at 11:21:16AM +0200, Peter De Schrijver wrote:
>> On Wed, Nov 02, 2011 at 07:30:43PM +0100, Colin Cross wrote:
>> > On Wed, Nov 2, 2011 at 7:09 AM, Peter De Schrijver
>> > <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> > > This patch splits the early init code in a common and a tegra20 =
specific part.
>> > > L2 cache initialization is generalized and discovers the cache a=
ssociativity
>> > > at runtime.
>> > >
>> > > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> > > ---
>> > <snip>
>> >
>> > > -static __initdata struct tegra_clk_init_table common_clk_init_t=
able[] =3D {
>> > > +void (*arch_reset)(char mode, const char *cmd) =3D tegra_assert=
_system_reset;
>> > > +
>> > This is unrelated to the patch description?
>> >
>>
>> This is a left over from the past. Will be removed from the next ver=
sion.
>
> Please can Tegra move over to hooking the restart via arm_pm_restart(=
)
> rather than via arch_reset()? =A0That would leave arch_reset() for
> software-based reboot methods - which I suspect Tegra doesn't use.
>
> That would allow Tegra to dovetail into the arch_reset cleanup work m=
uch
> better than it would otherwise do.

Sounds reasonable to me. Want a patch to put in your arch_reset
cleanup branch, I presume? I'll post something later today.


-Olof
