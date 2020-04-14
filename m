From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH v6 5/9] dt-binding: tegra: Add VI and CSI bindings
Date: Tue, 14 Apr 2020 13:14:44 -0500
Message-ID: <20200414181444.GA17346@bogus>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-6-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1585963507-12610-6-git-send-email-skomatineni@nvidia.com>
Sender: linux-media-owner@vger.kernel.org
Cc: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 3 Apr 2020 18:25:03 -0700, Sowjanya Komatineni wrote:
> Tegra contains VI controller which can support up to 6 MIPI CSI
> camera sensors.
> 
> Each Tegra CSI port from CSI unit can be one-to-one mapper to
> VI channel and can capture from an external camera sensor or
> from built-in test pattern generator.
> 
> This patch adds dt-bindings for Tegra VI and CSI.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt        | 73 ++++++++++++++++++----
>  1 file changed, 60 insertions(+), 13 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
