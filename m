From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 3/4] ARM: tegra: select PINCTRL_TEGRA124 for Tegra124
 SoC
Date: Thu, 12 Dec 2013 11:36:59 -0700
Message-ID: <52AA024B.20409@wwwdotorg.org>
References: <1386241070-4350-1-git-send-email-ldewangan@nvidia.com> <1386241070-4350-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1386241070-4350-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org
Cc: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, thierry.reding@gmail.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 12/05/2013 03:57 AM, Laxman Dewangan wrote:
> The pincontrol driver for Tegra124 is build through config
> PINCTRL_TEGRA124. Select this config option whenever Tegra124
> SoC is enabled.

Applied to Tegra's for-3.14/soc branch.

(I thought I had sent this before myself, but I'd only written the patch
locally, and had not actually sent it out, hence I took your identical
patch.)
