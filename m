From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 1/2] clk: tegra: divider: Fix missing check for enable-bit on rate's recalculation
Date: Mon, 22 Jul 2019 14:55:54 -0700
Message-ID: <20190722215554.DA23D21951@mail.kernel.org>
References: <20190715173527.5719-1-digetx@gmail.com> <20190717200821.A77A120818@mail.kernel.org> <ca05abf7-1486-ceb7-91d6-266640eea69e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ca05abf7-1486-ceb7-91d6-266640eea69e@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-07-17 14:33:36)
> 17.07.2019 23:08, Stephen Boyd =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Quoting Dmitry Osipenko (2019-07-15 10:35:26)
> >> Unset "enable" bit means that divider is in bypass mode, hence it does=
n't
> >> have any effect in that case.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >=20
> > Any Fixes tags for these patches?
>=20
> I'm not aware of any actual bugs that this change fixes. Probably better
> to just s/Fix/Add/ in the commit's title?

Sounds fine to me.
