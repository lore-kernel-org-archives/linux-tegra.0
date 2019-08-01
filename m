From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v9 11/15] dt-bindings: memory: Add binding for NVIDIA
 Tegra30 External Memory Controller
Date: Thu, 1 Aug 2019 14:05:12 +0300
Message-ID: <7fa8dd9c-1298-9a52-2529-86285797ab0e@gmail.com>
References: <20190730165618.10122-1-digetx@gmail.com>
 <20190730165618.10122-12-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730165618.10122-12-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

30.07.2019 19:56, Dmitry Osipenko пишет:
> Add device-tree binding for NVIDIA Tegra30 External Memory Controller.
> The binding is based on the Tegra124 EMC binding since hardware is
> similar, although there are couple significant differences.
> 
> Note that the memory timing description is given in a platform-specific
> form because there is no detailed information on how to convert a
> typical-common DDR timing into the register values. The timing format is
> borrowed from downstream kernel, hence there is no hurdle in regards to
> upstreaming of memory timings for the boards.
> 
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Hello Rob,

Are the device-tree changes looking good to you?
