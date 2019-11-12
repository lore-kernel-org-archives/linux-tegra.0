From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1] clk: tegra: clk-dfll: Fix to remove pm_runtime_irq_safe
Date: Tue, 12 Nov 2019 14:46:46 -0800
Message-ID: <20191112224647.39F572084E@mail.kernel.org>
References: <1573575426-31314-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1573575426-31314-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com, mturquette@baylibre.com, pgaikwad@nvidia.com, thierry.reding@gmail.com
Cc: digetx@gmail.com, pdeschrijver@nvidia.com, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Sowjanya Komatineni (2019-11-12 08:17:05)
> This patch includes fix to remove pm_runtime_irq_safe which was added
> mistakenly during dfll suspend and resume implementation as a part of
> Tegra210 SC7 suspend and resume patch series.
>=20
> This patch removes pm_runtime_irq_safe and also has minor description
> update for argument of dfll_suspend in comments.
>=20
> Some of the patch series are applied so sending this fix as incremental
> fix to latest linux-next.

Please don't send cover letters for single patches. The value add is
minimal vs. just putting extra text next to the diffstat in the single
patch.

>=20
> Sowjanya Komatineni (1):
>   clk: tegra: clk-dfll: Fix to remove pm_runtime_irq_safe
>=20
>  drivers/clk/tegra/clk-dfll.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
