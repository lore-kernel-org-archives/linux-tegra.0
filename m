From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: tegra186-gpio: Add information for
 Tegra194
Date: Wed, 27 Jun 2018 10:58:05 -0600
Message-ID: <20180627165805.GA21522@rob-hp-laptop>
References: <20180620125406.11906-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180620125406.11906-1-mperttunen@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: mark.rutland@arm.com, vbhadram@nvidia.com, devicetree@vger.kernel.org, linus.walleij@linaro.org, jonathanh@nvidia.com, linux-gpio@vger.kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 20, 2018 at 03:54:02PM +0300, Mikko Perttunen wrote:
> The Tegra194 GPIO controller is similar to the one in Tegra186.
> Add relevant information to the device tree binding documentation.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
