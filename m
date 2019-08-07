From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V6 14/21] clk: tegra210: Add suspend and resume support
Date: Wed, 07 Aug 2019 14:22:29 -0700
Message-ID: <20190807212229.EA9D821743@mail.kernel.org>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com> <1563738060-30213-15-git-send-email-skomatineni@nvidia.com> <e683b417-66fb-38dc-c16b-dab616583a88@gmail.com> <88da46d2-b90d-f57e-7611-b8653b56bdf6@nvidia.com> <ceedb802-7561-488f-3a89-67bee19f2fea@gmail.com> <e2d0e8cc-b4ea-1148-4af1-fee6bb266cca@nvidia.com> <5054f178-db27-9286-d123-3e2b2a885717@gmail.com> <8c259511-d8ea-51b2-0b1d-c85b964bc44c@gmail.com> <20190802175119.1E401217F5@mail.kernel.org> <641727e6-4796-f982-3b58-4c8d666de1a2@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <641727e6-4796-f982-3b58-4c8d666de1a2@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, jason@lakedaemon.net, jonathanh@nvidia.com, linus.walleij@linaro.org, marc.zyngier@arm.com, mark.rutland@arm.com, stefan@agner.ch, tglx@linutronix.de, thierry.reding@gmail.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Sowjanya Komatineni (2019-08-02 13:39:57)
>=20
> On 8/2/19 10:51 AM, Stephen Boyd wrote:
> > And also add a comment to this location in the code because it's
> > non-obvious that we can't use iopoll here.
> >
> Actually added comment during function usage instead of during include=20
> as iopoll.h is removed.
>=20
> Will add additional comment in include section as well highlighting=20
> reason for removal of iopoll.h
>=20

No I wasn't saying to add a comment to the include section, just add a
comment in the place where you would have called iopoll but don't. Sorry
that it wasn't clear.
