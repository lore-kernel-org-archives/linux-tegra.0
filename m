From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] Add support for CPCAP regulators on Motorola Xoom
 devices.
Date: Wed, 25 Jul 2018 09:35:14 -0600
Message-ID: <20180725153514.GA21550@rob-hp-laptop>
References: <20180724132541.17039-1-pgwipeout@gmail.com>
 <20180724132541.17039-3-pgwipeout@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180724132541.17039-3-pgwipeout@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Geis <pgwipeout@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 24, 2018 at 09:25:41AM -0400, Peter Geis wrote:
> Added support for the CPCAP power management regulator functions on
> Tegra based Motorola Xoom devices.
> Added sw2_sw4 value tables, which provide power to the Tegra core and
> aux devices.
> Added the Xoom init tables and device tree compatibility match.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  .../bindings/regulator/cpcap-regulator.txt    |  1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/regulator/cpcap-regulator.c           | 80 +++++++++++++++++++
>  2 files changed, 81 insertions(+)
