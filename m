From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: tegra: divider: Check UART's divider enable-bit state on rate's recalculation
Date: Fri, 15 Nov 2019 13:36:53 -0800
Message-ID: <20191115213654.9187920730@mail.kernel.org>
References: <20191030004813.9187-1-digetx@gmail.com> <20191113230303.726AE206E3@mail.kernel.org> <02df00b3-5e23-441f-b2d5-b84fdb411e98@gmail.com> <20191114115656.GC5690@aiwendil> <ec7062cf-a246-8b95-dca7-34e2b957d691@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ec7062cf-a246-8b95-dca7-34e2b957d691@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-11-14 04:10:51)
> >=20
> > It's not so much that I missed to pick this up. It's just that it didn't
> > make it in time. This was posted just a couple of days before v5.4-rc6
> > and I had already finalized the branches at that point. Given that this
> > doesn't fix any actual issues it didn't seem worth to force it in at
> > that point.
> >=20
> > That said, I don't have any objections if Stephen wants to pick this up
> > on top of the pull requests.
>=20
> Thanks!

I'm fine to wait for it to come through a pull request next time. I just
wanted to know what to do with this patch in my queue.
