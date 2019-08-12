From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v10 10/15] dt-bindings: memory: Add binding for NVIDIA
 Tegra30 Memory Controller
Date: Mon, 12 Aug 2019 13:55:36 -0600
Message-ID: <CAL_JsqLPAQ19UL4ZcRZBo+Zp3rLrOBC7O3u2kPZntzJMNwfOww@mail.gmail.com>
References: <20190811210043.20122-1-digetx@gmail.com> <20190811210043.20122-11-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811210043.20122-11-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Aug 11, 2019 at 3:01 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Add binding for the NVIDIA Tegra30 SoC Memory Controller.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra30-mc.yaml | 167 ++++++++++++++++++
>  1 file changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
