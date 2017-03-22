From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 4/5] dt-bindings: tegra: Update compatible strings for
 Tegra flowctrl
Date: Wed, 22 Mar 2017 11:26:18 -0600
Message-ID: <b85e7f4e-ba63-8374-b10d-3f9f04252a69@wwwdotorg.org>
References: <1490202056-13040-1-git-send-email-jonathanh@nvidia.com>
 <1490202056-13040-5-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1490202056-13040-5-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 03/22/2017 11:00 AM, Jon Hunter wrote:
> Update the compatible strings for Tegra Flow Control driver to match
> the device-tree source files for Tegra.

> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt

> +  - "nvidia,tegra124-flowctrl": for Tegra124 and Tegra132

I think that should be:

+  - "nvidia,tegra124-flowctrl": for Tegra124
+  - "nvidia,tegra132-flowctrl", "nvidia,tegra124-flowctrl": for \
Tegra132
