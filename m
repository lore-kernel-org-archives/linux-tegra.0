From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1 01/10] thermal: tegra: move tegra thermal files into
 tegra directory
Date: Thu, 14 Jan 2016 13:33:21 +0800
Message-ID: <56973321.9030209@nvidia.com>
References: <1452671929-32740-1-git-send-email-wni@nvidia.com> <1452671929-32740-2-git-send-email-wni@nvidia.com> <20160113142418.GA2588@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160113142418.GA2588@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Thierry, thanks for you comments, will fix them.

On 2016=E5=B9=B401=E6=9C=8813=E6=97=A5 22:24, Thierry Reding wrote:
> * PGP Signed by an unknown key
>=20
> On Wed, Jan 13, 2016 at 03:58:40PM +0800, Wei Ni wrote:
>> Move tegra soctherm driver to tegra directory, it's easy to maintain
>> and add more new function support for tegra platforms.
>=20
> Please use the proper spelling "Tegra", except where you refer to
> directory or file names.
>=20
>> This will also help to split soctherm driver into common parts and
>> chip specific data related parts.
>>
>> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/thermal/Kconfig                      | 15 +++++----------
>>  drivers/thermal/Makefile                     |  2 +-
>>  drivers/thermal/tegra/Kconfig                |  9 +++++++++
>>  drivers/thermal/tegra/Makefile               |  6 ++++++
>>  drivers/thermal/{ =3D> tegra}/tegra_soctherm.c |  0
>>  5 files changed, 21 insertions(+), 11 deletions(-)
>>  create mode 100644 drivers/thermal/tegra/Kconfig
>>  create mode 100644 drivers/thermal/tegra/Makefile
>>  rename drivers/thermal/{ =3D> tegra}/tegra_soctherm.c (100%)
>>
>> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
>> index c463c89b90ef..7984cba6b340 100644
>> --- a/drivers/thermal/Kconfig
>> +++ b/drivers/thermal/Kconfig
>> @@ -254,16 +254,6 @@ config ARMADA_THERMAL
>>  	  Enable this option if you want to have support for thermal manag=
ement
>>  	  controller present in Armada 370 and Armada XP SoC.
>> =20
>> -config TEGRA_SOCTHERM
>> -	tristate "Tegra SOCTHERM thermal management"
>> -	depends on ARCH_TEGRA
>> -	help
>> -	  Enable this option for integrated thermal management support on =
NVIDIA
>> -	  Tegra124 systems-on-chip. The driver supports four thermal zones
>> -	  (CPU, GPU, MEM, PLLX). Cooling devices can be bound to the therm=
al
>> -	  zones to manage temperatures. This option is also required for t=
he
>> -	  emergency thermal reset (thermtrip) feature to function.
>> -
>>  config DB8500_CPUFREQ_COOLING
>>  	tristate "DB8500 cpufreq cooling"
>>  	depends on ARCH_U8500
>> @@ -380,6 +370,11 @@ depends on ARCH_STI && OF
>>  source "drivers/thermal/st/Kconfig"
>>  endmenu
>> =20
>> +menu "Tegra thermal drivers"
>> +depends on ARCH_TEGRA
>> +source "drivers/thermal/tegra/Kconfig"
>> +endmenu
>> +
>=20
> I think it'd be more idiomatic to only source the file here and move =
the
> menu declaration and the dependencies into that file. Perhaps also ma=
ke
> the menu description "NVIDIA Tegra thermal drivers", I think we've be=
en
> using that consistently elsewhere.
>> diff --git a/drivers/thermal/tegra/Kconfig b/drivers/thermal/tegra/K=
config
>> new file mode 100644
>> index 000000000000..a6e6cd4528dc
>> --- /dev/null
>> +++ b/drivers/thermal/tegra/Kconfig
>> @@ -0,0 +1,9 @@
>> +config TEGRA_SOCTHERM
>> +	tristate "Tegra SOCTHERM thermal management"
>> +	depends on ARCH_TEGRA
>> +	help
>> +	  Enable this option for integrated thermal management support on =
NVIDIA
>> +	  Tegra124 systems-on-chip. The driver supports four thermal zones
>> +	  (CPU, GPU, MEM, PLLX). Cooling devices can be bound to the therm=
al
>> +	  zones to manage temperatures. This option is also required for t=
he
>> +	  emergency thermal reset (thermtrip) feature to function.
>> diff --git a/drivers/thermal/tegra/Makefile b/drivers/thermal/tegra/=
Makefile
>> new file mode 100644
>> index 000000000000..8c51076e4b1e
>> --- /dev/null
>> +++ b/drivers/thermal/tegra/Makefile
>> @@ -0,0 +1,6 @@
>> +#
>> +# Tegra thermal specific Makefile
>> +#
>> +
>> +# Tegra soc thermal drivers
>> +obj-$(CONFIG_TEGRA_SOCTHERM)	+=3D tegra_soctherm.o
>=20
> I personally don't think these comments are helpful. They're really
> redundant given that they're in a Makefile within a subdirectory of
> drivers/thermal.
>=20
> Thierry
>=20
> * Unknown Key
> * 0x7F3EB3A1
>=20
