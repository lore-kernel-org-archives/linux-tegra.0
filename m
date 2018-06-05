From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/6] mtd: rawnand: tegra: add devicetree binding
Date: Tue, 5 Jun 2018 14:13:13 -0600
Message-ID: <20180605201313.GA32175@rob-hp-laptop>
References: <20180531221637.6017-1-stefan@agner.ch>
 <20180531221637.6017-4-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180531221637.6017-4-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@bootlin.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, mark.rutland@arm.com, thierry.reding@gmail.com, dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 01, 2018 at 12:16:34AM +0200, Stefan Agner wrote:
> This adds the devicetree binding for the Tegra 2 NAND flash
> controller.
> 
> Signed-off-by: Lucas Stach <dev@lynxeye.de>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  .../bindings/mtd/nvidia-tegra20-nand.txt      | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt

Reviewed-by: Rob Herring <robh@kernel.org>
