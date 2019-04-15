From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 3/3] ARM: Enable Trusted Foundations for multiplatform
 ARM v7
Date: Mon, 15 Apr 2019 10:23:57 -0700
Message-ID: <20190415172357.GC2839@atomide.com>
References: <20190411091848.16949-1-thierry.reding@gmail.com>
 <20190411091848.16949-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190411091848.16949-3-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

* Thierry Reding <thierry.reding@gmail.com> [190411 09:19]:
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -141,6 +141,7 @@ CONFIG_ARM_CPUIDLE=y
>  CONFIG_ARM_ZYNQ_CPUIDLE=y
>  CONFIG_ARM_EXYNOS_CPUIDLE=y
>  CONFIG_KERNEL_MODE_NEON=y
> +CONFIG_TRUSTED_FOUNDATIONS=y
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y

I'm updating my branch for make savedefconfig clean-up
for multi_v7_defconfig as posted earlier in thread
"[PATCHv2 0/2] Update multi_v7_defconfig for dropped
and moved options", looks like this commit causes
a trivial merge conflict.

Can we consider your branch immutable for commit
8b695aa58cc4 ("ARM: Enable Trusted Foundations for
multiplatform ARM v7")?

I'd like to merge that one in to avoid an unecessary
merge conflict.

Regards,

Tony
