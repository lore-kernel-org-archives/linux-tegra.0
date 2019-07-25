From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v1 0/2] Tegra30+ CPU suspend-resume bug-fixes
Date: Thu, 25 Jul 2019 12:40:10 +0300
Message-ID: <20190725094010.GK12715@pdeschrijver-desktop.Nvidia.com>
References: <20190707230358.10672-1-digetx@gmail.com>
 <f81a974b-4e64-9b66-0399-519480f53c31@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f81a974b-4e64-9b66-0399-519480f53c31@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 23, 2019 at 04:28:35AM +0300, Dmitry Osipenko wrote:
> 08.07.2019 2:03, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hello,
> >=20
> > This small series addresses two suspend-resume bugs: one affects Tegra3=
0+
> > due to a typo in the code, other fixes CPU hang on Tegra30 specifically=
.
> >=20
> > Please review and apply, thanks!
> >=20
> > Dmitry Osipenko (2):
> >   ARM: tegra: Fix FLOW_CTLR_HALT register clobbering by tegra_resume()
> >   ARM: tegra: Use WFE for power-gating on Tegra30
> >=20
> >  arch/arm/mach-tegra/reset-handler.S |  6 +++---
> >  arch/arm/mach-tegra/sleep-tegra30.S |  4 +++-
> >  drivers/soc/tegra/flowctrl.c        | 19 +++++++++++++++++--
> >  3 files changed, 23 insertions(+), 6 deletions(-)
> >=20
>=20
> Hello Peter,
>=20
> We were talking about these fixes on the IRC not so long time ago, does
> it look good to you? Care to give an ACK?

Acked-By Peter De Schrijver <pdeschrijver@nvidia.com>
