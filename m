From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/4] ARM: tegra: enable Tegra114 based platform PMICs
Date: Wed, 20 Mar 2013 14:50:21 -0600
Message-ID: <514A210D.4040507@wwwdotorg.org>
References: <1363787070-14801-1-git-send-email-ldewangan@nvidia.com> <1363787070-14801-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1363787070-14801-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 03/20/2013 07:44 AM, Laxman Dewangan wrote:
> NVIDIA's Tegra114 have two reference platform, Dalmore and Pluto.
> Dalmore uses the following PMICs:
> - TPS65913 as primary PMIC.
> - TPS65090 as secondary PMIC used for switch regulators and battery charging.
> - TPS51632 for cpu regulator.
> 
> Pluto uses the TPS65913 as the PMIC.
> 
> Enable config variable of these PMICs for Dalomore and Pluto.

Just FYI, I would apply the DT changes to Tegra's for-3.10/dt branch,
and the defconfig change to Tegra's for-3.10/defconfig branch. The /dt
branch will get merged first, and the /defconfig after it. Hence, you
would typically want to send patches in that order. It doesn't really
make any practical difference in this case though.
