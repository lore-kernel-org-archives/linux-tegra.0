From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v10 09/15] dt-bindings: memory: tegra30: Convert to
 Tegra124 YAML
Date: Mon, 12 Aug 2019 13:53:43 -0600
Message-ID: <CAL_JsqJNwMOMyDaB=zqbCLwfn+ro6RcvXFkRbN_t-mEeUi3rVQ@mail.gmail.com>
References: <20190811210043.20122-1-digetx@gmail.com> <20190811210043.20122-10-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811210043.20122-10-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Aug 11, 2019 at 3:01 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> The Tegra30 binding will actually differ from the Tegra124 a tad, in
> particular the EMEM configuration description. Hence rename the binding
> to Tegra124 during of the conversion to YAML.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../nvidia,tegra124-mc.yaml                   | 152 ++++++++++++++++++
>  .../memory-controllers/nvidia,tegra30-mc.txt  | 123 --------------
>  2 files changed, 152 insertions(+), 123 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.txt

Reviewed-by: Rob Herring <robh@kernel.org>
