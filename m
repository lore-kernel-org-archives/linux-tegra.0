From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v4 1/4] of: Add NVIDIA Tegra XUSB pad controller binding
Date: Tue, 17 Jun 2014 10:24:54 -0600
Message-ID: <53A06BD6.40608@wwwdotorg.org>
References: <1403006877-19850-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1403006877-19850-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 06/17/2014 06:07 AM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This patch adds the device tree binding documentation for the XUSB pad
> controller found on NVIDIA Tegra SoCs. It exposes both pinmuxing and PHY
> capabilities.

Thanks. I'll wait for a Tested-by from Mikko and an Acked-by from Linus
before taking this series.
