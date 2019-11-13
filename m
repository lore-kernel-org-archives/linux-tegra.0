From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: tegra: divider: Check UART's divider enable-bit state on rate's recalculation
Date: Wed, 13 Nov 2019 15:03:01 -0800
Message-ID: <20191113230303.726AE206E3@mail.kernel.org>
References: <20191030004813.9187-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191030004813.9187-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-10-29 17:48:13)
> UART clock is divided using divisor values from DLM/DLL registers when
> enable-bit is unset in clk register and clk's divider configuration isn't
> taken onto account in this case. This doesn't cause any problems, but
> let's add a check for the divider's enable-bit state, for consistency.
>=20
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Is this going to be picked up or should I just apply atop the tegra PR?
