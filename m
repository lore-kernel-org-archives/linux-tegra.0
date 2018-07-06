From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/3] clk: tegra: refactor 7.1 div calculation
Date: Fri, 06 Jul 2018 10:10:06 -0700
Message-ID: <153089700685.143105.9967468507381208265@swboyd.mtv.corp.google.com>
References: <1530617721-5767-1-git-send-email-avienamo@nvidia.com>
 <46bc7178-f8a4-cc4e-ebe3-507671ffb735@gmail.com>
 <20180704105148.1e32d307@dhcp-10-21-25-168>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180704105148.1e32d307@dhcp-10-21-25-168>
Sender: linux-kernel-owner@vger.kernel.org
To: Aapo Vienamo <avienamo@nvidia.com>, Peter Geis <pgwipeout@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Aapo Vienamo (2018-07-04 00:51:48)
> On Tue, 3 Jul 2018 11:10:21 -0400
> Peter Geis <pgwipeout@gmail.com> wrote:
> =

> > Good Morning,
> > =

> > Just a heads up.
> > During compilation with your patches, I get the following warning:
> > =

> > In file included from ./arch/arm/include/asm/div64.h:127:0,
> >                   from ./include/linux/kernel.h:174,
> >                   from drivers/clk/tegra/div71.c:17:
> > drivers/clk/tegra/div71.c: In function =E2=80=98div71_get=E2=80=99:
> > ./include/asm-generic/div64.h:222:28: warning: comparison of distinct =

> > pointer types lacks a cast
> >    (void)(((typeof((n)) *)0) =3D=3D ((uint64_t *)0)); \
> >                              ^
> > drivers/clk/tegra/div71.c:40:2: note: in expansion of macro =E2=80=98do=
_div=E2=80=99
> >    do_div(divider_ux1, rate);
> >    ^~~~~~
> > =

> > Very Respectfully,
> > Peter Geis
> > =

>  =

> That's indeed true. Looks like this warning is produced only on 32-bit
> arm as it uses a different variant of the do_div macro than arm64.
> =


divider_ux1 is an s64, but the generic do_div() macro is checking to
make sure that's compatible with a u64, and it isn't. Maybe you should
use a function like div64_long()?
