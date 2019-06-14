From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V2] clk: tegra210: Fix default rates for HDA clocks
Date: Fri, 14 Jun 2019 10:43:42 -0700
Message-ID: <20190614174342.DBED2217D6@mail.kernel.org>
References: <1559743299-11576-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1559743299-11576-1-git-send-email-jonathanh@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Jon Hunter (2019-06-05 07:01:39)
> Currently the default clock rates for the HDA and HDA2CODEC_2X clocks
> are both 19.2MHz. However, the default rates for these clocks should
> actually be 51MHz and 48MHz, respectively. The current clock settings
> results in a distorted output during audio playback. Correct the default
> clock rates for these clocks by specifying them in the clock init table
> for Tegra210.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---

Applied to clk-fixes
