From: Colin Cross <ccross@android.com>
Subject: Re: [PATCH v2] ARM: tegra: only select MACH_HAS_SND_SOC_TEGRA_WM8903
	if SND_SOC
Date: Tue, 26 Jul 2011 16:00:20 -0700
Message-ID: <CAMbhsRRnNcokjeyy8HKf0MNvXVvFSQ0dpjGYApvUXtZsrrh66Q@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF049EBDF52B@HQMAIL01.nvidia.com>
	<1311668159-11337-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<74CDBE0F657A3D45AFBB94109FB122FF049EBDF7DE@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049EBDF7DE@HQMAIL01.nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@nvidia.com>
Cc: "Arnd Bergmann (arnd@arndb.de)" <arnd@arndb.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, =?ISO-8859-1?Q?Uwe_Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>, "Olof Johansson (olof@lixom.net)" <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 26, 2011 at 8:48 AM, Stephen Warren <swarren@nvidia.com> wrote:
> Uwe Kleine-K=F6nig wrote at Tuesday, July 26, 2011 2:16 AM:
>> This fixes:
>> =A0 =A0 =A0 warning: (MACH_HARMONY && MACH_KAEN && MACH_SEABOARD) select=
s MACH_HAS_SND_SOC_TEGRA_WM8903
>> which has unmet direct dependencies (SOUND && !M68K && SND && SND_SOC)
>>
>> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>
> Acked-by: Stephen Warren <swarren@nvidia.com>
>
> (I'm also CC'ing the various maintainers explicitly, so they see the patc=
h,
> and can decide which git tree to take this through)

Acked-By: Colin Cross <ccross@android.com>

Arnd, can you take this?

>> ---
>> Changes since (implicit) v1:
>> =A0- correctly depend on SND_SOC instead of the non-existent SOUND_SOC
>> =A0- fix commit log accordingly
>>
>> Thanks to Stephen Warren for noticing.
>>
>> Best regards
>> Uwe
>>
>> =A0arch/arm/mach-tegra/Kconfig | =A0 =A06 +++---
>> =A01 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
>> index 5ec1846..fec64f3 100644
>> --- a/arch/arm/mach-tegra/Kconfig
>> +++ b/arch/arm/mach-tegra/Kconfig
>> @@ -27,14 +27,14 @@ comment "Tegra board type"
>>
>> =A0config MACH_HARMONY
>> =A0 =A0 =A0 =A0 bool "Harmony board"
>> - =A0 =A0 =A0 select MACH_HAS_SND_SOC_TEGRA_WM8903
>> + =A0 =A0 =A0 select MACH_HAS_SND_SOC_TEGRA_WM8903 if SND_SOC
>> =A0 =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 =A0 Support for nVidia Harmony development platform
>>
>> =A0config MACH_KAEN
>> =A0 =A0 =A0 =A0 bool "Kaen board"
>> =A0 =A0 =A0 =A0 select MACH_SEABOARD
>> - =A0 =A0 =A0 select MACH_HAS_SND_SOC_TEGRA_WM8903
>> + =A0 =A0 =A0 select MACH_HAS_SND_SOC_TEGRA_WM8903 if SND_SOC
>> =A0 =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 =A0 Support for the Kaen version of Seaboard
>>
>> @@ -45,7 +45,7 @@ config MACH_PAZ00
>>
>> =A0config MACH_SEABOARD
>> =A0 =A0 =A0 =A0 bool "Seaboard board"
>> - =A0 =A0 =A0 select MACH_HAS_SND_SOC_TEGRA_WM8903
>> + =A0 =A0 =A0 select MACH_HAS_SND_SOC_TEGRA_WM8903 if SND_SOC
>> =A0 =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 =A0 Support for nVidia Seaboard development platform. It=
 will
>> =A0 =A0 =A0 =A0also be included for some of the derivative boards that
>> --
>> 1.7.5.4
>
> --
> nvpublic
>
>
