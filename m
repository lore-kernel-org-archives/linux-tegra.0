From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] soc: tegra: pmc: restrict compilation of suspend-related
 support to ARM
Date: Wed, 07 Jan 2015 18:24:39 +0300
Message-ID: <54AD4FB7.20600@gmail.com>
References: <alpine.DEB.2.02.1412092224050.31750@utopia.booyaka.com> <20150107143354.GD1621@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150107143354.GD1621@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Paul Walmsley <paul@pwsan.com>
Cc: linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Paul Walmsley <pwalmsley@nvidia.com>, Thierry Reding <treding@nvidia.com>, Allen Martin <amartin@nvidia.com>, Stephen Warren <swarren@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

07.01.2015 17:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Tue, Dec 09, 2014 at 10:36:50PM +0000, Paul Walmsley wrote:
>>
>> Tegra SoCs with 64-bit ARM support don't currently support deep CPU
>> low-power states in mainline Linux.  When this support is added in t=
he
>> future, it will probably look rather different from the existing
>> 32-bit ARM support, since the ARM64 maintainers' strong preference i=
s
>> to use PSCI to implement it.
>>
>> So, for the time being, prevent the CPU suspend-related code and dat=
a
>> in the Tegra PMC driver from compiling on ARM64.
>>
>> Signed-off-by: Paul Walmsley <paul@pwsan.com>
>> Signed-off-by: Paul Walmsley <pwalmsley@nvidia.com>
>> Cc: Thierry Reding <treding@nvidia.com>
>> Cc: Allen Martin <amartin@nvidia.com>
>> Cc: Stephen Warren <swarren@nvidia.com>
>> Cc: Alexandre Courbot <gnurou@gmail.com>
>> ---
>> Applies on next-20141209.
>> Intended for v3.20.
>> Boot-tested on Tegra124 Jetson TK1 on next-20141209.
>> Also boot-tested on Tegra132 Norrin FFD on next-20141209 + some unre=
lated=20
>> patches.
>>
>>  drivers/soc/tegra/pmc.c | 7 +++++--
>>  include/soc/tegra/pm.h  | 2 +-
>>  2 files changed, 6 insertions(+), 3 deletions(-)
>=20
> On second thought, I decided to apply this as-is.
>=20
> Thanks,
> Thierry
>=20

Oh, I haven't noticed this patch before...

I sent patch fixing tegra20 suspend bug [
http://patchwork.ozlabs.org/patch/423778/ ] and it will obviously confl=
ict with
this one.
=46or now there is no feedback for my suspend bug patch (other than for=
 V1), but,
if it's fine, I think it would be easier to rebase Paul's patch on top =
of it.
Any other suggestions?

--=20
Dmitry
