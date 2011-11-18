From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 08/10] arm/tegra: pinmux tables and definitions for tegra30
Date: Fri, 18 Nov 2011 13:56:07 -0800
Message-ID: <CAOesGMh-n9cp1f_tCB7qaFMZ86mXM7WDVkA_hOxf9bb0Z4_XjA@mail.gmail.com>
References: <1321546766-26770-1-git-send-email-pdeschrijver@nvidia.com>
	<1321546766-26770-9-git-send-email-pdeschrijver@nvidia.com>
	<20111118214324.GD31678@quad.lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF1740D74FA4@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF1740D74FA4@HQMAIL01.nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Randy Dunlap <rdunlap@xenotime.net>, Russell King <linux@arm.linux.org.uk>, Colin Cross <ccross@android.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 18, 2011 at 1:51 PM, Stephen Warren <swarren@nvidia.com> wr=
ote:
> Olof Johansson wrote at Friday, November 18, 2011 2:43 PM:
>> > @@ -667,7 +710,12 @@ void tegra_pinmux_config_pullupdown_table(con=
st struct tegra_pingroup_config *co
>> > =A0}
>> >
>> > =A0static struct of_device_id tegra_pinmux_of_match[] __devinitdat=
a =3D {
>> > +#ifdef CONFIG_ARCH_TEGRA_2x_SOC
>> > =A0 =A0 { .compatible =3D "nvidia,tegra20-pinmux", tegra20_pinmux_=
init },
>> > +#endif
>> > +#ifdef CONFIG_ARCH_TEGRA_3x_SOC
>> > + =A0 { .compatible =3D "nvidia,tegra30-pinmux", tegra30_pinmux_in=
it },
>> > +#endif
>>
>> Again, provide empty stubs instead of ifdeffing the table.
>
> Isn't it better for the driver not to support that compatible flag, r=
ather
> than claiming support, but then not actually working correctly?

Ah, yes, of course. I misread it as one of the scan tables, not used
for probing. Nevermind.


-Olof
