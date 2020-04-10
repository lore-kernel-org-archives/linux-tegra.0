From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 01/22] dt-bindings: memory: tegra20: mc: Document new
 interconnect property
Date: Fri, 10 Apr 2020 12:05:13 -0500
Message-ID: <20200410170513.GA30556@bogus>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200330010904.27643-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@samsung.com>, Georgi Djakov <georgi.djakov@linaro.org>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 30 Mar 2020 04:08:43 +0300, Dmitry Osipenko wrote:
> Memory controller is interconnected with memory clients and with the
> external memory controller. Document new interconnect property which
> turns memory controller into interconnect provider.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-mc.txt          | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
