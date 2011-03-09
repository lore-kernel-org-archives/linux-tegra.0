From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: harmony: initialize the TPS65862 PMIC
Date: Wed, 09 Mar 2011 08:23:31 +0200
Message-ID: <4D771CE3.6020606@compulab.co.il>
References: <cover.1299588456.git.mike@compulab.co.il> <4ade6d195fff78271085eafb0a99de3be8beb426.1299588456.git.mike@compulab.co.il> <201103082312.06911.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201103082312.06911.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/09/11 00:12, Marc Dietrich wrote:
> Hi Mike,
>=20
> Am Dienstag 08 M=C3=A4rz 2011, um 13:58:58 schrieb Mike Rapoport:
>> Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
>> ---
>>  arch/arm/mach-tegra/Makefile              |    1 +
>>  arch/arm/mach-tegra/board-harmony-power.c |  161 ++++++++++++++++++=
+++++++++++
>>  arch/arm/mach-tegra/board-harmony.c       |    1 +
>>  arch/arm/mach-tegra/board-harmony.h       |    1 +
>>  4 files changed, 164 insertions(+), 0 deletions(-)
>>  create mode 100644 arch/arm/mach-tegra/board-harmony-power.c
>=20
> ...
>>
>> diff --git a/arch/arm/mach-tegra/board-harmony-power.c b/arch/arm/ma=
ch-tegra/board-harmony-power.c
>> new file mode 100644
>> index 0000000..ca43d7a
>> --- /dev/null
>> +++ b/arch/arm/mach-tegra/board-harmony-power.c
> ...
>> +static struct i2c_board_info __initdata harmony_regulators[] =3D {
>> +	{
>> +		I2C_BOARD_INFO("tps6586x", 0x34),
>> +		.irq		=3D INT_EXTERNAL_PMU,
>> +		.platform_data	=3D &tps_platform,
>> +	},
>> +};
>> +
>> +int __init harmony_regulator_init(void)
>> +{
>> +	i2c_register_board_info(3, harmony_regulators, 1);
>=20
> I don't know harmony well, but are you sure this is 3, not 4, as on a=
ll other boards?

In the mainline version of i2c-tegra the adapter (and therefore bus) nu=
mber
equals the platform device id, and in case of DVC adapter it's 3.

>=20
> Marc


--=20
Sincerely yours,
Mike.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
