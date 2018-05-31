From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1] media: dt: bindings: tegra-vde: Document new optional
 Memory Client reset property
Date: Wed, 30 May 2018 23:11:29 -0500
Message-ID: <20180531041129.GA566@rob-hp-laptop>
References: <20180526143355.24288-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180526143355.24288-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sat, May 26, 2018 at 05:33:55PM +0300, Dmitry Osipenko wrote:
> Recently binding of the Memory Controller has been extended, exposing
> the Memory Client reset controls and hence it is now a reset controller.
> Tegra video-decoder device is among the Memory Controller reset users,
> document the new optional VDE HW reset property.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/media/nvidia,tegra-vde.txt    | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
