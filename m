From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V3 0/4] ARM: tegra: convert dts files of all Tegra platforms
 to use pinctrl defines
Date: Thu, 05 Dec 2013 16:33:48 -0700
Message-ID: <52A10D5C.3060002@wwwdotorg.org>
References: <1386240249-30786-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1386240249-30786-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: thierry.reding@gmail.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 12/05/2013 03:44 AM, Laxman Dewangan wrote:
> This patch series convert dts files of all Tegra's platforms to use the pinctron
> dt-binding macro for better readability.

I think this series looks fine now; I'll apply soon pending what happens
with the DMA/reset/ binding rework.

There are quite a few typos/spelling/capitalization mistakes in the
commit descriptions, but I'll fix them up when applying.
