From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: Fix build error with tegra_assert_system_reset
Date: Sun, 27 Nov 2011 22:35:50 -0800
Message-ID: <CAOesGMh4_YRpaXgapJ9DLPH_A8ft=W1tf10kFdQF90JN=R8ziw@mail.gmail.com>
References: <1322009631-711-1-git-send-email-swarren@nvidia.com>
	<20111123095009.GG9581@n2100.arm.linux.org.uk>
	<74CDBE0F657A3D45AFBB94109FB122FF174F08C6CC@HQMAIL01.nvidia.com>
	<20111124203443.GU9581@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111124203443.GU9581-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 24, 2011 at 12:34 PM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Wed, Nov 23, 2011 at 08:59:48AM -0800, Stephen Warren wrote:
>> OK, I tested that and it works too.
>
> Great. =A0Here's the final patch - could I have an ack for it please?
>
> Thanks.
>
> 8<=3D=3D=3D=3D=3D=3D
> ARM: restart: tegra: use new restart hook
>
> Hook these platforms restart code into the new restart hook rather
> than using arch_reset().
>
> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

(tested-by as well, but adding multiple entries seems silly)


-Olof
