From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] soc: tegra: pmc: restrict compilation of suspend-related
 support to ARM
Date: Thu, 08 Jan 2015 14:23:40 +0300
Message-ID: <54AE68BC.305@gmail.com>
References: <alpine.DEB.2.02.1412092224050.31750@utopia.booyaka.com> <20150107143354.GD1621@ulmo> <54AD4FB7.20600@gmail.com> <20150108084929.GA1987@ulmo.nvidia.com> <54AE5117.5020905@gmail.com> <20150108105818.GJ1987@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150108105818.GJ1987@ulmo.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Paul Walmsley <paul@pwsan.com>, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Paul Walmsley <pwalmsley@nvidia.com>, Thierry Reding <treding@nvidia.com>, Allen Martin <amartin@nvidia.com>, Stephen Warren <swarren@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

08.01.2015 13:58, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Thu, Jan 08, 2015 at 12:42:47PM +0300, Dmitry Osipenko wrote:
>> 08.01.2015 11:49, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> I don't like changing this back to syscore_ops since it makes thing=
s
>>> less easier to follow. I also don't think that using PMC_SCRATCH41 =
for
>>> two different purposes is a good thing. There are a couple of
>>> suggestions in my reply to your original patch. Could you investiga=
te
>>> whether any of those can be used to fix this instead?
>>>
>>> Thierry
>>>
>>
>> I haven't received your reply. Double checked gmail inbox and mailin=
g lists -
>> nothing. It may just not propagated yet if you sent it today, otherw=
ise can you
>> please re-send it?
>=20
> For some reason it hadn't gone out. Should be now, though.
>=20
> Thierry
>=20

Received now, thanks! Your proposal sounds interesting, I'll try it.

--=20
Dmitry
