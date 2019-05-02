From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: memory: Add binding for NVIDIA
 Tegra30 External Memory Controller
Date: Wed, 1 May 2019 19:17:03 -0500
Message-ID: <CAL_JsqKCWytgQEDPLX27xdaDrARtHssbhFcL47RO0zfECm0Gig@mail.gmail.com>
References: <20190414202009.31268-1-digetx@gmail.com> <20190414202009.31268-3-digetx@gmail.com>
 <20190429220542.GA17924@bogus> <137c766e-66f6-828a-5c3b-f526d66d37bd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <137c766e-66f6-828a-5c3b-f526d66d37bd@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, May 1, 2019 at 7:06 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 30.04.2019 1:05, Rob Herring =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Sun, Apr 14, 2019 at 11:20:07PM +0300, Dmitry Osipenko wrote:
> >> Add device-tree binding for NVIDIA Tegra30 External Memory Controller.
> >> The binding is based on the Tegra124 EMC binding since hardware is
> >> similar, although there are couple significant differences.
> >
> > My comments on Tegra124 binding apply here.
>
> The common timing definition doesn't fully match the definition that is
> used by Tegra's Memory Controller, thus the DQS (data strobe) timing
> parameter is comprised of multiple sub-parameters that describe how to
> generate the strobe in hardware. There are also more additional
> parameters that are specific to Tegra and they are individually
> characterized for each memory model and clock rate. Hence the common
> timing definition isn't usable.

I don't understand. Every PC in the world can work with any DIMM
(within a given generation) just with SPD data. Why is that not
sufficient here?

In any case, it seems for Tegra124 a different approach is going to be
taken. Seems like an "avoid DT" solution to me, but if it's contained
within the firmware it's not my problem.

Rob
