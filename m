From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH RE-SEND] clk: tegra: Don't enable already enabled PLLs
Date: Mon, 4 Mar 2019 10:18:57 +0200
Message-ID: <20190304081857.GE21084@pdeschrijver-desktop.Nvidia.com>
References: <20190224153222.8142-1-digetx@gmail.com>
 <b64760b5-0d37-ae05-9c8e-9e6d47293c92@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b64760b5-0d37-ae05-9c8e-9e6d47293c92@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 27, 2019 at 06:15:04PM +0300, Dmitry Osipenko wrote:
> 24.02.2019 18:32, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Initially Common Clock Framework isn't aware of the clock-enable status=
,
> > this results in enabling of clocks that were enabled by bootloader. Thi=
s
> > is not a big deal for a regular clock-gates, but for PLL's it may have
> > some unpleasant consequences. Thus re-enabling PLLX (the main CPU paren=
t
> > clock) may result in extra long period of PLL re-locking.
> >=20
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
>=20
> Peter (and everyone else), yours r-b and ACK will be appreciated since yo=
u kinda already took a look at this patch in the past and were okay with it=
 (IIRC, we had some brief discussion on the #tegra IRC a few months ago), t=
hanks.=20
>=20

Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>
